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
    public partial class AddUsedEquipment_Page1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userName = "";

            if (!IsPostBack)
            {
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

                refreshMachineTypeEDS();
                refreshIndustryEDS();

                if (Request["mode"].ToString() == "edit")
                {
                    lbIndustry.SelectedValue = Request["industryID"].ToString();
                    lbMachineType.SelectedValue = Request["machineTypeID"].ToString();
                }
            }
        }

        private void refreshMachineTypeEDS()
        {
            using (GESEntities db = new GESEntities())
            {
                try
                {
                    var MachineList = (from c in db.MachineTypes where c.Status == "Active" select c).OrderBy(x => x.MachineTypeName);

                    lbMachineType.DataSource = MachineList;
                    lbMachineType.DataSourceID = "";
                    lbMachineType.DataBind();

                }
                catch (Exception ex)
                {
                }
            }
        }
        
        //private void refreshMachineTypeEDS()
        //{
        //    MachineTypeEntityDataSource.WhereParameters.Clear();
        //    MachineTypeEntityDataSource.AutoGenerateWhereClause = true;
        //    MachineTypeEntityDataSource.WhereParameters.Add("Status", TypeCode.String, "Active");

        //}

        private void refreshIndustryEDS()
        {
            using (GESEntities db = new GESEntities())
            {
                try
                {
                    var MachineList = (from c in db.Industries where c.Status == "Active" select c).OrderBy(x => x.IndustryName);

                    lbIndustry.DataSource = MachineList;
                    lbIndustry.DataSourceID = "";
                    lbIndustry.DataBind();

                }
                catch (Exception ex)
                {
                }
            }
        }
        
        //private void refreshIndustryEDS()
        //{
        //    IndustryEntityDataSource.WhereParameters.Clear();
        //    IndustryEntityDataSource.AutoGenerateWhereClause = true;
        //    IndustryEntityDataSource.WhereParameters.Add("Status", TypeCode.String, "Active");
        //}

        protected void btnAddMachine_Click(object sender, EventArgs e)
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

            //Response.Redirect("AddUsedEquipment_Page2.aspx?mode=" + Request["mode"].ToString() + "&machineID=" + machineID.ToString() + "&industryID=" + lbIndustry.SelectedValue.ToString() + "&machineTypeID=" + lbMachineType.SelectedValue.ToString());
            Response.Redirect("AddUsedEquipment_Page2.aspx?mode=" + Request["mode"].ToString() + "&machineID=" + machineID.ToString() + "&industryID=" + lbIndustry.SelectedValue.ToString() + "&machineTypeID=" + lbMachineType.SelectedValue.ToString(), false);
        }
           
        protected void btnAddMachType_Click(object sender, EventArgs e)
        {
            if (txtAddMachType.Text == "")
            {
                lblAddMachTypeError.Text = "Required";
            }
            else
            {
                using (GESEntities db = new GESEntities())
                {
                    try
                    {
                        MachineType newMachineType = new MachineType();
                        newMachineType.MachineTypeName = txtAddMachType.Text.ToString();
                        newMachineType.MachineTypeDescription = txtAddMachType.Text.ToString();
                        newMachineType.Status = "Active";


                        db.MachineTypes.AddObject(newMachineType);
                        db.SaveChanges();

                        txtAddMachType.Text = "";
                        lblAddMach.Text = "Added succesfully";

                        lblAddMachTypeError.Text = "";

                        refreshMachineTypeEDS();
                    }
                    catch (Exception exp)
                    {
                        throw new Exception("ERROR: Unable to Add entry - " + exp.Message.ToString(), exp);
                    }
                }
            }
        }

        protected void btnAddIndustry_Click(object sender, EventArgs e)
        {
            if (txtAddIndustry.Text == "")
            {
                lblAddIndustryError.Text = "Required";
            }
            else
            {
                using (GESEntities db = new GESEntities())
                {
                    try
                    {
                        Industry newIndustry = new Industry();
                        newIndustry.IndustryName = txtAddIndustry.Text.ToString();
                        newIndustry.IndustryDescription = txtAddIndustry.Text.ToString();
                        newIndustry.Status = "Active";


                        db.Industries.AddObject(newIndustry);
                        db.SaveChanges();

                        txtAddIndustry.Text = "";
                        lblAddIndustry.Text = "Added succesfully";

                        lblAddIndustryError.Text = "";

                        refreshIndustryEDS();
                    }
                    catch (Exception exp)
                    {
                        throw new Exception("ERROR: Unable to Add entry - " + exp.Message.ToString(), exp);
                    }
                }
            }
        }
    }
}
