using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HelloGES.DAL;

namespace HelloGES
{
    public partial class UsedEquipment : System.Web.UI.Page
    {
        string userName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            System.Security.Principal.IPrincipal User = HttpContext.Current.User;
            userName = User.Identity.Name.ToUpper(); 

            if (string.Compare(userName, "ADMIN", true) == 0)
            {
                lblStatus.Visible = true;
                listStatus.Visible = true;
                btnViewList.Visible = true;
            }
            else
            {
                lblStatus.Visible = false;
                listStatus.Visible = false;
                btnViewList.Visible = false;
            }

            lblModel.Visible = false;
            listModel.Visible = false;

            lblYear.Visible = false;
            listYear.Visible = false;

            lblManufacturer.Visible = false;
            listManufacturer.Visible = false;

            btnSearch.Visible = false;

            if (!IsPostBack)
            {
                hfUEManufacturer.Value = "0";
                hfUEMachineType.Value = "0";
                hfUEModel.Value = "0";

                string searchType = "";
                string orderBy = "";
                string direction = "";
                int machineTypeID = 0;

                try
                {
                    searchType = Request["searchtype"].ToString();
                }
                catch
                {
                    searchType = "";
                }

                try
                {
                    orderBy = Request["orderby"].ToString();
                }
                catch
                {
                    orderBy = "";
                }

                try
                {
                    direction = Request["direction"].ToString();
                }
                catch
                {
                    direction = "";
                }

                try
                {
                    Int32.TryParse(Request["machinetypeid"].ToString(), out machineTypeID);
                }
                catch
                {
                    machineTypeID = 0;
                }

                refreshUsedEquipmentListEDS(searchType, orderBy, direction, machineTypeID);
                refreshMachineTypeEDS();
                //refreshManufacturerEDS();

                //SearchResultBar.Visible = false;
                //lvEquipmentList.Visible = false;
            }
        }

