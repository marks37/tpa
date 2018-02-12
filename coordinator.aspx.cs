using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Providers.Entities;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class coordinator : System.Web.UI.Page
{
    static clsDBLayer DBLayer = new clsDBLayer(ConfigurationManager.ConnectionStrings["VisibilityDB"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        clsUser user = (clsUser)Session["user"];
        if (Session["user"] == null)
        {
            Response.Redirect("Site_Login.aspx");
        }
        else
        {
            if (!user.Type.Equals("Team Leader"))
            {
                //Response.Redirect("~/Site_Login.aspx");
                Response.Redirect("~/Site_Login.aspx");
            }
        }

        if (!IsPostBack)
        {
            var visibLink = (HtmlGenericControl)this.Master.FindControl("coorLink");
            visibLink.Attributes.Add("class", "active");
            List<clsUser> assignedUsers = DBLayer.getAssignedUsers(user.Id);
            coordinatorList.DataSource = assignedUsers;
            coordinatorList.DataBind();
        }
    }


    protected void coordinatorList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if(!IsPostBack){
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                clsUser user = (clsUser)e.Item.DataItem;
                clsUser team_leader = DBLayer.getUserAccountById(user.Teamleader);
                Label team_leader_lbl = (Label)e.Item.FindControl("team_leader_lbl");
                team_leader_lbl.Text = team_leader.Fullname;
            }
        }

    }

    [System.Web.Services.WebMethod]
    public static string[] savePassword(string userId, string newPassword, string confirmPassword)
    {
        string text = "";
        string[] message;
        Boolean success = true;
        clsUser user = DBLayer.getUserAccountById(userId);
        clsUser logged_in_user = (clsUser)HttpContext.Current.Session["user"];
        try
        {
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
                text = @"Password doesn't meet requirement";
            }
            if (!confirmPassword.Equals(newPassword))
            {
                validation++;
                text = @"Passwords don't match";
            }
            if (user.Password.Equals(newPassword))
            {
                validation++;
                text = @"Password is already used for "+user.Username;
            }
            if (validation == 0)
            {
                text = "Password saved for "+user.Username;
                DBLayer.changePassword(newPassword, user.Id);
                clsActivityLog log = new clsActivityLog();
                log.Username = logged_in_user.Username;
                log.Activity = "User changed "+user.Username+"'s password";
                log.DateCreated = DBLayer.GetCurrentTime().ToString();
                log.PageUrl = HttpContext.Current.Request.Url.AbsolutePath;
                DBLayer.addNewActivityLog(log);
            }
            else
            {
                success = false;
                text += @", "+success;
            }
        }
        catch (Exception)
        {
            throw;
        }
        message = text.Split(',');
        return message;
    }

    [System.Web.Services.WebMethod]
    public static Boolean checkPassword(string newPassword, string userId)
    {
        //string isValid = "true";
        //clsUser user = DBLayer.getUserAccountById(userId);
        //if (user.Password.Equals(newPassword))
        //{
        //    isValid = "false";
        //}
        //return isValid;
        return true;
    }

}