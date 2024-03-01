using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Portfolio_ASP
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PortfolioCon"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void register_now(object sender, EventArgs e)
        {
            Response.Redirect("~/SignUp.aspx");
        }

        protected void admin_login(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AdminLogin.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //Response.Redirect("~/Admin_User/UserPage.aspx");

            if (IsFormValid())
            {  
                try
                {
                    SqlCommand cmd = new SqlCommand("select Username,Password from UserLst where Username=@Username AND Password=@Password", con);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    cmd.Parameters.AddWithValue("@Username", txtuserid.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtpass.Text.Trim());
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        { 
                            Session["UserName"] = dr.GetValue(0).ToString();

                            Response.Write("<script>alert('Login success');</script>");
                            Response.Redirect("~/Admin_User/UserPage.aspx?username=" + Server.UrlEncode(dr.GetValue(0).ToString()));
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid login... error');</script>");
                        //Response.Redirect("~/Default.aspx");
                        txtuserid.Text = string.Empty;
                        txtpass.Text = string.Empty;
                        txtuserid.Focus(); 
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }


            }
            else
            {
                //Response.Write("<script>alert('validation error');</script>");
            }
        }

        protected void cancelLogin(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }


        private bool IsFormValid()
        {
            if (txtuserid.Text == string.Empty)
            {
                Response.Write("<script>alert('UserName is Required');</script>");
                txtuserid.Text = string.Empty;
                txtuserid.Focus();
                return false;
            }
            if (txtpass.Text == string.Empty)
            {
                Response.Write("<script>alert('Password is Required');</script>");
                txtpass.Text = string.Empty;
                txtpass.Focus();
                return false;
            }

            return true;
        }
    }
}