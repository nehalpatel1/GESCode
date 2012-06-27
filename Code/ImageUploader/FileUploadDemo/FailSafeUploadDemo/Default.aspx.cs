using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aurigma.ImageUploader;
using System.IO;

public partial class ReliableUpload_Default : System.Web.UI.Page
{
	private List<string> hashes;
	private List<string> existedFiles = new List<string>();

	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void Uploader1_FileUploaded(object sender, FileUploadedEventArgs e)
	{
		UploadedFile uploadedFile = e.UploadedFile;
		SourceGallery gallery = new SourceGallery();

		if (!string.IsNullOrEmpty(Request["hashcheck"]))
		{
			if (hashes == null)
			{
				hashes = new List<string>();
				foreach (Dictionary<string, string> item in gallery.GetItems())
				{
					hashes.Add(item["description"]);
				}
			}

			string hash = uploadedFile.Package.PackageFields["HashCodeMD5_" + uploadedFile.Index];
			if (hashes.Contains(hash))
			{
				existedFiles.Add(uploadedFile.Index.ToString());
			}

			// Last uploaded file?
			if (uploadedFile.Index == uploadedFile.Package.PackageFileCount - 1)
			{
				Response.ClearContent();
				Response.Write(string.Join(";", existedFiles.ToArray()));
				Response.End();
			}
			return;
		}

		// Is it new upload session?
		if (uploadedFile.Package.PackageIndex == 0 && uploadedFile.Index == 0 &&
			!string.IsNullOrEmpty(Request["clean"]))
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

			string hash = uploadedFile.Package.PackageFields["HashCodeMD5_" + uploadedFile.Index];

			// Add file to the gallery
			gallery.Add(uploadedFile.SourceName, sourceName, hash);
		}

		// Save gallery
		gallery.Save();
	}
}