 <%@ WebHandler Language="C#" Class="FileUploadHandler" %>

using System;
using System.Web;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class FileUploadHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    string FileName = string.Empty;
    string fname;
    public void ProcessRequest (HttpContext context) {
        if (context.Request.Files.Count > 0)
        {
            HttpFileCollection files = context.Request.Files;
            for (int i = 0; i < files.Count; i++)
            {
                HttpPostedFile file = files[i];
                FileName = file.FileName;
                string savelocation = context.Server.MapPath("uploads/");
                string fileextention = System.IO.Path.GetExtension(FileName);
                string filename = Guid.NewGuid().ToString();
                fname = savelocation + filename + fileextention;
                file.SaveAs(fname);
                //int getPos = fname.LastIndexOf("\\");
                //int len = fname.Length;
                //string getPath = fname.Substring(getPos, len - getPos);
                //string pathToStore = getPath.Remove(0, 1);
                FileInfo fiImage = new FileInfo(fname);
                long m_lImageFileLength=fiImage.Length;
                FileStream fs=new FileStream(fname,FileMode.Open,
                          FileAccess.Read,FileShare.Read);
                byte[] m_barrImg=new byte[Convert.ToInt32(m_lImageFileLength)];
                int iBytesRead = fs.Read(m_barrImg,0,
                         Convert.ToInt32(m_lImageFileLength));
                string s1;
                s1 = ConfigurationManager.ConnectionStrings["c1"].ConnectionString;
                SqlConnection con = new SqlConnection(s1);
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into Adhar values(@aid, @name, @fathername, @husbandname, @address, @district, @state, @pincode, @mobileno, @image)", con);
                cmd.Parameters.AddWithValue("@aid", context.Session["AdharCardNo"]);
                cmd.Parameters.AddWithValue("@name", context.Session["Name"]);
                cmd.Parameters.AddWithValue("@fathername", context.Session["Father'sName"]);
                cmd.Parameters.AddWithValue("@husbandname", context.Session["Husband'sName"]);
                cmd.Parameters.AddWithValue("@address", context.Session["Address"]);
                cmd.Parameters.AddWithValue("@state", context.Session["State"]);
                cmd.Parameters.AddWithValue("@district", context.Session["District"]);
                cmd.Parameters.AddWithValue("@pincode", context.Session["PinCode"]);
                cmd.Parameters.AddWithValue("@mobileno", context.Session["MobileNo"]);
                cmd.Parameters.AddWithValue("@image", m_barrImg);
                cmd.ExecuteNonQuery();
                con.Close();
                //if(File.Exists(fname))
                //{
                //    File.Delete(fname);
                //}
                //if (fiImage.Exists)
                //{
                //    fiImage.Delete(fname);
                //}
            }
            //if (fname != null || fname != string.Empty)
            //{
            //    if ((System.IO.File.Exists(fname)))
            //    {
            //        System.IO.File.Delete(fname);
            //    }
            //}
            context.Response.ContentType = "text/plain";
            context.Response.Write(FileName + " Uploaded Successfully!");
        }

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}