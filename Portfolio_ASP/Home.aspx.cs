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

            home_description();
            about_text();
            thanks_message();
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
                con.Close();    
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

        public void home_description()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["PortfolioCon"].ConnectionString;

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT description FROM information where id=@ID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@ID", 4);
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        // Assuming there's only one row in the result set
                        string retrievedData = reader["description"].ToString();

                        // Display the retrieved data
                        home_description_text.InnerText = retrievedData;
                    }
                    else
                    {
                        // No data found
                        home_description_text.InnerText = "No data found.";
                    }
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Response.Write("An error occurred: " + ex.Message);
            }
        }
    
    
        public void about_text()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["PortfolioCon"].ConnectionString;

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT description FROM information where id=@ID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@ID", 5);
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        // Assuming there's only one row in the result set
                        string retrievedData = reader["description"].ToString();

                        // Display the retrieved data
                        about_des_text.InnerText = retrievedData;
                    }
                    else
                    {
                        // No data found
                        about_des_text.InnerText = "No data found.";
                    }
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Response.Write("An error occurred: " + ex.Message);
            }
        }
    
    
        public void thanks_message()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["PortfolioCon"].ConnectionString;

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT description FROM information where id=@ID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@ID", 6);
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        // Assuming there's only one row in the result set
                        string retrievedData = reader["description"].ToString();

                        // Display the retrieved data
                        thanks_des_text.InnerText = retrievedData;
                    }
                    else
                    {
                        // No data found
                        thanks_des_text.InnerText = "No data found.";
                    }
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Response.Write("An error occurred: " + ex.Message);
            }
        }
    
    
    } 
}