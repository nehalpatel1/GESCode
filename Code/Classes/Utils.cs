using System;
using System.Collections.Generic;
using System.Web;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;

/// <summary>
/// Summary description for Utils
/// </summary>
public static class Utils
{
	public static string ResolveApplicationUrl(string applicationPath, string url)
	{
		if (url.StartsWith("~/"))
		{
			url = applicationPath + url.Substring(1);
		}
		return url;
	}

	public static string GetSafeFileName(string directory, string name)
	{
		// Replace special characters
		StringBuilder sb = new StringBuilder(name);
		foreach (char c in Path.GetInvalidFileNameChars())
		{
			sb.Replace(c, '_');
		}
		name = sb.ToString();

		// Rename duplicates
		if (File.Exists(Path.Combine(directory, name)))
		{
			int i = 1;
			string baseName = Path.GetFileNameWithoutExtension(name);
			string ext = Path.GetExtension(name);
			while (File.Exists(Path.Combine(directory, baseName + "_" + i.ToString() + ext)))
			{
				i++;
			}
			return baseName + "_" + i.ToString() + ext;
		}
		else
		{
			return name;
		}
	}
}