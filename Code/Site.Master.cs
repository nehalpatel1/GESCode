using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security;

namespace HelloGES
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        string userName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            System.Security.Principal.IPrincipal User = HttpContext.Current.User;
            userName = User.Identity.Name.ToUpper();
            //if (User.Identity.IsAuthenticated)            

            string good = BuildProductMenu(userName);

            int currentNumberOfUsers = HelloGES.Global.CurrentNumberOfUsers;
            int totalNumberOfUsers = HelloGES.Global.TotalNumberOfUsers;
            lblCurrentNumberOfUsers.Text = currentNumberOfUsers.ToString();
            lblTotalNumberOfUsers.Text = totalNumberOfUsers.ToString();

        }

        private string BuildProductMenu(string userName)
        {
            //if (userName == "ADMIN")
            //{
            //    MenuItem piMyQuip = new MenuItem("MY QUIP", "", "", "~/MyQuip.aspx");
            //    NavigationMenu.Items.;
            //}

            string returnResult = "";

            NavigationMenu.Items.Clear();

            try
            {
                MenuItem piHome = new MenuItem("Home", "", "", "~/Default.aspx");
                NavigationMenu.Items.Add(piHome);

                MenuItem piShantui = new MenuItem("Shantui", "", "", "~/Shantui.aspx");
                NavigationMenu.Items.Add(piShantui);

                MenuItem piUE = new MenuItem("Used Equipment", "", "", "~/UsedEquipment.aspx?searchtype=new&orderby=normal&direction=normal");
                NavigationMenu.Items.Add(piUE);

                MenuItem piContact = new MenuItem("Contact Us", "", "", "~/ContactUs.aspx");
                NavigationMenu.Items.Add(piContact);

                if (userName == "ADMIN")
                {
                    MenuItem piMyQuip = new MenuItem("My Quip", "", "", "~/MyQuip.aspx");
                    NavigationMenu.Items.Add(piMyQuip);
                }

                returnResult = "TRUE";
            }
            catch (Exception ex)
            {
                returnResult = "FALSE|" + ex.Message;
            }

            return returnResult;
        }            
    }
}
