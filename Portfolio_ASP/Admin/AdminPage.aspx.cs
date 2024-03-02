using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portfolio_ASP.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        static String username = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminSession"] != null)
            {
                if (!IsPostBack)
                {
                    //BindCategory();
                }
                username = Request.QueryString["username"];
                admin_label.Text = username;
            }
            else
            {
                Response.Redirect("AdminLogin.aspx");
            }

            
        }
    }
}