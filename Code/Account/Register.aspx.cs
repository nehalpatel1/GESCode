using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using HelloGES.DAL;
using System.Net.Mail;

namespace HelloGES.Account
{
    public partial class Register : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
        }

        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {
            //FormsAuthentication.SetAuthCookie(RegisterUser.UserName, false /* createPersistentCookie */);

            //string continueUrl = RegisterUser.ContinueDestinationPageUrl;
            //if (String.IsNullOrEmpty(continueUrl))
            //{
            //    continueUrl = "~/";
            //}
            //Response.Redirect(continueUrl);
        }

        protected void CreateUserButton_Click(object sender, EventArgs e)
        {
            lblError.Text = "";

            using (GESEntities db = new GESEntities())
            {
                try
                {
                    //Check that email doesn't exist
                    var getUser = (from c in db.Users where c.Email == Email.Text.ToString() select c).FirstOrDefault();

                    if (getUser != null)
                    {
                        lblError.Text = "This Email address has already been registered";
                    }
                    else
                    {

                        //Register user 
                        User newUser = new User();
                        newUser.UserName = Guid.NewGuid().ToString();
                        newUser.Password = Password.Text.ToString();
                        newUser.Email = Email.Text.ToString();
                        //newUser.FirstName = txtFirstName.Text.ToString();
                        //newUser.LastName = txtSurname.Text.ToString();
                        //newUser.CellNo = txtCellNo.Text.ToString();
                        //newUser.AddrCity = txtTown.Text.ToString();
                        newUser.RoleID = 2;
                        db.Users.AddObject(newUser);
                        db.SaveChanges();

                        //Send Welcome Email
                        SendWelcomeMail(Email.Text.ToString());

                        Response.Redirect("~/MyQuip.aspx");
                    }
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to register New User - " + exp.Message.ToString(), exp);
                }
            }
        }

        private void SendWelcomeMail(string Email)
        {
            string body = "";
            string subject = "";


            subject = "Global Earthmoving Solutions - Successful Website Registraion";

            body = "Welcome " + Email + "," + 
                    Environment.NewLine +
                    Environment.NewLine +
                    "Your account has now been opened and you are free to load machines. " + 
                    Environment.NewLine +
                    Environment.NewLine +
                    "Regards," +
                    Environment.NewLine +
                    "Global Earthmoving Solutions Team.";

            //Send Mail
            MailMessage mailObj = new MailMessage("postmaster@globalearthmoving.co.za", Email, subject, body);
            mailObj.Bcc.Add("mark@globalearthmoving.com");
            mailObj.Body = body.ToString();

            SmtpClient SMTPServer = new SmtpClient();
            SMTPServer.Host = "mail.globalearthmoving.co.za";
            SMTPServer.Credentials = new System.Net.NetworkCredential("postmaster", "@dmin123");
            SMTPServer.EnableSsl = true;
            try
            {
                SMTPServer.Send(mailObj);
            }
            catch (Exception ex)
            {
                //Label1.Text = ex.ToString();
            }
        }
    }
}