        private void refreshUsedEquipmentListEDS(string refreshType, string orderBy, string direction, int machineTypeID)
        {
            using (GESEntities db = new GESEntities())
            {
                try
                {
                    string status = listStatus.SelectedValue;

                    if (refreshType != "new")
                    {
                        if (machineTypeID != 0)
                        {
                            var MachineList = (from c in db.vUsedMachineLists where c.Status == status && c.MachineTypeID == machineTypeID select c).OrderByDescending(x => x.DateInserted);

                            if (orderBy != "normal")
                            {
                                switch (orderBy)
                                {
                                    case "year":
                                        if (direction == "desc")
                                        {
                                            MachineList = MachineList.OrderByDescending(x => x.Year);
                                        }
                                        else
                                        {
                                            MachineList = MachineList.OrderBy(x => x.Year);
                                        }
                                        break;
                                    case "manufacturername":
                                        if (direction == "desc")
                                        {
                                            MachineList = MachineList.OrderByDescending(x => x.ManufacturerName);
                                        }
                                        else
                                        {
                                            MachineList = MachineList.OrderBy(x => x.ManufacturerName);
                                        }
                                        break;
                                    case "model":
                                        if (direction == "desc")
                                        {
                                            MachineList = MachineList.OrderByDescending(x => x.ModelName);
                                        }
                                        else
                                        {
                                            MachineList = MachineList.OrderBy(x => x.ModelName);
                                        }
                                        break;
                                    case "machinetypename":
                                        if (direction == "desc")
                                        {
                                            MachineList = MachineList.OrderByDescending(x => x.MachineTypeName);
                                        }
                                        else
                                        {
                                            MachineList = MachineList.OrderBy(x => x.MachineTypeName);
                                        }
                                        break;
                                    case "sellprice":
                                        if (direction == "desc")
                                        {
                                            MachineList = MachineList.OrderByDescending(x => x.SellPrice);
                                        }
                                        else
                                        {
                                            MachineList = MachineList.OrderBy(x => x.SellPrice);
                                        }
                                        break;
                                }
                            }

                            var machineDetail = MachineList.FirstOrDefault();

                            lblSearchResultLabel.Text = "Used " + machineDetail.MachineTypeName + " For Sale";

                            Page.Header.Title = lblSearchResultLabel.Text;
                            Page.Header.Description = lblSearchResultLabel.Text;
                            Page.Header.Keywords = lblSearchResultLabel.Text;

                            lvEquipmentList.DataSource = MachineList;
                            lvEquipmentList.DataSourceID = "";
                            lvEquipmentList.DataBind();
                        }
                    }
                    else
                    {
                        var MachineList = (from c in db.vUsedMachineLists where c.Status == status select c).OrderByDescending(x => x.DateInserted).Take(10);

                        if (orderBy != "normal")
                        {
                            switch (orderBy)
                            {
                                case "year":
                                    if (direction == "desc")
                                    {
                                        MachineList = MachineList.OrderByDescending(x => x.Year);
                                    }
                                    else
                                    {
                                        MachineList = MachineList.OrderBy(x => x.Year);
                                    }
                                    break;
                                case "manufacturername":
                                    if (direction == "desc")
                                    {
                                        MachineList = MachineList.OrderByDescending(x => x.ManufacturerName);
                                    }
                                    else
                                    {
                                        MachineList = MachineList.OrderBy(x => x.ManufacturerName);
                                    }
                                    break;
                                case "model":
                                    if (direction == "desc")
                                    {
                                        MachineList = MachineList.OrderByDescending(x => x.ModelName);
                                    }
                                    else
                                    {
                                        MachineList = MachineList.OrderBy(x => x.ModelName);
                                    }
                                    break;
                                case "machinetypename":
                                    if (direction == "desc")
                                    {
                                        MachineList = MachineList.OrderByDescending(x => x.MachineTypeName);
                                    }
                                    else
                                    {
                                        MachineList = MachineList.OrderBy(x => x.MachineTypeName);
                                    }
                                    break;
                                case "sellprice":
                                    if (direction == "desc")
                                    {
                                        MachineList = MachineList.OrderByDescending(x => x.SellPrice);
                                    }
                                    else
                                    {
                                        MachineList = MachineList.OrderBy(x => x.SellPrice);
                                    }
                                    break;
                            }
                        }

                        lblSearchResultLabel.Text = "Used Equipment For Sale - Top 10 Recently Added";

                        Page.Header.Title = lblSearchResultLabel.Text;
                        Page.Header.Description = "South Africa's favourite marketplace for buying, selling and hiring new and used machinery and transportation equipment specialising in the areas of construction, agriculture, material handing, groundscare and forestry.";
                        Page.Header.Keywords = "Equipment, Plant hire, Plant for hire,  Global Earthmoving Solutions, Earthmoving, TLB, FEL, "+
                                                "front end loader, motor grader, grader, excavators, equipment rental, forklift hire, construction plant, hire services, "+
                                                "plant hire companies, plant hire rates, mini diggers, trench digger, plant hire south africa, mini digger, plant services, "+
                                                "plant hire gauteng, plant and tool hire, atlas plant hire, mcc plant hire, plant hire cape town, construction plant hire, "+
                                                "plant hire durban, small plant hire, roller hire, sandton plant hire, plant hire pretoria, digger hire, "+
                                                "komatsu, bulldozers, bulldozer, dozer, backhoe, heavy machinery,"+
                                                "excavator, road roller, tlb for sale, used machinery, used equipment, farm equipment, loaders, diggers, plant machinery, "+
                                                "used tractors, used crane, used excavator, used loader, used backhoe loader, used telescopic handler, used forklift truck, "+
                                                "used container handler, Used Plant and Equipments, Used Plant & Equipment, new and used Plant Equipment prices, "+
                                                "New Plant & Equipments, New Plant & Equipment , Used Plant & Equipment classifieds, Plant & Equipment reviews, "+
                                                "buy a Plant & Equipment , sell a Plant & Equipment , Sell my Plant & Equipment , Plant & Equipment classifieds, "+
                                                "Plant & Equipments for sale, Plant & Equipment parts and accessories, shantui, jcb, volvo, bell";

                        lvEquipmentList.DataSource = MachineList;
                        lvEquipmentList.DataSourceID = "";
                        lvEquipmentList.DataBind();

                    }
                }
                catch (Exception ex)
                {
                }
            }


            //if (refreshType != "New")
            //{
            //    lblSearchResultLabel.Text = "Search Results";
            //    if ((hfUEMachineType.Value != "0") & (hfUEMachineType.Value != ""))
            //    {
            //        UsedEquipmentListEntityDataSource.WhereParameters.Add("MachineTypeID", TypeCode.Int32, hfUEMachineType.Value);
            //    }
            //}
            //else
            //{
            //    Top 10
            //    DateInserted DESC

            //    lblSearchResultLabel.Text = "Top 10 Recently Added Machines";
            //}


            
            //UsedEquipmentListEntityDataSource.WhereParameters.Clear();
            //UsedEquipmentListEntityDataSource.AutoGenerateWhereClause = true;

            //if (refreshType != "New")
            //{
            //    lblSearchResultLabel.Text = "Search Results";
            //    if ((hfUEMachineType.Value != "0") & (hfUEMachineType.Value != ""))
            //    {
            //        UsedEquipmentListEntityDataSource.Select = "it.MachineID, it.MachineGrade, it.SerialNo, it.Year, it.Mileage, it.Location," +
            //                                                    "it.SellPrice, it.Status, it.MachineTypeName, it.IndustryName, it.ModelName, " +
            //                                                    "it.ManufacturerName, it.PhotoUrl, it.MachineDescription, it.MachineTypeID, " +
            //                                                    "it.ModelID, it.ManufacturerID, it.IndustryID, it.DateInserted";
            //        UsedEquipmentListEntityDataSource.WhereParameters.Add("MachineTypeID", TypeCode.Int32, hfUEMachineType.Value);
            //    }

            //    //if ((hfUEManufacturer.Value != "0") & (hfUEManufacturer.Value != ""))
            //    //{
            //    //    UsedEquipmentListEntityDataSource.WhereParameters.Add("ManufacturerID", TypeCode.Int32, hfUEManufacturer.Value);
            //    //}

            //    //if ((hfUEModel.Value != "0") & (hfUEModel.Value != ""))
            //    //{
            //    //    UsedEquipmentListEntityDataSource.WhereParameters.Add("ModelID", TypeCode.Int32, hfUEModel.Value);
            //    //}
            //}
            //else
            //{
            //    //UsedEquipmentListEntityDataSource.WhereParameters.Add("MachineTypeID", TypeCode.Int32, "0");
            //    UsedEquipmentListEntityDataSource.Select = "TOP(10) it.MachineID, it.MachineGrade, it.SerialNo, it.Year, it.Mileage, it.Location," +
            //                                                        "it.SellPrice, it.Status, it.MachineTypeName, it.IndustryName, it.ModelName, " +
            //                                                        "it.ManufacturerName, it.PhotoUrl, it.MachineDescription, it.MachineTypeID, " +
            //                                                        "it.ModelID, it.ManufacturerID, it.IndustryID, it.DateInserted";
            //    lblSearchResultLabel.Text = "Top 10 Recently Added Machines";
            //}

            //UsedEquipmentListEntityDataSource.WhereParameters.Add("Status", TypeCode.String, listStatus.SelectedValue);
        }
        
