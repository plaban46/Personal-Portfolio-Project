using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portfolio_ASP
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Registration();

        }

        private void Registration()
        {

            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PortfolioCon"].ConnectionString);
                SqlCommand cmd = new SqlCommand("Insert into UserLst(Username,Address,City,Mobile,Email,Password,Gender) values(@Name,@Address,@City,@Mobile,@Email,@Password,@Gender)", con);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd.Parameters.AddWithValue("@Name", txtname.Text); 
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@City", txtCity.Text); 
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Gender", ddlGender.Text);
                cmd.Parameters.AddWithValue("@Password", txtpass.Text); 

                cmd.ExecuteNonQuery();
                con.Close();
                clr();
                Response.Write("<script>alert('Success')</script>");
                Response.Redirect("~/Login.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        private void clr()
        {
            txtname.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtCity.Text = string.Empty;
            txtCity.Text = string.Empty; 
            txtMobile.Text = string.Empty;
            txtEmail.Text = string.Empty;
            ddlGender.SelectedIndex = -1; 
            txtname.Focus();
        }

        protected void cancleSignup(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}