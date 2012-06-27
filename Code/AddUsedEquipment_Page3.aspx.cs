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
using Aurigma.ImageUploader;
using System.Text;
using System.Text.RegularExpressions;

namespace HelloGES
{
    public partial class AddUsedEquipment_Page3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int machineID = 0;
            int industryID = 0;
            int machineTypeID = 0;
            int manufacturerID = 0;

            string model = "";
            string uploadMethod = "";

            try
            {
                Int32.TryParse(Request["machineID"].ToString(), out machineID);
            }
            catch
            {
                machineID = 0;
            }

            try
            {
                Int32.TryParse(Request["industryID"].ToString(), out industryID);
            }
            catch
            {
                industryID = 0;
            }

            try
            {
                Int32.TryParse(Request["machineTypeID"].ToString(), out machineTypeID);
            }
            catch
            {
                machineTypeID = 0;
            }

            try
            {
                model = Request["model"].ToString();
            }
            catch
            {
                model = "";
            }

            try
            {
                Int32.TryParse(Request["manufacturerID"].ToString(), out manufacturerID);
            }
            catch
            {
                manufacturerID = 0;
            }

            try
            {
                uploadMethod = Request["uploadMethod"].ToString();
            }
            catch
            {
                uploadMethod = "";
            }

            if (uploadMethod == "normal")
            {
                pnNormalUpload.Visible = true;
                pnArigmaUpload.Visible = false;
            }
            else
            {
                pnNormalUpload.Visible = false;
                pnArigmaUpload.Visible = true;
            }

            string redirectString = "AddUsedEquipment_Page3.aspx?mode=" + Request["mode"].ToString() + "&machineID=" + machineID + "&industryID=" + industryID + "&machineTypeID=" + machineTypeID + "&Model=" + model + "&ManufacturerID=" + manufacturerID;
            Uploader1.UploadSettings.RedirectUrl = redirectString;

