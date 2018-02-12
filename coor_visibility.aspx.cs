using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Visibility : System.Web.UI.Page
{

    clsDBLayer DBLayer = new clsDBLayer(ConfigurationManager.ConnectionStrings["VisibilityDB"].ToString());


    protected void Page_Load(object sender, EventArgs e)
    {
        clsUser user = (clsUser)Session["user"];
        if (Session["user"] == null)
        {
            Response.Redirect("Site_Login.aspx");
        }
        else
        {
            if ((!user.Type.Equals("Coordinator"))&&(!user.Type.Equals("Promo Rep")))
            {
                //Response.Redirect("~/Site_Login.aspx");
                Response.Redirect("~/Site_Login.aspx");
            }
        }
        List<clsWorkplan> workplanList = DBLayer.getWorkplansByUserId(user.Id);
        
        if (!IsPostBack)
        {
            var visibLink = (HtmlGenericControl)this.Master.FindControl("visibLink");
            visibLink.Attributes.Add("class", "active");
            //workplans_rptr.DataSource = workplanList;
            //workplans_rptr.DataBind();

            List<clsManpower> branches = DBLayer.getAssignedBranches(user.Id);
            foreach (clsManpower branch in branches)
            {
                ListItem newItem = new ListItem();
                newItem.Text = branch.BranchName;
                newItem.Value = branch.BranchId;
                branchSelect.Items.Add(newItem);
            }
        }
        
    }

    public string test()
    {
        string test = "testing";
        return test;
    }

    public string getSubmissions()
    {
        string htmlStr = "";
        clsUser user = (clsUser)Session["user"];
        List<clsWorkplan> workplanList = DBLayer.getWorkplansByUserId(user.Id);
        for (int a = 0; a < workplanList.Count(); a++)
        {
            string link = "view_visibility.aspx?pk="+workplanList[a].Id;
            htmlStr += "<tr>";
            htmlStr += "<td>";
            if (workplanList[a].Status.Equals("Draft"))
            {
                htmlStr += "<span class='label label-info'>"+workplanList[a].Status + "</span>";
            }
            else if (workplanList[a].Status.Equals("Submitted"))
            {
                htmlStr += "<span class='label label-success'>" + workplanList[a].Status + "</span>";
            }
            htmlStr += "</td>";
            htmlStr += "<td>" + workplanList[a].AccountGroup + "</td>";
            htmlStr += "<td>" + workplanList[a].BranchName + "</td>";
            //DateTime callDate = DateTime.ParseExact(workplanList[a].CallDate, "yyyy-MM-dd HH:mm:ss,fff", System.Globalization.CultureInfo.InvariantCulture);
            DateTime CallDate = DateTime.Parse(workplanList[a].CallDate);
            htmlStr += "<td>" + CallDate.ToString("yyyy-MM-dd") +"</td>";
            DateTime DateCreated = DateTime.Parse(workplanList[a].DateCreated);
            htmlStr += "<td>" + DateCreated.ToString("yyyy-MM-dd") + "</td>";
            htmlStr += "<td class='text-center'><a class='btn btn-link btn-sm' href='"+link+"'>View</a></td>";
            htmlStr += "</tr>";
        }
            return htmlStr;
    }

    public string loadBranches()
    {
        //DataTable assignedBranches = new DataTable();
        //for (int a = 0; a < branches.Count(); a++)
        //{
        //    branchDropDownList.Items.Add(new ListItem(branches[a].Id, branches[a].BranchName));
        //}
        //branchDropDownList.DataSource = branches;
        //branchDropDownList.DataTextField = "branch_name";
        //branchDropDownList.DataValueField = "branch_id";
        //branchDropDownList.DataBind();

        string htmlStr = "";
        clsUser user = (clsUser)Session["user"];
        List<clsManpower> branches = DBLayer.getAssignedBranches("5");
        for (int a = 0; a < branches.Count(); a++)
        {
            htmlStr += "<option value='" + branches[a].Id + "'>";
            htmlStr += branches[a].BranchName;
            htmlStr += "</option>";
        }

        return htmlStr;
    }
    protected void submitBtn_Click(object sender, EventArgs e)
    {
        int validation = 0;

        if (branchSelect.SelectedValue == "0" || branchSelect.SelectedValue == "")
        {
            branchValidation.Text = "This is required!";
            branchValidation.CssClass += "text-danger bg-danger";
            validation++;
        }
        else
        {
            branchValidation.Text = "";
            branchValidation.CssClass = "";
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

            clsWorkplan workplan = new clsWorkplan();
            workplan.BranchId = branchSelect.SelectedValue;
            workplan.CallDate = GetCurrentTime().ToString("yyyy-MM-dd");
            workplan.Status = "Pending";
            workplan.Deadline = GetCurrentTime().AddDays(7).ToString();
            workplan.Deadline = null;
            clsUser user = (clsUser)Session["user"];
            workplan.AddedBy = user.Id;
            workplan.Reference = "Added by User";
            workplan.UserId = user.Id;
            workplan.DateCreated = GetCurrentTime().ToString();
            string workplanId = DBLayer.addWorkplan(workplan);
            List<clsVisibility> visibilityList = DBLayer.getVisibilityProgramsByBranchId(workplan.BranchId);

            foreach (clsVisibility visib in visibilityList)
            {
                clsVisibilitySurvey survey = new clsVisibilitySurvey();
                survey.VisibilityId = visib.Id;
                survey.WorkplanId = workplanId;
                survey.DateCreated = GetCurrentTime().ToString();

                List<clsVisibilityResponse> responseList = new List<clsVisibilityResponse>();
                foreach (clsVisibilityStandard standard in visib.Standard)
                {
                    clsVisibilityResponse response = new clsVisibilityResponse();
                    response.Standard = standard.Id;
                    response.DateCreated = GetCurrentTime().ToString();
                    response.Remarks = "";
                    responseList.Add(response);
                }
                survey.Response = responseList;
                DBLayer.addVisibilitySurvey(survey);
            }

            //DBLayer.viewWorkplan(workplanId);
            Response.Redirect("view_visibility.aspx?pk=" + workplanId);

        }

        //string str = "$(document).ready(function () {";
        //str += "alert('Account: " + branchHidden.Value + " | Call Date: " + callDateHidden.Value + " | Workplan ID: "+workplanId+"');";
        //str += "});";
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "Confi", str, true);

    }
    protected void cancelBtn_Click(object sender, EventArgs e)
    {
        branchSelect.ClearSelection();
        branchValidation.Text = "";
        branchValidation.CssClass = "";
        callDate.Text = "";
        callDateValidation.Text = "";
        callDateValidation.CssClass = "";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);        
    }
    protected void workplans_rptr_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            clsWorkplan workplan = (clsWorkplan)e.Item.DataItem;
            HtmlTableRow tr = (HtmlTableRow)e.Item.FindControl("tablerow");
            Label branchlbl = (Label)e.Item.FindControl("branchlbl");

            if (!workplan.ViewedAt.Equals(""))
            {
                //tr.Attributes.Add("Class", "active");
            }
            else 
            {
                tr.Attributes.Add("Class", "");
                tr.Style.Add("font-weight", "bold");
            }

            Label statuslbl = (Label)e.Item.FindControl("statuslbl");
            
            if (workplan.Status.Equals("Submitted"))
            {
                statuslbl.Text = workplan.Status;
                statuslbl.CssClass = "label label-success";
            }
            else if (workplan.Status.Equals("Pending"))
            {
                statuslbl.Text = workplan.Status;
                statuslbl.CssClass = "label label-default";
            }
            else if (workplan.Status.Equals("For Approval"))
            {
                statuslbl.CssClass = "label label-warning";
            }

            Label deadlinelbl = (Label)e.Item.FindControl("deadlinelbl");
            if (!workplan.Deadline.Equals("") && !workplan.Status.Equals("Submitted"))
            {
                DateTime deadline = DateTime.Parse(workplan.Deadline);
                deadlinelbl.Text = deadline.ToString("MM-dd-yyyy");
                if (deadline <= GetCurrentTime())
                {
                    statuslbl.Text = "Missed";
                    statuslbl.CssClass = "label label-danger";
                }
                else
                {

                }
            }
            else
            {
                deadlinelbl.Text = "";
            }
            
            Label calldatelbl = (Label)e.Item.FindControl("calldatelbl");
            DateTime CallDate = DateTime.Parse(workplan.CallDate);
            calldatelbl.Text = CallDate.ToString("MM-dd-yyyy");
            
            //Label datecreatedlbl = (Label)e.Item.FindControl("datecreatedlbl");
            //DateTime dateCreated = DateTime.Parse(workplan.DateCreated);
            //datecreatedlbl.Text = dateCreated.ToString("yyyy-MM-dd");

                        
        }
    }

    protected DateTime GetCurrentTime()
    {
        DateTime serverTime = DateTime.Now;
        DateTime _localTime = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(serverTime, TimeZoneInfo.Local.Id, "Singapore Standard Time");
        return _localTime;
    }
    protected void workplans_rptr_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string workplanId = e.CommandArgument.ToString();
        if (e.CommandName == "view")
        {
            clsWorkplan workplan =  DBLayer.viewWorkplan(workplanId);
            List<clsVisibilitySurvey> surveyList = DBLayer.getVisibilitySurveysByWorkplanId(workplan.Id);
            if (surveyList.Count() == 0)
            {
                List<clsVisibility> visibilityList = DBLayer.getVisibilityProgramsByBranchId(workplan.BranchId);
                foreach (clsVisibility visib in visibilityList)
                {
                    clsVisibilitySurvey survey = new clsVisibilitySurvey();
                    survey.VisibilityId = visib.Id;
                    survey.WorkplanId = workplanId;
                    survey.DateCreated = GetCurrentTime().ToString();

                    List<clsVisibilityResponse> responseList = new List<clsVisibilityResponse>();
                    foreach (clsVisibilityStandard standard in visib.Standard)
                    {
                        clsVisibilityResponse response = new clsVisibilityResponse();
                        response.Standard = standard.Id;
                        response.DateCreated = GetCurrentTime().ToString();
                        response.Remarks = "";
                        responseList.Add(response);
                    }
                    survey.Response = responseList;
                    DBLayer.addVisibilitySurvey(survey);
                }
            }
            clsUser user = (clsUser)Session["user"];
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
        IQueryable<vw_visibility_surveys> query = new Entities().vw_visibility_surveys;
        int userId = int.Parse(user.Id);
        DateTime lastDay = new DateTime(DBLayer.GetCurrentTime().Year, DBLayer.GetCurrentTime().Month, DateTime.DaysInMonth(DBLayer.GetCurrentTime().Year,DBLayer.GetCurrentTime().Month));
        query = query.Where(p => (p.user_id == userId) && (p.call_date<=lastDay)).OrderBy(x => x.id);
        e.QueryableSource = query;
    }
    protected void ASPxGridView1_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
    {
        int workplanId = (int)(sender as ASPxGridView).GetRowValues(e.VisibleIndex, "id");
        string target_url = "~/view_visibility.aspx?pk=" + workplanId;
        if (e.ButtonID == "viewBtn")
        {

            clsWorkplan workplan = DBLayer.viewWorkplan(workplanId.ToString());
            List<clsVisibilitySurvey> surveyList = DBLayer.getVisibilitySurveysByWorkplanId(workplan.Id);
            if (surveyList.Count() == 0)
            {
                List<clsVisibility> visibilityList = DBLayer.getVisibilityProgramsByBranchId(workplan.BranchId);
                foreach (clsVisibility visib in visibilityList)
                {
                    clsVisibilitySurvey survey = new clsVisibilitySurvey();
                    survey.VisibilityId = visib.Id;
                    survey.WorkplanId = workplanId.ToString();
                    survey.DateCreated = GetCurrentTime().ToString();

                    List<clsVisibilityResponse> responseList = new List<clsVisibilityResponse>();
                    foreach (clsVisibilityStandard standard in visib.Standard)
                    {
                        clsVisibilityResponse response = new clsVisibilityResponse();
                        response.Standard = standard.Id;
                        response.DateCreated = GetCurrentTime().ToString();
                        response.Remarks = "";
                        responseList.Add(response);
                    }
                    survey.Response = responseList;
                    DBLayer.addVisibilitySurvey(survey);
                }
            }
            clsUser user = (clsUser)Session["user"];
            if (user != null)
            {
                clsActivityLog log = new clsActivityLog();
                log.Username = user.Username;
                log.DateCreated = DBLayer.GetCurrentTime().ToString();
                log.PageUrl = HttpContext.Current.Request.Url.AbsolutePath;
                log.Activity = "viewed visit::" + workplanId;
                DBLayer.addNewActivityLog(log);

            }   


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