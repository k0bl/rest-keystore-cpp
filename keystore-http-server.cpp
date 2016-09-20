#include "server_http.hpp"
#include "client_http.hpp"

//Added for the json-example
#define BOOST_SPIRIT_THREADSAFE
#include <boost/property_tree/ptree.hpp>
#include <boost/property_tree/json_parser.hpp>

//Added for the default_resource example
#include <fstream>
#include <boost/filesystem.hpp>
#include <vector>
#include <algorithm>

//Dbo stuff
#include <Wt/Dbo/Dbo>
#include <Wt/Dbo/Session>
#include <Wt/Dbo/backend/Postgres>
//cred object
#include "Cred.h"
//crypto
#include "crypto/cryptopp_wrapper.h"

using namespace std;
//Added for the json-example:
using namespace boost::property_tree;

using namespace Wt;
namespace dbo = Wt::Dbo;

typedef SimpleWeb::Server<SimpleWeb::HTTP> HttpServer;
typedef SimpleWeb::Client<SimpleWeb::HTTP> HttpClient;

//postgres connection info for dbo    
const char *pgconninfo = "hostaddr = 127.0.0.1 port = 5432 user = pes7-keystore dbname = pes7-keystore password = Falcon1337";
std::string my_key = "0ZmY7gLhG7vghXnUF54L5495lcfJTovT";
//Added for the default_resource example
void default_resource_send(const HttpServer &server, shared_ptr<HttpServer::Response> response,
                           shared_ptr<ifstream> ifs, shared_ptr<vector<char> > buffer);

