using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Upload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        NameValueCollection nvc = Request.Form;
        //foreach (var key in nvc.AllKeys)
        //{
        //    Response.Write(key + " : " + nvc[key]);
        //    Console.WriteLine(key + " : " + nvc[key]);
        //}

        //Stream container = Request.InputStream;

        if (nvc["method"] == "delete")
        {
            if ((System.IO.File.Exists(Server.MapPath(nvc["filepath"]))))
            {
                System.IO.File.Delete(Server.MapPath(nvc["filepath"]));
            }
        }
        else if (nvc["method"] == "upload")
        {
            HttpPostedFile file = Request.Files["bytesContent"];
            if (file != null && file.ContentLength > 0)
            {
                try
                {
                    string fname = Path.GetFileName(file.FileName);
                    file.SaveAs(Server.MapPath(nvc["filepath"]));
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

        
    }
}