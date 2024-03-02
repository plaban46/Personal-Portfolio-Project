using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portfolio_ASP.Admin
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminSession"] != null)
            {
                if (!IsPostBack)
                {
                    //BindCategory();
                }
            }
            else
            {
                Response.Redirect("AdminLogin.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Session["AdminSession"] = null;
            Response.Redirect("~/Home.aspx");
        }
    }
}