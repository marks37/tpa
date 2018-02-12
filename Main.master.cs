using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Main : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!this.Page.User.Identity.IsAuthenticated)
        //{
        //    FormsAuthentication.RedirectToLoginPage();
        //}
    }
    protected void logoutBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Site_Login.aspx");
    }
    protected void settingsBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("MainPages/SettingsPages/General.aspx");
    }
}
