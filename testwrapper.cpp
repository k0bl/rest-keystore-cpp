#include <iostream>
#include <sstream>
#include "crypto/cryptopp_wrapper.h"

using namespace std;
std::string my_key = "0ZmY7gLhG7vghXnUF54L5495lcfJTovT";

int main()
{
	cout<<"Space Wrapper TEST!"<<endl<<endl;

	const char *enc_username = "6B63D86E25DCDCEC46E45995B8E0C78C";
    const char *enc_password = "296CE993680005C5CC2A55512C06B114";

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

}