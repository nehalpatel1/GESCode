using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using HelloGES.DAL;

namespace HelloGES.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            string userName = "";
            string password = "";

            if (txtUserName.Text.ToString().ToUpper() == "ADMIN")
            {
                userName = "ADMIN";
                password = "Gl0b@l";
            }
            //else if (txtUserName.Text.ToString().ToUpper() == "DEMO")
            //{
            //    userName = "DEMO";
            //    password = "demo";
            //}
            else
            {
                using (GESEntities db = new GESEntities())
                {
                    try
                    {
                        string tmpUserName = txtUserName.Text.ToString().ToUpper();

                        var editUser = (from c in db.Users where c.UserName.ToUpper() == tmpUserName select c).FirstOrDefault();

                        if (editUser != null)
                        {
                            userName = editUser.UserName;
                            password = editUser.Password;
                        }
                    }
                    catch (Exception exp)
                    {
                        throw new Exception("ERROR: Unable to read from User table - " + exp.Message.ToString(), exp);
                    }
                }
            }

            bool userNameValid = string.Compare(txtUserName.Text.ToString().ToUpper(), userName, true) == 0;
            bool passwordValid = string.Compare(txtPassword.Text.ToString(), password, false) == 0;

            if (userNameValid && passwordValid)
            {
                //Update User table
                if (txtUserName.Text.ToString().ToUpper() != "ADMIN")
                {
                    using (GESEntities db = new GESEntities())
                    {
                        try
                        {
                            var editUser = (from c in db.Users where c.Email == userName select c).FirstOrDefault();
                            if (editUser != null)
                            {
                                editUser.LatestLoggedInDate = DateTime.Now;
                                editUser.NumberOfLogins = editUser.NumberOfLogins + 1;

                                db.SaveChanges();
                            }
                        }
                        catch (Exception exp)
                        {
                            throw new Exception("ERROR: Unable to update user Table - " + exp.Message.ToString(), exp);
                        }
                    }
                }

                FormsAuthentication.RedirectFromLoginPage(userName, false);
            }
            else 
            {
                lblError.Text = "Email / Password combination incorrect";
            }
        }
    }
}
