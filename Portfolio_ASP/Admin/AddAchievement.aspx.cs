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
    public partial class AddAchievement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
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
        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            if (IsFormValidate())
            {
                //Insert Record

                //Insert Image first
                FileUpload1.SaveAs(Server.MapPath("~/img/") + FileUpload1.FileName); 
                SqlConnection con = new SqlConnection(GetConnectionString());
                SqlCommand cmd = new SqlCommand("insert into AddAchievement(IName,Image) values(@NAME,@IMg)", con);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd.Parameters.AddWithValue("@NAME", txtItemName.Text); 
                cmd.Parameters.AddWithValue("@IMg", "~/img/" + FileUpload1.FileName); 
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Item added successfully');</script>");
                txtItemName.Text = string.Empty; 


            }
            else
            {
                Response.Write("<script>alert('Validation Error');</script>");
            }


        }

        private bool IsFormValidate()
        {
            if (txtItemName.Text == string.Empty)
            {
                Response.Write("<script>alert('Item name is Required');</script>");
                txtItemName.Text = string.Empty;
                txtItemName.Focus();
                return false;
            } 
            return true;
        }
         
    }
}