using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class New_Visibility_Pictures : System.Web.UI.Page
{
    clsDBLayer DBLayer = new clsDBLayer(ConfigurationManager.ConnectionStrings["VisibilityDB"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string responseId = Request.QueryString["item"];
            List<clsVisibilityPicture> pictureList = DBLayer.getVisibilityPicturesByResponseId(responseId);
            picRepeater.DataSource = pictureList;
            picRepeater.DataBind(); 
        }
    }

    public clsWorkplan getWorkplan(string id)
    {
        clsWorkplan workplan = DBLayer.getWorkplan(id);
        return workplan;
    }
    protected void AjaxFileUpload1_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
    {
        string fileName = Path.GetFileName(e.FileName);
        AjaxFileUpload1.SaveAs(Server.MapPath("~/Images/" + fileName));

        clsVisibilityPicture picture = new clsVisibilityPicture();
        picture.FileName = fileName;
        picture.FilePath = "Images/" + fileName;
        picture.ResponseId = Request.QueryString["item"];
        picture.Userid = "1";
        picture.DateCreated = DateTime.Now.ToString("yyyy-MM-dd");
        DBLayer.addVisibilityPicturesByResponseId(picture);
    }
    protected void submitBtn_Click(object sender, EventArgs e)
    {

    }
    protected void saveDraftBtn_Click(object sender, EventArgs e)
    {

    }
    protected void backBtn_Click(object sender, EventArgs e)
    {
        string workplanId = Request.QueryString["pk"];
        Response.Redirect("New_Visibility.aspx?pk=" + workplanId);
    }
}