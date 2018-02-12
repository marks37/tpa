using AjaxControlToolkit;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;
using System.Text;
using System.Text.RegularExpressions;
using System.Drawing.Drawing2D;

public partial class new_visibility : System.Web.UI.Page
{
    clsDBLayer DBLayer = new clsDBLayer(ConfigurationManager.ConnectionStrings["VisibilityDB"].ToString());
    clsFTPLayer ftpLayer = new clsFTPLayer("tpa", "~!n0v3mb3r@@2017!~", "23.89.193.176", 80, "ftp");
    //Will user this later for saving visibility to db without querying data from db
    List<clsVisibility> visibilityList = new List<clsVisibility>();
    List<clsVisibilitySurvey> surveyList = new List<clsVisibilitySurvey>();
    //private Boolean workplanHasContent;
    //private List<clsVisibilityPicture> tempPictures;
    //private List<clsVisibilityPicture> savedPictures;
    //private List<clsVisibilityPicture> addedPictures;
    private string message;

    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);
        if (message != null)
        {
            validationSummary.Text = message;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop1", "showAlert();", true);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        clsUser user = (clsUser)Session["user"];
        if (Session["user"] == null)
        {
            Response.Redirect("~/Site_Login.aspx");
        }


        Page.Form.Attributes.Add("enctype", "multipart/form-data");
        if (!IsPostBack)
        {
            var visibLink = (HtmlGenericControl)this.Master.FindControl("visibLink");
            visibLink.Attributes.Add("class", "active");
            if (user.Type.Equals("Team Leader"))
            {
                

                submitBtn.Visible = false;
                backBtn.HRef = "tl_visibility.aspx";
            }
            else
            {
                backBtn.HRef = "coor_visibility.aspx";
            }

            validationSummary.Text = "";

            string workplanId = Request.QueryString["pk"];
            clsWorkplan workplan = DBLayer.getWorkplan(workplanId);

            if (workplan.Status == "Pending")
            {
                closeBtnPlaceholder.Visible = false;
            }

            if (workplan.Status == "Submitted")
            {
                saveDraftBtn.Visible = false;
                submitBtn.Visible = false;
                statusBtn.Attributes.Add("class", "btn-success btn btn-sm");
                statusBtn.InnerText = "Submitted";
                statusBtn.Visible = true;

                uploadBtnPlaceholder.Visible = false;
                saveBtn.Visible = false;
                cancelBtn.Visible = false;
            }
            if (user.Type.Equals("Promo Rep") || user.Type.Equals("Coordinator"))
            {
                if (workplan.Status == "For Approval")
                {
                    saveDraftBtn.Visible = false;
                    submitBtn.Visible = false;
                    statusBtn.Attributes.Add("class", "btn-warning btn btn-sm");
                    statusBtn.InnerText = "For Approval";
                    statusBtn.Visible = true;

                    uploadBtnPlaceholder.Visible = false;
                    saveBtn.Visible = false;
                    cancelBtn.Visible = false;
                    closeBtnPlaceholder.Visible = false;
                }
            }
            else if (user.Type.Equals("Team Leader"))
            {
                if (workplan.Status == "For Approval")
                {
                    submitBtn.Visible = true;
                    submitBtn.Text = "Submit Visibility to CMD";
                    closeBtnPlaceholder.Visible = false;
                }
            }
            surveyList = DBLayer.getVisibilitySurveysByWorkplanId(workplanId);
            parentRepeater.DataSource = surveyList;
            parentRepeater.DataBind();

            confirmParent.DataSource = surveyList;
            confirmParent.DataBind();

        }

    }
    
    protected void R1_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {

        if (!IsPostBack)
        {
            clsUser user = (clsUser)Session["user"];
            string result = "";
            string visibilityId = "";
            string surveyId = "";
            Repeater childRepeater = (Repeater)e.Item.FindControl("childRepeater");
            string workplanId = Request.QueryString["pk"];
            clsWorkplan workplan = DBLayer.getWorkplan(workplanId);
            //List<clsVisibilitySurvey> surveyList = DBLayer.getVisibilitySurveysByWorkplanId(workplanId);
            // This event is raised for the header, the footer, separators, and items.

            // Execute the following logic for Items and Alternating Items.
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //if (surveyList.Count() != 0)
                //{
                //    result = "Id: " + ((clsVisibilitySurvey)e.Item.DataItem).Id + "</br>";
                //    surveyId = ((clsVisibilitySurvey)e.Item.DataItem).Id;

                //    List<clsVisibilityResponse> responseList = DBLayer.getVisibilityResponseBySurveyId(surveyId);
                //    childRepeater.DataSource = responseList;
                //    //result += "standard: " + standardList.Count()+"</br>"; 
                //    //result += "repeater: " + childRepeater.ID + "</br>"; 
                //    childRepeater.DataBind();
                //}
                //else
                //{
                //    result = "Id: " + ((clsVisibility)e.Item.DataItem).Id + "</br>";
                //    visibilityId = ((clsVisibility)e.Item.DataItem).Id;

                //    List<clsVisibilityStandard> standardList = DBLayer.getVisibilityStandardByVisibilityId(visibilityId);
                //    childRepeater.DataSource = standardList;
                //    //result += "standard: " + standardList.Count()+"</br>"; 
                //    //result += "repeater: " + childRepeater.ID + "</br>"; 
                //    childRepeater.DataBind();

                //}

                surveyId = ((clsVisibilitySurvey)e.Item.DataItem).Id;
                //List<clsVisibilityResponse> responseList = DBLayer.getVisibilityResponseBySurveyId(surveyId);
                //childRepeater.DataSource = responseList;
                childRepeater.DataSource = ((clsVisibilitySurvey)e.Item.DataItem).Response;
                //result += "standard: " + standardList.Count()+"</br>"; 
                //result += "repeater: " + childRepeater.ID + "</br>"; 
                childRepeater.DataBind();
            }
            //Response.Write(result);

            //if (workplan.Status == "Submitted"||(workplan.Status == "For Approval"&&(user.Type.Equals("Promo Rep")||user.Type.Equals("Coordinator"))))
            //{
            //    foreach (RepeaterItem item2 in childRepeater.Items)
            //    {

            //        // Execute the following logic for Items and Alternating Items.
            //        if (item2.ItemType == ListItemType.Item || item2.ItemType == ListItemType.AlternatingItem)
            //        {
            //            //get controls
            //            HiddenField HiddenStandardId = (HiddenField)item2.FindControl("HiddenFieldId2");
            //            RadioButton hit = (RadioButton)item2.FindControl("hitRadio");
            //            hit.Enabled = hit.Checked;
            //            RadioButton miss = (RadioButton)item2.FindControl("missRadio");
            //            miss.Enabled = miss.Checked;
            //            TextBox remarks = (TextBox)item2.FindControl("remarks");
            //            remarks.Attributes.Add("Readonly", "");
            //            //DropDownList remarksDDL = (DropDownList)item2.FindControl("remarksDDL");
            //            //remarksDDL.Enabled = false;
            //        }

            //    }
            //}
            //else
            //{
            //    foreach (RepeaterItem item2 in childRepeater.Items)
            //    {

            //        // Execute the following logic for Items and Alternating Items.
            //        if (item2.ItemType == ListItemType.Item || item2.ItemType == ListItemType.AlternatingItem)
            //        {
            //            HiddenField HiddenStandardId = (HiddenField)item2.FindControl("HiddenFieldId2");
            //            HiddenField targetPic = (HiddenField)item2.FindControl("targetPic");
            //            Label itemValidate = (Label)item2.FindControl("itemValidate");
            //            itemValidate.Text = "";
            //        }
            //    }
            //}
            
        }
    }

    protected void R2_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {
        if (!IsPostBack)
        {
            clsUser user = (clsUser)Session["user"];
            string workplanId = Request.QueryString["pk"];
            clsWorkplan workplan = DBLayer.getWorkplan(workplanId);

            // This event is raised for the header, the footer, separators, and items.
            // Execute the following logic for Items and Alternating Items.
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                clsVisibilityResponse response = (clsVisibilityResponse)e.Item.DataItem;
                string responseId = response.Id;
                List<clsVisibilityPicture> pictureList = DBLayer.getVisibilityPicturesByResponseId(responseId);
                LinkButton addPicBtn = (LinkButton)e.Item.FindControl("addPicBtn");
                TextBox remarksTxt = (TextBox)e.Item.FindControl("remarks");
                DropDownList remarksDDL = (DropDownList)e.Item.FindControl("remarksDDL");
                remarksDDL.Enabled = response.Miss;
                //remarksDDL.Attributes.Add("disabled", "true");
                RadioButton hit = (RadioButton)e.Item.FindControl("hitRadio");
                RadioButton miss = (RadioButton)e.Item.FindControl("missRadio");
                remarksTxt.Text = response.Remarks;
                //hit.InputAttributes.Add("OnClick", "disableRemarks('" + remarksDDL.ClientID + "')");
                //miss.InputAttributes.Add("OnClick", "enableRemarks('" + remarksDDL.ClientID + "')");
                if (hit.Checked)
                {
                    ListItem selected = remarksDDL.Items.FindByText("Select");
                    remarksDDL.ClearSelection();
                    selected.Selected = true;
                }
                else if(miss.Checked)
                {
                    if (response.MissCategory == null)
                    {
                        ListItem selected = remarksDDL.Items.FindByText("Others");
                        remarksDDL.ClearSelection();
                        selected.Selected = true;
                    }
                    else if (!string.IsNullOrEmpty(response.MissCategory))
                    {
                        ListItem selected = remarksDDL.Items.FindByText(response.MissCategory);
                        remarksDDL.ClearSelection();
                        selected.Selected = true;
                    }else {
                        ListItem selected = remarksDDL.Items.FindByText("Select");
                        remarksDDL.ClearSelection();
                        selected.Selected = true;
                    }
                }
                else
                {
                    ListItem selected = remarksDDL.Items.FindByText("Select");
                    remarksDDL.ClearSelection();
                    selected.Selected = true;
                }

                if ((workplan.Status.Equals("Submitted"))|| (workplan.Status.Equals("For Approval") && (user.Type.Equals("Coordinator") || user.Type.Equals("Promo Rep"))))
                {
                    hit.Enabled = hit.Checked;
                    miss.Enabled = miss.Checked;
                    remarksDDL.Enabled = false;
                    remarksTxt.Enabled = false;
                    addPicBtn.Text = "View Picture (" + pictureList.Count() + ")";
                    addPicBtn.CssClass = "btn btn-sm btn-default";
                }
                else
                {
                    addPicBtn.Text = "Add Picture (" + pictureList.Count() + ")";
                }

            }

        }
    }

    protected int validateForm()
    {
        string workplanId = Request.QueryString["pk"];
        clsUser user = (clsUser)Session["user"];
        int validation = 0;
        string message = "";
        foreach (RepeaterItem item in parentRepeater.Items)
        {
            if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater childRepeater = (Repeater)item.FindControl("childRepeater");
                foreach (RepeaterItem item2 in childRepeater.Items)
                {
                    if (item2.ItemType == ListItemType.Item || item2.ItemType == ListItemType.AlternatingItem)
                    {
                        HiddenField responseId = (HiddenField)item2.FindControl("HiddenFieldId2");
                        Label itemValidate = (Label)item2.FindControl("itemValidate");
                        RadioButton hitRadio = (RadioButton)item2.FindControl("hitRadio");
                        RadioButton missRadio = (RadioButton)item2.FindControl("missRadio");
                        DropDownList remarksDDL = (DropDownList)item2.FindControl("remarksDDL");
                        TextBox remarks = (TextBox)item2.FindControl("remarks");
                        List<clsVisibilityPicture> pictureList = DBLayer.getVisibilityPicturesByResponseId(responseId.Value);
                        if ((!missRadio.Checked && !hitRadio.Checked))
                        {
                            itemValidate.Text = "This is required";
                            validation++;

                        }
                        else if(missRadio.Checked&&remarksDDL.SelectedValue == "0"){
                            itemValidate.Text = "Please select remarks category.";
                            validation++;
                        }
                        else if (missRadio.Checked && remarksDDL.SelectedItem.Text.Equals("Others") && string.IsNullOrWhiteSpace(remarks.Text))
                        {
                            itemValidate.Text = "Please indicate reason.";
                            validation++;
                        }
                        else if(pictureList.Count() == 0){
                            itemValidate.Text = "Please add a picture.";
                            validation++;
                        }
                        else
                        {
                            itemValidate.Text = "";
                            itemValidate.CssClass += "";
                        }
                    }
                }
            }
        }

        return validation;
    }

    protected void clearFormValidation()
    {
        foreach (RepeaterItem item in parentRepeater.Items)
        {
           if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
            {
                //get response items tru child repeater
                Repeater childRepeater = (Repeater)item.FindControl("childRepeater");

                foreach (RepeaterItem item2 in childRepeater.Items)
                {
                    // Execute the following logic for Items and Alternating Items.
                    if (item2.ItemType == ListItemType.Item || item2.ItemType == ListItemType.AlternatingItem)
                    {

                        Label itemValidate = (Label)item2.FindControl("itemValidate");
                        itemValidate.Text = "";
                        itemValidate.CssClass += "";
                    }
                }
            }
        }

    }

    protected void saveForm()
    {
        clsUser user = (clsUser)Session["user"];
        //Note to self: datalist items are useless in postbacks. Values are reset to null. Nothing we can do
        //Just use hidden fields to pass and get data

        string workplanId = Request.QueryString["pk"];
        string result = "";
        
        foreach (RepeaterItem item in parentRepeater.Items)
        {
            if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
            {
                //get visibility id tru hidden field
                //optional: declare repeater item as visibility obj then get id property
                HiddenField HiddenVisibilityId = (HiddenField)item.FindControl("HiddenFieldId1");

                //for testing purposes, print value
                result = "ItemCode: " + HiddenVisibilityId.Value + "</br>";

                //declare survey, response list for saving form inputs in db
                clsVisibilitySurvey survey = new clsVisibilitySurvey();
                List<clsVisibilityResponse> responseList = new List<clsVisibilityResponse>();

                //create survey obj
                survey.VisibilityId = HiddenVisibilityId.Value;
                survey.WorkplanId = workplanId;
                survey.DateCreated = DateTime.Now.ToString("yyyy-MM-dd");

                //get response items tru child repeater
                Repeater childRepeater = (Repeater)item.FindControl("childRepeater");

                foreach (RepeaterItem item2 in childRepeater.Items)
                {

                    // Execute the following logic for Items and Alternating Items.
                    if (item2.ItemType == ListItemType.Item || item2.ItemType == ListItemType.AlternatingItem)
                    {
                        //useless, saved as ref only
                        //declare item as standard
                        //clsVisibilityStandard response = (clsVisibilityStandard)item2.DataItem;
                        //string temp = ((clsVisibilityStandard)item2.DataItem).Name;

                        //get controls
                        HiddenField HiddenStandardId = (HiddenField)item2.FindControl("HiddenFieldId2");
                        HiddenField HiddenResponseId = (HiddenField)item2.FindControl("HiddenFieldId2");
                        RadioButton hit = (RadioButton)item2.FindControl("hitRadio");
                        RadioButton miss = (RadioButton)item2.FindControl("missRadio");
                        DropDownList remarksDDL = (DropDownList)item2.FindControl("remarksDDL");                        
                        TextBox remarks = (TextBox)item2.FindControl("remarks");
                        clsVisibilityResponse response = new clsVisibilityResponse();

                        string remarksFilter = remarksDDL.SelectedItem.Text;
                        //if (remarksDDL.SelectedValue.Equals("0"))
                        //{
                        //    remarksFilter = null;
                        //}

                        response.Id = HiddenResponseId.Value;
                        response.Standard = HiddenStandardId.Value;
                        response.Hit = hit.Checked;
                        response.Miss = miss.Checked;
                        response.Remarks = remarks.Text;
                        response.MissCategory = remarksFilter;
                        response.DateCreated = GetCurrentTime().ToString();
                        response.DateModified = GetCurrentTime().ToString();
                        response.ModifiedBy = user.Id;
                        responseList.Add(response);

                    }
                }
                survey.Response = responseList;
                DBLayer.updateVisibilitySurveyById(survey);
            }
        }

        if (user != null)
        {
            clsActivityLog log = new clsActivityLog();
            log.Username = user.Username;
            log.DateCreated = DBLayer.GetCurrentTime().ToString();
            log.PageUrl = HttpContext.Current.Request.Url.AbsolutePath;
            log.Activity = "saved visit::" + workplanId;
            DBLayer.addNewActivityLog(log);
        }

        //Response.Redirect("View_Visibility.aspx?pk=" + workplanId);

        validationSummary.Text = message;
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showAlert();", true);

    }

    public bool ProcessMyDataItem(object myValue)
    {
        if (myValue == null)
        {
            return false;
        }

        return (bool)myValue;
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
        List<clsManpower> branches = DBLayer.getAssignedBranches("1");
        for (int a = 0; a < branches.Count(); a++)
        {
            htmlStr += "<option value='" + branches[a].Id + "'>";
            htmlStr += branches[a].BranchName;
            htmlStr += "</option>";
        }

        return htmlStr;
    }

    [WebMethod]                           
    public static void test()
    {
        //Your Logic
    }

    public clsWorkplan getWorkplan(string id)
    {
        clsWorkplan workplan = DBLayer.getWorkplan(id);
        return workplan;
    }

    public string getVisibility(string branchId)
    {
        string htmlStr = "";
        List<clsVisibility> visibilityList = DBLayer.getVisibilityProgramsByBranchId(branchId);
        for (int a = 0; a < visibilityList.Count(); a++)
        {
            htmlStr += "<tbody>";
                htmlStr += "<tr>";
                    htmlStr += "<td rowspan='3'>";
                        htmlStr += "<address><br />";
                            htmlStr += "<strong>"+visibilityList[a].ItemCode+"</strong><br/>";
                            htmlStr += visibilityList[a].Category+"<br/>";
                            htmlStr += visibilityList[a].Brand+"<br/>";
                            htmlStr += visibilityList[a].Display_type+"<br/>";
                        htmlStr += "</address>";
                    htmlStr += "</td>";
                htmlStr += "</tr>";
                htmlStr += "<tr>";
                    htmlStr += "<td class='custom-row-1'>Planogram</td>";
                    htmlStr += "<td class='custom-row-1 text-center'>";
                        htmlStr += "<div class='radio radio-success'>";
                            htmlStr += "<input type='radio' name='optionsRadios' id='optionsRadios1' value='option1'>";
                            htmlStr += "<label for='optionsRadios1'></label>";
                        htmlStr += "</div>";
                    htmlStr += "</td>";
                    htmlStr += "<td class='custom-row-1 text-center'>";
                        htmlStr += "<div class='radio radio-danger'>";
                            htmlStr += "<input type='radio' name='optionsRadios' id='optionsRadios2' value='option2'>";
                            htmlStr += "<label for='optionsRadios2'></label>";
                        htmlStr += "</div>";
                    htmlStr += "</td>";
                    htmlStr += "<td class='text-center'>";
                        htmlStr += "<div class='radio radio-danger'>";
                            htmlStr += "<textarea rows='2' class='form-control'></textarea>";
                        htmlStr += "</div>";
                    htmlStr += "</td>";
                htmlStr += "</tr>";
            htmlStr += "</tbody>";
        }
            return htmlStr;
    }

    protected void saveDraftBtn_Click(object sender, EventArgs e)
    {
        clearFormValidation();
        saveForm();
        message += "<div id='myAlert' class='alert alert-success fade' role='alert'>";
        message += "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>";
        message += "<p class='text-success'>Draft successfully saved!</p>";
        message += "</div>";
    }

    protected void submitBtn_Click(object sender, EventArgs e)
    {
        string workplanId = Request.QueryString["pk"];
        int validation = validateForm();
        if (validation > 0)
        {
            message += "<div id='myAlert' class='alert alert-danger fade' role='alert'>";
            message += "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>";
            message += "<p class='text-danger'>Please complete all required fields!</p>";
            message += "</div>";
        }
        else
        {
            clearFormValidation();
            saveForm();
            surveyList = DBLayer.getVisibilitySurveysByWorkplanId(workplanId);
            confirmParent.DataSource = surveyList;
            confirmParent.DataBind();

            validationSummary.Text = "";
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "confirmModal()", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop2", "confirmModal()", true);
        }
    }

    protected void submitBtn2_Click(object sender, EventArgs e)
    {

    }

    protected void uploadBtn_Click(object sender, EventArgs e)
    {
        //LinkButton btn = (LinkButton)(sender);
        //string yourValue = btn.CommandArgument;
        //Response.Write(yourValue);
        //testLbl.Text = "SUCCESS!";


        //foreach (RepeaterItem item in parentRepeater.Items)
        //{

        //    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        //get response items tru child repeater
        //        Repeater childRepeater = (Repeater)item.FindControl("childRepeater");

        //        foreach (RepeaterItem item2 in childRepeater.Items)
        //        {

        //            // Execute the following logic for Items and Alternating Items.
        //            if (item2.ItemType == ListItemType.Item || item2.ItemType == ListItemType.AlternatingItem)
        //            {
        //                Label testLbl = (Label)item2.FindControl("testLbl");
        //                testLbl.Text = "SUCCESS!";
        //            }
        //        }
        //    }
        //}
    }

    protected void childRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string workplanId = Request.QueryString["pk"];
        clsWorkplan workplan = DBLayer.getWorkplan(workplanId);

        if (e.CommandName == "uploadPhoto")
        {
            
            //FileUpload file = (FileUpload)e.Item.FindControl("FileUpload1");
            //testLbl.Text = file.HasFile + "";

            //if (picture.PostedFile != null)
            //{ 
            //    string test = picture.Value.ToString(); 
            //}
            
            //string filename = System.IO.Path.GetFileName(picture.fil);
            //testLbl.Text = picture.PostedFile.ContentLength+"";
            //testLbl.Text = picture.PostedFile.FileName + "";

            
            //if (FileUpload1.HasFile)
            //{
            //    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            //    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Images/") + fileName);
            //    Response.Redirect(Request.Url.AbsoluteUri);
            //}

        }
        if (e.CommandName == "addPicture")
        {
            string responseId = (string)e.CommandArgument;
            clsVisibilityResponse response = DBLayer.getVisibilityResponseByResponseId(responseId);
            clsVisibilitySurvey survey = DBLayer.getVisibilitySurveyBySurveyId(response.SurveyId);

            modalTitle.Text = "<span class='label label-default'>" + workplan.BranchName + "</span> " + survey.ItemCode + " " + response.Name;
            responseIdHidden.Value = response.Id;
            List<clsVisibilityPicture> pictureList = DBLayer.getVisibilityPicturesByResponseId(response.Id);
            picRepeater.DataSource = pictureList;
            picRepeater.DataBind();
            string message = "";
            if (pictureList.Count() == 0&&workplan.Status.Equals("Submitted"))
            {
                message += "<br><br><br><br><br><br><br>";
                message += "<br><h1 class='text-muted text-center'>There are no pictures!</h1>";
            }
            else if (pictureList.Count() == 0 &&workplan.Status.Equals("Pending"))
            {
                message += "<br><br><br><br><br><br><br>";
                message += "<h1 class='text-muted text-center'>There are no pictures! <br>Click the upload button to add one.</h1>";
            }
            pictureMessage.Text = message;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }
    }
    protected void myFile_UploadedComplete(object sender, AsyncFileUploadEventArgs e)
    {   
        ImageHandler imageHandler = new ImageHandler();
        string contentType = myFile.ContentType;
        clsUser user = (clsUser)Session["user"];
        string oldpath;
        string newpath;
        string strDirectory = DBLayer.GetCurrentTime().ToString("yyyyMM");
        string tmpDirectory =  "temp";
        DateTime? dateTaken = null;
        string extension = Path.GetExtension(e.FileName);

        if (contentType.Equals("image/jpeg") || contentType.Equals("image/gif") || contentType.Equals("image/png") || contentType.Equals("image/jpg"))
        {
            Stream imageStr = myFile.FileContent;
            if (ftpLayer.createDirectory(strDirectory))
            {
                // Extract date captured.  
                using(System.Drawing.Image image = new Bitmap(imageStr)){
                    int OrientationId = 0x132;
                    int[] ids = image.PropertyIdList;
                    PropertyItem propItem = null;
                    if (ids.Contains(OrientationId))
                    {
                        propItem = image.GetPropertyItem(OrientationId);
                    }
                    //Get the Date Created property  
                    if (propItem != null)
                    {
                        // Extract the property value (a string).  
                        System.Text.ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
                        string text = encoding.GetString(propItem.Value, 0, propItem.Len - 1);

                        // Parse the date and time.  
                        System.Globalization.CultureInfo provider = CultureInfo.InvariantCulture;
                        dateTaken = DateTime.ParseExact(text, "yyyy:MM:d H:m:s", provider);
                    }
                }

                //Create pic name using pic Id from db
                string pictureId;

                using (var entitiesContext = new Entities())
                {
                    Data_Visibility_Picture pic = new Data_Visibility_Picture();
                    pic.response_id = int.Parse(responseIdHidden.Value);
                    pic.user_id = int.Parse(user.Id);
                    pic.date_created = DBLayer.GetCurrentTime();

                    if (dateTaken.HasValue)
                    {
                        pic.date_captured = dateTaken;
                        pic.date_captured2 = dateTaken;
                    }
                    else
                    {
                        pic.date_captured = DBLayer.GetCurrentTime();
                    }

                    entitiesContext.Data_Visibility_Picture.Add(pic);
                    entitiesContext.SaveChanges();
                    pictureId = pic.id.ToString();
                }

                String name = "VISIB" + "_" + DBLayer.GetCurrentTime().ToString("yyyyMMdd") + "_" + pictureId + extension;
                String thumbnail_name = "VISIB" + "_" + DBLayer.GetCurrentTime().ToString("yyyyMMdd") + "_" + pictureId + "_thumbnail" + extension;

                //Check if pic name has duplicates
                while (ftpLayer.exists(strDirectory + "/"+name))
                {

                }

                //Compress pic
                Stream compressedImage = imageHandler.compressImage(myFile.FileContent,1080,1920,75);
                Stream compressedThumbnail = imageHandler.compressImage(myFile.FileContent, 300, 640, 25);
                Bitmap sample = new Bitmap(compressedImage);

                //Save pic
                ftpLayer.uploadImage(compressedImage, strDirectory + "/" + name);
                ftpLayer.uploadImage(compressedThumbnail, strDirectory + "/" + thumbnail_name);

                //Update pic entry in db
                using (Entities context = new Entities())
                {
                    var picEntry = context.Data_Visibility_Picture.Find(int.Parse(pictureId));
                    picEntry.name = name;
                    picEntry.file_name = name;
                    picEntry.file_path = strDirectory + "/" + name;
                    picEntry.file_size_b = compressedImage.Length;
                    picEntry.thumbnail_name = thumbnail_name;
                    picEntry.thumbnail_path = strDirectory + "/" + thumbnail_name;
                    picEntry.height = sample.Height;
                    picEntry.width = sample.Width;

                    Data_User_Activity_Log act_log = new Data_User_Activity_Log();
                    act_log.username = user.Username;
                    act_log.dateCreated = DBLayer.GetCurrentTime();
                    act_log.pageUrl = HttpContext.Current.Request.Url.AbsolutePath;
                    act_log.activity = "uploaded " + name + " in response::" + responseIdHidden.Value;
                    context.Data_User_Activity_Log.Add(act_log);

                    context.SaveChanges();
                }

            }


        }
        else
        {
            alertMessage.Text = "We support only images of type jpg, gif and png";
        }

        
    }
    protected void refreshBtn_Click(object sender, EventArgs e)
    {
        string workplanId = Request.QueryString["pk"];
        clsWorkplan workplan = DBLayer.getWorkplan(workplanId);
        string responseId = responseIdHidden.Value;
        clsVisibilityResponse response = DBLayer.getVisibilityResponseByResponseId(responseId);
        clsVisibilitySurvey survey = DBLayer.getVisibilitySurveyBySurveyId(response.SurveyId);

        modalTitle.Text =  "<span class='label label-default'>" + workplan.BranchName + "</span> " + survey.ItemCode + " " + response.Name;
        responseIdHidden.Value = response.Id;
        List<clsVisibilityPicture> pictureList = DBLayer.getVisibilityPicturesByResponseId(response.Id);
        picRepeater.DataSource = pictureList;
        picRepeater.DataBind();
        string message = "";
        if (pictureList.Count() == 0)
        {
            message += "<br><br><br><br><br><br><br>";
            message += "<h1 class='text-muted text-center'>There are no pictures! <br>Click the upload button to add one.</h1>";
        }
        pictureMessage.Text = message;
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "refreshParent();", true);
    }

    protected void picRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        string pictureId;
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            pictureId = ((clsVisibilityPicture)e.Item.DataItem).Id;
            clsVisibilityPicture picture = DBLayer.getVisibilityPictureById(pictureId);
            HiddenField picId = (HiddenField)e.Item.FindControl("HiddenFieldPicId");
            picId.Value = pictureId;
            Button deleteBtn = (Button)e.Item.FindControl("deleteBtn");
            deleteBtn.CommandArgument = pictureId;
            TextBox remarks = (TextBox)e.Item.FindControl("remarks");
            remarks.Text = picture.Remarks;



            System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)e.Item.FindControl("picCon");
            //Stream image = ftpLayer.downloadImage(((clsVisibilityPicture)e.Item.DataItem).FilePath);
            img.ImageUrl = ResolveUrl("~/FTPImageHandler.ashx?id="+pictureId);
            //DropDownList shelfBrandDDL = (DropDownList)e.Item.FindControl("shelfBrandDDL");
            //List<clsVisibilityShelfBrand> shelfList = DBLayer.getShelfBrandList();
            //foreach (clsVisibilityShelfBrand shelf in shelfList)
            //{
            //    ListItem newItem = new ListItem();
            //    newItem.Text = shelf.Description;
            //    newItem.Value = shelf.Id;
            //    shelfBrandDDL.Items.Add(newItem);
            //}

            //ListItem selectedListItem = shelfBrandDDL.Items.FindByValue(((clsVisibilityPicture)e.Item.DataItem).ShelfId);

            //if (selectedListItem != null)
            //{
            //    selectedListItem.Selected = true;
            //}

            string responseId = responseIdHidden.Value;
            clsVisibilityResponse response = DBLayer.getVisibilityResponseByResponseId(responseId);
            TextBox measureTxtBox = (TextBox)e.Item.FindControl("measure");
            measureTxtBox.Text = response.Code;

            DateTime? temp = null;
            if ((((clsVisibilityPicture)e.Item.DataItem).DateCaptured2) == "")
            {
                temp = DateTime.Parse(((clsVisibilityPicture)e.Item.DataItem).DateCaptured);
            }
            else
            {
                temp = DateTime.Parse(((clsVisibilityPicture)e.Item.DataItem).DateCaptured2);
            }
            TextBox dateCaptured = (TextBox)e.Item.FindControl("dateCaptured");
            dateCaptured.Text = ((DateTime)temp).ToString("yyyy-MM-dd");
            
            string workplanId = Request.QueryString["pk"];
            clsWorkplan workplan = DBLayer.getWorkplan(workplanId);
            TextBox branchCode = (TextBox)e.Item.FindControl("branchCode");
            branchCode.Text = workplan.AccountCode;

            if (workplan.Status.Equals("Submitted"))
            {
                dateCaptured.ReadOnly = true;
                //shelfBrandDDL.Enabled = false;
                remarks.ReadOnly = true;
                deleteBtn.Visible = false;
            }

            clsUser user = (clsUser)Session["user"];
            if (user.Type.Equals("Promo Rep") || user.Type.Equals("Coordinator"))
            {
                if (workplan.Status == "For Approval")
                {
                    dateCaptured.ReadOnly = true;
                    //shelfBrandDDL.Enabled = false;
                    remarks.ReadOnly = true;
                    deleteBtn.Visible = false;
                }
            }
            else if (user.Type.Equals("Team Leader"))
            {
                if (workplan.Status == "For Approval")
                {
                }
            }

        }
    }
    protected void picRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "deletePic")
        {
            string pictureId = (string)e.CommandArgument;

            using (var entity = new Entities())
            {
                var picture = entity.Data_Visibility_Picture.Find(int.Parse(pictureId));

                if (ftpLayer.exists(picture.file_path))
                {
                    ftpLayer.delete(picture.file_path);
                }
                if (ftpLayer.exists(picture.thumbnail_path))
                {
                    ftpLayer.delete(picture.thumbnail_path);
                }

                DBLayer.removeVisibilityPictureById(pictureId);
                e.Item.Visible = false;
                string responseId = responseIdHidden.Value;
                List<clsVisibilityPicture> pictureList = DBLayer.getVisibilityPicturesByResponseId(responseId);
                picRepeater.DataSource = pictureList;
                picRepeater.DataBind();
                string message = "";
                if (pictureList.Count() == 0)
                {
                    message += "<br><br><br><br><br><br><br>";
                    message += "<h1 class='text-muted text-center'>There are no pictures! <br>Click the upload button to add one.</h1>";
                }
                pictureMessage.Text = message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "refreshParent();", true);
                clsUser user = (clsUser)Session["user"];
                if (user != null)
                {
                    clsActivityLog log = new clsActivityLog();
                    log.Username = user.Username;
                    log.DateCreated = DBLayer.GetCurrentTime().ToString();
                    log.PageUrl = HttpContext.Current.Request.Url.AbsolutePath;
                    log.Activity = "deleted " + picture.file_name + " in response::" + responseId;
                    DBLayer.addNewActivityLog(log);
                }

            }



                 
        }
    }
    protected void saveBtn_Click(object sender, EventArgs e)
    {
        string responseId = responseIdHidden.Value;
        clsVisibilityResponse response = DBLayer.getVisibilityResponseByResponseId(responseId);

        int validation = 0;
        foreach (RepeaterItem item in picRepeater.Items)
        {
            if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
            {
                clsVisibilityPicture picture = new clsVisibilityPicture();
                string name;
                HiddenField picId = (HiddenField)item.FindControl("HiddenFieldPicId");
                TextBox branchCode = (TextBox)item.FindControl("branchCode");
                TextBox measureTxtBox = (TextBox)item.FindControl("measure");
                TextBox dateCaptured = (TextBox)item.FindControl("dateCaptured");
                //DropDownList shelfBrandDDL = (DropDownList)item.FindControl("shelfBrandDDL");
                //Label shelfValidate = (Label)item.FindControl("shelfValidate");
                TextBox remarks = (TextBox)item.FindControl("remarks");
                //clsVisibilityShelfBrand shelf = DBLayer.getShelfBrand(shelfBrandDDL.SelectedValue);
                DateTime capturedDate = Convert.ToDateTime(dateCaptured.Text);
                
                //string message = "<p class='text-danger'>";
                //if(shelfBrandDDL.SelectedValue=="0"){
                //    message += "This is required!";
                //    message += "</p>";
                //    validation ++;
                //}
                //else
                //{
                //    message = "";
                //}
                //shelfValidate.Text = message;

                name = branchCode.Text + "_" + response.Standard + "_" + measureTxtBox.Text + "_" + capturedDate.ToString("yyyyMMdd");
                picture.Id = picId.Value;
                picture.Name = name;
                //picture.ShelfId = shelfBrandDDL.SelectedValue;
                picture.DateCaptured = dateCaptured.Text;
                picture.Remarks = remarks.Text;

                if (validation==0)
                {
                    DBLayer.updateVisibilityPictureById(picture); 
                }
            }
        }
        if (validation==0)
        {
            clsUser user = (clsUser)Session["user"];
            if (user != null)
            {
                clsActivityLog log = new clsActivityLog();
                log.Username = user.Username;
                log.DateCreated = DBLayer.GetCurrentTime().ToString();
                log.PageUrl = HttpContext.Current.Request.Url.AbsolutePath;
                log.Activity = "saved picture changes in response::" + responseId;
                DBLayer.addNewActivityLog(log);
            }    
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
        }

    }
    protected void cancelBtn_Click(object sender, EventArgs e)
    {
        string responseId = responseIdHidden.Value;
        DBLayer.clearTempVisibilityPicturesByResponseId(responseId);
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "refreshParent();", true);
    }
    protected void test_Click(object sender, EventArgs e)
    {
        //string workplanId = Request.QueryString["pk"];
        //surveyList = DBLayer.getVisibilitySurveysByWorkplanId(workplanId);
        //parentRepeater.DataSource = surveyList;
        //parentRepeater.ItemDataBound += new RepeaterItemEventHandler(R1_ItemDataBound);
        //parentRepeater.DataBind();
        //UpdatePanel3.Update();
        foreach (RepeaterItem item in parentRepeater.Items)
        {
            if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
            { 
                Repeater childRepeater = (Repeater)item.FindControl("childRepeater");
                foreach (RepeaterItem item2 in childRepeater.Items)
                {
                    string workplanId = Request.QueryString["pk"];
                    clsWorkplan workplan = DBLayer.getWorkplan(workplanId);
                    HiddenField HiddenResponseId = (HiddenField)item2.FindControl("HiddenFieldId2");
                    string responseId = HiddenResponseId.Value;
                    List<clsVisibilityPicture> pictureList = DBLayer.getVisibilityPicturesByResponseId(responseId);
                    LinkButton addPicBtn = (LinkButton)item2.FindControl("addPicBtn");
                    DropDownList remarksDDL = (DropDownList)item2.FindControl("remarksDDL");
                    RadioButton miss = (RadioButton)item2.FindControl("missRadio");
                    remarksDDL.Enabled = miss.Enabled;

                    if (workplan.Status == "Submitted")
                    {
                        addPicBtn.Text = "View Picture (" + pictureList.Count() + ")";
                    }
                    else
                    {
                        addPicBtn.Text = "Add Picture (" + pictureList.Count() + ")";
                    }
                }
            }
        }

    }


    protected void confirmSubmitBtn_Click(object sender, EventArgs e)
    {

        //Note to self: datalist items are useless in postbacks. Values are reset to null. Nothing we can do
        //Just use hidden fields to pass and get data
        clsUser user = (clsUser)Session["user"];
        string workplanId = Request.QueryString["pk"];
        string status = "Submitted";        
        if (user.Type.Equals("Promo Rep") || user.Type.Equals("Coordinator"))
        {
            status = "For Approval";
        }else if(user.Type.Equals("Team Leader")){
            status = "Submitted";
        }

        clsWorkplan workplan = new clsWorkplan();
        workplan.Id = workplanId;
        workplan.Status = status;
        DBLayer.changeWorkplanStatus(workplan);
        string result = "";

        saveForm();

        if (user != null)
        {
            clsActivityLog log = new clsActivityLog();
            log.Username = user.Username;
            log.DateCreated = DBLayer.GetCurrentTime().ToString();
            log.PageUrl = HttpContext.Current.Request.Url.AbsolutePath;
            log.Activity = "submitted visib of visit::" + workplanId;
            DBLayer.addNewActivityLog(log);
        }  
        //Response.Redirect("View_Visibility.aspx?pk=" + workplanId);
        message += "<div id='myAlert' class='alert alert-success fade' role='alert'>";
        message += "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>";
        message += "<p class='text-success'>Survey successfully submitted!</p>";
        message += "</div>";

        saveDraftBtn.Visible = false;
        submitBtn.Visible = false;
        statusBtn.Attributes.Add("class", "btn-success btn btn-sm");
        statusBtn.InnerText = "Submitted";
        statusBtn.Visible = true;

        uploadBtnPlaceholder.Visible = false;
        saveBtn.Visible = false;
        cancelBtn.Visible = false;
    }

    protected DateTime GetCurrentTime()
    {
        DateTime serverTime = DateTime.Now;
        DateTime _localTime = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(serverTime, TimeZoneInfo.Local.Id, "Singapore Standard Time");
        return _localTime;
    }

    protected void confirmParent_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            string surveyId = "";
            Repeater confirmChild = (Repeater)e.Item.FindControl("confirmChild");
            surveyId = ((clsVisibilitySurvey)e.Item.DataItem).Id;
            List<clsVisibilityResponse> responseList = DBLayer.getVisibilityResponseBySurveyId(surveyId);
            confirmChild.DataSource = responseList;
            confirmChild.DataBind();
        }
    }
    protected void confirmChild_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            clsVisibilityResponse response = (clsVisibilityResponse)e.Item.DataItem;
            Label hit = (Label)e.Item.FindControl("hit");
            hit.Text = "";

            Label miss = (Label)e.Item.FindControl("miss");
            miss.Text = "";
            if (response.Hit)
            {
                hit.CssClass += "fa fa-check";
            }
            else if (response.Miss)
            {
                //miss.Text = "<i class='fa fa-check'><i/>";
                miss.CssClass += "fa fa-check";
            }
        }
    }
    protected void backBtn_Click(object sender, EventArgs e)
    {
    }

    private string cleanFileName(string name)
    {
        string illegal = name;
        string regexSearch = new string(Path.GetInvalidFileNameChars()) + new string(Path.GetInvalidPathChars());
        Regex r = new Regex(string.Format("[{0}]", Regex.Escape(regexSearch)));
        illegal = r.Replace(illegal, "");
        return illegal;
    }

    /// <summary>
    /// Resize the image to the specified width and height.
    /// </summary>
    /// <param name="image">The image to resize.</param>
    /// <param name="width">The width to resize to.</param>
    /// <param name="height">The height to resize to.</param>
    /// <returns>The resized image.</returns>
    public static Bitmap ResizeImage(System.Drawing.Image image, int width, int height)
    {
        var destRect = new Rectangle(0, 0, width, height);
        var destImage = new Bitmap(width, height);

        destImage.SetResolution(image.HorizontalResolution, image.VerticalResolution);

        using (var graphics = Graphics.FromImage(destImage))
        {
            graphics.CompositingMode = CompositingMode.SourceCopy;
            graphics.CompositingQuality = CompositingQuality.HighQuality;
            graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
            graphics.SmoothingMode = SmoothingMode.HighQuality;
            graphics.PixelOffsetMode = PixelOffsetMode.HighQuality;

            using (var wrapMode = new ImageAttributes())
            {
                wrapMode.SetWrapMode(WrapMode.TileFlipXY);
                graphics.DrawImage(image, destRect, 0, 0, image.Width, image.Height, GraphicsUnit.Pixel, wrapMode);
            }
        }

        return destImage;
    }
    protected void submitBtnFinal_Click(object sender, EventArgs e)
    {

    }
    protected void missRadio_CheckedChanged(object sender, EventArgs e)
    {
        //foreach (RepeaterItem item1 in parentRepeater.Items)
        //{
        //    Repeater childRptr = (Repeater)item1.FindControl("childRepeater");
        //    foreach (RepeaterItem item in childRptr.Items)
        //    {
        //        if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
        //        {
        //            DropDownList remarksDDL = (DropDownList)item.FindControl("remarksDDL");
        //            RadioButton miss = (RadioButton)item.FindControl("missRadio");
        //            remarksDDL.Enabled = miss.Enabled;
        //        }
        //    }
        //}
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "refreshForm();", true);
    }
}