using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aurigma.ImageUploader;
using System.IO;
using System.Globalization;
using System.Collections.Specialized;

public partial class GpsDemo_Default : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void Uploader1_FileUploaded(object sender, FileUploadedEventArgs e)
	{
		UploadedFile uploadedFile = e.UploadedFile;
		GpsGallery gallery = new GpsGallery();

		// Is it new upload session?
		if (uploadedFile.Package.PackageIndex == 0 && uploadedFile.Index == 0)
		{
			// Remove previously uploaded files
			gallery.Empty();
		}

		// Image Uploader configured to upload 3 thumbnails for every selected to upload file
		int fileCount = 3;
		string sourceFileName = null;
		string[] thumbnails = new string[fileCount - 1];

		// Save thumbnails
		for (int i = 0; i < fileCount; i++)
		{
			ConvertedFile file = uploadedFile.ConvertedFiles[i];
			if (file != null)
			{
				string fileName;
				if (i == 0)
				{
					// First converter is a source file
					fileName = Utils.GetSafeFileName(gallery.UploadedFilesAbsolutePath, file.Name);
					file.SaveAs(Path.Combine(gallery.UploadedFilesAbsolutePath, fileName));
					sourceFileName = fileName;
				}
				else
				{
					// Thumbnail
					fileName = Utils.GetSafeFileName(gallery.ThumbnailsAbsolutePath, file.Name);
					file.SaveAs(Path.Combine(gallery.ThumbnailsAbsolutePath, fileName));
					thumbnails[i - 1] = fileName;
				}
			}
		}

		// Get index of the uploaded file
		string index = uploadedFile.Index.ToString(CultureInfo.InvariantCulture);

		// Get package fields collection
		NameValueCollection fields = uploadedFile.Package.PackageFields;

		double? latitude = gallery.ParseCoordinate(fields["ExifGpsLatitude_" + index], fields["ExifGpsLatitudeRef_" + index]); ;
		double? longitude = gallery.ParseCoordinate(fields["ExifGpsLongitude_" + index], fields["ExifGpsLongitudeRef_" + index]);

		double size = uploadedFile.SourceSize;
		string sizeStr;
		if (size > 1024 * 1024)
		{
			sizeStr = (size / (1024 * 1024)).ToString("N0") + " MB";
		}
		else if (size > 1024)
		{
			sizeStr = (size / 1024).ToString("N0") + " KB";
		}
		else
		{
			sizeStr = size.ToString("N0") + " B";
		}

		string dimension = uploadedFile.SourceWidth + "x" + uploadedFile.SourceHeight;

		// Add file to the gallery
		gallery.Add(uploadedFile.SourceName, sourceFileName, thumbnails, uploadedFile.Description, latitude, longitude, sizeStr, dimension);

		// Save gallery
		gallery.Save();
	}
}