using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using com.nirvanix.services;

public partial class Nirvanix_Gallery : System.Web.UI.Page
{
	private const int MaxPageSize = 500;

	protected void Page_Load(object sender, EventArgs e)
	{
		Authentication authService = new Authentication();
		string sessionToken = authService.Login(
			ConfigurationManager.AppSettings["Nirvanix_AppKey"],
			ConfigurationManager.AppSettings["Nirvanix_Username"],
			ConfigurationManager.AppSettings["Nirvanix_Password"]);

		IMFS fsService = new IMFS();
		FSFolderList folderList = fsService.ListFolder(sessionToken, "ImageUploader7/", 1, MaxPageSize, "", false);
		string[] pathArray = new string[folderList.TotalFileCount];
		for (int i = 0; i < pathArray.Length; i++)
		{
			pathArray[i] = folderList.File[i].Path;
		}
		Download[] links = fsService.GetDownloadLinks(sessionToken, pathArray, 3 * 24 * 3600, null);

		Dictionary<string, Dictionary<string, string>> images = new Dictionary<string, Dictionary<string, string>>();
		foreach (Download fileLink in links)
		{
			string key, type;
			string filePath = fileLink.FilePath;
			if (filePath.EndsWith("_Thumbnail0.jpg"))
			{
				// small thumbnail
				key = filePath.Remove(filePath.Length - 15);
				type = "small";
			}
			else if (filePath.EndsWith("_Thumbnail1.jpg"))
			{
				// large thumbnail
				key = filePath.Remove(filePath.Length - 15);
				type = "large";
			}
			else
			{
				// original file
				key = filePath;
				type = "original";
			}

			if (key != null)
			{
				Dictionary<string, string> image;
				if (!images.TryGetValue(key, out image))
				{
					image = new Dictionary<string, string>();
					images.Add(key, image);
				}

				switch (type)
				{
					case "small":
						image.Add("thumbnailUrl0", fileLink.DownloadURL);
						break;
					case "large":
						image.Add("thumbnailUrl1", fileLink.DownloadURL);
						break;
					case "original":
						image.Add("thumbnailUrl2", fileLink.DownloadURL);
						image.Add("name", Path.GetFileName(filePath));
						break;
				}
			}
		}

		UploadedFilesRepeater.DataSource = images.Values;
		UploadedFilesRepeater.DataBind();
	}
}