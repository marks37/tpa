using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class tl_visibility : System.Web.UI.Page
{
    clsDBLayer DBLayer = new clsDBLayer(ConfigurationManager.ConnectionStrings["VisibilityDB"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        clsUser user = (clsUser)Session["user"];
        if (Session["user"] == null)
        {
            if (!Page.IsCallback)
            {
                Response.Redirect("~/Site_Login.aspx");
            }
        }
        else
        {
            if (!user.Type.Equals("Team Leader"))
            {
                //Response.Redirect("~/Site_Login.aspx");
                Response.Redirect("~/Site_Login.aspx");
            }
        }

        var visibLink = (HtmlGenericControl)this.Master.FindControl("visibLink");
        visibLink.Attributes.Add("class", "active");

        //List<clsWorkplan> workplanList = DBLayer.getWorkplansTLVisibilityByUserId(user.Id);

        if (!IsPostBack)
        {
            //workplan_rptr.DataSource = workplanList;
            //workplan_rptr.DataBind();
        }

    }

    protected DateTime GetCurrentTime()
    {
        DateTime serverTime = DateTime.Now;
        DateTime _localTime = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(serverTime, TimeZoneInfo.Local.Id, "Singapore Standard Time");
        return _localTime;
    }

    protected void workplan_rptr_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            clsWorkplan workplan = (clsWorkplan)e.Item.DataItem;
            Label statuslbl = (Label)e.Item.FindControl("statuslbl");
            statuslbl.CssClass = "";
            if (workplan.Status.Equals("Submitted"))
            {
                statuslbl.Text = workplan.Status;
                statuslbl.CssClass += " label label-success";
            }
            else if (workplan.Status.Equals("Pending"))
            {
                statuslbl.Text = workplan.Status;
                statuslbl.CssClass += " label label-default";
            }
            else if (workplan.Status.Equals("For Approval"))
            {
                statuslbl.Text = workplan.Status;
                statuslbl.CssClass += " label label-warning";
            }

            Label deadlinelbl = (Label)e.Item.FindControl("deadlinelbl");
            DateTime deadline = DateTime.Parse(workplan.Deadline);
            deadlinelbl.Text = deadline.ToString("MM.dd.yyyy");

            if (!workplan.Deadline.Equals("") && !workplan.Status.Equals("Submitted"))
            {
                if (deadline <= GetCurrentTime())
                {
                    statuslbl.Text = "Missed";
                    statuslbl.CssClass += " label label-danger";
                }
                else
                {

                }
            }
            else
            {
            }

            Label branchlbl = (Label)e.Item.FindControl("branchlbl");
            branchlbl.Text = workplan.AssignedBranch.BranchCode + " " + workplan.AssignedBranch.Account_group_1 + " " + workplan.AssignedBranch.BranchName;

            Label coordinatorlbl = (Label)e.Item.FindControl("coordinatorlbl");
            coordinatorlbl.Text = workplan.AssignedUser.Fullname;

            Label calldatelbl = (Label)e.Item.FindControl("calldatelbl");
            DateTime CallDate = DateTime.Parse(workplan.CallDate);
            calldatelbl.Text = CallDate.ToString("MM.dd.yyyy");

        }
    }
    protected void workplan_rptr_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        clsUser user = (clsUser)Session["user"];
        string workplanId = e.CommandArgument.ToString();
        if (e.CommandName == "view")
        {
            if (user != null)
            {
                clsActivityLog log = new clsActivityLog();
                log.Username = user.Username;
                log.DateCreated = DBLayer.GetCurrentTime().ToString();
                log.PageUrl = HttpContext.Current.Request.Url.AbsolutePath;
                log.Activity = "viewed visit::" + workplanId;
                DBLayer.addNewActivityLog(log);

            }
            Response.Redirect("~/view_visibility.aspx?pk=" + workplanId);
        }
    }

    protected void EntityServerModeDataSource1_Selecting(object sender, DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs e)
    {
        clsUser user = (clsUser)Session["user"];
        if (Session["user"] == null)
        {
            if (!Page.IsCallback)
            {
                Response.Redirect("~/Site_Login.aspx");
            }
        }

        int userId = int.Parse(user.Id);
        
        //IQueryable<vw_visibility_surveys_tl> query = new Entities().vw_visibility_surveys_tl;
        //query = query.Where(p => p.assigned == userId).OrderBy(x => x.id);
        //e.QueryableSource = query;

        Entities context = new Entities();

        //var surveys = context.vw_visibility_surveys_tl.Where(p=>p.assigned==userId);
        var surveys = from d1 in context.vw_visibility_surveys_tl
                      where d1.assigned == userId
                      select d1;

        //var assignedUsers = context.sp_getAssignedUsers(userId).ToList();
        //var assignedSurveys = from d1 in surveys
        //                      join d2 in assignedUsers on d1.user_id equals d2.id
        //                      select new {
        //                      d1.account_group_1,
        //                      d1.added_by,
        //                      d1.assigned,
        //                      d1.branch_code,
        //                      d1.branch_id,
        //                      d1.branch_name,
        //                      d1.call_date,
        //                      d1.date_created,
        //                      d1.date_submitted,
        //                      d1.deadline,
        //                      d1.fullname,
        //                      d1.id,
        //                      d1.is_deleted,
        //                      d1.reference,
        //                      d1.status,
        //                      d1.user_id,
        //                      d1.viewed_at
        //                      };


        e.QueryableSource = surveys;

    }

    protected void ASPxGridView1_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
    {
        int workplanId = (int)(sender as ASPxGridView).GetRowValues(e.VisibleIndex, "id");
        string target_url = "~/view_visibility.aspx?pk=" + workplanId;
        if (e.ButtonID == "viewBtn")
        {
            if (Page.IsCallback)
            {
                ASPxWebControl.RedirectOnCallback(target_url);
            }
            else
            {
                Response.Redirect(target_url);
            }
        }

    }
}