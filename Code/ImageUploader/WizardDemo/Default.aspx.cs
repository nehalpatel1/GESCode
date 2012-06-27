using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aurigma.ImageUploader;

public partial class WizardDemo_Default : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		Uploader1.Metadata.AdditionalFormName = this.Page.Form.Name;
	}

	protected void Uploader1_FileUploaded(object sender, FileUploadedEventArgs e)
	{
		UploadedFile uploadedFile = e.UploadedFile;
		WizardGallery gallery = new WizardGallery();

		// Is it new upload session?
		if (uploadedFile.Package.PackageIndex == 0 && uploadedFile.Index == 0)
		{
			// Remove previously uploaded files
			gallery.Empty();

			// Add common info to galllery
			NameValueCollection form = Request.Form;
			Dictionary<string, string> values = new Dictionary<string, string>();
			values.Add("propertytype", form["propertyTypeDropDownList"]);
			values.Add("headline", form["headlineTextBox"]);
			values.Add("description", form["descriptionTextBox"]);
			values.Add("price", form["priceTextBox"]);
			values.Add("number", form["numberTextBox"]);
			values.Add("street", form["streetTextBox"]);
			values.Add("city", form["cityTextBox"]);
			values.Add("zipcode", form["zipCodeTextBox"]);
			values.Add("bedrooms", form["bedroomsDropDownList"]);
			values.Add("bathrooms", form["bathroomsDropDownList"]);
			values.Add("square", form["squareTextBox"]);

			gallery.UpdateCommonInfo(values);
		}

		// Save files
		ConvertedFile sourceFile = uploadedFile.ConvertedFiles[0];
		ConvertedFile thumbnailFile = uploadedFile.ConvertedFiles[1];
		if (sourceFile != null && thumbnailFile != null)
		{
			string sourceFileName = Utils.GetSafeFileName(gallery.UploadedFilesAbsolutePath, sourceFile.Name);
			sourceFile.SaveAs(Path.Combine(gallery.UploadedFilesAbsolutePath, sourceFileName));

			string thumbnailFileName = Utils.GetSafeFileName(gallery.UploadedFilesAbsolutePath, thumbnailFile.Name);
			thumbnailFile.SaveAs(Path.Combine(gallery.ThumbnailsAbsolutePath, thumbnailFileName));

			// Add file to the gallery
			gallery.Add(uploadedFile.SourceName, sourceFileName, new string[] { thumbnailFileName }, uploadedFile.Description);
		}

		// Save gallery
		gallery.Save();

	}
}