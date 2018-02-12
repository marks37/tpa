using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class tl_workplan : System.Web.UI.Page
{
    clsDBLayer DBLayer = new clsDBLayer(ConfigurationManager.ConnectionStrings["VisibilityDB"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {

        var workplanLink = (HtmlGenericControl)this.Master.FindControl("workplanLink");
        workplanLink.Attributes.Add("class", "active");

        clsUser user = (clsUser)Session["user"];
        if (Session["user"] == null)
        {
            Response.Redirect("~/Site_Login.aspx");
        }
        else
        {
            if (!user.Type.Equals("Team Leader"))
            {
                //Response.Redirect("~/Site_Login.aspx");
                Response.Redirect("~/Site_Login.aspx");
            }
        }
        List<clsWorkplan> workplanList = DBLayer.getWorkplansTLViewByUserId(user.Id);

        if (!IsPostBack)
        {
            workplan_rptr.DataSource = workplanList;
            workplan_rptr.DataBind();

            List<clsManpower> manpower = DBLayer.getAssignedBranchesTLViewByUserId(user.Id, null);
            foreach (clsManpower item in manpower)
            {
                ListItem newItem = new ListItem();
                newItem.Text = item.AssignedBranch.BranchCode + " " +item.AssignedBranch.BranchName + " " +item.AssignedBranch.Account_group_1 + " / "+item.AssignedUser.Fullname;
                newItem.Value = item.Id;
                manpowerSelect.Items.Add(newItem);
                manpowerEdit.Items.Add(newItem);
            }
        }
    }
    protected void workplan_rptr_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            clsWorkplan workplan = (clsWorkplan)e.Item.DataItem;
            Label deadlinelbl = (Label)e.Item.FindControl("deadlinelbl");
            Label locklbl = (Label)e.Item.FindControl("lock");
            LinkButton editBtn = (LinkButton)e.Item.FindControl("viewBtn");
            if (!workplan.Deadline.Equals(""))
            {
                DateTime deadline = DateTime.Parse(workplan.Deadline);
                deadlinelbl.Text = deadline.ToString("MM.dd.yyyy");
            }
            else
            {
                deadlinelbl.Text = "";
            }

            Label branchlbl = (Label)e.Item.FindControl("branchlbl");
            branchlbl.Text = workplan.AssignedBranch.BranchCode+" "+workplan.AssignedBranch.Account_group_1+" "+workplan.AssignedBranch.BranchName;

            Label coordinatorlbl = (Label)e.Item.FindControl("coordinatorlbl");
            coordinatorlbl.Text = workplan.AssignedUser.Fullname;
            
            Label calldatelbl = (Label)e.Item.FindControl("calldatelbl");
            DateTime CallDate = DateTime.Parse(workplan.CallDate);
            calldatelbl.Text = CallDate.ToString("MM.dd.yyyy");

            Label dateAddedlbl = (Label)e.Item.FindControl("dateAddedlbl");
            DateTime dateAdded = DateTime.Parse(workplan.DateCreated);
            dateAddedlbl.Text = dateAdded.ToString("MM.dd.yyyy");

            if (CallDate < DBLayer.GetCurrentTime())
            {
                locklbl.Text = "<i class='fa fa-lock'></i>";
                editBtn.CssClass += " disabled";
            }else{
                locklbl.Text = "<i class='fa fa-unlock-alt'></i>";
            }
        }
    }
    protected void cancelBtn_Click(object sender, EventArgs e)
    {
        manpowerSelect.ClearSelection();
        manpowerValidation.Text = "";
        manpowerValidation.CssClass = "";
        callDate.Text = "";
        callDateValidation.Text = "";
        callDateValidation.CssClass = "";
        ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), "Pop", "closeModal();", true);        
    }
    protected void submitBtn_Click(object sender, EventArgs e)
    {
        int validation = 0;

        if (manpowerSelect.SelectedValue == "0" || manpowerSelect.SelectedValue == "")
        {
            manpowerValidation.Text = "This is required!";
            manpowerValidation.CssClass += "text-danger bg-danger";
            validation++;
        }
        else
        {
            manpowerValidation.Text = "";
            manpowerValidation.CssClass = "";
        }

        if (callDate.Text == "" )
        {
            callDateValidation.Text = "This is required!";
            callDateValidation.CssClass += "text-danger bg-danger";
            validation++;
        }
        else
        {
            callDateValidation.Text = "";
            callDateValidation.CssClass = "";
        }


        if (validation==0)
        {

            clsManpower manpower = DBLayer.getManpowerById(manpowerSelect.SelectedValue);
            clsWorkplan workplan = new clsWorkplan();
            workplan.BranchId = manpower.AssignedBranch.BranchId;
            workplan.CallDate = callDate.Text;
            workplan.Status = "Pending";
            workplan.Deadline = DateTime.Parse(callDate.Text).AddDays(10).ToString();
            clsUser user = (clsUser)Session["user"];
            workplan.AddedBy = user.Id;
            workplan.Reference = "Workplan";
            workplan.UserId = manpower.AssignedUser.Id;
            workplan.DateCreated = GetCurrentTime().ToString();
            string workplanId = DBLayer.addWorkplan(workplan);

            clsActivityLog log = new clsActivityLog();
            log.Username = user.Username;
            log.DateCreated = DBLayer.GetCurrentTime().ToString();
            log.PageUrl = HttpContext.Current.Request.Url.AbsolutePath;
            log.Activity = "added visit::"+workplanId;
            DBLayer.addNewActivityLog(log);

            //DBLayer.viewWorkplan(workplanId);
            //Response.Redirect("view_visibility.aspx?pk=" + workplanId);
            List<clsWorkplan> workplanList = DBLayer.getWorkplansTLViewByUserId(user.Id);
            workplan_rptr.DataSource = workplanList;
            workplan_rptr.DataBind();
            manpowerSelect.ClearSelection();
            manpowerValidation.Text = "";
            manpowerValidation.CssClass = "";
            callDate.Text = "";
            callDateValidation.Text = "";
            callDateValidation.CssClass = "";
            ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), "Pop", "closeModal();", true);        

        }
    }
    protected DateTime GetCurrentTime()
    {
        DateTime serverTime = DateTime.Now;
        DateTime _localTime = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(serverTime, TimeZoneInfo.Local.Id, "Singapore Standard Time");
        return _localTime;
    }

    protected void refreshContent()
    {
        clsUser user = (clsUser)Session["user"];
        
    }
    protected void workplan_rptr_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            string workplanId = (string)e.CommandArgument;
            workplanID.Value = workplanId;
            clsWorkplan workplan = DBLayer.getWorkplan(workplanId);
            clsUser user = (clsUser)Session["user"];
            clsManpower assignment = new clsManpower();
            clsManpower filter = new clsManpower();
            filter.UserId = workplan.UserId;
            filter.BranchId = workplan.BranchId;
            List<clsManpower> manpower = DBLayer.getAssignedBranchesTLViewByUserId(user.Id, filter);
            foreach (clsManpower item in manpower)
            {
                if (item.AssignedUser.Id == workplan.UserId && item.AssignedBranch.BranchId == workplan.BranchId)
                {
                    assignment = item;
                }
            }

            ListItem selected = manpowerEdit.Items.FindByValue(assignment.Id);

            if (selected != null)
            {
                manpowerEdit.ClearSelection();
                selected.Selected = true;
            }

            DateTime callDate = DateTime.Parse(workplan.CallDate);

            callDateEdit.Text = callDate.ToString("MM/dd/yyyy");

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "editModal();", true);        
        }
    }
    protected void submitEditBtn_Click(object sender, EventArgs e)
    {
        int validation = 0;

        if (manpowerEdit.SelectedValue == "0" || manpowerEdit.SelectedValue == "")
        {
            manpowerEditValidation.Text = "This is required!";
            manpowerEditValidation.CssClass += "text-danger bg-danger";
            validation++;
        }
        else
        {
            manpowerEditValidation.Text = "";
            manpowerEditValidation.CssClass = "";
        }

        if (callDateEdit.Text == "")
        {
            callDateEditValidation.Text = "This is required!";
            callDateEditValidation.CssClass += "text-danger bg-danger";
            validation++;
        }
        else
        {
            callDateEditValidation.Text = "";
            callDateEditValidation.CssClass = "";
        }


        if (validation == 0)
        {

            clsManpower manpower = DBLayer.getManpowerById(manpowerEdit.SelectedValue);
            clsWorkplan workplan = new clsWorkplan();
            workplan.Id = workplanID.Value;
            workplan.BranchId = manpower.AssignedBranch.BranchId;
            workplan.CallDate = callDateEdit.Text;
            workplan.Deadline = DateTime.Parse(callDateEdit.Text).AddDays(10).ToString();
            clsUser user = (clsUser)Session["user"];
            workplan.ModifiedBy = user.Id;
            workplan.UserId = manpower.AssignedUser.Id;
            workplan.DateModified = GetCurrentTime().ToString();
            DBLayer.editWorkplan(workplan);

            clsActivityLog log = new clsActivityLog();
            log.Username = user.Username;
            log.DateCreated = DBLayer.GetCurrentTime().ToString();
            log.PageUrl = HttpContext.Current.Request.Url.AbsolutePath;
            log.Activity = "updated visit::" + workplan.Id;
            DBLayer.addNewActivityLog(log);

            //DBLayer.viewWorkplan(workplanId);
            //Response.Redirect("view_visibility.aspx?pk=" + workplanId);
            List<clsWorkplan> workplanList = DBLayer.getWorkplansTLViewByUserId(user.Id);
            workplan_rptr.DataSource = workplanList;
            workplan_rptr.DataBind();
            manpowerEdit.ClearSelection();
            manpowerEditValidation.Text = "";
            manpowerEditValidation.CssClass = "";
            callDateEdit.Text = "";
            callDateEditValidation.Text = "";
            callDateEditValidation.CssClass = "";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeEditModal();", true);

            string message = "";
            message += "<div class='alert alert-success' role='alert'>";
            message += "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>";
            message += "<p class='text-success'>Edit successful!</p>";
            message += "</div>";
            messagelbl.Text = message;
        }
        else
        {
            string message = "";
            message += "<div class='alert alert-danger' role='alert'>";
            message += "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>";
            message += "<p class='text-danger'>Edit failed!</p>";
            message += "</div>";
            messagelbl.Text = message;
            ScriptManager.RegisterStartupScript(UpdatePanel3, this.GetType(), "Pop", "closeEditModal();", true);
        }
    }
    protected void cancelEditBtn_Click(object sender, EventArgs e)
    {

    }
}