using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portfolio_ASP
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PortfolioCon"].ConnectionString);

        public List<FeedbackItem> FeedbackList { get; set; }
         
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
                PopulateFeedbackList();
            }
        }

        private void PopulateFeedbackList()
        {
            try{
                SqlCommand cmd = new SqlCommand("select Name,Topic,Description from AddTopic", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                FeedbackList = new List<FeedbackItem>();
                while (dr.Read())
                {
                    FeedbackList.Add(new FeedbackItem { Title = "", WriterName = dr.GetValue(0).ToString(), TopicName = dr.GetValue(1).ToString(), Description = dr.GetValue(2).ToString() });
                }
            }catch(Exception ex)
            {

            }
            
        }

        public class FeedbackItem
        {
            public string Title { get; set; }
            public string WriterName { get; set; }
            public string TopicName { get; set; }
            public string Description { get; set; }
        }

        protected void hambergerButton_Click(object sender, EventArgs e)
        {
            pnlMobileNav.CssClass = pnlMobileNav.CssClass.Contains("open") ? "mobile-nav" : "mobile-nav open";
        }
    }
}