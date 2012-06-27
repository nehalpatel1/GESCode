using System;
using System.IO;
using Aurigma.ImageUploader;

public partial class FolderUpload_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

	protected void Uploader1_FileUploaded(object sender, FileUploadedEventArgs e)
	{
		UploadedFile uploadedFile = e.UploadedFile;
		FolderGallery gallery = new FolderGallery();

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
			string relativePath = uploadedFile.RelativePath;
			if (!string.IsNullOrEmpty(relativePath) && relativePath[0] == '\\')
			{
				relativePath = relativePath.Substring(1);
			}
			string path = Path.Combine(gallery.UploadedFilesAbsolutePath, relativePath);

			if (!Directory.Exists(path))
			{
				Directory.CreateDirectory(path);
			}

			string sourceName = Utils.GetSafeFileName(path, uploadedFile.SourceName);
			// Save file to the disk
			sourceFile.SaveAs(Path.Combine(path, sourceName));

			gallery.Add(
				Path.Combine(relativePath,
				uploadedFile.SourceName).Replace('\\', '/'),
				Path.Combine(relativePath, sourceName).Replace('\\', '/'),
				null
			);
		}

		gallery.Save();
	}
}