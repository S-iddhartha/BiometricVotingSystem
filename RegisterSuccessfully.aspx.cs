using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class RegisterSuccessfully : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string filename = Path.Combine(Server.MapPath("~/uploads/"));
        ////FileInfo file = new FileInfo(filename);
        ////file.Delete();
        //var directory = new DirectoryInfo(filename);
        //foreach (FileInfo file in directory.GetFiles())
        //{
        //    file.Delete();
        //}
    }

    protected void BackButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("AfterAdminPageLogin.aspx");
    }
}