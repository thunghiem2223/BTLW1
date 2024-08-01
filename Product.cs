using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL
{
    public class Product
    {
        int id;
        string name;
        string link;
        string price;
        string description;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public string Link
        {
            get { return link; }
            set { link = value; }
        }

        public string Price
        {
            get { return price; }
            set 
            {
                string reverse = "";
                string result = "";

                int length = value.Length;
                int j = 0;
                for (int i = length - 1; i >= 0; i--)
                {
                if (j == 3)
                {
                    reverse += ".";
                    j = 0;
                }
                    reverse += value[i];
                    j++;
                }

                for (int i = reverse.Length - 1; i >= 0; i--)
                {
                    result += reverse[i];
                }

                price = result + " ₫"; 
            }
        }

        public string Description
        {
            get { return description; }
            set { description = value; }
        }
    }
}