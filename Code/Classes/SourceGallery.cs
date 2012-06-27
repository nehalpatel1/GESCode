using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Gallery which contains source file only
/// </summary>
public class SourceGallery : BaseGallery
{
	public SourceGallery()
		: base()
	{ }

	public void Add(string name, string sourceFile, string description)
	{
		Dictionary<string, string> attributes = FillAttributes(name, sourceFile, description);
		base.Add(attributes);
	}

	protected Dictionary<string, string> FillAttributes(string name, string sourceFile, string description)
	{
		Dictionary<string, string> attributes = new Dictionary<string, string>(3);
		attributes.Add("name", name);
		attributes.Add("source", sourceFile);
		attributes.Add("description", description);
		return attributes;
	}

	protected override Dictionary<string, string> GetItem(System.Xml.XmlElement node)
	{
		Dictionary<string, string> item = new Dictionary<string, string>();
		string name = node.GetAttribute("name");
		string sourceFile = node.GetAttribute("source");
		string description = node.GetAttribute("description");

		string sourceFileUrl = Utils.ResolveApplicationUrl(Context.Request.ApplicationPath, UploadedFilesVirtualPath + "/" + sourceFile);
		sourceFileUrl = HttpUtility.UrlPathEncode(sourceFileUrl);

		item.Add("name", name);
		item.Add("url", sourceFileUrl);
		item.Add("description", description);

		return item;
	}
}