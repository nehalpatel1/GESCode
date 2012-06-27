using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ReliableUpload_Gallery : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			SourceGallery gallery = new SourceGallery();
			UploadedFilesRepeater.DataSource = gallery.GetItems();
			UploadedFilesRepeater.DataBind();
		}
	}
}