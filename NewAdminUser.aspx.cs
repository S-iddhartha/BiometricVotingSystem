using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class NewAdminUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BackButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminPage.aspx");
    }

    protected void NEXTButton_Click(object sender, EventArgs e)
    {
        Session["AdharNo"] = txtAdharNo.Text;
        string s2;
        s2 = ConfigurationManager.ConnectionStrings["c1"].ConnectionString;
        SqlConnection con1 = new SqlConnection(s2);
        con1.Open();
        SqlCommand cmd1 = new SqlCommand("select ADHAR_ID from Admin where ADHAR_ID = @AID", con1);
        cmd1.Parameters.AddWithValue("@AID", Session["AdharNo"]);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        if (dr1.HasRows)
        {
            lblMessage.Text = "You already have an account <br> So you can't open a new account on the same registered Adhar No. Sorry...";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            //System.Threading.Thread.Sleep(2000);
            NEXTButton.Enabled = false;
            //BackButton.Enabled = false;
            //Response.Redirect("AdminPage.aspx");
            con1.Close();
        }
        else
        {
            string s1;
            s1 = ConfigurationManager.ConnectionStrings["c1"].ConnectionString;
            SqlConnection con = new SqlConnection(s1);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Adhar where Adhar_Id = @AID", con);
            cmd.Parameters.AddWithValue("@AID", Session["AdharNo"]);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                TextBox1.Text = dr["Name"].ToString();
                Session["Name"] = TextBox1.Text;
                Response.Redirect("WelcomeNewAdmin.aspx");
            }
            else
            {
                lblMessage.Text = "Your Adhar Id is not found, go register for your Adhar Card, sorry Dude";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                //System.Threading.Thread.Sleep(2000);
                NEXTButton.Enabled = false;
                //BackButton.Enabled = false;
                //Response.Redirect("AdminPage.aspx");
            }
            con.Close();
        }
    }

    protected void txtAdharNo_TextChanged(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        //txtAdharNo.Text = "";
        NEXTButton.Enabled = true;
    }
}