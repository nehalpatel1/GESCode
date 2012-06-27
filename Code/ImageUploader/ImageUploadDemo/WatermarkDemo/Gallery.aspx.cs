using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WatermarkDemo_Gallery : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			ThumbnailsGallery gallery = new ThumbnailsGallery();
			UploadedFilesRepeater.DataSource = gallery.GetItems();
			UploadedFilesRepeater.DataBind();
		}
	}
}