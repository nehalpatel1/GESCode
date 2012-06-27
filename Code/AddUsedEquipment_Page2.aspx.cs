using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HelloGES.DAL;
using System.Web.Security;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace HelloGES
{
    public partial class AddUsedEquipment_Page2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                refreshManufacturerEDS();
                
                string userName = "";
                System.Security.Principal.IPrincipal User = HttpContext.Current.User;
                userName = User.Identity.Name.ToUpper();

                if (userName == "ADMIN")
                {
                    AdminSection.Visible = true;
                }
                else
                {
                    AdminSection.Visible = false;
                }
                
                
                if (Request["mode"].ToString() == "edit")
                {
                    using (GESEntities db = new GESEntities())
                    {
                        try
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

                            //show machine data
                            var getmachineRow = (from p in db.Machines where p.MachineID == machineID select p).FirstOrDefault();

                            if (getmachineRow != null)
                            {
                                lbManufacturer.SelectedValue = getmachineRow.ManufacturerID.Value.ToString();
                                tbModel.Text = getmachineRow.ModelName.ToString();
                                txtMachineDescription.Text = getmachineRow.MachineDescription;
                                txtMachineGrade.Text = getmachineRow.MachineGrade;
                                txtSerial.Text = getmachineRow.SerialNo;
                                txtYear.Text = getmachineRow.Year;
                                txtMileage.Text = getmachineRow.Mileage;
                                txtLocation.Text = getmachineRow.Location;
                                txtContactPerson.Text = getmachineRow.ContactPerson;
                                txtEmailAddress.Text = getmachineRow.EmailAddress;
                                txtContactNumber.Text = getmachineRow.ContactNumber;
                                txtCostPrice.Text = getmachineRow.CostPrice.ToString();
                                txtSalesPrice.Text = getmachineRow.SellPrice.ToString();
                                listStatus.SelectedValue = getmachineRow.Status.ToString();
                            }

                        }
                        catch (Exception exp)
                        {
                            if (exp.Message == "")
                            {
                                throw new Exception("ERROR: Unable to Submit Enquiry - " + exp.InnerException.ToString(), exp);
                            }
                            else
                            {
                                throw new Exception("ERROR: Unable to Submit Enquiry - " + exp.Message.ToString(), exp);
                            }
                        }
                    }
                }
            }
        }

        private void refreshManufacturerEDS()
        {
            using (GESEntities db = new GESEntities())
            {
                try
                {
                    var MachineList = (from c in db.Manufacturers where c.Status == "Active" select c).OrderBy(x => x.ManufacturerName);

                    lbManufacturer.DataSource = MachineList;
                    lbManufacturer.DataSourceID = "";
                    lbManufacturer.DataBind();

                }
                catch (Exception ex)
                {
                }
            }
        }
        
        //private void refreshManufacturerEDS()
        //{
        //    ManufacturerEntityDataSource.WhereParameters.Clear();
        //    ManufacturerEntityDataSource.AutoGenerateWhereClause = true;
        //    ManufacturerEntityDataSource.WhereParameters.Add("Status", TypeCode.String, "Active");
        //}


        protected void btnAddMachine_Click(object sender, EventArgs e)
        {
            string userName = "";
            System.Security.Principal.IPrincipal User = HttpContext.Current.User;
            userName = User.Identity.Name.ToUpper();

            if (userName == "DEMO")
            {
                string newMachineID = "0";
                string mode = Request["mode"].ToString();
                string industryID = Request["industryID"].ToString();
                string machineTypeID = Request["machineTypeID"].ToString();

                Response.Redirect("AddUsedEquipment_Page3.aspx?mode=" + mode + "&machineID=" + newMachineID + "&industryID=" + industryID + "&machineTypeID=" + machineTypeID + "&Model=" + tbModel.Text.Replace(" ", "-") + "&ManufacturerID=" + lbManufacturer.SelectedItem.Value + "&uploadMethod=arigma", false);
            }
            else
            {

                using (GESEntities db = new GESEntities())
                {
                    try
                    {
                        if (Request["mode"].ToString() == "new")
                        {
                            Machine newMachine = new Machine();
                            newMachine.ManufacturerID = Int32.Parse(lbManufacturer.SelectedItem.Value);
                            newMachine.MachineTypeID = Int32.Parse(Request["machineTypeID"].ToString());
                            newMachine.ModelName = tbModel.Text;
                            newMachine.IndustryID = Int32.Parse(Request["industryID"].ToString());
                            newMachine.MachineDescription = txtMachineDescription.Text.ToString();
                            newMachine.MachineGrade = txtMachineGrade.Text.ToString();
                            newMachine.SerialNo = txtSerial.Text.ToString();
                            newMachine.Year = txtYear.Text.ToString();
                            newMachine.Mileage = txtMileage.Text.ToString();
                            newMachine.Location = txtLocation.Text.ToString();
                            newMachine.ContactPerson = txtContactPerson.Text.ToString();
                            newMachine.EmailAddress = txtEmailAddress.Text.ToString();
                            newMachine.ContactNumber = txtContactNumber.Text.ToString();
                            newMachine.CostPrice = ConvertStringDecimal(txtCostPrice.Text.ToString());
                            newMachine.SellPrice = ConvertStringDecimal(txtSalesPrice.Text.ToString());
                            newMachine.Status = listStatus.SelectedItem.Value;
                            newMachine.DealerMachine = "N";
                            newMachine.DateInserted = DateTime.Now;

                            db.Machines.AddObject(newMachine);
                            db.SaveChanges();

                            string newMachineID = newMachine.MachineID.ToString();
                            string mode = Request["mode"].ToString();
                            string industryID = Request["industryID"].ToString();
                            string machineTypeID = Request["machineTypeID"].ToString();

                            Response.Redirect("AddUsedEquipment_Page3.aspx?mode=" + mode + "&machineID=" + newMachineID + "&industryID=" + industryID + "&machineTypeID=" + machineTypeID + "&Model=" + tbModel.Text.Replace(" ", "-") + "&ManufacturerID=" + lbManufacturer.SelectedItem.Value + "&uploadMethod=arigma", false);
                        }
                        else
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

                            var editMachine = (from c in db.Machines where c.MachineID == machineID select c).FirstOrDefault();
                            if (editMachine != null)
                            {
                                editMachine.ManufacturerID = Int32.Parse(lbManufacturer.SelectedItem.Value);
                                editMachine.MachineTypeID = Int32.Parse(Request["machineTypeID"].ToString());
                                editMachine.ModelName = tbModel.Text;
                                editMachine.IndustryID = Int32.Parse(Request["industryID"].ToString());
                                editMachine.MachineDescription = txtMachineDescription.Text.ToString();
                                editMachine.MachineGrade = txtMachineGrade.Text.ToString();
                                editMachine.SerialNo = txtSerial.Text.ToString();
                                editMachine.Year = txtYear.Text.ToString();
                                editMachine.Mileage = txtMileage.Text.ToString();
                                editMachine.Location = txtLocation.Text.ToString();
                                editMachine.CostPrice = ConvertStringDecimal(txtCostPrice.Text.ToString());
                                editMachine.SellPrice = ConvertStringDecimal(txtSalesPrice.Text.ToString());
                                editMachine.Status = listStatus.SelectedItem.Value;
                                editMachine.DealerMachine = "N";
                                editMachine.DateInserted = DateTime.Now;

                                db.SaveChanges();
                                Response.Redirect("AddUsedEquipment_Page3.aspx?mode=" + Request["mode"].ToString() + "&machineID=" + Request["machineID"].ToString() + "&industryID=" + Request["industryID"].ToString() + "&machineTypeID=" + Request["machineTypeID"].ToString() + "&Model=" + tbModel.Text.Replace(" ", "-") + "&ManufacturerID=" + lbManufacturer.SelectedItem.Value + "&uploadMethod=arigma", false);
                            }
                        }
                    }
                    catch (Exception exp)
                    {
                        if (exp.Message.Contains("inner exception"))
                        {
                            lblStatus.Text = "ERROR: Unable to add/edit used equipment- " + exp.InnerException.ToString();
                        }
                        else
                        {
                            lblStatus.Text = "ERROR: Unable to add/edit used equipment- " + exp.Message.ToString();
                        }
                    }
                }
            }
        }
           
        protected void btnAddManu_Click(object sender, EventArgs e)
        {
            if (txtAddManu.Text == "")
            {
                lblAddManuError.Text = "Required";
            }
            else
            {
                using (GESEntities db = new GESEntities())
                {
                    try
                    {
                        Manufacturer newManufacturer = new Manufacturer();
                        newManufacturer.ManufacturerName = txtAddManu.Text.ToString();
                        newManufacturer.ManufacturerDescription = txtAddManu.Text.ToString();
                        newManufacturer.Status = "Active";


                        db.Manufacturers.AddObject(newManufacturer);
                        db.SaveChanges();

                        txtAddManu.Text = "";
                        lblAddManu.Text = "Added succesfully";

                        lblAddManuError.Text = "";
                    }
                    catch (Exception exp)
                    {
                        throw new Exception("ERROR: Unable to Add entry - " + exp.Message.ToString(), exp);
                    }
                }
            }
        }

        public Decimal ConvertStringDecimal(string stringVal) 
        {
			decimal decimalVal = 0;
			
			try {
				decimalVal = System.Convert.ToDecimal(stringVal);
				System.Console.WriteLine(
					"The string as a decimal is {0}.", decimalVal);
			} 
			catch (System.OverflowException){
				System.Console.WriteLine(
					"The conversion from string to decimal overflowed.");
			}
			catch (System.FormatException) {
				System.Console.WriteLine(
					"The string is not formatted as a decimal.");
			}
			catch (System.ArgumentNullException) {
				System.Console.WriteLine(
					"The string is null.");
			}

            return decimalVal;
		}

    }
}