int main() {
    
    //HTTP-server at port 8080 using 1 thread
    //Unless you do more heavy non-threaded processing in the resources,
    //1 thread is usually faster than several threads
    HttpServer server(8080, 1);
    std::cout << "Starting HTTP server on port 8080" << std::endl;
    

    //POST-example for the path /credentials, responds with the credentials from the datastore
    //Responds with an appropriate error message if the posted json is not valid, or if attributes are missing
    //Example posted json:
    // {
    //     "cred_id": 105f3184-bf88-4307-af46-61fb60b61c77,
    //     "username": "john@gmail.com",
    //     "password": "SecurePasswordOne"
    // }
    server.resource["^/credentials$"]["POST"]=[](shared_ptr<HttpServer::Response> response, shared_ptr<HttpServer::Request> request) {
        try {
            ptree pt;
            read_json(request->content, pt);

            string cred_id=pt.get<string>("cred_id");
            string username=pt.get<string>("username");
            string password=pt.get<string>("password");
            
            string startcrypt="ENCRYPTING CREDENTIALS FOR: "+cred_id;
            std::cout << startcrypt << std::endl;
            
            //encrypt before storing in database
            SpaceCrypto::CryptTwoFish cryptusername;
            SpaceCrypto::CryptTwoFish cryptpassword;
            cryptusername.setPlainString(username);
            cryptpassword.setPlainString(password);
            cryptusername.setKey(my_key);
            cryptpassword.setKey(my_key);

            std::string usernamecrypt_ = cryptusername.Encrypt();
            std::string passwordcrypt_ = cryptpassword.Encrypt();
            
            cout<<"Encrypted username: "<<usernamecrypt_<<endl;
            cout<<"Encrypted password: "<<passwordcrypt_<<endl;
            
            string endcrypt="DONE ENCRYPTING CREDENTIALS FOR: "+cred_id;
            std::cout << endcrypt << std::endl;
            
            //setup the postgres connection
            Wt::Dbo::Session dbsession;
            Wt::Dbo::backend::Postgres pg_ = Wt::Dbo::backend::Postgres(pgconninfo);
            
            dbsession.setConnection(pg_);
            pg_.setProperty("show-queries", "true");

            dbsession.mapClass<Cred>("cred");
            // dbsession.mapClass<CompositeEntity>("composite");

            dbo::Transaction transaction(dbsession);
            try {
                dbsession.createTables();
                // log("info") << "Database created";
                std::cout << "Database created" << std::endl;      
            }
            catch (...) {
                // log("info") << "Using existing database";
                std::cout << "Using existing database" << std::endl;
            }
            transaction.commit();

            dbo::Transaction storetrans(dbsession);
            dbo::ptr<Cred> cred = dbsession.add(new Cred());

            cred.modify()->username_ = usernamecrypt_;
            cred.modify()->password_ = passwordcrypt_;
            cred.modify()->credId_ = cred_id;

            storetrans.commit();

            string res="ENCRYPTED CREDENTIALS STORED SUCCESSFULLY for: "+cred_id;
            std::cout << res << std::endl;

            *response << "HTTP/1.1 200 OK\r\n"
                      << "Content-Type: application/json\r\n"
                      << "Content-Length: " << res.length() << "\r\n\r\n"
                      << res;
        }
        catch(exception& e) {
            *response << "HTTP/1.1 400 Bad Request\r\nContent-Length: " << strlen(e.what()) << "\r\n\r\n" << e.what();
        }
    };

    //GET-example for the path /match/[number], responds with the matched string in path (number)
    //For instance a request GET /match/123 will receive: 123
    server.resource["^/credentials/([_a-z0-9-]+)$"]["GET"]=[&server](shared_ptr<HttpServer::Response> response, shared_ptr<HttpServer::Request> request) {
        string number=request->path_match[1];
        //get the credentials from the database
        Wt::Dbo::Session dbsession;
        Wt::Dbo::backend::Postgres pg_ = Wt::Dbo::backend::Postgres(pgconninfo);
        
        dbsession.setConnection(pg_);
        pg_.setProperty("show-queries", "true");

        dbsession.mapClass<Cred>("cred");
        
        dbo::Transaction transaction(dbsession);

        dbo::ptr<Cred> cred = dbsession.find<Cred>().where("cred_id = ?").bind(number);
        const char *enc_username = cred->username_.c_str();
        const char *enc_password = cred->password_.c_str();
        
        cout<<"Encrypted username: "<<enc_username<<endl;
        cout<<"Encrypted password: "<<enc_password<<endl;

        SpaceCrypto::CryptTwoFish cryptusername;
        SpaceCrypto::CryptTwoFish cryptpassword;
        
        cryptusername.setEncString(enc_username);
        cryptpassword.setEncString(enc_password);

        cryptusername.setInputMode(SpaceCrypto::HEX);
        cryptpassword.setInputMode(SpaceCrypto::HEX);
        
        cryptusername.setKey(my_key);
        cryptpassword.setKey(my_key);

        cryptusername.setOutputMode(SpaceCrypto::NORMAL);
        cryptpassword.setOutputMode(SpaceCrypto::NORMAL);
        
        string text_username = cryptusername.Decrypt();
        string text_password = cryptpassword.Decrypt();
        
        cout<<"PLAINTEXT username: "<<text_username<<endl;
        cout<<"PLAINTEXT password: "<<text_password<<endl;

        string resjson = "{\n    \"username\":\""+text_username+"\",\n    \"password\":\""+text_password+"\"\n}";

        transaction.commit();

        //decrypt them
        //send them back to the client
        *response << "HTTP/1.1 200 OK\r\nContent-Length: " << resjson.length() << "\r\n\r\n" << resjson;
    };
    
    //Get example simulating heavy work in a separate thread
    server.resource["^/work$"]["GET"]=[&server](shared_ptr<HttpServer::Response> response, shared_ptr<HttpServer::Request> /*request*/) {
        thread work_thread([response] {
            this_thread::sleep_for(chrono::seconds(5));
            string message="Work done";
            *response << "HTTP/1.1 200 OK\r\nContent-Length: " << message.length() << "\r\n\r\n" << message;
        });
        work_thread.detach();
    };
    
    //Default GET-example. If no other matches, this anonymous function will be called. 
    //Will respond with content in the web/-directory, and its subdirectories.
    //Default file: index.html
    //Can for instance be used to retrieve an HTML 5 client that uses REST-resources on this server
    server.default_resource["GET"]=[&server](shared_ptr<HttpServer::Response> response, shared_ptr<HttpServer::Request> request) {
        try {
            auto web_root_path=boost::filesystem::canonical("web");
            auto path=boost::filesystem::canonical(web_root_path/request->path);
            //Check if path is within web_root_path
            if(distance(web_root_path.begin(), web_root_path.end())>distance(path.begin(), path.end()) ||
               !equal(web_root_path.begin(), web_root_path.end(), path.begin()))
                throw invalid_argument("path must be within root path");
            if(boost::filesystem::is_directory(path))
                path/="index.html";
            if(!(boost::filesystem::exists(path) && boost::filesystem::is_regular_file(path)))
                throw invalid_argument("file does not exist");
            
            auto ifs=make_shared<ifstream>();
            ifs->open(path.string(), ifstream::in | ios::binary);
            
            if(*ifs) {
                //read and send 128 KB at a time
                streamsize buffer_size=131072;
                auto buffer=make_shared<vector<char> >(buffer_size);
                
                ifs->seekg(0, ios::end);
                auto length=ifs->tellg();
                
                ifs->seekg(0, ios::beg);
                
                *response << "HTTP/1.1 200 OK\r\nContent-Length: " << length << "\r\n\r\n";
                default_resource_send(server, response, ifs, buffer);
            }
            else
                throw invalid_argument("could not read file");
        }
        catch(const exception &e) {
            string content="Could not open path "+request->path+": "+e.what();
            *response << "HTTP/1.1 400 Bad Request\r\nContent-Length: " << content.length() << "\r\n\r\n" << content;
        }
    };
    
    thread server_thread([&server](){
        //Start server
        server.start();
    });
    
    //Wait for server to start so that the client can connect
    this_thread::sleep_for(chrono::seconds(1));
        
    server_thread.join();
    
    return 0;
}

void default_resource_send(const HttpServer &server, shared_ptr<HttpServer::Response> response,
                           shared_ptr<ifstream> ifs, shared_ptr<vector<char> > buffer) {
    streamsize read_length;
    if((read_length=ifs->read(&(*buffer)[0], buffer->size()).gcount())>0) {
        response->write(&(*buffer)[0], read_length);
        if(read_length==static_cast<streamsize>(buffer->size())) {
            server.send(response, [&server, response, ifs, buffer](const boost::system::error_code &ec) {
                if(!ec)
                    default_resource_send(server, response, ifs, buffer);
                else
                    cerr << "Connection interrupted" << endl;
            });
        }
    }
}
