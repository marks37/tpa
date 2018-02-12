using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Site_Login : System.Web.UI.Page
{
    clsDBLayer DBLayer = new clsDBLayer(ConfigurationManager.ConnectionStrings["VisibilityDB"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        clsUser user = (clsUser)Session["user"];
        if (user != null)
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
        else if (Page.Request.QueryString["session"]==("expired"))
        {
            string message = "";
            message += "<div class='alert alert-danger'>";
            message += "Your session has expired. Please login again";
            message += "</div>";
            invalidLogin.Text = message;
        }



    }
    protected void loginBtn_Click(object sender, EventArgs e)
    {
        string username = inputUsername.Text;
        string password = inputPassword.Text;
        string message = "";
        clsUser user = DBLayer.validateUser(username, password);

        //message += "<div class='alert alert-danger'>";
        //message += "System is under maintenance.<br> We're so sorry about this. :(";
        //message += "</div>";
        //invalidLogin.Text = message;
        clsActivityLog log = new clsActivityLog();

        if (user.Username != null)
        {
            //message += "SUCCES FU";
            //invalidLogin.Text = message;
            //FormsAuthentication.RedirectFromLoginPage(user.Username, true);
            log.Username = user.Username;
            log.Activity = "logged in successfully";
            log.DateCreated = DBLayer.GetCurrentTime().ToString();
            log.PageUrl = HttpContext.Current.Request.Url.AbsolutePath;
            DBLayer.addNewActivityLog(log);

            Session["user"] = user;

            if (user.Type.Equals("Coordinator"))
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
        else
        {
            log.Username = username;
            log.Activity = "login failed (Invalid username/password)";
            log.DateCreated = DBLayer.GetCurrentTime().ToString();
            log.PageUrl = HttpContext.Current.Request.Url.AbsolutePath;
            DBLayer.addNewActivityLog(log);

            message += "<div class='alert alert-danger'>";
            message += "Invalid username or password!";
            message += "</div>";
            invalidLogin.Text = message;
        }
    }
}