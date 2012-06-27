using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aurigma.ImageUploader;
using System.IO;

public partial class MultipleDescriptions_Default : System.Web.UI.Page
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


		// Save uploaded files

		int thumbnailCount = 2;
		string[] thumbnailNames = new string[thumbnailCount];
		for (int i = 0; i < thumbnailCount; i++)
		{
			ConvertedFile thumbnailFile = uploadedFile.ConvertedFiles[i];
			if (thumbnailFile != null)
			{
				// Save thumbnail
				string thumbnailName = Utils.GetSafeFileName(gallery.ThumbnailsAbsolutePath, thumbnailFile.Name);
				thumbnailFile.SaveAs(Path.Combine(gallery.ThumbnailsAbsolutePath, thumbnailName));

				thumbnailNames[i] = thumbnailName;
			}
		}

		// Get Title value
		string title = uploadedFile.Package.PackageFields["Title_" + uploadedFile.Index];

		// Use original file name if title was not specified
		if (string.IsNullOrEmpty(title))
		{
			title = uploadedFile.SourceName;
		}

		// Add file to the gallery
		gallery.Add(title, null, thumbnailNames, uploadedFile.Description);

		// Save gallery
		gallery.Save();
	}
}