using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class NEWUSER : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strpath = @"uploads/";
        if(Directory.Exists(strpath))
        {
            foreach (string file in Directory.GetFiles(strpath))
            {
                File.Delete(file);
            }
        }
    }

    protected void Back_Button_Click(object sender, EventArgs e)
    {
        Response.Redirect("NewAdminUser.aspx");
    }
}