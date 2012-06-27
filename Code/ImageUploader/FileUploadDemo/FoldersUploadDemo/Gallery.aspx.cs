using System;

public partial class FolderUpload_Gallery : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			FolderGallery gallery = new FolderGallery();
			UploadedFilesRepeater.DataSource = gallery.GetItems(Request.QueryString["path"]);
			UploadedFilesRepeater.DataBind();
		}
	}
}