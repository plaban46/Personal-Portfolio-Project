using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portfolio_ASP.Admin
{
    public partial class Admin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PortfolioCon"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session.RemoveAll();
            //Session.Remove("UserName");
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (IsFormValid())
            {
                //Response.Write("<script>alert('Success');</script>");

                try
                {
                    SqlCommand cmd = new SqlCommand("select Username,Password from AdminLst where Username=@Username AND Password=@Password", con);
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
                            Response.Redirect("AdminPage.aspx?username=" + Server.UrlEncode(dr.GetValue(0).ToString())); 
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

        protected void cancelAdmin(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }
    }
}