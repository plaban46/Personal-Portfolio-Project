using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portfolio_ASP.Admin_User
{ 
    public partial class WebForm1 : System.Web.UI.Page
    {
        static String username = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserSession"] != null)
            {
                if (!IsPostBack)
                {
                     
                }
                username = Request.QueryString["username"];
                user_lavel.Text = username; 
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            
        }
    }
}