using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HelloGES.DAL;

namespace HelloGES
{
    public partial class UsedEquipmentDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            refreshEquipmentDetail();
        }


        private void refreshEquipmentDetail()
        {
            using (GESEntities db = new GESEntities())
            {
                try
                {
                    int machineID = 0;

                    try
                    {
                        Int32.TryParse(Request["MachineID"].ToString(), out machineID);
                    }
                    catch
                    {
                        machineID = 0;
                    }

                    var MachineList = (from c in db.vUsedMachineLists where c.MachineID == machineID select c);

                    FormView_Product.DataSource = MachineList;
                    FormView_Product.DataSourceID = "";
                    FormView_Product.DataBind();

                    var machineDetail = MachineList.FirstOrDefault();

                    Page.Header.Title = machineDetail.ManufacturerName + " " + machineDetail.ModelName + " " + machineDetail.Year + " " + machineDetail.MachineTypeName + " for sale" + " " + machineDetail.Location;
                    Page.Header.Description = machineDetail.ManufacturerName + " " + machineDetail.ModelName + " " + machineDetail.Year + " " + machineDetail.MachineTypeName + " for sale" + " in " + machineDetail.Location;
                    Page.Header.Keywords = machineDetail.ManufacturerName + ", " + machineDetail.ModelName + ", " + machineDetail.Year + ", " + machineDetail.MachineTypeName + " for sale" + ", " + machineDetail.MachineTypeName + " for sale " + machineDetail.Location;
                    lblSearchResultLabel.Text = Page.Header.Title;
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to retrieve machine info - " + exp.Message.ToString(), exp);
                }
            }
        }
    }
}