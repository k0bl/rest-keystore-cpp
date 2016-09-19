/*
* Copyright (C) 2016 Cody Scherer <cody@pes7.com> PES7, Inc | Long Beach, CA.
*
* See the LICENSE file for terms of use.
*
* This may look like C code but its really C++
*/

#ifndef CRED_H_
#define CRED_H_

#include <Wt/Dbo/Dbo>
#include <Wt/Dbo/WtSqlTraits>

namespace dbo = Wt::Dbo;

class Cred
{
public:
        std::string credId_;
        std::string username_;
        std::string password_;

        //dbo template for reperral
        template<class Action>
        void persist(Action& a)
        {
                //class mapping for locality
                dbo::field(a, username_, "username");
                dbo::field(a, password_, "password");
                dbo::field(a, credId_, "cred_id");
        }

};

#endif //CRED_H_