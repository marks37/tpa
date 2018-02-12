using AjaxControlToolkit;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_view_visibility : System.Web.UI.Page
{
    clsDBLayer DBLayer = new clsDBLayer(ConfigurationManager.ConnectionStrings["VisibilityDB"].ToString());
    //Will user this later for saving visibility to db without querying data from db
    List<clsVisibility> visibilityList = new List<clsVisibility>();
    List<clsVisibilitySurvey> surveyList = new List<clsVisibilitySurvey>();
    //private Boolean workplanHasContent;
    //private List<clsVisibilityPicture> tempPictures;
    //private List<clsVisibilityPicture> savedPictures;
    //private List<clsVisibilityPicture> addedPictures;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Form.Attributes.Add("enctype", "multipart/form-data");
        if (!IsPostBack)
        {
            validationSummary.Text = "";

            //FileUpload1.Attributes["onchange"] = "UploadFile(this)";
            List<clsManpower> branches = DBLayer.getAssignedBranches("1");
            for (int a = 0; a < branches.Count(); a++)
            {
                //branchDropDownList.Items.Add(new ListItem(branches[a].BranchName, branches[a].Id));
            }

            string workplanId = Request.QueryString["pk"];
            clsWorkplan workplan = DBLayer.getWorkplan(workplanId);

            if (workplan.Status == "Submitted")
            {
                saveDraftBtn.Visible = false;
                submitBtn.Visible = false;
            }

            //List<clsVisibilitySurvey> tempsurveyList = DBLayer.getVisibilitySurveysByWorkplanId(workplanId);
            //foreach (clsVisibilitySurvey survey in tempsurveyList)
            //{
            //    surveyList.Add(survey);
            //}
            surveyList = DBLayer.getVisibilitySurveysByWorkplanId(workplanId);
            parentRepeater.DataSource = surveyList;
            parentRepeater.DataBind();

            confirmParent.DataSource = surveyList;
            confirmParent.DataBind();
            //visibilityList = DBLayer.getVisibilityProgramsByBranchId(workplan.BranchId);
            //if (surveyList.Count()!=0)
            //{
            //    parentRepeater.DataSource = surveyList;
            //    parentRepeater.DataBind();
            //    workplanHasContent = true;
            //}
            //else
            //{
            //    parentRepeater.DataSource = visibilityList;
            //    parentRepeater.DataBind();
            //    workplanHasContent = false;
            //}

            if (workplan.Status.Equals("Submitted"))
            {
                uploadBtnPlaceholder.Visible = false;
                saveBtn.Visible = false;
                cancelBtn.Visible = false;
            }
            else
            {
                closeBtnPlaceholder.Visible = false;
            }

        }
    }

    protected void R1_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {

        if (true)
        {

            string result = "";
            //string visibilityId = "";
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


                result = "Id: " + ((clsVisibilitySurvey)e.Item.DataItem).Id + "</br>";
                surveyId = ((clsVisibilitySurvey)e.Item.DataItem).Id;

                List<clsVisibilityResponse> responseList = DBLayer.getVisibilityResponseBySurveyId(surveyId);
                childRepeater.DataSource = responseList;
                //result += "standard: " + standardList.Count()+"</br>"; 
                //result += "repeater: " + childRepeater.ID + "</br>"; 
                childRepeater.DataBind();
            }
            //Response.Write(result);

            if (workplan.Status == "Submitted")
            {
                foreach (RepeaterItem item2 in childRepeater.Items)
                {

                    // Execute the following logic for Items and Alternating Items.
                    if (item2.ItemType == ListItemType.Item || item2.ItemType == ListItemType.AlternatingItem)
                    {
                        //get controls
                        HiddenField HiddenStandardId = (HiddenField)item2.FindControl("HiddenFieldId2");
                        RadioButton hit = (RadioButton)item2.FindControl("hitRadio");
                        hit.Enabled = hit.Checked;
                        RadioButton miss = (RadioButton)item2.FindControl("missRadio");
                        miss.Enabled = miss.Checked;
                        TextBox remarks = (TextBox)item2.FindControl("remarks");
                        remarks.Attributes.Add("Readonly", "");

                    }

                }
            }
            else
            {
                foreach (RepeaterItem item2 in childRepeater.Items)
                {

                    // Execute the following logic for Items and Alternating Items.
                    if (item2.ItemType == ListItemType.Item || item2.ItemType == ListItemType.AlternatingItem)
                    {
                        HiddenField HiddenStandardId = (HiddenField)item2.FindControl("HiddenFieldId2");
                        //HtmlInputFile picture = (HtmlInputFile)item2.FindControl("myFile");
                        //FileUpload picture = (FileUpload)item2.FindControl("FileUpload1");
                        HiddenField targetPic = (HiddenField)item2.FindControl("targetPic");
                        Label itemValidate = (Label)item2.FindControl("itemValidate");
                        itemValidate.Text = "";
                        //AjaxControlToolkit.AsyncFileUpload picture = (AjaxControlToolkit.AsyncFileUpload)item2.FindControl("myFile");

                        //Button uploadBtn = (Button)item2.FindControl("uploadBtn");
                        //uploadBtn.CssClass += " uploadBtn" + HiddenStandardId.Value;
                        //picture.Attributes["onchange"] = "UploadFile('" + uploadBtn.ClientID + "', this, '" + targetPic.ClientID + "')";
                    }
                }
            }

        }
    }

    protected void R2_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {
        if (true)
        {
            string workplanId = Request.QueryString["pk"];
            clsWorkplan workplan = DBLayer.getWorkplan(workplanId);

            // This event is raised for the header, the footer, separators, and items.
            // Execute the following logic for Items and Alternating Items.
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string responseId = ((clsVisibilityResponse)e.Item.DataItem).Id;
                List<clsVisibilityPicture> pictureList = DBLayer.getVisibilityPicturesByResponseId(responseId);
                Button addPicBtn = (Button)e.Item.FindControl("addPicBtn");

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

    protected void RP_Persons_OnItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            //Person person = (Person)e.Item.DataItem;
            //((Label)e.Item.FindControl("lblCountry")).Text = person.Country.Name;
            //if (person.IsActive)
            //{
            //    ((Image)e.Item.FindControl("imgActive")).Visible = True;
            //    ((Image)e.Item.FindControl("imgInactive")).Visible = False;
            //}
            //else
            //{
            //    ((Image)e.Item.FindControl("imgActive")).Visible = False;
            //    ((Image)e.Item.FindControl("imgInactive")).Visible = True;
            //}
        }
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
            htmlStr += "<strong>" + visibilityList[a].ItemCode + "</strong><br/>";
            htmlStr += visibilityList[a].Category + "<br/>";
            htmlStr += visibilityList[a].Brand + "<br/>";
            htmlStr += visibilityList[a].Display_type + "<br/>";
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
                        RadioButton hitRadio = (RadioButton)item2.FindControl("hitRadio");
                        RadioButton missRadio = (RadioButton)item2.FindControl("missRadio");
                        if (missRadio.Checked | hitRadio.Checked)
                        {
                            itemValidate.Text = "";
                            itemValidate.CssClass += "";
                        }
                    }
                }
            }
        }

        //Note to self: datalist items are useless in postbacks. Values are reset to null. Nothing we can do
        //Just use hidden fields to pass and get data

        string workplanId = Request.QueryString["pk"];
        string result = "";
        //List<clsVisibilitySurvey> surveyList2 = DBLayer.getVisibilitySurveysByWorkplanId(workplanId);
        //foreach (clsVisibilitySurvey survey in surveyList2)
        //{
        //    surveyList.Add(survey);
        //}
        //surveyList = DBLayer.getVisibilitySurveysByWorkplanId(workplanId);
        //parentRepeater.DataSource = surveyList;
        //parentRepeater.DataBind();

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
                        TextBox remarks = (TextBox)item2.FindControl("remarks");

                        clsVisibilityResponse response = new clsVisibilityResponse();

                        response.Id = HiddenResponseId.Value;
                        response.Standard = HiddenStandardId.Value;
                        response.Hit = hit.Checked;
                        response.Miss = miss.Checked;
                        response.Remarks = remarks.Text;
                        response.DateCreated = DateTime.Now.ToString("yyyy-MM-dd");
                        responseList.Add(response);

                        //print for testing purposes
                        //result += "standard: " + HiddenStandardId.Value + " hit: " + hit.Checked + " miss: " + miss.Checked + "</br>";
                        //result += remarks.Text + "</br>";
                    }
                }
                survey.Response = responseList;
                DBLayer.updateVisibilitySurveyById(survey);

                if (surveyList.Count != 0)
                {
                }
                else
                {
                    //DBLayer.addVisibilitySurvey(survey);
                }
            }

            //Response.Write(result);
        }
        Response.Redirect("New_Visibility.aspx?pk=" + workplanId);
        string message = "";
        message += "<div class='alert alert-success' role='alert'>";
        message += "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>";
        message += "<p class='text-success'>Draft successfully saved!</p>";
        message += "</div>";
        validationSummary.Text = message;
    }

    protected void submitBtn_Click(object sender, EventArgs e)
    {
        int validation = 0;
        string message = "";
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
                        HiddenField responseId = (HiddenField)item2.FindControl("HiddenFieldId2");
                        Label itemValidate = (Label)item2.FindControl("itemValidate");
                        RadioButton hitRadio = (RadioButton)item2.FindControl("hitRadio");
                        RadioButton missRadio = (RadioButton)item2.FindControl("missRadio");
                        //if (missRadio.Checked | hitRadio.Checked)
                        //{
                        //    itemValidate.Text = "";
                        //    itemValidate.CssClass += "";
                        //}
                        //else
                        //{
                        //    itemValidate.Text = "This is required";
                        //    itemValidate.CssClass += "text-danger bg-danger";
                        //    validation++;
                        //}
                        List<clsVisibilityPicture> pictureList = DBLayer.getVisibilityPicturesByResponseId(responseId.Value);
                        if ((!missRadio.Checked && !hitRadio.Checked) || pictureList.Count() == 0)
                        {
                            //pictureList.Count()==0
                            itemValidate.Text = "This is required";
                            itemValidate.CssClass += "text-danger bg-danger";
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
        if (validation > 0)
        {
            message += "<div class='alert alert-danger' role='alert'>";
            message += "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>";
            message += "<p class='text-danger'>Please complete all required fields!</p>";
            message += "</div>";
            validationSummary.Text = message;
        }
        else
        {
            validationSummary.Text = "";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "confirmModal();", true);
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
            //Label3.Text = "Success";
            string responseId = (string)e.CommandArgument;
            clsVisibilityResponse response = DBLayer.getVisibilityResponseByResponseId(responseId);
            clsVisibilitySurvey survey = DBLayer.getVisibilitySurveyBySurveyId(response.SurveyId);

            modalTitle.Text = "<span class='label label-default'>" + workplan.BranchName + "</span> " + survey.ItemCode + " " + response.Name;
            responseIdHidden.Value = response.Id;
            List<clsVisibilityPicture> pictureList = DBLayer.getVisibilityPicturesByResponseId(response.Id);
            picRepeater.DataSource = pictureList;
            picRepeater.DataBind();
            string message = "";
            if (pictureList.Count() == 0 && workplan.Status.Equals("Submitted"))
            {
                message += "<br><br><br><br><br><br><br>";
                message += "<br><h1 class='text-muted text-center'>There are no pictures!</h1>";
            }
            else if (pictureList.Count() == 0 && workplan.Status.Equals("Draft"))
            {
                message += "<br><br><br><br><br><br><br>";
                message += "<h1 class='text-muted text-center'>There are no pictures! <br>Click the upload button to add one.</h1>";
            }
            pictureMessage.Text = message;
            //ClientScript.RegisterStartupScript(GetType(), "hwa", "$('#myModal').modal('show');", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }
    }
    protected void myFile_UploadedComplete(object sender, AsyncFileUploadEventArgs e)
    {
        string contentType = myFile.ContentType;

        if (contentType == "image/jpeg" || contentType == "image/gif"
              || contentType == "image/png" || contentType == "image/jpg")
        {

            System.IO.Directory.CreateDirectory(Server.MapPath("Images/Temp"));

            // Specify the path to save the uploaded file to.
            string savePath = "~/Images/Temp";

            // Get the name of the file to upload.
            string fileName = Path.GetFileName(e.FileName);
            string extension = Path.GetExtension(e.FileName);
            string fullPath = Path.GetFullPath(e.FileName);

            // Create the path and file name to check for duplicates.
            string pathToCheck = savePath + fileName;

            // Create a temporary file name to use for checking duplicates.
            string tempfileName = "";

            // Check to see if a file already exists with the
            // same name as the file to upload.
            if (System.IO.File.Exists(Server.MapPath(pathToCheck)))
            {
                int counter = 2;
                while (System.IO.File.Exists(Server.MapPath(pathToCheck)))
                {
                    // if a file with this name already exists,
                    // prefix the filename with a number.
                    tempfileName = counter.ToString() + fileName;
                    pathToCheck = savePath + tempfileName;
                    counter++;
                }
                fileName = tempfileName;
                // Notify the user that the file name was changed.
                //UploadStatusLabel.Text = "A file with the same name already exists." +
                //    "<br />Your file was saved as " + fileName;

            }
            else
            {
                // Notify the user that the file was saved successfully.
                //UploadStatusLabel.Text = "Your file was uploaded successfully.";
            }

            // Append the name of the file to upload to the path.
            //savePath += fileName;
            // Call the SaveAs method to save the uploaded
            // file to the specified directory.
            //FileUpload1.SaveAs(savePath);
            myFile.SaveAs(Server.MapPath(savePath + fileName));

            string file = Server.MapPath(savePath + fileName);

            // Load an image however you like.  
            System.Drawing.Image image = new Bitmap(file);
            DateTime? dateTaken = null;

            int OrientationId = 0x132;
            int[] ids = image.PropertyIdList;
            System.Drawing.Imaging.PropertyItem propItem = null;
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

            string responseId = responseIdHidden.Value;
            string name;
            string workplanId = Request.QueryString["pk"];

            clsVisibilityPicture picture = new clsVisibilityPicture();
            clsVisibilityResponse response = DBLayer.getVisibilityResponseByResponseId(responseId);
            clsWorkplan workplan = DBLayer.getWorkplan(workplanId);
            clsVisibilitySurvey survey = DBLayer.getVisibilitySurveyBySurveyId(response.SurveyId);
            DateTime capturedDate = GetCurrentTime();

            // Format name
            if (!dateTaken.HasValue)
            {
                picture.DateCaptured = capturedDate.ToString();
                name = workplan.AccountCode + "_" + survey.ItemCode + "_" + response.Code + "_" + capturedDate.ToString("yyyyMMdd");
            }
            else
            {
                capturedDate = (DateTime)dateTaken;
                picture.DateCaptured = capturedDate.ToString();
                name = workplan.AccountCode + "_" + survey.ItemCode + "_" + response.Code + "_" + capturedDate.ToString("yyyyMMdd");
            }

            // Specify the path to save the uploaded file to.
            savePath = "~/Images/";

            // Create the path and file name to check for duplicates.
            pathToCheck = savePath + name + extension;

            // Create a temporary file name to use for checking duplicates.
            tempfileName = "";

            // Check to see if a file already exists with the
            // same name as the file to upload.
            if (System.IO.File.Exists(Server.MapPath(pathToCheck)))
            {
                int counter = 2;
                while (System.IO.File.Exists(Server.MapPath(pathToCheck)))
                {
                    // if a file with this name already exists,
                    // prefix the filename with a number.
                    tempfileName = counter.ToString() + name;
                    pathToCheck = savePath + tempfileName + extension;
                    counter++;
                }
                name = tempfileName;
                // Notify the user that the file name was changed.
                //UploadStatusLabel.Text = "A file with the same name already exists." +
                //    "<br />Your file was saved as " + fileName;

            }
            else
            {
                // Notify the user that the file was saved successfully.
                //UploadStatusLabel.Text = "Your file was uploaded successfully.";
            }

            // Append the name of the file to upload to the path.
            //savePath += fileName;
            // Call the SaveAs method to save the uploaded
            // file to the specified directory.
            myFile.SaveAs(Server.MapPath(savePath + name + extension));

            System.IO.DirectoryInfo di = new DirectoryInfo(Server.MapPath("~/Images/Temp/"));

            //Clear temp folder
            foreach (FileInfo item in di.GetFiles())
            {
                item.Delete();
            }

            picture.Name = name + extension;
            picture.FileName = name + extension;
            picture.FilePath = "Images/" + name + extension;
            picture.ResponseId = responseId;
            picture.Userid = "1";
            picture.DateCreated = capturedDate.ToString();
            DBLayer.addVisibilityPicturesByResponseId(picture);

        }
        else
        {
            alertMessage.Text = "We support only images of type jpg, gif and png";
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "alertModal();", true);
            //myFileValidation.Text = "We support only images of type jpg, gif and png";

        }


    }
    protected void refreshBtn_Click(object sender, EventArgs e)
    {
        string workplanId = Request.QueryString["pk"];
        clsWorkplan workplan = DBLayer.getWorkplan(workplanId);
        string responseId = responseIdHidden.Value;
        clsVisibilityResponse response = DBLayer.getVisibilityResponseByResponseId(responseId);
        clsVisibilitySurvey survey = DBLayer.getVisibilitySurveyBySurveyId(response.SurveyId);

        modalTitle.Text = "<span class='label label-default'>" + workplan.BranchName + "</span> " + survey.ItemCode + " " + response.Name;
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
            temp = DateTime.Parse(((clsVisibilityPicture)e.Item.DataItem).DateCaptured);
            if (!temp.HasValue)
            {
                temp = DateTime.Parse(((clsVisibilityPicture)e.Item.DataItem).DateCaptured2);
            }
            DateTime result = DateTime.Parse(((clsVisibilityPicture)e.Item.DataItem).DateCaptured);
            TextBox dateCaptured = (TextBox)e.Item.FindControl("dateCaptured");
            if (temp.HasValue)
            {

            }
            dateCaptured.Text = result.ToString("yyyy-MM-dd");
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
        }
    }
    protected void picRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "deletePic")
        {
            string pictureId = (string)e.CommandArgument;
            clsVisibilityPicture picture = DBLayer.getVisibilityPictureById(pictureId);

            if ((System.IO.File.Exists(Server.MapPath(picture.FilePath))))
            {
                System.IO.File.Delete(Server.MapPath(picture.FilePath));
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

                if (validation == 0)
                {
                    DBLayer.updateVisibilityPictureById(picture);
                }
            }
        }
        if (validation == 0)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
        }

    }
    protected void cancelBtn_Click(object sender, EventArgs e)
    {
        string responseId = responseIdHidden.Value;
        DBLayer.clearTempVisibilityPicturesByResponseId(responseId);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "refreshParent();", true);
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
                    Button addPicBtn = (Button)item2.FindControl("addPicBtn");

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

        string workplanId = Request.QueryString["pk"];
        string status = "Submitted";
        clsWorkplan workplan = new clsWorkplan();
        workplan.Id = workplanId;
        workplan.Status = status;
        DBLayer.changeWorkplanStatus(workplan);
        string result = "";
        List<clsVisibilitySurvey> surveyList = DBLayer.getVisibilitySurveysByWorkplanId(workplanId);

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
                        TextBox remarks = (TextBox)item2.FindControl("remarks");

                        clsVisibilityResponse response = new clsVisibilityResponse();

                        response.Id = HiddenResponseId.Value;
                        response.Standard = HiddenStandardId.Value;
                        response.Hit = hit.Checked;
                        response.Miss = miss.Checked;
                        response.Remarks = remarks.Text;
                        response.DateCreated = DateTime.Now.ToString("yyyy-MM-dd");
                        responseList.Add(response);

                        //print for testing purposes
                        result += "standard: " + HiddenStandardId.Value + " hit: " + hit.Checked + " miss: " + miss.Checked + "</br>";
                        //result += remarks.Text + "</br>";
                    }
                }
                survey.Response = responseList;
                if (surveyList.Count != 0)
                {
                    DBLayer.updateVisibilitySurveyById(survey);
                }
                else
                {
                    DBLayer.addVisibilitySurvey(survey);
                }
            }

            Response.Write(result);
        }
        Response.Redirect("New_Visibility.aspx?pk=" + workplanId);
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
            if (response != null)
            {
                hit.CssClass += "fa fa-check";
                miss.CssClass += "fa fa-check";
            }
            //if (response.Hit != null || !response.Hit.Equals(""))
            //{
            //}
            //else if (response.Miss != null || !response.Miss.Equals(""))
            //{
            //    //miss.Text = "<i class='fa fa-check'><i/>";
            //}
        }
    }
    protected void backBtn_Click(object sender, EventArgs e)
    {
    }
}