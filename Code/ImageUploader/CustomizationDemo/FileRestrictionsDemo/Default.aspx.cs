using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aurigma.ImageUploader;
using System.IO;

public partial class RestrictionsDemo_Default : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
	}

	protected void Uploader1_FileUploaded(object sender, FileUploadedEventArgs e)
	{
		UploadedFile uploadedFile = e.UploadedFile;
		SourceGallery gallery = new SourceGallery();

		// Is it new upload session?
		if (uploadedFile.Package.PackageIndex == 0 && uploadedFile.Index == 0)
		{
			// Remove previously uploaded files
			gallery.Empty();
		}

		// Get source file
		ConvertedFile sourceFile = uploadedFile.ConvertedFiles[0];
		if (sourceFile != null)
		{
			string sourceName = Utils.GetSafeFileName(gallery.UploadedFilesAbsolutePath, uploadedFile.SourceName);
			// Save file to the disk
			sourceFile.SaveAs(Path.Combine(gallery.UploadedFilesAbsolutePath, sourceName));

			string description = uploadedFile.Description;

			// Add file to the gallery
			gallery.Add(uploadedFile.SourceName, sourceName, description);
		}

		// Save gallery
		gallery.Save();
	}
}