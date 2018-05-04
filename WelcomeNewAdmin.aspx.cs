using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class WelcomeNewAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //string value = null;
            //if (value == null)
            //{
                lblBefore.Text = "Oh! Hi! ";
                lblName.Text = Session["Name"].ToString() + " ";
                lblAfter.Text = "Is that you?";
                OKButton.Visible = false;
                container.Attributes.Add("style", "display:none");
            //}
            //else
            //{
            //    value = (string)Session["yourKye"];
            //    if (value == "test123")
            //        ClientScript.RegisterStartupScript(this.GetType(), "MyMethod", "ShowProgress();", true);
            //}
            
            
            //YesButton.OnClientClick = "toggle_div_fun('container');";
            //BACKButton.Visible = false;
        }
        else
            container.Attributes.Add("style", "display:block");
    }

    protected void YesButton_Click(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            lblAfter.Text = "";
            lblBefore.Text = "";
            lblName.Text = "";
            lblBefore.Text = "Okay, then ";
            lblName.Text = "let me ";
            lblAfter.Text = "verify you";
            //YesButton.Attributes.Add("OnClick", "toggle_div_fun('container');" /*return false;"*/);
            //YesButton.OnClientClick = "toggle_div_fun('container');";
            YesButton.Visible = false;
            NoButton.Visible = false;
            lblInstruction.Text = "Just give me your fingerprint in the Drag and Drop area";
            OKButton.Visible = true;
            //BACKButton.Visible = true;
            //Image2.ImageUrl = "~/uploads/" + "~/FileFetchHandler.ashx";
            //ClientScript.RegisterClientScriptBlock(GetType(), "IsPostBack", "var isPostBack = true;", true);
        }
    }

    //protected void BACKButton_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("NewAdminUser.aspx");
    //}

    protected void OKButton_Click1(object sender, EventArgs e)
    {
        int num = Convert.ToInt32(Session["number"]);
        if (num == 2)
            Response.Redirect("VerifySuccessful.aspx");
        else if (num == 1)
        {
            lblMessage.Text = "Oops!!! Your fingerprint is not matched properly.";
            System.Threading.Thread.Sleep(1000);
            Response.Redirect("AdminPage.aspx");
        }
        else if (num == 3)
        {
            lblMessage.Text = "You have provided a wrong fingerprint.";
        }
        //else if (num == 4)
        //{
            lblMessage.Text = "You Have not given me any Finger Print Image of yours!!!";
        //}
    }
    //protected void GetName()
    //{
    //    int num = Convert.ToInt32(Session["number"]);
    //    if (num == 4)
    //        lblMessage.Text = "Please wait for few seconds & let me verify your fingerprint!!!";
    //}
}