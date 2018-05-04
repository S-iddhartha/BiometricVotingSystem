using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class AdminPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Text = "";
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        Session["userid"] = txtUsername.Text;
        Session["password"] = txtPassword.Text;
        string s1;
        s1 = ConfigurationManager.ConnectionStrings["c1"].ConnectionString;
        SqlConnection con = new SqlConnection(s1);
        con.Open();
        SqlCommand cmd = new SqlCommand("select USER_ID, Password from Admin where USER_ID = @u1 and Password = @p1", con);
        cmd.Parameters.AddWithValue("@u1", txtUsername.Text);
        cmd.Parameters.AddWithValue("@p1", txtPassword.Text);
        SqlDataReader dr = cmd.ExecuteReader();
        if(dr.Read())
        {
            Response.Redirect("AfterAdminPageLogin.aspx");
        }
        else
        {
            lblMessage.Text = "Either Username Or Password Or Both are Incorrect";
        }
        con.Close();
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("MainChoosingPage.aspx");
    }
}