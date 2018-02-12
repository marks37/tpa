using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_visibility : System.Web.UI.Page
{
    clsDBLayer DBLayer = new clsDBLayer(ConfigurationManager.ConnectionStrings["VisibilityDB"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        List<clsWorkplan> allWorkplan = DBLayer.getAllWorkplans();
        visibRepeater.DataSource = allWorkplan;
        visibRepeater.DataBind();
    }
    protected void visibRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            clsWorkplan workplan = (clsWorkplan)e.Item.DataItem;
            Label statuslbl = (Label)e.Item.FindControl("statuslbl");
            statuslbl.Text = workplan.Status;
            if (workplan.Status.Equals("Submitted"))
            {
                statuslbl.CssClass += "label label-success";
            }
            Label calldatelbl = (Label)e.Item.FindControl("calldatelbl");
            DateTime CallDate = DateTime.Parse(workplan.CallDate);
            calldatelbl.Text = CallDate.ToString("yyyy-MM-dd");
            Label datecreatedlbl = (Label)e.Item.FindControl("datecreatedlbl");
            DateTime dateCreated = DateTime.Parse(workplan.DateCreated);
            datecreatedlbl.Text = dateCreated.ToString("yyyy-MM-dd");

        }
    }
    protected void visibRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string workplanId = e.CommandArgument.ToString();
        if (e.CommandName == "view")
        {
            Response.Redirect("~/admin_view_visibility.aspx?pk=" + workplanId);
        }
    }
}