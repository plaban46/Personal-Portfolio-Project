using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Portfolio_ASP.Admin
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Optional: Populate dropdown or gridview with existing images
            }
        }

        protected void home_image_up_Click(object sender, EventArgs e)
        {
            if (home_image.HasFile)
            {
                try
                { 
                    byte[] imageData = home_image.FileBytes;
                     
                    SaveImageToDatabase(imageData,1); 
                }
                catch (Exception ex)
                {
                    // Handle error
                }
            }
        }

        protected void SaveImageToDatabase(byte[] imageData, int imageID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["PortfolioCon"].ConnectionString;
            string query_delete = "DELETE FROM Images WHERE id = @ID";
            string query_insert = "INSERT INTO Images (id, ImageData) VALUES (@ID, @ImageData)";
             
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();  
                using (SqlCommand deleteCommand = new SqlCommand(query_delete, connection))
                {
                    deleteCommand.Parameters.Add("@ID", SqlDbType.Int).Value = imageID;
                    deleteCommand.ExecuteNonQuery();
                }  
                using (SqlCommand insertCommand = new SqlCommand(query_insert, connection))
                {
                    insertCommand.Parameters.Add("@ID", SqlDbType.Int).Value = imageID;
                    insertCommand.Parameters.Add("@ImageData", SqlDbType.VarBinary, -1).Value = imageData;
                    insertCommand.ExecuteNonQuery();
                }
                connection.Close();
            }
        }

        Boolean flag = true;
        protected void home_image_re_Click(object sender, EventArgs e)
        {
            // Retrieve image from database based on certain criteria (e.g., image ID)
            byte[] imageData = RetrieveImageFromDatabase(1);

            if (imageData != null)
            {
                // Check if ViewState contains flag, if not, initialize it to true
                if (ViewState["Flag"] == null)
                {
                    ViewState["Flag"] = true;
                }

                bool flag = (bool)ViewState["Flag"];

                if (flag)
                {
                    // Display the retrieved image on the web form
                    home_image_view.Visible = true;
                    home_image_view.ImageUrl = "data:image;base64," + Convert.ToBase64String(imageData);
                }
                else
                {
                    home_image_view.Visible = false;
                    home_image_view.ImageUrl = null;
                }

                // Toggle flag value for next click
                ViewState["Flag"] = !flag;
            }

        }

        protected byte[] RetrieveImageFromDatabase(int imageID)
        {
            byte[] imageData = null;
            string connectionString = ConfigurationManager.ConnectionStrings["PortfolioCon"].ConnectionString;
            string query = "SELECT ImageData FROM Images WHERE ID = @ImageID";

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
                    connection.Close(); 
                }
            } 
            return imageData;
        }


        protected void about_image_up_Click(object sender, EventArgs e)
        {
            if (about_image.HasFile)
            {
                try
                {
                    byte[] imageData = about_image.FileBytes;

                    SaveImageToDatabase(imageData, 2);
                }
                catch (Exception ex)
                {
                    // Handle error
                }
            }
        }

        Boolean flag_about;
        protected void about_image_re_Click(object sender, EventArgs e)
        {
            // Retrieve image from database based on certain criteria (e.g., image ID)
            byte[] imageData = RetrieveImageFromDatabase(2);

            if (imageData != null)
            {
                // Check if ViewState contains flag, if not, initialize it to true
                if (ViewState["flag_about"] == null)
                {
                    ViewState["flag_about"] = true;
                }

                bool flag = (bool)ViewState["flag_about"];

                if (flag)
                {
                    // Display the retrieved image on the web form
                    about_image_view.Visible = true;
                    about_image_view.ImageUrl = "data:image;base64," + Convert.ToBase64String(imageData);
                }
                else
                {
                    about_image_view.Visible = false;
                    about_image_view.ImageUrl = null;
                }

                // Toggle flag value for next click
                ViewState["flag_about"] = !flag;
            }
        } 

        protected void thanks_image_up_Click(object sender, EventArgs e)
        {
            if (thanks_image.HasFile)
            {
                try
                {
                    byte[] imageData = thanks_image.FileBytes;

                    SaveImageToDatabase(imageData, 3);
                }
                catch (Exception ex)
                {
                    // Handle error
                }
            }
        }

        Boolean flag_thanks;
        protected void thanks_image_re_Click(object sender, EventArgs e)
        {
            // Retrieve image from database based on certain criteria (e.g., image ID)
            byte[] imageData = RetrieveImageFromDatabase(3);

            if (imageData != null)
            {
                // Check if ViewState contains flag, if not, initialize it to true
                if (ViewState["flag_thanks"] == null)
                {
                    ViewState["flag_thanks"] = true;
                }

                bool flag = (bool)ViewState["flag_thanks"];

                if (flag)
                {
                    // Display the retrieved image on the web form
                    thanks_image_view.Visible = true;
                    thanks_image_view.ImageUrl = "data:image;base64," + Convert.ToBase64String(imageData);
                }
                else
                {
                    thanks_image_view.Visible = false;
                    thanks_image_view.ImageUrl = null;
                }

                // Toggle flag value for next click
                ViewState["flag_thanks"] = !flag;
            }
        }
    }
} 