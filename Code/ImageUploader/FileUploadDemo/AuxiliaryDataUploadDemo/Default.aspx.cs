using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aurigma.ImageUploader;
using System.IO;
using System.Text;

public partial class AuxiliaryDataUpload_Default : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			FolderGallery gallery = new FolderGallery();
			foreach (Dictionary<string, string> item in gallery.GetItems())
			{
				if (item.ContainsKey("directory") && item["name"] != "..")
				{
					folderNameDropDownList.Items.Add(item["name"]);
				}
			}

			folderNameTextBox.Text = DateTime.UtcNow.Date.ToShortDateString();
		}
	}

	protected void Uploader1_FileUploaded(object sender, FileUploadedEventArgs e)
	{
		UploadedFile uploadedFile = e.UploadedFile;
		FolderGallery gallery = new FolderGallery();

		// Get source file
		ConvertedFile sourceFile = uploadedFile.ConvertedFiles[0];
		if (sourceFile != null)
		{
			string folderName = uploadedFile.Package.PackageFields["folder"];
			if (!string.IsNullOrEmpty(folderName))
			{
				StringBuilder sb = new StringBuilder(folderName);
				foreach (char c in Path.GetInvalidFileNameChars())
				{
					sb.Replace(c, '_');
				}
				folderName = sb.ToString();
			}

			string path = Path.Combine(gallery.UploadedFilesAbsolutePath, folderName);

			if (!Directory.Exists(path))
			{
				Directory.CreateDirectory(path);
			}

			string sourceName = Utils.GetSafeFileName(path, uploadedFile.SourceName);
			// Save file to the disk
			sourceFile.SaveAs(Path.Combine(path, sourceName));

			gallery.Add(
				Path.Combine(folderName, sourceName).Replace('\\', '/'),
				Path.Combine(folderName, sourceName).Replace('\\', '/'),
				uploadedFile.Description
			);
		}

		gallery.Save();
	}
}