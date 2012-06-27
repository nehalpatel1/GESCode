using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HelloGES.DAL;
using System.Net.Mail;

namespace HelloGES.LeadManagement.Undercarriage_Parts
{
    public partial class Undercarriage_Parts : System.Web.UI.Page
    {
        protected void btnEnquiry_Click(object sender, EventArgs e)
        {
            int enquiryID = 0;

            using (GESEntities db = new GESEntities())
            {
                try
                {
                    //Create a visitor user ID if not already logged in
                    //------------------------------------------------------------------------+
                    //  Add New User Record                                                   |
                    //------------------------------------------------------------------------+
                    User newUser = new User();
                    newUser.UserName = "Visitor-" + Guid.NewGuid().ToString();
                    newUser.Password = "123456";
                    newUser.FirstName = txtFirstName.Text.ToString();
                    newUser.LastName = txtSurname.Text.ToString();
                    newUser.Email = txtEmail.Text.ToString();
                    newUser.CellNo = txtCellNo.Text.ToString();
                    newUser.AddrCity = txtTown.Text.ToString();
                    newUser.RoleID = 1; //Visitor
                    db.Users.AddObject(newUser);
                    db.SaveChanges();

                    //------------------------------------------------------------------------+
                    //  Add New Enquiry Record                                                |
                    //------------------------------------------------------------------------+
                    Enquiry newEnquiry = new Enquiry();
                    newEnquiry.UserID = newUser.UserID;
                    newEnquiry.DateInserted = DateTime.Now;
                    newEnquiry.Comments = txtComments.Text.ToString();
                    newEnquiry.MachineID = 0;
                    db.Enquiries.AddObject(newEnquiry);
                    db.SaveChanges();

                    enquiryID = newEnquiry.EnquiryID;
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to Submit Enquiry - " + exp.Message.ToString(), exp);
                }
            }

            //------------------------------------------------------------------------+
            //  Send off the email notification                                       |
            //------------------------------------------------------------------------+
            string body = "";
            string subject = "";

            using (GESEntities db = new GESEntities())
            {
                try
                {
                    subject = "GES Website Enquiry # " + enquiryID.ToString() + " from the Undercarriage Parts Lead Page";

                    body = body +
                            "Lead Detail" + Environment.NewLine +
                            "-----------" + Environment.NewLine +
                            "First Name : " + txtFirstName.Text.ToString() + Environment.NewLine +
                            "Surname : " + txtSurname.Text.ToString() + Environment.NewLine +
                            "Email : " + txtEmail.Text.ToString() + Environment.NewLine +
                            "Cell No : " + txtCellNo.Text.ToString() + Environment.NewLine +
                            "Town : " + txtTown.Text.ToString() + Environment.NewLine +
                            "Comments/Requirements : " + txtComments.Text.ToString();

                    //Send Mail
                    MailMessage mailObj = new MailMessage("reeves.graham@gmail.com", "markreevesmk@gmail.com", subject, body);
                    mailObj.To.Add("grahamuc27@lantic.net");
                    mailObj.CC.Add("reeves.graham@gmail.com");
                    mailObj.Body = body.ToString();

                    SmtpClient SMTPServer = new SmtpClient();
                    SMTPServer.Host = "smtp.gmail.com";
                    SMTPServer.Credentials = new System.Net.NetworkCredential("reeves.graham@gmail.com", "reevesie007");
                    SMTPServer.EnableSsl = true;
                    try
                    {
                        SMTPServer.Send(mailObj);

                        Response.Redirect("~/LeadManagement/Lead-Enquiry-Confirmation.aspx", false);
                    }
                    catch (Exception ex)
                    {
                        string error = ex.ToString();
                    }
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to send mail - " + exp.Message.ToString(), exp);
                }
            }

        }
    }
}