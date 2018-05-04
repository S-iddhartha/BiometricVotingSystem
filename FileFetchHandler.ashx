<%@ WebHandler Language="C#" Class="FileFetchHandler" %>

using System;
using System.Web;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Web.UI;

public class FileFetchHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    string FileName = string.Empty;
    string filepath = string.Empty;
    int count1 = 0, count2 = 0, i, j;
    bool flag = true;
    public void ProcessRequest(HttpContext context)
    {
        //context.Response.Write("<script>ShowProgress();</script>");
        if (context.Request.Files.Count > 0)
        {
            HttpFileCollection files = context.Request.Files;
            for (int i = 0; i < files.Count; i++)
            {
                context.Session["number"] = "4";
                //if(Convert.ToInt32(context.Session["number"]) == 4)
                //    context.Response.Write("Please wait for few seconds & let me verify your fingerprint!!!");
                context.Response.ContentType = "image";
                HttpPostedFile file = files[i];
                FileName = file.FileName;
                string savelocation = context.Server.MapPath("uploads/");
                string fileextention = System.IO.Path.GetExtension(FileName);
                string filename = Guid.NewGuid().ToString();
                string fname2 = savelocation + filename + fileextention;
                file.SaveAs(fname2);
                //context.Response.Write("Please Wait...I am verifying your fingerprint...");
                FileInfo fiImage = new FileInfo(fname2);
                System.Drawing.Bitmap img1 = new System.Drawing.Bitmap(fname2);
                string s1;
                s1 = ConfigurationManager.ConnectionStrings["c1"].ConnectionString;
                SqlConnection con = new SqlConnection(s1);
                con.Open();
                SqlCommand cmd = new SqlCommand("Select Fingerprint_Image from Adhar where Adhar_Id = @adid", con);
                cmd.Parameters.AddWithValue("@adid", context.Session["AdharNo"]);
                SqlDataReader dr = cmd.ExecuteReader();
                if(dr.Read())
                {
                    //context.Response.BinaryWrite((byte[])dr["Fingerprint's_Image"]);
                    byte[] data = (byte[])dr["Fingerprint_Image"];
                    Bitmap img2 = null;
                    using (MemoryStream stream = new MemoryStream(data))
                    {
                        img2 = new Bitmap(stream);
                    }
                    //fname1 = dr["Fingerprint's_Image"].ToString();
                    string img1_ref, img2_ref;
                    //Bitmap img1 = new Bitmap(fname1);
                    //Bitmap img2 = new Bitmap(fname2);
                    if (img1.Width == img2.Width && img1.Height == img2.Height)
                    {
                        for (i = 0; i < img1.Width; i++)
                        {
                            for (j = 0; j < img1.Height; j++)
                            {
                                img1_ref = img1.GetPixel(i, j).ToString();
                                img2_ref = img2.GetPixel(i, j).ToString();
                                if (img1_ref != img2_ref)
                                {
                                    count2++;
                                    flag = false;
                                    break;
                                }
                                count1++;
                                //context.Response.Redirect("<script>ShowProgress();</script>");
                                //ScriptManager.RegisterClientScriptResource(this.GetType(), "ShowProgress();");
                            }
                        }
                        if (flag == false)
                        {
                            //context.Response.Redirect("<script>toggle_div('loading')</script>");
                            context.Response.Write("Oops, Images are not same," + count2 + " wrong pixels found.");
                            context.Session["number"] = 1;
                            return;
                            //context.Response.End();
                            //fiImage.Delete();
                        }
                        else
                        {
                            //string script = "$ (document).ready(function () {});";
                            //Page.cli
                            //context.Response.Write('ShowProgress();');
                            //ScriptManager.RegisterStartupScript( this.GetType(), "load", script, true);
                            //context.Response.Flush();
                            //context.Response.End();
                            //System.Threading.Thread.Sleep(5000);
                            //context.Response.Redirect("<script>toggle_div('loading')</script>");
                            context.Response.Write(" Images are same , " + count1 + " same pixels found and " + count2 + " wrong pixels found");
                            context.Session["number"] = 2;
                            return;
                            //context.Response.Redirect("WelcomeNewAdmin.aspx");
                            //context.Session["a"] = 1;
                            //fiImage.Delete();
                            //HttpContext.Current.Response.Redirect("WelcomeNewAdmin.aspx", false);
                        }
                    }
                    else
                    {
                        //context.Response.Redirect("<script>toggle_div('loading')</script>");
                        context.Response.Write("Can not Compare this images");
                        context.Session["number"] = 3;
                        return;
                    }
                    //context.Response.End();
                }
            }
            context.Response.ContentType = "text/plain";
            //context.Response.Write("Please Wait...I am verifying your fingerprint...");
        }
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}