using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL
{
    public class Account
    {
        string username = "";
        string password = "";
        string address = "";

        public string Username
        {
            get { return username; }
            set { username = value; }
        }
        public string Password
        {
            get { return password; }
            set { password = value; }
        }

        public string Address
        {
            get { return address; }
            set { address = value; }
        }
    }
}