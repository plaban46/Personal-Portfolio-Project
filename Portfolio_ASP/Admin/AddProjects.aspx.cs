using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portfolio_ASP.Admin
{
    public partial class AddProjects : System.Web.UI.Page
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

        private string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["PortfolioCon"].ConnectionString;
        }
        protected void AddProjectButton(object sender, EventArgs e)
        {
            if (IsFormValidate())
            {
                //Insert Record

                //Insert Image first
                FileUpload1.SaveAs(Server.MapPath("~/img/") + FileUpload1.FileName);
                SqlConnection con = new SqlConnection(GetConnectionString());
                SqlCommand cmd = new SqlCommand("insert into AddProject(Name,Image,Year,Description,Link) values(@Name,@Image,@Year,@Description,@Link);", con);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd.Parameters.AddWithValue("@Name", txtProName.Text);
                cmd.Parameters.AddWithValue("@Image", "./img/" + FileUpload1.FileName);
                cmd.Parameters.AddWithValue("@Year", txtProYear.Text);
                cmd.Parameters.AddWithValue("@Description", txtProDes.Text);
                cmd.Parameters.AddWithValue("@Link", txtProLink.Text);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Project added successfully');</script>");

                txtProName.Text = string.Empty;
                txtProYear.Text = string.Empty;
                txtProDes.Text = string.Empty;
                txtProLink.Text = string.Empty;
            }
            else
            {
                Response.Write("<script>alert('Validation Error');</script>");
            }


        }

        private bool IsFormValidate()
        {
            if (txtProName.Text == string.Empty)
            {
                Response.Write("<script>alert('Project Name Required');</script>");
                txtProName.Text = string.Empty;
                txtProName.Focus();
                return false;
            }
            if (txtProYear.Text == string.Empty)
            {
                Response.Write("<script>alert('Project Year Required');</script>");
                txtProYear.Text = string.Empty;
                txtProYear.Focus();
                return false;
            }
            if (txtProDes.Text == string.Empty)
            {
                Response.Write("<script>alert('Project Description Required');</script>");
                txtProDes.Text = string.Empty;
                txtProDes.Focus();
                return false;
            }
            if (txtProLink.Text == string.Empty)
            {
                Response.Write("<script>alert('Project Link Required');</script>");
                txtProLink.Text = string.Empty;
                txtProLink.Focus();
                return false;
            }
            return true;
        }

    }
}