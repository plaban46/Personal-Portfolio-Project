using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portfolio_ASP.Admin_User
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserSession"] != null)
            {
                if (!IsPostBack)
                {

                }
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session["UserSession"] = null;
            Response.Redirect("~/Home.aspx");
        }
    }
}