using System;
using System.Collections.Generic;
using System.Web;
using System.Xml;
using System.Globalization;

/// <summary>
/// Summary description for ThumbnailsGallery
/// </summary>
public class ThumbnailsGallery : SourceGallery
{
	public ThumbnailsGallery()
		: base()
	{ }

	public void Add(string name, string sourceFile, string[] thumbnails, string description)
	{
		Dictionary<string, string> attributes = FillAttributes(name, sourceFile, thumbnails, description);
		Add(attributes);
	}

	protected Dictionary<string, string> FillAttributes(string name, string sourceFile, string[] thumbnails, string description)
	{
		Dictionary<string, string> attributes = base.FillAttributes(name, sourceFile, description);
		for (int i = 0; i < thumbnails.Length; i++)
		{
			if (!string.IsNullOrEmpty(thumbnails[i]))
			{
				string key = "thumbnail" + i.ToString(CultureInfo.InvariantCulture);
				attributes.Add(key, thumbnails[i]);
			}
		}
		return attributes;
	}

	protected override Dictionary<string, string> GetItem(XmlElement node)
	{
		Dictionary<string, string> item = base.GetItem(node);

		// Add thumbnails 
		foreach (XmlAttribute attribute in node.Attributes)
		{
			if (attribute.LocalName.StartsWith("thumbnail"))
			{
				string thumbnailFile = attribute.Value;

				if (!string.IsNullOrEmpty(thumbnailFile))
				{
					string thumbnailFileUrl = Utils.ResolveApplicationUrl(Context.Request.ApplicationPath, ThumbnailsVirtualPath + "/" + thumbnailFile);
					thumbnailFileUrl = HttpUtility.UrlPathEncode(thumbnailFileUrl);
					item.Add("thumbnailUrl" + attribute.LocalName.Substring("thumbnail".Length), thumbnailFileUrl);
				}
			}
		}

		return item;
	}
}