        private void refreshModelEDS()
        {
            ModelEntityDataSource.WhereParameters.Clear();
            ModelEntityDataSource.AutoGenerateWhereClause = true;
            ModelEntityDataSource.WhereParameters.Add("ManufacturerID", TypeCode.Int32, hfUEManufacturer.Value);
            ModelEntityDataSource.WhereParameters.Add("MachineTypeID", TypeCode.Int32, hfUEMachineType.Value);
        }

        private void refreshMachineTypeEDS()
        {
            using (GESEntities db = new GESEntities())
            {
                try
                {
                    var MachineList = (from c in db.vMachineTypeCounts select c).OrderBy(x => x.MachineTypeID);

                    listMachineType.DataSource = MachineList;
                    listMachineType.DataSourceID = "";
                    listMachineType.DataBind();

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

        private void refreshManufacturerEDS()
        {
            ManufacturerEntityDataSource.WhereParameters.Clear();
            ManufacturerEntityDataSource.AutoGenerateWhereClause = true;
            if (hfUEManufacturer.Value != "0")
            {
                ManufacturerEntityDataSource.WhereParameters.Add("ManufacturerID", TypeCode.Int32, hfUEManufacturer.Value);
            }
            else 
            {
                ManufacturerEntityDataSource.WhereParameters.Add("ManufacturerID", TypeCode.Int32, "0");
            }
            //if (hfUEMachineType.Value != "0")
            //{
            //    ManufacturerEntityDataSource.WhereParameters.Add("MachineTypeID", TypeCode.Int32, hfUEMachineType.Value);
            //}

            //if ((hfUEManufacturer.Value == "0") && (hfUEMachineType.Value == "0"))
            //{
            //    ManufacturerEntityDataSource.WhereParameters.Add("ManufacturerID", TypeCode.Int32, "0");
            //}

            ManufacturerEntityDataSource.WhereParameters.Add("Status", TypeCode.String, "Active");
        }

        protected void listMachineType_DataBound(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    listMachineType.Items.Add("Please select...");
            //    listMachineType.Items.Insert(0, listMachineType.Items.FindByText("Please select..."));
            //    //listMachineType.SelectedIndex = 0;
            //    //listMachineType.SelectedValue = "0";
            //    hfUEMachineType.Value = "0";
            //}

            //refreshModelEDS();

            //if ((hfUEMachineType.Value != "0") & (hfUEMachineType.Value != ""))
            //{
            //    listMachineType.SelectedValue = hfUEMachineType.Value;
            //}

            int machineTypeID = 0;

            try
            {
                Int32.TryParse(Request["machinetypeid"].ToString(), out machineTypeID);
            }
            catch
            {
                machineTypeID = 0;
            }

            if (machineTypeID != 0)
            {
                listMachineType.SelectedValue = machineTypeID.ToString();
            }        
        }

        protected void listManufacturer_DataBound(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    listManufacturer.Items.Add("Please select...");
            //    listManufacturer.Items.Insert(0, listManufacturer.Items.FindByText("Please select..."));
            //    listManufacturer.SelectedIndex = 0;
            //}

            if ((hfUEManufacturer.Value != "0") & (hfUEManufacturer.Value != ""))
            {
                listManufacturer.SelectedValue = hfUEManufacturer.Value;
            }

        }

        protected void listModel_DataBound(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    listModel.Items.Add("All...");
            //    listModel.Items.Insert(0, listModel.Items.FindByText("All..."));
            //    listModel.SelectedIndex = 0;
            //}

            if ((hfUEModel.Value != "0") & (hfUEModel.Value != ""))
            {
                listModel.SelectedValue = hfUEModel.Value;
            }
        }

        protected void listYear_DataBound(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    listYear.Items.Add("All...");
            //    listYear.Items.Insert(0, listYear.Items.FindByText("All..."));
            //    listYear.SelectedIndex = 0;
            //}
        }

        protected void listManufacturer_SelectedIndexChanged(object sender, EventArgs e)
        {
            hfUEManufacturer.Value = listManufacturer.SelectedValue;
            hfUEModel.Value = listModel.SelectedValue;
            
            //refreshModelEDS();

            //refreshUsedEquipmentListEDS("Refresh");
        }

        protected void listMachineType_SelectedIndexChanged(object sender, EventArgs e)
        {
            hfUEMachineType.Value = listMachineType.SelectedValue;
            hfUEManufacturer.Value = "0";//listManufacturer.SelectedValue;
            hfUEModel.Value = "0"; //listModel.SelectedValue;

            //refreshManufacturerEDS();

            //refreshModelEDS();
            SearchResultBar.Visible = true;
            lvEquipmentList.Visible = true;

            //refreshUsedEquipmentListEDS("Refresh");

            Response.Redirect("UsedEquipment.aspx?searchtype=refresh&orderby=normal&direction=normal&machinetypeid=" + hfUEMachineType.Value, false);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
        }

        protected void lvEquipmentList_ItemCreated(object sender, ListViewItemEventArgs e)
        {
            try
            {
                HyperLink tempHyper = (HyperLink)e.Item.FindControl("editHyperLink");

                //check if admin logged in
                if (string.Compare(userName, "ADMIN", true) == 0)
                    tempHyper.Visible = true;
                else
                    tempHyper.Visible = false;

            }
            catch 
            {
            }
        }

        protected void btnViewList_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReportViewer.aspx");
        }

        protected void listStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            hfUEMachineType.Value = listMachineType.SelectedValue;
            hfUEManufacturer.Value = "0";//listManufacturer.SelectedValue;
            hfUEModel.Value = "0"; //listModel.SelectedValue;

            //refreshManufacturerEDS();

            //refreshModelEDS();
            SearchResultBar.Visible = true;
            lvEquipmentList.Visible = true;

            //refreshUsedEquipmentListEDS("Refresh");

            Response.Redirect("UsedEquipment.aspx?searchtype=refresh&orderby=normal&direction=normal&machinetypeid=" + hfUEMachineType.Value, false);
        }
    }
}