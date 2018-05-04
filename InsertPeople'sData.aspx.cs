using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class InsertPeople_sData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BackButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("AfterAdminPageLogin.aspx");
    }

    protected void DropState_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.IsPostBack)
        {
            string s1;
            s1 = ConfigurationManager.ConnectionStrings["c1"].ConnectionString;
            SqlConnection con = new SqlConnection(s1);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select DISTRICT from District where STATE = '"+DropState.Text+"'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if(ds.Tables[0].Rows.Count > 0)
            {
                ds.Dispose();
                DropDistrict.Items.Clear();
                DropDistrict.DataSource = ds;
                DropDistrict.DataTextField = "DISTRICT";
                DropDistrict.DataBind();
                con.Close();
            }
        }
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        Session["Name"] = txtName.Text;
        Session["Father'sName"] = txtFatherName.Text;
        Session["Husband'sName"] = txtHusbandName.Text;
        Session["Address"] = txtAddress.Text;
        Session["State"] = DropState.Text;
        Session["District"] = DropDistrict.Text;
        Session["PinCode"] = txtPin.Text;
        Session["MobileNo"] = txtMobileNo.Text;
        Session["AdharCardNo"] = txtAdharCardNo.Text;
        Response.Redirect("VerifyPeople'sDetails.aspx");
    }
}