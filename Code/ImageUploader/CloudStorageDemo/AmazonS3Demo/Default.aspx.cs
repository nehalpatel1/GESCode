using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aurigma.ImageUploader;
using System.IO;
using System.Configuration;

public partial class AmazonS3_Default : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (ValidateAmazonS3Settings())
		{
			errorMessage.Visible = false;
			Uploader1.Visible = true;
			AmazonS3Extender1.Visible = true;
		}
		else
		{
			errorMessage.Visible = true;
			Uploader1.Visible = false;
			AmazonS3Extender1.Visible = false;
		}
	}

	protected bool ValidateAmazonS3Settings()
	{
		bool isValid = !string.IsNullOrEmpty(ConfigurationManager.AppSettings["AmazonS3_AWSAccessKeyId"]) &&
			!string.IsNullOrEmpty(ConfigurationManager.AppSettings["AmazonS3_Bucket"]) &&
			!string.IsNullOrEmpty(ConfigurationManager.AppSettings["AmazonS3_SecretAccessKey"]);
		return isValid;
	}
}