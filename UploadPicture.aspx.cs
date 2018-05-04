using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class UploadPicture : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        if(Page.IsValid)
        {
            //string[] filepaths = ("~/uploads/");
            //foreach (string filepath in filepaths)
            //    File.Delete(filepath);
            Response.Redirect("RegisterSuccessfully.aspx");
        }
        else
        {
            lblMessage.Text = "Captcha is not Entered Properly, Please Re-Type It.";
        }
    }
    protected void BackButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("VerifyPeople'sDetails.aspx");
    }
}