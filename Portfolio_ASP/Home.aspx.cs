using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.UI;
using System.Web.UI.WebControls; 

namespace Portfolio_ASP
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PortfolioCon"].ConnectionString);

        public static List<FeedbackItem> FeedbackList { get; set; }
        public static List<AchievementItem> AchievementList { get; set; }
        public static List<ProjectItem> ProjectList { get; set; }
        public static List<PhotographyItem> PhotographyList { get; set; }
         
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
               
            }
            PopulateFeedbackList();
            PopulateAchievementList();
            PopulateProjectList();
            PopulatePhotographyList();

            home_description();
            about_text();
            thanks_message();
            home_about_thanks_image_loading();
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
                    FeedbackList.Add(new FeedbackItem { Title = dr.GetValue(0).ToString(), TopicName = dr.GetValue(1).ToString(), Description = dr.GetValue(2).ToString() });
                }
                con.Close();    
            }catch(Exception ex)
            {

            } 
        }
        private void PopulateAchievementList()
        {
            
            //AchievementList = new List<AchievementItem>();
            //AchievementList.Add(new AchievementItem { Name = "Feedback 1", ImageUrl = "Introduction to ASP.NET" });
            //AchievementList.Add(new AchievementItem { Name = "Feedback 2", ImageUrl = "ASP.NET" });


            try
            {
                SqlCommand cmd = new SqlCommand("select IName,Image from AddAchievement", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                AchievementList = new List<AchievementItem>();
                while (dr.Read())
                {
                    AchievementList.Add(new AchievementItem { Name = dr.GetValue(0).ToString(), ImageUrl = dr.GetValue(1).ToString() });
                }
                con.Close();
            }
            catch (Exception ex)
            {

            }
        }
        private void PopulateProjectList()
        {
            
            //AchievementList = new List<AchievementItem>();
            //AchievementList.Add(new AchievementItem { Name = "Feedback 1", ImageUrl = "Introduction to ASP.NET" });
            //AchievementList.Add(new AchievementItem { Name = "Feedback 2", ImageUrl = "ASP.NET" });


            try
            {
                SqlCommand cmd = new SqlCommand("select Name,Image,Year,Description,Link from AddProject", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                ProjectList = new List<ProjectItem>();
                while (dr.Read())
                {
                    ProjectList.Add(new ProjectItem { Name = dr.GetValue(0).ToString(), ImageUrl = dr.GetValue(1).ToString(), Year = dr.GetValue(2).ToString(), Description = dr.GetValue(3).ToString(), Link = dr.GetValue(4).ToString()});
                }
                con.Close();
            }
            catch (Exception ex)
            {

            }
        }
        private void PopulatePhotographyList()
        {

            //AchievementList = new List<AchievementItem>();
            //AchievementList.Add(new AchievementItem { Name = "Feedback 1", ImageUrl = "Introduction to ASP.NET" });
            //AchievementList.Add(new AchievementItem { Name = "Feedback 2", ImageUrl = "ASP.NET" });


            try
            {
                SqlCommand cmd = new SqlCommand("select IName,Image from AddPhotography", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                PhotographyList = new List<PhotographyItem>();
                while (dr.Read())
                {
                    PhotographyList.Add(new PhotographyItem { Name = dr.GetValue(0).ToString(), ImageUrl = dr.GetValue(1).ToString() });
                }
                con.Close();
            }
            catch (Exception ex)
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

        public class AchievementItem
        {
            public string Name { get; set; }
            public string ImageUrl { get; set; }
        }        
        
        public class ProjectItem
        {
            public string Name { get; set; }
            public string ImageUrl { get; set; }
            public string Year { get; set; }
            public string Description { get; set; }
            public string Link { get; set; } 
            
        }

        public class PhotographyItem
        {
            public string Name { get; set; }
            public string ImageUrl { get; set; }
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




        protected void home_about_thanks_image_loading()
        {
            // Retrieve image from database based on certain criteria (e.g., image ID)
            byte[] imageData_home = RetrieveImageFromDatabase(1);
            byte[] imageData_about = RetrieveImageFromDatabase(2);
            byte[] imageData_thanks = RetrieveImageFromDatabase(3);

            if (imageData_home != null)
            {
                string base64String = Convert.ToBase64String(imageData_home);
                home_image_view.Visible = true; 
                home_image_view.ImageUrl = "data:image;base64," + base64String;

            }
            if (imageData_about != null)
            { 
                string base64String = Convert.ToBase64String(imageData_about); 
                about_image_view.Visible= true;
                about_image_view.ImageUrl = "data:image;base64," + base64String;
            }
            if (imageData_thanks != null)
            { 
                string base64String = Convert.ToBase64String(imageData_thanks);
                thanks_image_view.Visible = true;
                thanks_image_view.ImageUrl = "data:image;base64," + base64String;
            }
        }

        protected byte[] RetrieveImageFromDatabase(int imageID)
        {
            byte[] imageData = null;
            string connectionString = ConfigurationManager.ConnectionStrings["PortfolioCon"].ConnectionString;
            string query = "SELECT ImageData FROM information WHERE ID = @ImageID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@ImageID", SqlDbType.Int).Value = imageID;
                    connection.Open();
                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        imageData = (byte[])result;
                    }
                }
            }
            return imageData;
        }

        protected void contactButton_Click(object sender, EventArgs e)
        {
            //Response.Redirect("~/Login.aspx"); //Handled By Javascript
        }
    }
}