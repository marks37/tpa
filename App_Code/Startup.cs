using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TPA.Startup))]
namespace TPA
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
