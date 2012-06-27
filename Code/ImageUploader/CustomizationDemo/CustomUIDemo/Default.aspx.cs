using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aurigma.ImageUploader;
using System.IO;

public partial class CustomUIDemo_Default : System.Web.UI.Page
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

	protected void themeLinkButton_Click(object sender, EventArgs e)
	{
		if (sender == grayThemeLinkButton)
		{
			Uploader1.HeaderColor = new GradientColor("#636363;#2d2d2d");
			
			Uploader1.PaneItem.HoverColor = new GradientColor("#f5f5f5;#dfdfdf");
			Uploader1.PaneItem.HoverBorderColor = System.Drawing.Color.FromArgb(0x7d, 0x7d, 0x7d);
			Uploader1.PaneItem.SelectionColor = new GradientColor("#f0f0f0;#cfcfcf");
			Uploader1.PaneItem.SelectionBorderColor = System.Drawing.Color.FromArgb(0x7d, 0x7d, 0x7d);
			Uploader1.PaneItem.SelectionHoverColor = new GradientColor("#f5f5f5;#dfdfdf");
			Uploader1.PaneItem.SelectionHoverBorderColor = System.Drawing.Color.FromArgb(0x7d, 0x7d, 0x7d);

			Uploader1.StatusPane.Color = new GradientColor("#efefef;#f6f6f6");

			uploadProgressDiv.Attributes["class"] = "progress progress-gray";
		}
		else if (sender == greenThemeLinkButton)
		{
			Uploader1.HeaderColor = new GradientColor("#49d159;#2e901d");
		
			Uploader1.PaneItem.HoverColor = new GradientColor("#f5fdf6;#f5fdf6");
			Uploader1.PaneItem.HoverBorderColor = System.Drawing.Color.FromArgb(0x99, 0xfd, 0xc1);
			Uploader1.PaneItem.SelectionColor = new GradientColor("#f0fdf9;#d5fcf2");
			Uploader1.PaneItem.SelectionBorderColor = System.Drawing.Color.FromArgb(153, 253, 193);
			Uploader1.PaneItem.SelectionHoverColor = new GradientColor("#e8fdf5;#c4fae8");
			Uploader1.PaneItem.SelectionHoverBorderColor = System.Drawing.Color.FromArgb(153, 253, 193);
			
			Uploader1.StatusPane.Color = new GradientColor("#a3d3a3;#81c076");

			uploadProgressDiv.Attributes["class"] = "progress progress-green";
		}
	}
}