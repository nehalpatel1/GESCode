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
    public partial class AddUsedEquipment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    listManufacturer.Items.Insert(0, new ListItem("--Please select a value--", "-1", true));
            //    listMachineType.Items.Insert(0, new ListItem("--Please select a value--"));
            //    listModel.Items.Insert(-1, new ListItem("--Please select a value--", "-1"));
            //    listIndustry.Items.Insert(-1, new ListItem("--Please select a value--", "-1"));
            //}
            //else
            //{
            //    listManufacturer.AppendDataBoundItems = false;
            //    listMachineType.AppendDataBoundItems = false;
            //    listModel.AppendDataBoundItems = false;
            //    listIndustry.AppendDataBoundItems = false;
            //}

            string mode = "";
            try 
            {
                mode = Request["mode"].ToString();
            }
            catch 
            {
                mode = "new";
            }
            
            if (mode == "edit")
            {
                using (GESEntities db = new GESEntities())
                {
                    try
                    {
                        if (lblMachineID.Text == "")
                        {
                            int MachineID = 0;
                            Int32.TryParse(Request["MachineID"].ToString(), out MachineID);

                            //show machine data
                            var getmachineRow = (from p in db.Machines where p.MachineID == MachineID select p).FirstOrDefault();

                            if (getmachineRow != null)
                            {
                                lblMachineID.Text = getmachineRow.MachineID.ToString();


                                hfManufacturer.Value = getmachineRow.ManufacturerID.Value.ToString();
                                hfMachineType.Value = getmachineRow.MachineTypeID.ToString();
                                hfModel.Value = getmachineRow.ModelID.ToString();
                                hfIndustry.Value = getmachineRow.IndustryID.Value.ToString();
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
                                hfStatus.Value = getmachineRow.Status.ToString();


                                //Show panels and refresh grid
                                panelUpload.Visible = true;
                                gridPhotos.Visible = true;

                                //Show panels and refresh grid
                                gridSpecs.Visible = true;

                                //Refresh Photos grid
                                PhotosEntityDataSource.WhereParameters.Clear();
                                PhotosEntityDataSource.AutoGenerateWhereClause = true;
                                PhotosEntityDataSource.WhereParameters.Add("MachineID", TypeCode.Int32, MachineID.ToString());
                            }

                            btnAddMachine.Visible = false;
                            btnUpdateMachine.Visible = true;
                            btnAddAnother.Visible = true;
                        }
                    }
                    catch (Exception exp)
                    {
                        throw new Exception("ERROR: Unable to Submit Enquiry - " + exp.Message.ToString(), exp);
                    }
                }
            }
            else
            {
                if (!IsPostBack)
                {
                    hfManufacturer.Value = "0";
                    hfMachineType.Value = "0";
                    hfModel.Value = "0";
                    hfStatus.Value = "0";

                    btnAddMachine.Visible = true;
                    btnUpdateMachine.Visible = false;
                    btnAddAnother.Visible = false;
                }
            }
        }
        
        protected void listManufacturer_SelectedIndexChanged(object sender, EventArgs e)
        {
            hfManufacturer.Value = listManufacturer.SelectedValue;
            hfModel.Value = "0"; // listModel.SelectedValue;
            refreshModelEDS();
        }

        protected void listMachineType_SelectedIndexChanged(object sender, EventArgs e)
        {
            hfMachineType.Value = listMachineType.SelectedValue;
            hfModel.Value = "0"; // listModel.SelectedValue;
            refreshModelEDS();
        }

        private void refreshModelEDS()
        { 
            ModelEntityDataSource.WhereParameters.Clear();
            ModelEntityDataSource.AutoGenerateWhereClause = true;
            ModelEntityDataSource.WhereParameters.Add("ManufacturerID", TypeCode.Int32, hfManufacturer.Value);
            ModelEntityDataSource.WhereParameters.Add("MachineTypeID", TypeCode.Int32, hfMachineType.Value);        
        }

        private void refreshManufacturerEDS()
        {
            ManufacturerEntityDataSource.WhereParameters.Clear();
            ManufacturerEntityDataSource.AutoGenerateWhereClause = true;
            ManufacturerEntityDataSource.WhereParameters.Add("Status", TypeCode.String, "Active");
        }

        private void refreshMachineTypeEDS()
        {
            MachineTypeEntityDataSource.WhereParameters.Clear();
            MachineTypeEntityDataSource.AutoGenerateWhereClause = true;
            MachineTypeEntityDataSource.WhereParameters.Add("Status", TypeCode.String, "Active");
        }

        private void refreshIndustryEDS()
        {
            IndustryEntityDataSource.WhereParameters.Clear();
            IndustryEntityDataSource.AutoGenerateWhereClause = true;
            IndustryEntityDataSource.WhereParameters.Add("Status", TypeCode.String, "Active");
        }

        protected void btnAddMachine_Click(object sender, EventArgs e)
        {
            using (GESEntities db = new GESEntities())
            {
                try
                {
                    Machine newMachine = new Machine();
                    newMachine.ManufacturerID = Int32.Parse(listManufacturer.SelectedItem.Value);
                    newMachine.MachineTypeID = Int32.Parse(listMachineType.SelectedItem.Value);
                    newMachine.ModelID = Int32.Parse(listModel.SelectedItem.Value);
                    newMachine.IndustryID = Int32.Parse(listIndustry.SelectedItem.Value); 
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

                    lblMachineID.Text = newMachine.MachineID.ToString();
                    lblStatus.Text = ". Successully created machine row";

                    panelUpload.Visible = true;
                    //btnAddMachine.Visible = false;
                    //btnUpdateMachine.Visible = true;
                    //btnAddAnother.Visible = true;

                    Response.Redirect("AddUsedEquipment.aspx?mode=edit&machineID=" + newMachine.MachineID.ToString());

                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to Submit Enquiry - " + exp.Message.ToString(), exp);
                }
            }
            //            Response.Redirect("ProductDetails.aspx?ProductID=" + productID);
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

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (uploadFile.HasFile == false) 
            { 
                    UploadDetails.Text = "Please first select a file to upload..."; 
            } 
            else 
            {
                using (GESEntities db = new GESEntities())
                {
                    int iMachineID = Int32.Parse(lblMachineID.Text.Substring(lblMachineID.Text.IndexOf(":") + 1).Trim());

                    //Fetch next photo # in the photo table for this machine
                    int iNextMachinePhotoID = 0;
                    
                    System.Nullable < Int32 > GetNextPhoto = (from p in db.Photos where p.MachineID == iMachineID select (int?)p.MachinePhotoID).Max();

                    if (GetNextPhoto.HasValue)
                    {
                        iNextMachinePhotoID = GetNextPhoto.Value + 1;
                    }
                    else
                    {
                        iNextMachinePhotoID = 1;    
                    }

                    //Save the image
                    string fileName = iMachineID.ToString() + "-" + iNextMachinePhotoID.ToString() + Path.GetExtension(uploadFile.FileName);
                    string filePath = Server.MapPath("~/UsedPics/" + fileName);

                    string fileNameTemp = "Temp" + iMachineID.ToString() + "-" + iNextMachinePhotoID.ToString() + Path.GetExtension(uploadFile.FileName);
                    string filePathTemp = Server.MapPath("~/UsedPics/" + fileNameTemp);
                    uploadFile.SaveAs(filePathTemp);

                    //Resize image                    
                    Bitmap mg = new Bitmap(filePathTemp);

                    int imgHeight = mg.Height;
                    int imgWidth = mg.Width;

                    bool resizeImage = false;

                    if (imgHeight >= imgWidth)
                    {
                        if (imgHeight > 480)
                        {
                            resizeImage = true;
                        }
                    }
                    else
                    {
                        if (imgWidth > 640)
                        {
                            resizeImage = true;
                        }
                    }

                    if (resizeImage)
                    {
                        Bitmap bp = FixedSize(mg, 640, 480);

                        bp.Save(filePath, System.Drawing.Imaging.ImageFormat.Jpeg);
                        bp.Dispose();
                    }
                    else
                    {
                        Bitmap bp = FixedSize(mg, imgHeight, imgWidth);

                        bp.Save(filePath, System.Drawing.Imaging.ImageFormat.Jpeg);
                        bp.Dispose();
                    }

                    mg.Dispose();

                    //delete Temp file
                    if (File.Exists(filePathTemp))
                    {
                        File.Delete(filePathTemp);
                    }

                    // Display the uploaded file's details 
                    UploadDetails.Text = string.Format(@"Uploaded file: {0}<br /> File size (in bytes): {1:N0}<br /> Content-type: {2}", uploadFile.FileName, uploadFile.FileBytes.Length, uploadFile.PostedFile.ContentType);

                    //insert a row into the photos table
                    Photo newPhoto = new Photo();
                    newPhoto.MachineID = iMachineID;
                    newPhoto.PhotoName = "Test";
                    newPhoto.PhotoDescription = "Test";
                    newPhoto.PhotoUrl = "UsedPics/" + fileName;
                    newPhoto.Status = "Active";
                    newPhoto.ShowThumbnail = "N";
                    newPhoto.MachinePhotoID = iNextMachinePhotoID;
                    
                    db.Photos.AddObject(newPhoto);
                    db.SaveChanges();
                    
                    //Refresh thumbnail list
                    PhotosEntityDataSource.WhereParameters.Clear();
                    PhotosEntityDataSource.AutoGenerateWhereClause = true;
                    PhotosEntityDataSource.WhereParameters.Add("MachineID", TypeCode.Int32, iMachineID.ToString());

                    gridPhotos.Visible = true;
                }
            } 
        }

        public void UpdateMachinePhotoRow(int MachinePhotoItem)
        {
            using (GESEntities db = new GESEntities())
            {
                try
                {
                    var MachinePhotoRow = (from c in db.Photos where c.PhotoID == MachinePhotoItem select c).FirstOrDefault();
                    if (MachinePhotoRow != null)
                    {
                        MachinePhotoRow.ShowThumbnail = "N";
                        db.SaveChanges();
                    }
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to update photo row- " + exp.Message.ToString(), exp);
                }
            }
        }

        public void UpdateMachineRow(int MachineID)
        {
            using (GESEntities db = new GESEntities())
            {
                try
                {
                    var editMachine = (from c in db.Machines where c.MachineID == MachineID select c).FirstOrDefault();
                    if (editMachine  != null)
                    {
                        editMachine.ManufacturerID = Int32.Parse(listManufacturer.SelectedItem.Value);
                        editMachine.MachineTypeID = Int32.Parse(listMachineType.SelectedItem.Value);
                        editMachine.ModelID = Int32.Parse(listModel.SelectedItem.Value);
                        editMachine.IndustryID = Int32.Parse(listIndustry.SelectedItem.Value);
                        editMachine.MachineDescription = txtMachineDescription.Text.ToString();
                        editMachine.MachineGrade = txtMachineGrade.Text.ToString();
                        editMachine.SerialNo = txtSerial.Text.ToString();
                        editMachine.Year = txtYear.Text.ToString();
                        editMachine.Mileage = txtMileage.Text.ToString();
                        editMachine.Location = txtLocation.Text.ToString();
                        editMachine.CostPrice = ConvertStringDecimal(txtCostPrice.Text.ToString());
                        editMachine.SellPrice = ConvertStringDecimal(txtSalesPrice.Text.ToString());
                        editMachine.Status = listStatus.SelectedItem.Value;
                        editMachine.DealerMachine = listDealerMachine.SelectedItem.Value; 
                        
                        db.SaveChanges();
                    }
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to Update Cart Item - " + exp.Message.ToString(), exp);
                }
            }
        }

        protected void btnUpdateMachine_Click(object sender, EventArgs e)
        {
            UpdateMachineRow(Int32.Parse(lblMachineID.Text));
            lblStatus.Text = ". Successully updated machine row";

        }
      
        protected void gridPhotos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);

            string buttonPressed = e.CommandName.ToString();

            int PhotoID = Int32.Parse(this.gridPhotos.Rows[index].Cells[0].Text);
            int MachineID = Int32.Parse(lblMachineID.Text.Substring(lblMachineID.Text.IndexOf(":") + 1).Trim());

            if (buttonPressed == "deletePhoto")
            {
                //Delete from Photo table
                using (GESEntities db = new GESEntities())
                {
                    try
                    {
                        var deletePhoto = (from c in db.Photos where c.PhotoID == PhotoID select c).FirstOrDefault();
                        if (deletePhoto != null)
                        {
                            db.DeleteObject(deletePhoto);
                            db.SaveChanges();
                        }
                    }
                    catch (Exception exp)
                    {
                        throw new Exception("ERROR: Unable to delete photo - " + exp.Message.ToString(), exp);
                    }
                }

                //Delete from file server
                string fileName = this.gridPhotos.Rows[index].Cells[3].Text;
                fileName = Server.MapPath(fileName);
                File.Delete(fileName);
            }
            else if (buttonPressed == "setThumbnail")
            {
                using (GESEntities db = new GESEntities())
                {
                    try
                    {
                        var MachinePhotos = (from c in db.Photos where c.MachineID == MachineID select c);

                        if (MachinePhotos != null)
                        {
                            foreach (var MachinePhotoItem in MachinePhotos)
                            {
                                UpdateMachinePhotoRow(MachinePhotoItem.PhotoID);
                            }
                        }

                        var PhotoRow = (from c in db.Photos where c.PhotoID == PhotoID select c).FirstOrDefault();
                        if (PhotoRow != null)
                        {
                            PhotoRow.ShowThumbnail = "Y";
                            db.SaveChanges();
                        }
                    }
                    catch (Exception exp)
                    {
                        throw new Exception("ERROR: Unable to Set Thumbnail - " + exp.Message.ToString(), exp);
                    }
                }
            }
            //gridPhotos.SelectedIndex = e.NewSelectedIndex;

            //Refresh Grid
            PhotosEntityDataSource.WhereParameters.Clear();
            PhotosEntityDataSource.AutoGenerateWhereClause = true;
            PhotosEntityDataSource.WhereParameters.Add("MachineID", TypeCode.Int32, MachineID.ToString());
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

                        ModelEntityDataSource.WhereParameters.Clear();
                        ModelEntityDataSource.AutoGenerateWhereClause = true;

                        refreshManufacturerEDS();
                        
                        lblAddManuError.Text = "";
                    }
                    catch (Exception exp)
                    {
                        throw new Exception("ERROR: Unable to Add entry - " + exp.Message.ToString(), exp);
                    }
                }
            }
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

                        refreshMachineTypeEDS();

                        lblAddMachTypeError.Text = "";
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

                        refreshIndustryEDS();

                        lblAddIndustryError.Text = "";
                    }
                    catch (Exception exp)
                    {
                        throw new Exception("ERROR: Unable to Add entry - " + exp.Message.ToString(), exp);
                    }
                }
            }
        }

        protected void btnAddModel_Click(object sender, EventArgs e)
        {

            if (txtAddModel.Text == "")
            {
                lblAddModelError.Text = "Required";
            }
            else
            {
                //Check that all fields are populated 
                if (listManufacturer.SelectedIndex < 0)
                {
                    lblAddModel.Text = "Choose a Manufacturer";
                    return;
                }

                if (listMachineType.SelectedIndex < 0)
                {
                    lblAddModel.Text = "Choose a Machine Type";
                    return;
                }

                using (GESEntities db = new GESEntities())
                {
                    try
                    {
                        Model newModel = new Model();
                        newModel.ManufacturerID = Int32.Parse(listManufacturer.SelectedItem.Value); ;
                        newModel.MachineTypeID = Int32.Parse(listMachineType.SelectedItem.Value); ;
                        newModel.ModelName = txtAddModel.Text.ToString();
                        newModel.ModelDescription = txtAddModel.Text.ToString();
                        newModel.Status = "Active";


                        db.Models.AddObject(newModel);
                        db.SaveChanges();

                        hfManufacturer.Value = listManufacturer.SelectedItem.Value;
                        hfMachineType.Value = listMachineType.SelectedItem.Value;
                        hfModel.Value = newModel.ModelID.ToString();

                        txtAddModel.Text = "";
                        lblAddModel.Text = "Added succesfully";

                        refreshModelEDS();

                        lblAddModelError.Text = "";
                    }
                    catch (Exception exp)
                    {
                        throw new Exception("ERROR: Unable to Add entry - " + exp.Message.ToString(), exp);
                    }
                }
            }
        }

        protected void listManufacturer_DataBound(object sender, EventArgs e)
        {
            if ((hfManufacturer.Value != "0") & (hfManufacturer.Value != ""))
            {
                listManufacturer.SelectedValue = hfManufacturer.Value;
            }
        }

        protected void listMachineType_DataBound(object sender, EventArgs e)
        {
            refreshModelEDS();
            
            if ((hfMachineType.Value != "0") & (hfMachineType.Value != ""))
            {
                listMachineType.SelectedValue = hfMachineType.Value;
            }
        }

        protected void listModel_DataBound(object sender, EventArgs e)
        {            
            if ((hfModel.Value != "0") & (hfModel.Value != ""))
            {
                listModel.SelectedValue = hfModel.Value;
            }
        }

        protected void listIndustry_DataBound(object sender, EventArgs e)
        {
            if (hfIndustry.Value != "")
            {
                listIndustry.SelectedValue = hfIndustry.Value;
            }
        }

        protected void listStatus_DataBound(object sender, EventArgs e)
        {
            if ((hfStatus.Value != "0") & (hfStatus.Value != ""))
            {
                listStatus.SelectedValue = hfStatus.Value;
            }
        }

        protected void btnAddAnother_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddUsedEquipment.aspx");
        }

        public System.Drawing.Bitmap ResizeImage(System.Drawing.Bitmap mg, Size newSize)
        {
            double ratio = 0d;
            double myThumbWidth = 0d;
            double myThumbHeight = 0d;
            int x = 0;
            int y = 0;

            Bitmap bp;

            if ((mg.Width / Convert.ToDouble(newSize.Width)) > (mg.Height /
            Convert.ToDouble(newSize.Height)))
                ratio = Convert.ToDouble(mg.Width) / Convert.ToDouble(newSize.Width);
            else
                ratio = Convert.ToDouble(mg.Height) / Convert.ToDouble(newSize.Height);
            myThumbHeight = Math.Ceiling(mg.Height / ratio);
            myThumbWidth = Math.Ceiling(mg.Width / ratio);


            Size thumbSize = new Size((int)myThumbWidth, (int)myThumbHeight);
            bp = new Bitmap(newSize.Width, newSize.Height);
            x = (newSize.Width - thumbSize.Width) / 2;
            y = (newSize.Height - thumbSize.Height);

            Graphics g = Graphics.FromImage(bp);
            g.Clear(Color.Transparent);
            g.SmoothingMode = SmoothingMode.HighQuality;
            g.InterpolationMode = InterpolationMode.HighQualityBicubic;
            g.PixelOffsetMode = PixelOffsetMode.HighQuality;
            g.CompositingQuality = CompositingQuality.HighQuality;
            Rectangle rect = new Rectangle(x, y, thumbSize.Width, thumbSize.Height);

            //RectangleF rectF = new RectangleF(x - 0.5F, y - 0.5F, thumbSize.Width + 1, thumbSize.Height + 1);
            //Rectangle rect = new Rectangle(x, y, thumbSize.Width, thumbSize.Height);

            //g.DrawImage(mg, rectF, rect, GraphicsUnit.Pixel);

            g.DrawImage(mg, rect, 0, 0, mg.Width, mg.Height, GraphicsUnit.Pixel);
            return bp;
        }

        public System.Drawing.Bitmap FixedSize(System.Drawing.Bitmap imgPhoto, int Width, int Height)
        {
            int sourceWidth = imgPhoto.Width;
            int sourceHeight = imgPhoto.Height;
            int sourceX = 0;
            int sourceY = 0;
            int destX = 0;
            int destY = 0;

            float nPercent = 0;
            float nPercentW = 0;
            float nPercentH = 0;

            nPercentW = ((float)Width / (float)sourceWidth);
            nPercentH = ((float)Height / (float)sourceHeight);
            if (nPercentH < nPercentW)
            {
                nPercent = nPercentH;
                destX = System.Convert.ToInt16((Width - (sourceWidth * nPercent)) / 2);
            }
            else
            {
                nPercent = nPercentW;
                destY = System.Convert.ToInt16((Height - (sourceHeight * nPercent)) / 2);
            }

            int destWidth = (int)(sourceWidth * nPercent);
            int destHeight = (int)(sourceHeight * nPercent);

            Bitmap bmPhoto = new Bitmap(Width, Height, System.Drawing.Imaging.PixelFormat.Format32bppArgb);
            bmPhoto.SetResolution(imgPhoto.HorizontalResolution, imgPhoto.VerticalResolution);

            Graphics grPhoto = Graphics.FromImage(bmPhoto);
            grPhoto.Clear(Color.White);
            grPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;
            grPhoto.CompositingQuality = CompositingQuality.HighQuality;
            grPhoto.SmoothingMode = SmoothingMode.HighQuality;
            grPhoto.PixelOffsetMode = PixelOffsetMode.HighQuality;

            grPhoto.DrawImage(imgPhoto,
                new RectangleF(destX - 0.5F, destY - 0.5F, destWidth + 1, destHeight + 1),
                new Rectangle(sourceX, sourceY, sourceWidth, sourceHeight),
                GraphicsUnit.Pixel);

            //grPhoto.DrawImage(imgPhoto,
            //    new Rectangle(destX, destY, destWidth, destHeight),
            //    new Rectangle(sourceX, sourceY, sourceWidth, sourceHeight),
            //    GraphicsUnit.Pixel);

            grPhoto.Dispose();
            return bmPhoto;
        }

        public System.Drawing.Bitmap ScaleByPercent(System.Drawing.Bitmap imgPhoto, int Percent)
        {
            float nPercent = ((float)Percent / 100);

            int sourceWidth = imgPhoto.Width;
            int sourceHeight = imgPhoto.Height;
            int sourceX = 0;
            int sourceY = 0;

            int destX = 0;
            int destY = 0;
            int destWidth = (int)(sourceWidth * nPercent);
            int destHeight = (int)(sourceHeight * nPercent);

            Bitmap bmPhoto = new Bitmap(destWidth, destHeight, System.Drawing.Imaging.PixelFormat.Format24bppRgb);
            bmPhoto.SetResolution(imgPhoto.HorizontalResolution, imgPhoto.VerticalResolution);

            Graphics grPhoto = Graphics.FromImage(bmPhoto);
            grPhoto.SmoothingMode = SmoothingMode.HighQuality;
            grPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;
            grPhoto.PixelOffsetMode = PixelOffsetMode.HighQuality;
            grPhoto.CompositingQuality = CompositingQuality.HighQuality;

            grPhoto.DrawImage(imgPhoto,
                new Rectangle(destX, destY, destWidth, destHeight),
                new Rectangle(sourceX, sourceY, sourceWidth, sourceHeight),
                GraphicsUnit.Pixel);

            grPhoto.Dispose();
            return bmPhoto;
        }

        protected void listStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            hfStatus.Value = listStatus.SelectedValue;
        }

        protected void listDealerMachine_SelectedIndexChanged(object sender, EventArgs e)
        {
            hfDealerMachine.Value = listDealerMachine.SelectedValue;
        }

        protected void listDealerMachine_DataBound(object sender, EventArgs e)
        {
            if ((hfDealerMachine.Value != "0") & (hfDealerMachine.Value != ""))
            {
                listDealerMachine.SelectedValue = hfDealerMachine.Value;
            }
        }

        protected void btnUploadSpec_Click(object sender, EventArgs e)
        {
            if (uploadFile.HasFile == false)
            {
                UploadDetails.Text = "Please first select a file to upload...";
            }
            else
            {
                using (GESEntities db = new GESEntities())
                {
                    int iMachineID = Int32.Parse(lblMachineID.Text.Substring(lblMachineID.Text.IndexOf(":") + 1).Trim());

                    //Fetch next photo # in the photo table for this machine
                    int iNextSpecID = 0;

                    System.Nullable<Int32> GetNextSpec = (from p in db.Specifications where p.MachineID == iMachineID select (int?)p.MachineSpecID).Max();

                    if (GetNextSpec.HasValue)
                    {
                        iNextSpecID = GetNextSpec.Value + 1;
                    }
                    else
                    {
                        iNextSpecID = 1;
                    }

                    //Save the image
                    string fileName = iMachineID.ToString() + "-" + iNextSpecID.ToString() + Path.GetExtension(uploadFile.FileName);
                    string filePath = Server.MapPath("~/Specs/" + fileName);

                    string fileNameTemp = "Temp" + iMachineID.ToString() + "-" + iNextSpecID.ToString() + Path.GetExtension(uploadFile.FileName);
                    string filePathTemp = Server.MapPath("~/Specs/" + fileNameTemp);
                    uploadFile.SaveAs(filePathTemp);

                    //delete Temp file
                    if (File.Exists(filePathTemp))
                    {
                        File.Delete(filePathTemp);
                    }

                    // Display the uploaded file's details 
                    UploadDetails.Text = string.Format(@"Uploaded file: {0}<br /> File size (in bytes): {1:N0}<br /> Content-type: {2}", uploadFile.FileName, uploadFile.FileBytes.Length, uploadFile.PostedFile.ContentType);

                    //insert a row into the photos table
                    Specification newSpec = new Specification();
                    newSpec.MachineID = iMachineID;
                    newSpec.SpecName = "Test";
                    newSpec.SpecDescription = "Test";
                    newSpec.SpecUrl = "Specs/" + fileName;
                    newSpec.Status = "Active";
                    newSpec.MachineSpecID = iNextSpecID;

                    db.Specifications.AddObject(newSpec);
                    db.SaveChanges();

                    //Refresh thumbnail list
                    SpecsEntityDataSource.WhereParameters.Clear();
                    SpecsEntityDataSource.AutoGenerateWhereClause = true;
                    SpecsEntityDataSource.WhereParameters.Add("MachineID", TypeCode.Int32, iMachineID.ToString());

                    gridSpecs.Visible = true;
                }
            } 
        }
    }
}
