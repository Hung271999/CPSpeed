using Microsoft.Owin;
using Microsoft.Owin.Security.Cookies;
using Owin;
using System;

[assembly: OwinStartupAttribute(typeof(CPSeed.Startup))]
namespace CPSeed
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            var sessionTimeout = 20; // 

            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                ExpireTimeSpan = TimeSpan.FromSeconds(30),
            });
        }
    }
}
