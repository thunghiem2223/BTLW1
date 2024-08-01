using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class Layout : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
            if (Session["username"] != null)
            {
                user.InnerHtml = Session["username"] + "";
                user.Style["display"] = "block";
                dangxuat.Style["display"] = "block";
            }
            else
            {
                user.Style["display"] = "none";
                dangxuat.Style["display"] = "none";
            }
        }


        protected void btnclick_dangxuat(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}