﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class AllProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            List<Product> list_pro = (List<Product>)Application["product"];
            List<Product> list_acc = (List<Product>)Application["accessory"];

            List<Product> list = new List<Product>();


            list.AddRange(list_pro);
            list.AddRange(list_acc);
            string chuoi = "";

            foreach (Product product in list)
            {
                chuoi += "<a href=\"Detail.aspx?id=" + product.Id + "\" class=\"product\">\r\n" +
                    "<div class=\"product-top\">\r\n\r\n" +
                        "<img src=\"" + product.Link + "\" alt=\"\" class=\"product-image\">\r\n" +
                    "</div>\r\n\r\n        " +
                    "<div class=\"product-info\">\r\n" +
                        "<div class=\"product-left\">\r\n" +
                            "<h3 class=\"product-name\">\r\n" +
                                "" + product.Name + "\r\n" +
                            "</h3>\r\n" +
                            "<h4 class=\"product-price\">\r\n" +
                                "" + product.Price + "\r\n" +
                            "</h4>\r\n" +
                        "</div>\r\n" +
                        "<div class=\"product-right\">\r\n" +
                            "<img src=\"../Image/icon/shopping-cart.png\" alt=\"\" class=\"add-to-cart\">\r\n" +
                        "</div>\r\n" +
                     "</div>\r\n" +
                 "</a>";
            }

            all_products.InnerHtml = chuoi;

        }
       
    }
}