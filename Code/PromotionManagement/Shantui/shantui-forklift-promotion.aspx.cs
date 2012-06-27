using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Configuration;

namespace HelloGES.PromotionManagement.Shantui
{
    public partial class shantui_forklift_promotion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Response.Redirect("../../Enquire.aspx?machineID=0&source=shantui-forklift-promo", false);
        }

        protected void imgSpecSheet_Click(object sender, ImageClickEventArgs e)
        {
            string path = MapPath(imgSpecSheet.CommandArgument);
            string name = Path.GetFileName(path);
            //string ext = Path.GetExtension(path);

            // set known types based on file extension  
            Response.AppendHeader("content-disposition", "attachment; filename=" + name);
            Response.ContentType = "Application/pdf";
            Response.WriteFile(path);
            Response.End();
        }
    }
}