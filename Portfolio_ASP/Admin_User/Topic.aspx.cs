using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portfolio_ASP.Admin_User
{
    public partial class WebForm2 : System.Web.UI.Page
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

        private string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["PortfolioCon"].ConnectionString;
        }
        protected void btnAddResearch_Click(object sender, EventArgs e)
        {
            if (IsFormValidate())
            {
                //Insert Record

                SqlConnection con = new SqlConnection(GetConnectionString());
                SqlCommand cmd = new SqlCommand("insert into AddTopic(Name,Topic,Description) values(@NAME,@TOPIC,@DESCRIPTION)", con);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd.Parameters.AddWithValue("@NAME", txtWriterName.Text);
                cmd.Parameters.AddWithValue("@TOPIC", txtTopicName.Text);
                cmd.Parameters.AddWithValue("@DESCRIPTION", txtDesName.Text); 
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Topic added successfully');</script>");
                txtWriterName.Text = string.Empty;
                txtTopicName.Text = string.Empty;
                txtDesName.Text = string.Empty;


            }
            else
            {
                Response.Write("<script>alert('Validation Error');</script>");
            }


        }

        private bool IsFormValidate()
        {
            if (txtWriterName.Text == string.Empty)
            {
                Response.Write("<script>alert('Writter name is Required');</script>");
                txtWriterName.Text = string.Empty;
                txtWriterName.Focus();
                return false;
            }
            if (txtTopicName.Text == string.Empty)
            {
                Response.Write("<script>alert('Topic name is Required');</script>");
                txtTopicName.Text = string.Empty;
                txtTopicName.Focus();
                return false;
            }
            if (txtDesName.Text == string.Empty)
            {
                Response.Write("<script>alert('Description is Required');</script>");
                txtDesName.Text = string.Empty;
                txtDesName.Focus();
                return false;
            } 
            return true;
        }

    }
}