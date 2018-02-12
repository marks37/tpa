<%@ WebHandler Language="C#" Class="FTPImageHandler" %>

using System;
using System.Web;

public class FTPImageHandler : IHttpHandler {
    clsDBLayer DBLayer = new clsDBLayer(System.Configuration.ConfigurationManager.ConnectionStrings["VisibilityDB"].ToString());
    
    public void ProcessRequest (HttpContext context) {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");

        string picId = context.Request.QueryString["id"];
        
        using(var entitiesContext = new Entities()){
            var picture = entitiesContext.Data_Visibility_Picture.Find(int.Parse(picId));
            
            var webClient = new System.Net.WebClient();
            webClient.Credentials = new System.Net.NetworkCredential("tpa", "~!n0v3mb3r@@2017!~");
            byte[] imageBytes = webClient.DownloadData("ftp://23.89.193.176/" + picture.thumbnail_path);

            context.Response.Buffer = true;
            context.Response.Charset = "";
            context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            context.Response.ContentType = "image/png";
            context.Response.AddHeader("content-disposition", "attachment;filename=" + picture.thumbnail_name);
            context.Response.BinaryWrite(imageBytes);
        }
        
        

    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}