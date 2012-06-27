using System;
using System.Collections.Specialized;
using System.IO;
using System.Web;
using Aurigma.ImageUploader;

public partial class PhotoOrder_Default : System.Web.UI.Page
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

		// Save files
		ConvertedFile sourceFile = uploadedFile.ConvertedFiles[0];
		ConvertedFile thumbnailFile = uploadedFile.ConvertedFiles[1];
		if (sourceFile != null && thumbnailFile != null)
		{
			string sourceFileName = Utils.GetSafeFileName(gallery.UploadedFilesAbsolutePath, sourceFile.Name);
			sourceFile.SaveAs(Path.Combine(gallery.UploadedFilesAbsolutePath, sourceFileName));

			string thumbnailFileName = Utils.GetSafeFileName(gallery.UploadedFilesAbsolutePath, thumbnailFile.Name);
			thumbnailFile.SaveAs(Path.Combine(gallery.ThumbnailsAbsolutePath, thumbnailFileName));

			string description = uploadedFile.Tag;
			if (!string.IsNullOrEmpty(description))
			{
				NameValueCollection data = HttpUtility.ParseQueryString(description);
				description = string.Format("Size: {0}<br />Paper: {1}<br />Quantity: {2}", 
					HttpUtility.HtmlEncode(data["Size"]), HttpUtility.HtmlEncode(data["Paper"]), HttpUtility.HtmlEncode(data["Quantity"]));
			}

			// Add file to the gallery
			gallery.Add(uploadedFile.SourceName, sourceFileName, new string[] { thumbnailFileName }, description);

			// Save gallery
			gallery.Save();
		}
	}
}