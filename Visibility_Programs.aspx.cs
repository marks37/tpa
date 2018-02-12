using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Visibility_Programs : System.Web.UI.Page
{
    clsDBLayer DBLayer = new clsDBLayer(ConfigurationManager.ConnectionStrings["VisibilityDB"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var visibLink = (HtmlGenericControl)this.Master.FindControl("programLink");
            visibLink.Attributes.Add("class", "active");

            List<clsVisibility> visibilityList = DBLayer.getVisibilityPrograms();
            parentRepeater.DataSource = visibilityList;
            parentRepeater.DataBind();

        }
    }
}