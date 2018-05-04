using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class VerifySuccessful : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string s1;
        //s1 = ConfigurationManager.ConnectionStrings["c1"].ConnectionString;
        //SqlConnection con = new SqlConnection(s1);
        //con.Open();
        //SqlCommand cmd = new SqlCommand("Select * from Adhar where Adhar_Id = @adid", con);
        //cmd.Parameters.AddWithValue("@adid", Session["AdharNo"]);
        //SqlDataReader dr = cmd.ExecuteReader();
        //if(dr.Read())
        //{
        lblName.Text = "Yey, you are totally verified";
        Label4.Text = "Now just give me your username and password";
    }

    protected void Back_Button_Click(object sender, EventArgs e)
    {
        Response.Redirect("NewAdminUser.aspx");
    }


    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(TextBox1.Text))
        {
            string s1;
            s1 = ConfigurationManager.ConnectionStrings["c1"].ConnectionString;
            SqlConnection con = new SqlConnection(s1);
            con.Open();
            SqlCommand cmd1 = new SqlCommand("select USER_ID from Admin where USER_ID = @userid", con);
            cmd1.Parameters.AddWithValue("@userid", TextBox1.Text);
            //cmd1.Parameters.AddWithValue("@adid", Session["AdharNo"]);
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.HasRows)
            {
                //if (Convert.ToDouble(Session["AdharNo"]) == Convert.ToDouble(dr["ADHAR_ID"]))
                //{
                //    lblUserid.Text = "You already have an account opened, <br> So you can't open a new account";
                //    lblUserid.ForeColor = System.Drawing.Color.Red;
                //    Response.Redirect("AdminPage.aspx");
                //}
                //else
                //{
                    lblUserid.Text = "_____Change userId Because it is already in use";
                    lblUserid.ForeColor = System.Drawing.Color.Red;
                    TextBox1.Text = "";
                //}               
            }
            else
            {
                lblUserid.Text = "_____Username Available";
                lblUserid.ForeColor = System.Drawing.Color.Green;
            }
        }
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        if(Page.IsValid)
        {
            string s1;
            s1 = ConfigurationManager.ConnectionStrings["c1"].ConnectionString;
            SqlConnection con = new SqlConnection(s1);
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into Admin values(@userid, @password, @adid)", con);
            cmd.Parameters.AddWithValue("@userid", TextBox1.Text);
            cmd.Parameters.AddWithValue("@password", TextBox2.Text);
            cmd.Parameters.AddWithValue("@adid", Session["AdharNo"]);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("NEWUSER.aspx");
        }
        else
        {
            Label10.Text = "Captcha is not entered properly";
            Label10.ForeColor = System.Drawing.Color.Red;
        }
    }
}