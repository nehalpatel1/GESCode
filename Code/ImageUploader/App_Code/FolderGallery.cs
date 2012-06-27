using System;
using System.Collections.Generic;
using System.Web;
using System.IO;
using System.Globalization;

/// <summary>
/// Summary description for FolderGallery
/// </summary>
public class FolderGallery : SourceGallery
{
	public FolderGallery()
		: base()
	{ }

	public override IEnumerable<Dictionary<string, string>> GetItems()
	{
		return GetItems(null);
	}

	private IEnumerable<Dictionary<string, string>> GetItemsInternal()
	{
		return base.GetItems();
	}

	public virtual IEnumerable<Dictionary<string, string>> GetItems(string path)
	{
		Dictionary<string, string> parent = new Dictionary<string, string>();
		parent.Add("name", "..");
		parent.Add("directory", "1");
		if (string.IsNullOrEmpty(path))
		{
			parent.Add("url", "?");
		}
		else
		{
			parent.Add("url", "?path=" + Uri.EscapeDataString(Path.GetDirectoryName(path).Replace('\\', '/')));
		}

		yield return parent;

		if (string.IsNullOrEmpty(path))
		{
			path = "";
		}
		else
		{
			path += "/";
		}

		List<Dictionary<string, string>> items = new List<Dictionary<string, string>>(GetItemsInternal());
		List<string> names = new List<string>(items.Count);
		List<Dictionary<string, string>> sortedItems = new List<Dictionary<string, string>>(items.Count);

		foreach (Dictionary<string, string> item in items)
		{
			string name = item["name"];
			if (name.StartsWith(path))
			{
				name = name.Substring(path.Length);
				string newName = name.Split('/')[0];
				if (!names.Contains(newName))
				{
					names.Add(newName);
					if (name != newName)
					{
						// Directory
						item["url"] = "?path=" + Uri.EscapeDataString(path + newName);
						item.Add("directory", "1");
						item.Add("size", "Folder");

						item.Remove("description");
					}
					else
					{
						FileInfo file = new FileInfo(Context.Request.MapPath(HttpUtility.UrlDecode(item["url"])));
						if (file.Exists)
						{
							item.Add("size", file.Length.ToString(CultureInfo.InvariantCulture));
						}
						else
						{
							item.Add("size", "0");
						}
					}
					item["name"] = newName;
					sortedItems.Add(item);
				}
			}
		}

		sortedItems.Sort(delegate(Dictionary<string, string> a, Dictionary<string, string> b)
		{
			if (a.ContainsKey("directory") && !b.ContainsKey("directory"))
			{
				return -1;
			}
			else if (!a.ContainsKey("directory") && b.ContainsKey("directory"))
			{
				return 1;
			}
			else
			{
				return string.Compare(a["name"], b["name"], true);
			}
		});

		foreach (Dictionary<string, string> item in sortedItems)
		{
			yield return item;
		}
	}
}