            if (!IsPostBack)
            {
                gridPhotos.Visible = true;
                //Refresh Photos grid
                refreshPhotoGrid();
            }
        }
        
        protected void btnAddMachine_Click(object sender, EventArgs e)
        {
            if (Request["mode"].ToString() == "edit")
            {
                Response.Redirect("UsedEquipment.aspx", false);
            }
            else
            {
                Response.Redirect("MyQuip.aspx", false);
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
      
        protected void gridPhotos_RowCommand(object sender, GridViewCommandEventArgs e)
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
            
            int index = Convert.ToInt32(e.CommandArgument);

            string buttonPressed = e.CommandName.ToString();

            int PhotoID = Int32.Parse(this.gridPhotos.Rows[index].Cells[0].Text);

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
                        var MachinePhotos = (from c in db.Photos where c.MachineID == machineID select c);

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

            //Refresh Grid
            refreshPhotoGrid();
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
            grPhoto.Clear(Color.Black);
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
                    int machineID = 0;
                    int industryID = 0;
                    int machineTypeID = 0;
                    int manufacturerID = 0;

                    string industry = "";
                    string machineType  = "";
                    string model = "";
                    string manufacturer = "";
                    
                    try
                    {
                        Int32.TryParse(Request["machineID"].ToString(), out machineID);
                    }
                    catch
                    {
                        machineID = 0;
                    }

                    try
                    {
                        Int32.TryParse(Request["industryID"].ToString(), out industryID);

                        var getIndustry = (from p in db.Industries where p.IndustryID == industryID select p).FirstOrDefault();

                        if (getIndustry != null)
                        {
                            industry = getIndustry.IndustryName;
                            industry = industry.Replace(" ", "-");
                            industry = industry.Replace("/", "-");
                        }
                    }
                    catch
                    {
                        industryID = 0;
                    }

                    try
                    {
                        Int32.TryParse(Request["machineTypeID"].ToString(), out machineTypeID);

                        var getMachineType = (from p in db.MachineTypes where p.MachineTypeID == machineTypeID select p).FirstOrDefault();

                        if (getMachineType != null)
                        {
                            machineType = getMachineType.MachineTypeName;
                            machineType = machineType.Replace(" ", "-");
                            machineType = machineType.Replace("/", "-");
                        }
                    }
                    catch
                    {
                        machineTypeID = 0;
                    }

                    try
                    {
                        model = Request["model"].ToString();
                        model = model.Replace("/", "-");
                    }
                    catch
                    {
                        model = "";
                    }

                    try
                    {
                        Int32.TryParse(Request["manufacturerID"].ToString(), out manufacturerID);

                        var getManufacturer = (from p in db.Manufacturers where p.ManufacturerID == manufacturerID select p).FirstOrDefault();

                        if (getManufacturer != null)
                        {
                            manufacturer = getManufacturer.ManufacturerName;
                            manufacturer = manufacturer.Replace(" ", "-");
                            manufacturer = manufacturer.Replace("/", "-");
                        }
                    }
                    catch
                    {
                        manufacturerID = 0;
                    }

                    
                    //Fetch next photo # in the photo table for this machine
                    int iNextMachinePhotoID = 0;
                    string showThumbnail = "N";

                    System.Nullable<Int32> GetNextPhoto = (from p in db.Photos where p.MachineID == machineID select (int?)p.MachinePhotoID).Max();

                    if (GetNextPhoto.HasValue)
                    {
                        iNextMachinePhotoID = GetNextPhoto.Value + 1;
                    }
                    else
                    {
                        iNextMachinePhotoID = 1;
                        showThumbnail = "Y";
                    }

                    //Save the image
                    string fileName = machineID.ToString() + "-" + iNextMachinePhotoID.ToString() + "-" + industry + "-" + machineType + "-" + model + "-" + manufacturer + Path.GetExtension(uploadFile.FileName);
                    string filePath = Server.MapPath("~/UsedPics/" + fileName);

                    string fileNameTemp = "Temp" + machineID.ToString() + "-" + iNextMachinePhotoID.ToString() + Path.GetExtension(uploadFile.FileName);
                    string filePathTemp = Server.MapPath("~/UsedPics/" + fileNameTemp);
                    uploadFile.SaveAs(filePathTemp);

                    //Resize image                    
                    Bitmap mg = new Bitmap(filePathTemp);

                    int imgHeight = mg.Height;
                    int imgWidth = mg.Width;

                    bool resizeImage = false;
                    bool portrait = false;

                    if (imgHeight >= imgWidth)
                    {
                        //if (imgHeight > 480)
                        if (imgHeight > 640)
                            {
                            resizeImage = true;
                            portrait = true;
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
                        if (portrait)
                        {
                            imgWidth = 480;
                            imgHeight = 640;
                        }
                        else
                        {
                            imgWidth = 640;
                            imgHeight = 480;
                        }
                    }

                    Bitmap bp = FixedSize(mg, imgWidth, imgHeight);

                    bp.Save(filePath, System.Drawing.Imaging.ImageFormat.Jpeg);
                    bp.Dispose();
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
                    newPhoto.MachineID = machineID;
                    newPhoto.PhotoName = industry + "-" + machineType + "-" + model + "-" + manufacturer;
                    newPhoto.PhotoDescription = industry + "-" + machineType + "-" + model + "-" + manufacturer;
                    newPhoto.PhotoUrl = "UsedPics/" + fileName;
                    newPhoto.Status = "Active";
                    newPhoto.ShowThumbnail = showThumbnail;
                    newPhoto.MachinePhotoID = iNextMachinePhotoID;

                    db.Photos.AddObject(newPhoto);
                    db.SaveChanges();

                    //Refresh thumbnail list
                    refreshPhotoGrid();
                    gridPhotos.Visible = true;
                }
            } 

        }

        protected void Uploader1_FileUploaded(object sender, Aurigma.ImageUploader.FileUploadedEventArgs e)
        {
            UploadedFile uploadedFile = e.UploadedFile;
            //SourceGallery gallery = new SourceGallery();

            //// Is it new upload session?
            //if (uploadedFile.Package.PackageIndex == 0 && uploadedFile.Index == 0)
            //{
            //    // Remove previously uploaded files
            //    gallery.Empty();
            //}

            //// Get source file
            //ConvertedFile sourceFile = uploadedFile.ConvertedFiles[0];
            //if (sourceFile != null)
            //{
            //    string sourceName = Utils.GetSafeFileName(gallery.UploadedFilesAbsolutePath, uploadedFile.SourceName);
            //    // Save file to the disk
            //    sourceFile.SaveAs(Path.Combine(gallery.UploadedFilesAbsolutePath, sourceName));

            //    string description = uploadedFile.Description;

            //    // Add file to the gallery
            //    gallery.Add(uploadedFile.SourceName, sourceName, description);
            //}
            //// Save gallery
            //gallery.Save();


            using (GESEntities db = new GESEntities())
            {
                int machineID = 0;
                int industryID = 0;
                int machineTypeID = 0;
                int manufacturerID = 0;

                string industry = "";
                string machineType = "";
                string model = "";
                string manufacturer = "";

                try
                {
                    Int32.TryParse(Request["machineID"].ToString(), out machineID);
                }
                catch
                {
                    machineID = 0;
                }

                try
                {
                    Int32.TryParse(Request["industryID"].ToString(), out industryID);

                    var getIndustry = (from p in db.Industries where p.IndustryID == industryID select p).FirstOrDefault();

                    if (getIndustry != null)
                    {
                        industry = getIndustry.IndustryName;
                        //// Replace special characters
                        //StringBuilder sb = new StringBuilder(name);
                        //foreach (char c in Path.GetInvalidFileNameChars())
                        //{
                        //    sb.Replace(c, '_');
                        //}
                        //name = sb.ToString();
                        industry = industry.Replace(" ", "-");
                        industry = industry.Replace("/", "-");
                    }
                }
                catch
                {
                    industryID = 0;
                }

                try
                {
                    Int32.TryParse(Request["machineTypeID"].ToString(), out machineTypeID);

                    var getMachineType = (from p in db.MachineTypes where p.MachineTypeID == machineTypeID select p).FirstOrDefault();

                    if (getMachineType != null)
                    {
                        machineType = getMachineType.MachineTypeName;
                        machineType = machineType.Replace(" ", "-");
                        machineType = machineType.Replace("/", "-");
                    }
                }
                catch
                {
                    machineTypeID = 0;
                }

                try
                {
                    model = Request["model"].ToString();
                    model = model.Replace("/", "-");
                }
                catch
                {
                    model = "";
                }

                try
                {
                    Int32.TryParse(Request["manufacturerID"].ToString(), out manufacturerID);

                    var getManufacturer = (from p in db.Manufacturers where p.ManufacturerID == manufacturerID select p).FirstOrDefault();

                    if (getManufacturer != null)
                    {
                        manufacturer = getManufacturer.ManufacturerName;
                        manufacturer = manufacturer.Replace(" ", "-");
                        manufacturer = manufacturer.Replace("/", "-");
                    }
                }
                catch
                {
                    manufacturerID = 0;
                }


                //Fetch next photo # in the photo table for this machine
                int iNextMachinePhotoID = 0;
                string showThumbnail = "N";

                System.Nullable<Int32> GetNextPhoto = (from p in db.Photos where p.MachineID == machineID select (int?)p.MachinePhotoID).Max();

                if (GetNextPhoto.HasValue)
                {
                    iNextMachinePhotoID = GetNextPhoto.Value + 1;
                }
                else
                {
                    iNextMachinePhotoID = 1;
                    showThumbnail = "Y";
                }

                //Save the image
                string fileName = machineID.ToString() + "-" + iNextMachinePhotoID.ToString() + "-" + industry + "-" + machineType + "-" + model + "-" + manufacturer + Path.GetExtension(uploadedFile.SourceName);
                string filePath = Server.MapPath("~/UsedPics/" + fileName);

                string fileNameTemp = "Temp" + machineID.ToString() + "-" + iNextMachinePhotoID.ToString() + Path.GetExtension(uploadedFile.SourceName);
                string filePathTemp = Server.MapPath("~/UsedPics/" + fileNameTemp);

                ConvertedFile sourceFile = uploadedFile.ConvertedFiles[0];
                if (sourceFile != null)
                {
                    string sourceName = filePathTemp;
                    // Save file to the disk
                    sourceFile.SaveAs(filePathTemp);

                    string description = uploadedFile.Description;
                    
                    // Add file to the gallery
                    //gallery.Add(uploadedFile.SourceName, sourceName, description);
                }

                //uploadFile.SaveAs(filePathTemp);

                //Resize image                    
                Bitmap mg = new Bitmap(filePathTemp);

                int imgHeight = mg.Height;
                int imgWidth = mg.Width;

                bool resizeImage = false;
                bool portrait = false;

                if (imgHeight >= imgWidth)
                {
                    //if (imgHeight > 480)
                    if (imgHeight > 640)
                    {
                        resizeImage = true;
                        portrait = true;
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
                    if (portrait)
                    {
                        imgWidth = 480;
                        imgHeight = 640;
                    }
                    else
                    {
                        imgWidth = 640;
                        imgHeight = 480;
                    }
                }

                Bitmap bp = FixedSize(mg, imgWidth, imgHeight);

                bp.Save(filePath, System.Drawing.Imaging.ImageFormat.Jpeg);
                bp.Dispose();
                mg.Dispose();

                //delete Temp file
                if (File.Exists(filePathTemp))
                {
                    File.Delete(filePathTemp);
                }

                // Display the uploaded file's details 
                //UploadDetails.Text = string.Format(@"Uploaded file: {0}<br /> File size (in bytes): {1:N0}<br /> Content-type: {2}", uploadFile.FileName, uploadFile.FileBytes.Length, uploadFile.PostedFile.ContentType);

                //insert a row into the photos table
                Photo newPhoto = new Photo();
                newPhoto.MachineID = machineID;
                newPhoto.PhotoName = industry + "-" + machineType + "-" + model + "-" + manufacturer;
                newPhoto.PhotoDescription = industry + "-" + machineType + "-" + model + "-" + manufacturer;
                newPhoto.PhotoUrl = "UsedPics/" + fileName;
                newPhoto.Status = "Active";
                newPhoto.ShowThumbnail = showThumbnail;
                newPhoto.MachinePhotoID = iNextMachinePhotoID;

                db.Photos.AddObject(newPhoto);
                db.SaveChanges();
            }
        }

        protected void Uploader1_AllFilesUploaded(object sender, AllFilesUploadedEventArgs e)
        {
            //int machineID = 0;
            //int industryID = 0;
            //int machineTypeID = 0;
            //int manufacturerID = 0;

            //string model = "";

            //try
            //{
            //    Int32.TryParse(Request["machineID"].ToString(), out machineID);
            //}
            //catch
            //{
            //    machineID = 0;
            //}

            //try
            //{
            //    Int32.TryParse(Request["industryID"].ToString(), out industryID);
            //}
            //catch
            //{
            //    industryID = 0;
            //}

            //try
            //{
            //    Int32.TryParse(Request["machineTypeID"].ToString(), out machineTypeID);
            //}
            //catch
            //{
            //    machineTypeID = 0;
            //}

            //try
            //{
            //    model = Request["model"].ToString();
            //}
            //catch
            //{
            //    model = "";
            //}

            //try
            //{
            //    Int32.TryParse(Request["manufacturerID"].ToString(), out manufacturerID);
            //}
            //catch
            //{
            //    manufacturerID = 0;
            //}

            //string redirectString = "AddUsedEquipment_Page3.aspx?mode=" + Request["mode"].ToString() + "&machineID=" + machineID + "&industryID=" + industryID + "&machineTypeID=" + machineTypeID + "&Model=" + model + "&ManufacturerID=" + manufacturerID;
            //Response.AppendHeader("Refresh", "0;URL="+redirectString); 
            //refreshPhotoGrid();
        }
        
        private void refreshPhotoGrid()
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

                    var photoList = (from c in db.Photos where c.MachineID == machineID select c);

                    gridPhotos.DataSource = photoList;
                    gridPhotos.DataSourceID = "";
                    gridPhotos.DataBind();
                }
                catch (Exception exp)
                {
                    throw new Exception("ERROR: Unable to refresh photo grid - " + exp.Message.ToString(), exp);
                }
            }
        }

        protected void btnToggleUpload_Click(object sender, EventArgs e)
        {
            if (pnArigmaUpload.Visible)
            {
                Response.Redirect(Uploader1.UploadSettings.RedirectUrl + "&uploadMethod=normal", false);
            }
            else
            {
                Response.Redirect(Uploader1.UploadSettings.RedirectUrl + "&uploadMethod=arigma", false);
            }
        }

    }
}
