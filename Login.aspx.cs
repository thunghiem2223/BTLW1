using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Account> accounts = (List<Account>)Application["account"];
            string username = Request.Form.Get("username");
            string password = Request.Form.Get("password");

            if (IsPostBack)
            {
                

                foreach(var acc in accounts)
                {
                    if(username == acc.Username && password == acc.Password)
                    {
                        Session["username"] = username;
                        advertise.InnerHtml = "";
                        successMessage.InnerHtml = "Đăng nhập thành công! Đang chuyển hướng...";
                        Response.AddHeader("REFRESH", "2;URL=Home.aspx"); // Chuyển hướng sau 2 giây
                        return;
                    }
                }    
             
                    advertise.InnerHtml = "Tài khoản hoặc mật khẩu không chính xác";
                
            }

        }
    }
}