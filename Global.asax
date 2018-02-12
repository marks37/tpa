<%@ Application Language="C#" %>
<%@ Import Namespace="TPA" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        RouteConfig.RegisterRoutes(RouteTable.Routes);
        BundleConfig.RegisterBundles(BundleTable.Bundles);
    }

    void Session_Start(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            //Response.Redirect("~/Site_Login.aspx?session=expired");                    
        }
    }
    
</script>
