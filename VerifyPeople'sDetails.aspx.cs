using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;

public partial class VerifyPeople_sDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblName.Text = Session["Name"].ToString();
        lblFatherName.Text = Session["Father'sName"].ToString();
        lblHusbandName.Text = Session["Husband'sName"].ToString();
        lblAddress.Text = Session["Address"].ToString();
        lblState.Text = Session["State"].ToString();
        lblDistrict.Text = Session["District"].ToString();
        lblPinCode.Text = Session["PinCode"].ToString();
        lblMobileNo.Text = Session["MobileNo"].ToString();
        lblAdharCardNo.Text = Session["AdharCardNo"].ToString();
    }

    protected void BackButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("InsertPeople'sData.aspx");
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("UploadPicture.aspx");
        //if(Page.IsValid)
        //{
        //    string s1;
        //    s1 = ConfigurationManager.ConnectionStrings["c1"].ConnectionString;
        //    SqlConnection con = new SqlConnection(s1);
        //    SqlCommand cmd = new SqlCommand("insert into Adhar values (@Name, @Father'sName, @Husband'sName, @Address, @State, @District, @PinCode, @MobileNo, @AdharCardNo)", con);
        //    con.Open();
        //    cmd.Parameters.AddWithValue("@Name", Session["Name"]);
        //    cmd.Parameters.AddWithValue("@Father'sName", Session["Father'sName"]);
        //    cmd.Parameters.AddWithValue("@Husband'sName", Session["Husband'sName"]);
        //    cmd.Parameters.AddWithValue("@Address", Session["Address"]);
        //    cmd.Parameters.AddWithValue("@State", Session["State"]);
        //    cmd.Parameters.AddWithValue("@District", Session["District"]);
        //    cmd.Parameters.AddWithValue("@PinCode", Session["PinCode"]);
        //    cmd.Parameters.AddWithValue("@MobileNo", Session["MobileNo"]);
        //    cmd.Parameters.AddWithValue("@AdharCardNo", Session["AdharCardNo"]);
        //    cmd.ExecuteNonQuery();
        //    Response.Redirect("RegisterSuccessfully.aspx");
        //}
        //else
        //{
        //    lblMessage.Text = "Captcha is not Entered Properly, Please Re-Type It.";
        //    lblMessage.ForeColor = System.Drawing.Color.Red;
        //}
    }
}