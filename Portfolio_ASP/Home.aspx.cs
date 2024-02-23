using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portfolio_ASP
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }   

        protected void hambergerButton_Click(object sender, EventArgs e)
        {
            pnlMobileNav.CssClass = pnlMobileNav.CssClass.Contains("open") ? "mobile-nav" : "mobile-nav open";
        }
    }
}