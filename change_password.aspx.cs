using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Providers.Entities;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class change_password : System.Web.UI.Page
{
    static clsDBLayer DBLayer = new clsDBLayer(ConfigurationManager.ConnectionStrings["VisibilityDB"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        //clsUser user = (clsUser)Session["user"];
        //if (user == null)
        //{
        //    Response.Redirect("Site_Login.aspx");
        //}
        //else
        //{

        //}
        if (!IsPostBack)
        {
            //saveBtn.Enabled = false;
        }
    }
    protected void saveBtn_Click(object sender, EventArgs e)
    {
        clsUser user = (clsUser)Session["user"];
        clsUser acct = DBLayer.getUserAccountByUsername(user.Username);
        string message = "";
        string body = "";
        message += "<div id='myAlert' class='alert alert-danger fade in' role='alert'>";
        message += "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>";
        message += "<p class='text-danger'><strong></strong>";        
        int validation = 0;
        string newPassword_Input = newPassword.Text;
        string confirmPassword_Input = confirmPassword.Text;
        string oldPassword_Input = oldPassword.Text;
        newPassword.Attributes.Add("value", newPassword_Input);
        confirmPassword.Attributes.Add("value", confirmPassword_Input);
        oldPassword.Attributes.Add("value", oldPassword_Input);
        saveBtn.Enabled = true;

        string regexString = @"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$";
        RegexStringValidator regexValidator = new RegexStringValidator(regexString);
        regexValidator.CanValidate(newPassword_Input.GetType());
        try
        {
            regexValidator.Validate(newPassword_Input);
        }
        catch (ArgumentException f)
        {
            validation++;
        }
        if (!confirmPassword_Input.Equals(newPassword_Input))
        {
            body = @"Your passwords dont match.";
            validation++;
        }
        if (!oldPassword_Input.Equals(acct.Password))
        {
            body = @"You entered an invalid password.";
            validation++;
        }
        message += body;
        message += "</p>";
        message += "</div>";
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "init", "update();", true);

        if (validation > 0)
        {
            //messagelbl.Text = message;
        }
        else
        {
            //ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), "changePassword", "closeChangePasswordModal();", true);
        }
        //Response.Redirect("~/tl_workplan.aspx");
        
    }

    [System.Web.Services.WebMethod]
    public static string[] validateForm(string oldPassword, string newPassword, string confirmPassword)
    {
        try
        {
            String body = "Success!";
            string status = "success";
            clsUser user = (clsUser)HttpContext.Current.Session["user"];
            clsUser acct = DBLayer.getUserAccountByUsername(user.Username);
            int validation = 0;
            string regexString = @"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$";
            RegexStringValidator regexValidator = new RegexStringValidator(regexString);
            regexValidator.CanValidate(newPassword.GetType());
            try
            {
                regexValidator.Validate(newPassword);
            }
            catch (ArgumentException f)
            {
                validation++;
                status = "danger";
            }
            if (!confirmPassword.Equals(newPassword))
            {
                body = @"Your passwords dont match.";
                validation++;
                status = "danger";
            }
            if (!oldPassword.Equals(acct.Password))
            {
                body = @"Your password is invalid.";
                validation++;
                status = "danger";
            }
            body += "," + status;
            string[] message = body.Split(',');

            DBLayer.changePassword(newPassword,user.Id);
            clsActivityLog log = new clsActivityLog();
            log.Username = user.Username;
            log.Activity = "User changed password";
            log.DateCreated = DBLayer.GetCurrentTime().ToString();
            log.PageUrl = HttpContext.Current.Request.Url.AbsolutePath;
            DBLayer.addNewActivityLog(log);
            return message;
        }
        catch (Exception)
        {
            throw;
        }

    }
}