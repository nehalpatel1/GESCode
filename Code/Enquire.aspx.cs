using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HelloGES.DAL;
using System.Net.Mail;
using System.Web.Configuration;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Services;
using System.IO;
using System.Net;
using System.Text;


namespace HelloGES
{
    public partial class Enquire : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                int machineID = 0;
                try
                {
                    Int32.TryParse(Request["machineID"].ToString(), out machineID);
                }
                catch
                {
                    machineID = 0;
                }

                hfMachineID.Value = machineID.ToString();
                hfBody.Value = "";

                string source = "";

                try
                {
                    source = Request["source"].ToString();

                    if (source == "used-equipment")
                    {
                        using (GESEntities db = new GESEntities())
                        {
                            try
                            {
                                var Machines = (from p in db.vUsedMachineLists where p.MachineID == machineID select p).FirstOrDefault();

                                hfBody.Value = "Machine Details" + Environment.NewLine +
                                                "---------------" + Environment.NewLine +
                                                "Machine ID : " + Machines.MachineID + Environment.NewLine +
                                                "Manufacturer : " + Machines.ManufacturerName + Environment.NewLine +
                                                "Machine Type : " + Machines.MachineTypeName + Environment.NewLine +
                                                "Model : " + Machines.ModelName + Environment.NewLine +
                                                "Description : " + Machines.MachineDescription + Environment.NewLine +
                                                "Condition : " + Machines.MachineGrade + Environment.NewLine +
                                                "Serial # : " + Machines.SerialNo + Environment.NewLine +
                                                "Year : " + Machines.Year + Environment.NewLine +
                                                "Mileage : " + Machines.Mileage + Environment.NewLine +
                                                "Location : " + Machines.Location + Environment.NewLine +
                                                "Selling Price : " + Machines.SellPrice + Environment.NewLine +
                                                "Status : " + Machines.Status + Environment.NewLine +
                                                Environment.NewLine;

                            }
                            catch (Exception exp)
                            {
                                throw new Exception("ERROR: Unable to obtain machine detail - " + exp.Message.ToString(), exp);
                            }
                        }

                        txtComments.Text = "Please contact me urgently to discuss the following machine:" + Environment.NewLine + hfBody.Value;

                    }

                    if (source == "equipment-to-sell")
                    {
                        txtComments.Text = "Thanks for clicking our banner advertisement." + Environment.NewLine + Environment.NewLine + "Either give Mark a call on 0732115904 to discuss personally or complete this enquiry page and email pictures to mark@globalearthmoving.co.za." + Environment.NewLine + Environment.NewLine + "When completing this enquiry page please provide as much information as possible i.e. Manufacturer, model, year, hours, condition, known defects/problems";
                    }

                    if (source == "grease-gun-ad")
                    {
                        txtComments.Text = "I'm interested in your Grease Gun promotion. Please contact me urgently to discuss.";
                    }

                    if (source == "roller-320d-ad")
                    {
                        txtComments.Text = "I'm interested in your 320D Roller for sale. Please contact me urgently to discuss.";
                    }

                    if (source == "140h-rim-for-sale-ad")
                    {
                        txtComments.Text = "I'm interested in your 140H Rim for sale. Please contact me urgently to discuss.";
                    }

                    if (source == "post-ad")
                    {
                        txtComments.Text = "Please contact me to discuss advertising on your site.";
                    }

                    if (source == "shantui-forklift-promo")
                    {
                        txtComments.Text = "I'm interested in your Shantui Forklift promotion. Please contact me urgently to discuss.";
                    }

                    if (source == "shantui-list-page")
                    {
                        using (GESEntities db = new GESEntities())
                        {
                            try
                            {
                                var Machines = (from p in db.Shantuis where p.ProductID == machineID select p).FirstOrDefault();

                                hfBody.Value = "Product Details" + Environment.NewLine +
                                                "---------------" + Environment.NewLine +
                                                "Product ID : " + Machines.ProductID + Environment.NewLine +
                                                "Category : " + Machines.Category + Environment.NewLine +
                                                "Model : " + Machines.Model + Environment.NewLine +
                                                Environment.NewLine;

                            }
                            catch (Exception exp)
                            {
                                throw new Exception("ERROR: Unable to obtain machine detail - " + exp.Message.ToString(), exp);
                            }
                        }

                        txtComments.Text = "Please contact me urgently to discuss the following Shantui machine:" + Environment.NewLine + Environment.NewLine + hfBody.Value;
                    }

                }
                catch
                {
                    source = "Unknown";
                }
            }
        }

        protected void btnEnquiry_Click(object sender, EventArgs e)
        {
            bool proceed = true;
            lblFirstName.Text = "";
            lblSurname.Text = "";
            lblEmailRequired.Text = "";
            lblCellNo.Text = "";

            //do normal checks
            if (txtFirstName.Text == "")
            {
                lblFirstName.Text = "Oops.... First Name please";
                proceed = false;
            }

            if (txtSurname.Text == "")
            {
                lblSurname.Text = "Oops.... Surname please";
                proceed = false;
            }

            if (txtEmail.Text == "")
            {
                lblEmailRequired.Text = "Oops.... Email Address please";
                proceed = false;
            }
            else
            {
                if (!Regex.IsMatch(txtEmail.Text, @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"))
                {
                    lblEmailRequired.Text = "Oops.... Please provide the correct email format";
                    proceed = false;
                }
            }

            if (txtCellNo.Text == "")
            {
                lblCellNo.Text = "Oops.... Cell # please";
                proceed = false;
            }
            else
            {
                if (!Regex.IsMatch(txtCellNo.Text, @"^[0-9]+$"))
                {
                    lblCellNo.Text = "Oops.... Please provide a numeric only number i.e. no spaces, hyphens, brackets, etc";
                    proceed = false;
                }
            }

            if (proceed)
            {
                btnEnquiry.Attributes.Add("onclick", "javascript:" + btnEnquiry.ClientID + ".disabled=true;" + ClientScript.GetPostBackEventReference(btnEnquiry, ""));

                int machineID = Int32.Parse(hfMachineID.Value);
                int enquiryID = 0;

                string source = "";

                try
                {
                    source = Request["source"].ToString();
                }
                catch
                {
                    source = "Unknown";
                }


                string body = "";
                string subject = "";

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
                        newUser.Comments = txtComments.Text.ToString();
                        db.Users.AddObject(newUser);
                        db.SaveChanges();

                        //------------------------------------------------------------------------+
                        //  Add New Enquiry Record                                                |
                        //------------------------------------------------------------------------+
                        Enquiry newEnquiry = new Enquiry();
                        newEnquiry.UserID = newUser.UserID;
                        newEnquiry.DateInserted = DateTime.Now;
                        newEnquiry.Comments = txtComments.Text.ToString();
                        newEnquiry.MachineID = machineID;
                        newEnquiry.Source = source;
                        db.Enquiries.AddObject(newEnquiry);
                        db.SaveChanges();

                        enquiryID = newEnquiry.EnquiryID;


                        if (source == "grease-gun-ad")
                        {
                            subject = "GES Enquiry # " + enquiryID.ToString() + " - Grease Gun Advert";
                        }
                        else if (source == "post-ad")
                        {
                            subject = "GES Enquiry # " + enquiryID.ToString() + " - Advertising Banners";
                        }
                        else if (source == "roller-320d-ad")
                        {
                            subject = "GES Enquiry # " + enquiryID.ToString() + " - 320D Roller for sale";
                        }
                        else if (source == "140h-rim-for-sale-ad")
                        {
                            subject = "GES Enquiry # " + enquiryID.ToString() + " - 140H Rim for sale";
                        }
                        else if (source == "used-equipment")
                        {
                            subject = "GES Enquiry # " + enquiryID.ToString() + " - Used Equipment page";
                        }
                        else if (source == "shantui-forklift-promo")
                        {
                            subject = "GES Enquiry # " + enquiryID.ToString() + " - Shantui Forklift Promotion page";
                        }
                        else if (source == "shantui-list-page")
                        {
                            subject = "GES Enquiry # " + enquiryID.ToString() + " - Shantui list page";
                        }
                        else if (source == "contact-us")
                        {
                            subject = "GES Enquiry # " + enquiryID.ToString() + " - Contact Us page";
                        }
                        else if (source == "equipment-to-sell")
                        {
                            subject = "GES Enquiry # " + enquiryID.ToString() + " - Equipment To Sell Banner";
                        }
                        else
                        {
                            subject = "GES Enquiry # " + enquiryID.ToString() + " - Page source unknown";
                        }
                    }
                    catch (Exception exp)
                    {
                        throw new Exception("ERROR: Unable to Submit Enquiry - " + exp.Message.ToString(), exp);
                    }
                }

                //------------------------------------------------------------------------+
                //  Send off the email notification                                       |
                //------------------------------------------------------------------------+

                //body = hfBody.Value;

                body = body +
                        "Lead Detail" + Environment.NewLine +
                        "-----------" + Environment.NewLine +
                        "Lead Source : " + source + Environment.NewLine +
                        "First Name : " + txtFirstName.Text.ToString() + Environment.NewLine +
                        "Surname : " + txtSurname.Text.ToString() + Environment.NewLine +
                        "Email : " + txtEmail.Text.ToString() + Environment.NewLine +
                        "Cell No : " + txtCellNo.Text.ToString() + Environment.NewLine +
                        "Town : " + txtTown.Text.ToString() + Environment.NewLine +
                        "Comments/Requirements : " + Environment.NewLine + Environment.NewLine + txtComments.Text.ToString();
                
                try
                {
                    string SMTPHost = WebConfigurationManager.AppSettings["SMTPHost"];
                    string SMTPUsername = WebConfigurationManager.AppSettings["SMTPUsername"];
                    string SMTPPassword = WebConfigurationManager.AppSettings["SMTPPassword"];

                    //string SMTPFrom = WebConfigurationManager.AppSettings["SMTPFrom"];
                    string SMTPFrom = txtEmail.Text.ToString();
                    string SMTPTo = WebConfigurationManager.AppSettings["SMTPTo"];
                    string SMTPCc = WebConfigurationManager.AppSettings["SMTPCc"];

#if DEBUG
                    SMTPFrom = WebConfigurationManager.AppSettings["SMTPFromTest"];
                    SMTPTo = WebConfigurationManager.AppSettings["SMTPToTest"];
                    SMTPCc = WebConfigurationManager.AppSettings["SMTPCcTest"];
#endif

                    //Send Mail
                    MailMessage mailObj = new MailMessage();
                    MailAddress from = new MailAddress(SMTPFrom, txtFirstName.Text.ToString() + " " + txtSurname.Text.ToString());
                    mailObj.From = from;
                    mailObj.Subject = subject + " | " + txtFirstName.Text.ToString() + " " + txtSurname.Text.ToString();
                    mailObj.Body = body.ToString();

                    //Get the To receipients
                    char[] separator = new char[] { ';' };

                    string[] strToSplit = SMTPTo.Split(separator);

                    foreach (string arrStr in strToSplit)
                    {
                        mailObj.To.Add(arrStr);
                    }

                    //Get the CC receipients
                    string[] strCCSplit = SMTPCc.Split(separator);

                    foreach (string arrStr in strCCSplit)
                    {
                        mailObj.CC.Add(arrStr);
                    }

                    SmtpClient SMTPServer = new SmtpClient();
                    SMTPServer.Host = SMTPHost;
                    SMTPServer.Credentials = new System.Net.NetworkCredential(SMTPUsername, SMTPPassword);
                    //SMTPServer.EnableSsl = true;
                    try
                    {
                        SMTPServer.Send(mailObj);

                        Response.Redirect("EnquiryConfirmation.aspx", false);
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.ToString();
                    }
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to send mail - " + exp.Message.ToString(), exp);
                }

                //Send lead to ZOHO
                insertZOHOLead(enquiryID.ToString(), body, subject);
             }
        }


        protected String insertZOHOLead(string enquiryID, string description, string title) 
        {
            string price = "";
            //Get machine Type and Model
            using (GESEntities db = new GESEntities())
            {
                try
                {
                    int machineID = 0;
                    try
                    {
                        Int32.TryParse(hfMachineID.Value, out machineID);
                    }
                    catch
                    {
                        machineID = 0;
                    }

                    if (machineID > 0)
                    {
                        var Machines = (from p in db.vUsedMachineLists where p.MachineID == machineID select p).FirstOrDefault();

                        title = title.ToLower();
                        title = title.Replace(" - used equipment page", "");
                        title = title + " | " + Machines.MachineTypeName + " | " + Machines.ManufacturerName + " | " + Machines.ModelName;

                        price = Machines.SellPrice.ToString();
                    }
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to obtain machine detail - " + exp.Message.ToString(), exp);
                }
            }
            
            WebRequest request = null;
            WebResponse response = null;
            string zohoResponse = "";

            try
            {
                string ZOHOApiKey = WebConfigurationManager.AppSettings["ZOHOApiKey"];
                string ZOHOUsername = WebConfigurationManager.AppSettings["ZOHOUsername"];
                string ZOHOPassword = WebConfigurationManager.AppSettings["ZOHOPassword"];
                string ZOHOTicket = getZOHOTicket("ZohoCRM", ZOHOUsername, ZOHOPassword);

                string uri = string.Format("https://crm.zoho.com/crm/private/xml/Leads/insertRecords?newFormat=1&apikey={0}&ticket={1}", ZOHOApiKey, ZOHOTicket);
                string xml =    @"xmlData=<?xml version=""1.0"" encoding=""utf-8""?>" + 
                                @"<Leads>" +
                                    @"<row no=""1"">" +
                                        @"<FL val=""Lead Owner"">Graham Reeves</FL>" +
                                        @"<FL val=""Company"">New Lead</FL>" +
                                        @"<FL val=""Title"">" + title + "</FL>" +
                                        @"<FL val=""First Name"">" + txtFirstName.Text.ToString() + "</FL>" +
                                        @"<FL val=""Last Name"">" + txtSurname.Text.ToString() + "</FL>" +
                                        @"<FL val=""Email"">"+txtEmail.Text.ToString()+"</FL>" +
                                        @"<FL val=""Mobile"">"+txtCellNo.Text.ToString()+"</FL>" +
                                        @"<FL val=""Lead Source"">GES Website</FL>" +
                                        @"<FL val=""Lead Status"">Not Contacted</FL>" +
                                        @"<FL val=""LeadSourceID"">" + enquiryID + "</FL>" +
                                        @"<FL val=""City"">"+txtTown.Text.ToString()+"</FL>" +
                                        @"<FL val=""Price Range"">" + price + "</FL>" +
                                        @"<FL val=""Description"">" + description + "</FL>" +
                                    @"</row>" +
                                @"</Leads>";

                UTF8Encoding utf8 = new UTF8Encoding(false); // false = do not output UTF8 byte order mark (BOM)
                byte[] bytes = utf8.GetBytes(xml);

                // create web request
                request = WebRequest.Create(uri);
                request.Method = "POST";
                request.ContentType = "application/x-www-form-urlencoded";
                request.ContentLength = bytes.LongLength;
                
                // write xml to request stream
                using (Stream writer = request.GetRequestStream())
                {
                    writer.Write(bytes, 0, (int)request.ContentLength);
                    writer.Flush();
                }

                // send xml and get response
                response = request.GetResponse();
                StreamReader reader = new StreamReader(response.GetResponseStream());
                zohoResponse = reader.ReadToEnd();
         
                // output results
                //Response.Write(string.Format("<h1>Zoho lead v{0}<h1><h2>Zoho request<h2><textarea>{1}</textarea><h2>Zoho response<h2><textarea>{2}</textarea>", version, xml, zohoResponse));
            }
            catch (WebException webEx)
            {
                throw webEx;
            }
            catch (Exception ex)
            {

            }
            finally
            {
                // close request and response stream
                //if (request != null) request.Close();
                //if (response != null) response.Close();
            }

            return zohoResponse;
        }

        /*-------------------------Get Ticket ---------------------------------*/
        protected static String getZOHOTicket(String serviceName, String loginId, String password) 
        {
            WebRequest request = null;
            WebResponse response = null;
            string zohoResponse = "";
            
            try
            {                
                string uri = "https://accounts.zoho.com/login?servicename="+serviceName+"&FROM_AGENT=true&LOGIN_ID="+loginId+"&PASSWORD="+password;
                string xml = "";

                UTF8Encoding utf8 = new UTF8Encoding(false); // false = do not output UTF8 byte order mark (BOM)
                byte[] bytes = utf8.GetBytes(xml);

                // create web request
                request = WebRequest.Create(uri);
                request.Method = "POST";
                request.ContentType = "application/x-www-form-urlencoded";
                request.ContentLength = bytes.LongLength;

                // send xml and get response
                response = request.GetResponse();                
                using (StreamReader sr = new StreamReader(response.GetResponseStream())) 
                {
                    while (sr.Peek() >= 0) 
                    {
                        string strLoop = sr.ReadLine();
                        if(strLoop != null && strLoop.StartsWith("TICKET")) 
                        {
                            zohoResponse = strLoop.Substring(7);
                        }
                    }
                }
            }
            catch (WebException webEx)
            {
                throw webEx;
            }
            catch (Exception ex)
            {

            }
            finally
            {
                // close request and response stream
                //if (request != null) request.GetRequestStream().Close();
                //if (response != null) response.GetResponseStream().Close();
                
            }

            return zohoResponse;
        }

        protected void btnZOHO_Click(object sender, EventArgs e)
        {
            insertZOHOLead("1", "test description", "Test Title");
        }
    }
}