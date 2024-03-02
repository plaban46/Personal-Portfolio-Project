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
    public partial class AddTimeline : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("insert into AddTimeline(Degree_Name,Ins_Image,Pass_Year,Institution) values(@Degree_Name,@Ins_Image,@Pass_Year,@Institution);", con);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd.Parameters.AddWithValue("@Degree_Name", txtDegree.Text);
                cmd.Parameters.AddWithValue("@Ins_Image", "./img/" + FileUpload1.FileName);
                cmd.Parameters.AddWithValue("@Pass_Year", txtPassYear.Text);
                cmd.Parameters.AddWithValue("@Institution", txtInstitution.Text); 

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Timeline Updated successfully');</script>");

                txtDegree.Text = string.Empty;
                txtPassYear.Text = string.Empty;
                txtInstitution.Text = string.Empty; 
            }
            else
            {
                Response.Write("<script>alert('Validation Error');</script>");
            }


        }

        private bool IsFormValidate()
        {
            if (txtDegree.Text == string.Empty)
            {
                Response.Write("<script>alert('Project Name Required');</script>");
                txtDegree.Text = string.Empty;
                txtDegree.Focus();
                return false;
            }
            if (txtPassYear.Text == string.Empty)
            {
                Response.Write("<script>alert('Project Year Required');</script>");
                txtPassYear.Text = string.Empty;
                txtPassYear.Focus();
                return false;
            }
            if (txtInstitution.Text == string.Empty)
            {
                Response.Write("<script>alert('Project Description Required');</script>");
                txtInstitution.Text = string.Empty;
                txtInstitution.Focus();
                return false;
            } 
            return true;
        }

    }
}