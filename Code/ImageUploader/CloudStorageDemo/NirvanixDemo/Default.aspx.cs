using System;
using System.Configuration;

public partial class Nirvanix_Default : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (ValidateNirvanixSettings())
		{
			errorMessage.Visible = false;
			Uploader1.Visible = true;
			NirvanixExtender1.Visible = true;
		}
		else
		{
			errorMessage.Visible = true;
			Uploader1.Visible = false;
			NirvanixExtender1.Visible = false;
		}
	}

	protected bool ValidateNirvanixSettings()
	{
		bool isValid = !string.IsNullOrEmpty(ConfigurationManager.AppSettings["Nirvanix_AppKey"]) &&
			!string.IsNullOrEmpty(ConfigurationManager.AppSettings["Nirvanix_Username"]) &&
			!string.IsNullOrEmpty(ConfigurationManager.AppSettings["Nirvanix_Password"]);
		return isValid;
	}

}