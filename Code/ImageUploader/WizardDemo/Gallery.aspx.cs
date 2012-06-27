using System;
using System.Collections.Generic;

public partial class WizardDemo_Gallery : System.Web.UI.Page
{

	Dictionary<string, string> _commonInfo;
	protected Dictionary<string, string> CommonInfo
	{
		get
		{
			if (_commonInfo == null)
			{
				_commonInfo = LoadCommonInfo();
			}
			return _commonInfo;
		}
	}

	private Dictionary<string, string> LoadCommonInfo()
	{
		return new WizardGallery().GetCommonInfo();
	}

    protected void Page_Load(object sender, EventArgs e)
    {
		if (!IsPostBack)
		{
			ThumbnailsGallery gallery = new ThumbnailsGallery();
			UploadedFilesRepeater.DataSource = gallery.GetItems();
			DataBind();
		}
    }
}