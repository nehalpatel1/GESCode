using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aurigma.ImageUploader;
using System.IO;

public partial class ResizeImages_Default : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (Request.HttpMethod == "GET" && !IsPostBack)
		{
			ThumbnailsGallery gallery = new ThumbnailsGallery();
			// Remove previously uploaded files
			gallery.Empty();
		}
	}

	protected void Uploader1_FileUploaded(object sender, FileUploadedEventArgs e)
	{
		UploadedFile uploadedFile = e.UploadedFile;
		ThumbnailsGallery gallery = new ThumbnailsGallery();

		// Image Uploader configured to upload 3 thumbnails for every selected to upload file
		int thumbnailCount = 3;
		string[] thumbnails = new string[thumbnailCount];

		// Save thumbnails
		for (int i = 0; i < thumbnailCount; i++)
		{
			ConvertedFile thumbnailFile = uploadedFile.ConvertedFiles[i];
			if (thumbnailFile != null)
			{
				string thumbnailName = Utils.GetSafeFileName(gallery.ThumbnailsAbsolutePath, thumbnailFile.Name);
				thumbnailFile.SaveAs(Path.Combine(gallery.ThumbnailsAbsolutePath, thumbnailName));
				thumbnails[i] = thumbnailName;
			}
		}

		// Add file to the gallery
		gallery.Add(uploadedFile.SourceName, null, thumbnails, uploadedFile.Description);

		// Save gallery
		gallery.Save();
	}
}