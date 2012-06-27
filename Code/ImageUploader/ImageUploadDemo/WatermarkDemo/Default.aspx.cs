using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aurigma.ImageUploader;
using System.IO;

public partial class WatermarkDemo_Default : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void Uploader1_FileUploaded(object sender, FileUploadedEventArgs e)
	{
		UploadedFile uploadedFile = e.UploadedFile;
		ThumbnailsGallery gallery = new ThumbnailsGallery();

		// Is it new upload session?
		if (uploadedFile.Package.PackageIndex == 0 && uploadedFile.Index == 0)
		{
			// Remove previously uploaded files
			gallery.Empty();
		}

		// Get source file
		ConvertedFile file = uploadedFile.ConvertedFiles[0];
		ConvertedFile thumbnailFile = uploadedFile.ConvertedFiles[1];
		if (file != null && thumbnailFile != null)
		{
			string fileName = Utils.GetSafeFileName(gallery.UploadedFilesAbsolutePath, uploadedFile.SourceName);
			// Save original file to the disk
			file.SaveAs(Path.Combine(gallery.UploadedFilesAbsolutePath, fileName));

			// Save thumbnail
			string thumbnailName = Utils.GetSafeFileName(gallery.ThumbnailsAbsolutePath, thumbnailFile.Name);
			thumbnailFile.SaveAs(Path.Combine(gallery.ThumbnailsAbsolutePath, thumbnailName));

			// Add file to the gallery
			gallery.Add(uploadedFile.SourceName, fileName, new string[] { thumbnailName }, null);
		}

		// Save gallery
		gallery.Save();
	}
}