using System;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Pomelo.EntityFrameworkCore.MySql;
using infofetcher.Models;

namespace infofetcher
{public class Startup
    {
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<mathieu_h_appContext>(options => 
                options.UseMySql("server=codeboxx.cq6zrczewpu2.us-east-1.rds.amazonaws.com;port=3306;database=mathieu_h_app;user=codeboxx;password=Codeboxx1!"));
            services.AddMvc()
                    .SetCompatibilityVersion(CompatibilityVersion.Version_2_1);
        }

        public void Configure(IApplicationBuilder app)
        {
            app.UseMvc();
        }
    }
}
