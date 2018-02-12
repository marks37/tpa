using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Visibility : System.Web.UI.MasterPage
{
    clsDBLayer DBLayer = new clsDBLayer(ConfigurationManager.ConnectionStrings["VisibilityDB"].ToString());

    public int iWarningTimeoutInMilliseconds;
    public int iSessionTimeoutInMilliseconds;
    public string sTargetURLForSessionTimeout;

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.DataBind();
        sTargetURLForSessionTimeout = "/Site_Login.aspx";
        int iNumberOfMinutesBeforeSessionTimeoutToWarnUser = 1;

        //Get the sessionState timeout (from web.config).
        //If not set there, the default is 20 minutes.
        int iSessionTimeoutInMinutes = Session.Timeout;

        //Compute our timeout values, one for
        //our warning, one for session termination.
        int iWarningTimeoutInMinutes = iSessionTimeoutInMinutes - iNumberOfMinutesBeforeSessionTimeoutToWarnUser;

        iWarningTimeoutInMilliseconds = iWarningTimeoutInMinutes * 60 * 1000;
        iSessionTimeoutInMilliseconds = iSessionTimeoutInMilliseconds * 60 * 1000;


        clsUser user = (clsUser)Session["user"];
        if (Session["user"] == null)
        {
            Response.Redirect("~/Site_Login.aspx");
        }
        else
        {
            username.Text = user.Fullname;

            if (user.Type.Equals("Coordinator") || user.Type.Equals("Promo Rep"))
            {
                //workplanLink.Attributes.Add("class", "hidden");
                workplanLink.Visible = false;
                coorLink.Visible = false;
                //coorLink.Attributes.Add("class", "hidden");
            }

        }
    }
    protected void logoutBtn_Click(object sender, EventArgs e)
    {
        clsUser user = (clsUser)Session["user"];
        clsActivityLog log = new clsActivityLog();
        log.Username = user.Username;
        log.Activity = "logged out successfully";
        log.DateCreated = DBLayer.GetCurrentTime().ToString();
        log.PageUrl = HttpContext.Current.Request.Url.AbsolutePath;
        DBLayer.addNewActivityLog(log);

        Session.Clear();
        Session.Abandon();
        Response.Redirect("~/Site_Login.aspx");
    }
    protected void visibLinkBtn_Click(object sender, EventArgs e)
    {
        clsUser user = (clsUser)Session["user"];
        if (Session["user"] == null)
        {
            //Response.Redirect("~/Site_Login.aspx");
        }
        else
        {
            if (user.Type.Equals("Coordinator"))
            {
                Response.Redirect("~/coor_visibility.aspx");
            }
            else if (user.Type.Equals("Promo Rep"))
            {
                Response.Redirect("~/coor_visibility.aspx");
            }
            else if (user.Type.Equals("Admin"))
            {
                Response.Redirect("~/admin_visibility.aspx");
            }
            else if (user.Type.Equals("Sales Representative"))
            {
                Response.Redirect("cds_visibility.aspx");
            } if (user.Type.Equals("Team Leader"))
            {
                Response.Redirect("~/tl_visibility.aspx");
            }
        }
    }
    protected void saveBtn_Click(object sender, EventArgs e)
    {
        clsUser user = (clsUser)Session["user"];
        int validation = 0;
        string newPassword_Input = "";
        string confirmPassword_Input = "";
        string oldPassword_Input = "";

        string regexString = @"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";
        RegexStringValidator regexValidator = new RegexStringValidator(regexString);
        regexValidator.CanValidate(newPassword_Input.GetType());
        try
        {
            regexValidator.Validate(newPassword_Input);
        }
        catch(ArgumentException f)
        {
            validation++;
        }

        if (!confirmPassword_Input.Equals(newPassword_Input))
        {
            validation++;
        }
        if (user.Password.Equals(oldPassword_Input))
        {
            validation++;            
        }

        if (validation > 0)
        {
            string message = "";
            message += "<div id='myAlert' class='alert alert-success fade in' role='alert'>";
            message += "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>";
            message += "<p class='text-success'>Error!</p>";
            message += "</div>";
            //messagelbl.Text = message;
        }
        else
        {
            //ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), "changePassword", "closeChangePasswordModal();", true);
        }
        //Response.Redirect("~/tl_workplan.aspx");
    }
    protected void cancelBtn_Click(object sender, EventArgs e)
    {
        //newPassword.Text = "";
        //confirmPassword.Text = "";
        //oldPassword.Text = "";
        //ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), "changePassword", "closeChangePasswordModal();", true);
    }
    protected void btnContinueSession_Click(object sender, EventArgs e)
    {
        //ScriptManager.RegisterStartupScript(UpdatePanel1, this.GetType(), "alert", "alert('huy');", true);
    }
    protected void sessionTimeoutBtn_Click(object sender, EventArgs e)
    {
        Application["Session"] = "Your session has timed out.";
    }
}
