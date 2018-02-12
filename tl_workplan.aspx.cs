using DevExpress.Web;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class tl_workplan : System.Web.UI.Page
{
    static clsDBLayer DBLayer = new clsDBLayer(ConfigurationManager.ConnectionStrings["VisibilityDB"].ToString());

    static string gConnString = ConfigurationManager.ConnectionStrings["VisibilityDB"].ToString();

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        clsUser user = (clsUser)Session["user"];
    }

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
                Response.Redirect("~/Site_Login.aspx");
            }
        }
        //List<clsWorkplan> workplanList = DBLayer.getWorkplansTLViewByUserId(user.Id);

        if (!IsPostBack)
        {
            //workplan_rptr.DataSource = workplanList;
            //workplan_rptr.DataBind();
            (gvWorkplans.Columns["call_date"] as GridViewDataDateColumn).ReadOnly = false;

            //List<clsUser> assignedUsers = DBLayer.getAssignedUsers(user.Id);

            

        }

        //clsUser user = (clsUser)Session["user"];
        DataTable assignedUsers = DBLayer.getAssignedUsers3(user.Id);
        (gvWorkplans.Columns["fullname"] as GridViewDataComboBoxColumn).PropertiesComboBox.DataSource = assignedUsers;
        (gvWorkplans.Columns["fullname"] as GridViewDataComboBoxColumn).PropertiesComboBox.TextField = "fullname";
        (gvWorkplans.Columns["fullname"] as GridViewDataComboBoxColumn).PropertiesComboBox.ValueField = "id";
    }

    protected void submitBtn_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa3", "findWorkplanMatches()", true);
    }

    protected static DateTime GetCurrentTime()
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
            string workplanId = (string) e.CommandArgument;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "initializeEditVisitForm("+workplanId+");", true);        
        }
    }

    protected void submitEditBtn_Click(object sender, EventArgs e)
    {
        clsWorkplan workplan = (clsWorkplan)HttpContext.Current.Session["workplan"];
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa4", "updateWorkplan("+workplan.Id+")", true);
    }

    [WebMethod]
    public static clsWorkplan getWorkplanByWorkplanId(string workplanId)
    {
        clsUser user = (clsUser)HttpContext.Current.Session["user"];
        clsWorkplan workplan = DBLayer.getCreatedWorkplan(HttpContext.Current.Server.HtmlEncode(workplanId), user.Id);
        HttpContext.Current.Session["workplan"] = workplan;
        return workplan;
    }

    [WebMethod]
    public static clsWorkplan editWorkplanByWorkplanId(string workplanId)
    {
        clsUser user = (clsUser)HttpContext.Current.Session["user"];
        clsWorkplan workplan = DBLayer.getCreatedWorkplan(HttpContext.Current.Server.HtmlEncode(workplanId), user.Id);

        //Check if workplan can be updated
        if (DateTime.Parse(workplan.Deadline) < DBLayer.GetCurrentTime())
        {
            workplan = null;
        }
        else
        {
            //Store workplan in session for validation/update later
            HttpContext.Current.Session["workplan"] = workplan;
        }
        return workplan;
    }

    [WebMethod]
    public static clsUser getAssignedEmpByBranchId(string branchId)
    {
        string json = "";
        clsUser assignedUser = new clsUser();
        assignedUser = DBLayer.getAssignedUserByBranchId(HttpContext.Current.Server.HtmlEncode(branchId));
        json = JsonConvert.SerializeObject(assignedUser);
        return assignedUser;
    }

    //[WebMethod]
    public static string getAssignedBranchesByUserID()
    {
        clsUser user = (clsUser)HttpContext.Current.Session["user"];
        List<clsBranch> assignedBranches = DBLayer.getAssignedBranchesByUserId(user.Id);
        string options = "";
        string acctGroup = "";
        foreach (clsBranch item in assignedBranches)
        {
            if (!acctGroup.Equals(item.Account_group_1))
            {
                acctGroup = item.Account_group_1;
                options += "<optgroup label='" + acctGroup + "!@#!@#!@#'>";
            }
            options += "<option value='" + item.BranchId + "'>" + item.BranchCode + "!@#" + item.BranchName + "!@#" + item.BranchAddress + "</option>";
            //options += "<option value='" + item.BranchId + "'><div style='color:green;'>" + item.BranchCode + " " + item.BranchName + item.BranchAddress + "</div></option>";
            //options += "<option value='" + item.BranchId + "'>" + item.BranchCode + " " + item.BranchName + "</option>";
            if (!acctGroup.Equals(item.Account_group_1))
            {
                options += "</optgroup>";
            }
        }
        return options;
    }

    public string getAssignedUsers(){
        clsUser user = (clsUser)Session["user"];
        List<clsUser> assignedUsers = DBLayer.getAssignedUsers(user.Id); 
        string option = "";
        foreach (clsUser item in assignedUsers)
        {
            option += "<option value='"+item.Id+"'>" +item.Fullname + "</option>";
        }
        return option;
    }

    [WebMethod]
    public static string findWorkplanMatches(clsWorkplan workplan)
    {
        clsWorkplan cleanWorkplan = workplan;
        cleanWorkplan.CallDate = HttpContext.Current.Server.HtmlEncode(workplan.CallDate);
        cleanWorkplan.BranchId = HttpContext.Current.Server.HtmlEncode(workplan.BranchId);
        cleanWorkplan.UserId = HttpContext.Current.Server.HtmlEncode(workplan.UserId);

        DateTime currentTime = DBLayer.GetCurrentTime();
        DateTime maxDate = currentTime.AddMonths(3-(currentTime.Month-1)%3).AddDays(-currentTime.Day);
        DateTime minDate = new DateTime(currentTime.Year, ((currentTime.Month - 1) / 3) * 3 + 1,1);


        List<clsWorkplan> matches = DBLayer.findMatchesWorkplan(cleanWorkplan, minDate, maxDate);
        string table = "";
        foreach (clsWorkplan item in matches)
        {
            table += "<tr>";
            table += "<td>";
            table += item.AssignedBranch.BranchName;
            table += "</td>";

            table += "<td>";
            DateTime CallDate = DateTime.Parse(item.CallDate);
            table += CallDate.ToString("MM.dd.yyyy");
            table += "</td>";

            table += "<td>";
            DateTime Deadline = DateTime.Parse(item.Deadline);
            table += Deadline.ToString("MM.dd.yyyy"); ;
            table += "</td>";

            table += "<td>";
            table += item.AssignedUser.Fullname;
            table += "</td>";

            table += "<td>";
            DateTime DateCreated = DateTime.Parse(item.DateCreated);
            table += DateCreated.ToString("MM.dd.yyyy"); ;
            table += "</td>";
            table += "</tr>";
        }
        return table;
    }

    [WebMethod]
    public static void saveWorkplan(clsWorkplan data)
    {
        clsWorkplan workplan = new clsWorkplan();
        workplan.BranchId = HttpContext.Current.Server.HtmlEncode(data.BranchId);
        workplan.CallDate = HttpContext.Current.Server.HtmlEncode(data.CallDate);
        workplan.Status = "Pending";
        workplan.Deadline = DateTime.Parse(HttpContext.Current.Server.HtmlEncode(data.CallDate)).AddDays(10).ToString();
        clsUser user = (clsUser)HttpContext.Current.Session["user"];
        workplan.AddedBy = user.Id;
        workplan.Reference = "Workplan";
        workplan.UserId = HttpContext.Current.Server.HtmlEncode(data.UserId);
        workplan.DateCreated = GetCurrentTime().ToString();
        string workplanId = DBLayer.addWorkplan(workplan);

        clsActivityLog log = new clsActivityLog();
        log.Username = user.Username;
        log.DateCreated = DBLayer.GetCurrentTime().ToString();
        log.PageUrl = HttpContext.Current.Request.Url.AbsolutePath;
        log.Activity = "added visit::" + workplanId;
        DBLayer.addNewActivityLog(log);

    }

    [WebMethod]
    public static Boolean updateWorkplan(clsWorkplan data)
    {
        //Get Workplan
        clsUser user = (clsUser)HttpContext.Current.Session["user"];

        //clsWorkplan workplan = DBLayer.getCreatedWorkplan(data.Id, user.Id);
        clsWorkplan workplan = (clsWorkplan) HttpContext.Current.Session["workplan"];

        if (DBLayer.GetCurrentTime() < DateTime.Parse(workplan.CallDate) && DateTime.Parse(data.CallDate) > DBLayer.GetCurrentTime().AddDays(-10))
        {

            //Update Workplan Details
            workplan.CallDate = data.CallDate;
            workplan.Deadline = DateTime.Parse(HttpContext.Current.Server.HtmlEncode(data.CallDate)).AddDays(10).ToString();
            workplan.ModifiedBy = user.Id;
            workplan.DateModified = GetCurrentTime().ToString();

            //Create new log
            clsActivityLog log = new clsActivityLog();
            log.Username = user.Username;
            log.DateCreated = DBLayer.GetCurrentTime().ToString();
            log.PageUrl = HttpContext.Current.Request.Url.AbsolutePath;
            log.Activity = "updated visit::" + workplan.Id;

            //Validate transaction before update
            if (DateTime.Parse(workplan.Deadline) >= DBLayer.GetCurrentTime())
            {
                DBLayer.editWorkplan(workplan);
                DBLayer.addNewActivityLog(log);
            }

            return true;

        }
        else
        {
            return false;
        }
    }

    [WebMethod]
    public static void clearSelection()
    {
        HttpContext.Current.Session.Remove("workplan");
    }

    protected void refreshBtn_Click(object sender, EventArgs e)
    {
        //ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), "Pop", "closeModal();", true);        
        //ScriptManager.RegisterStartupScript(UpdatePanel2, this.GetType(),"hwa", "alert('Hello World');", true);

        clsUser user = (clsUser)Session["user"];
        List<clsWorkplan> workplanList = DBLayer.getWorkplansTLViewByUserId(user.Id);
        //workplan_rptr.DataSource = workplanList;
        //workplan_rptr.DataBind();
        //string highlight = "$('#workplans tbody tr:first').effect('highlight', {}, 4000);";
        //ScriptManager.RegisterStartupScript(UpdatePanel2, this.GetType(), "hwa", highlight, true);
        EntityServerModeDataSource1.DataBind();
        gvWorkplans.DataBind();

    }
    protected void newVisitBtn_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "initializeVisitForm()", true);
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "newVisit", "initializeVisitForm", true);
    }
    protected void changeDateBtn_Click(object sender, EventArgs e)
    {
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "initializeEditVisitForm()", true);
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alert('hello world');", true);
    }

    protected void branchSelectOnChange_Click(object sender, EventArgs e)
    {
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa2", "alert('hello world');", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa2", "setAssignedEmp()", true);
    }
    protected void confirmBtn_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa3", "confirmVisit()", true);
    }
    protected void EntityServerModeDataSource1_Selecting(object sender, DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs e)
    {
        clsUser user = (clsUser)Session["user"];
        IQueryable<vw_data_workplan_tl> query = new Entities().vw_data_workplan_tl;
        int userId = int.Parse(user.Id);
        query = query.Where(p => p.team_leader == userId).OrderBy(x => x.call_date);
        e.QueryableSource = query;
    }
    protected void gvWorkplans_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e)
    {
        //if (e.VisibleIndex == -1) return;
        DateTime callDate = new DateTime();
        callDate = Convert.ToDateTime(gvWorkplans.GetRowValues(e.VisibleIndex,"call_date"));

        if (e.ButtonType == ColumnCommandButtonType.Edit)
        {
            if (GetCurrentTime() >= callDate)
            {
                e.Enabled = false;
            }
        }

        //bool isOddRow = e.VisibleIndex % 2 == 0;
        //if (isOddRow)
        //{
        //    if (e.ButtonType == ColumnCommandButtonType.Edit)
        //    {
        //        e.Visible = false;
        //    }
        //}


        


    }
    protected void gvWorkplans_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
    {
        DateTime callDate = new DateTime();
        callDate = Convert.ToDateTime(gvWorkplans.GetRowValues(e.VisibleIndex, "call_date"));
        if (GetCurrentTime() >= callDate)
        {
            if (e.Column.FieldName == "call_date")
            {
                ASPxDateEdit call_date_edit = (ASPxDateEdit)e.Editor;
                call_date_edit.MinDate = GetCurrentTime();
                call_date_edit.DropDownButton.Enabled = false;
                call_date_edit.DropDownButton.ClientVisible = false;
                call_date_edit.ReadOnly = true;
            }
            if (e.Column.FieldName == "fullname")
            {
                ASPxComboBox assigned = (ASPxComboBox)e.Editor;
                assigned.DropDownButton.Enabled = false;
                assigned.DropDownButton.ClientVisible = false;
                assigned.ReadOnly = true;
                assigned.DropDownButton.Visible = false;
                e.Editor.ReadOnly = true;
                assigned.Items.Clear();
            }
        }

        

        if (e.Column.FieldName == "fullname")
        {
            ASPxComboBox assigned = (ASPxComboBox)e.Editor;
            string tmp = assigned.Text;

            ListEditItem itemToSelect = assigned.Items.FindByText(tmp);
            //assigned.SelectedIndex = -1;

            if (itemToSelect != null)
            {
                itemToSelect.Selected = true;
            }
            //string check;
        }
    }
    protected void gvWorkplans_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        clsUser user = (clsUser)Session["user"];
        int workplan_id = int.Parse(e.Keys["id"].ToString());
        using (var entitiesContext = new Entities())
        {
            var workplan = entitiesContext.Data_Workplan.Find(workplan_id);
            workplan.call_date = (DateTime)e.NewValues["call_date"];
            workplan.deadline = ((DateTime)e.NewValues["call_date"]).AddDays(10);
            workplan.user_id = int.Parse(e.NewValues["fullname"].ToString());
            workplan.modified_by = int.Parse(user.Id);
            workplan.date_modified = GetCurrentTime();

            Data_User_Activity_Log act_log = new Data_User_Activity_Log();
            act_log.username = user.Username;
            act_log.dateCreated = DBLayer.GetCurrentTime();
            act_log.pageUrl = HttpContext.Current.Request.Url.AbsolutePath;
            act_log.activity = "updated visit::" + workplan_id;
            entitiesContext.Data_User_Activity_Log.Add(act_log);

            entitiesContext.SaveChanges();

        }
        e.Cancel = true;
    }
    protected void gvWorkplans_DataBound(object sender, EventArgs e)
    {
        //DateTime callDate = new DateTime();

          //callDate = Convert.ToDateTime(gvWorkplans.GetRowValues(e.VisibleIndex, "call_date"));




    }
    protected void gvWorkplans_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {

    }
    protected void gvWorkplans_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
    {

        //int workplanId = (int)(sender as ASPxGridView).GetRowValues(e.VisibleIndex, "id");
        //if (e.ButtonID == "customEdit")
        //{
        //    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "initializeEditVisitForm(" + workplanId + ");", true);
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "alert('Hello world')", true);                    
        //}
    }
}