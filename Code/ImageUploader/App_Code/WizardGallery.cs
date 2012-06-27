using System;
using System.Collections.Generic;
using System.Web;
using System.Xml;
using System.Globalization;
using System.IO;

public class WizardGallery : ThumbnailsGallery
{
	public WizardGallery()
		: base()
	{ }

	/// <summary>
	/// Update common information
	/// </summary>
	/// <param name="values"></param>
	public void UpdateCommonInfo(Dictionary<string, string> values)
	{
		XmlDocument common = FilesXml;

		foreach (KeyValuePair<string, string> value in values)
		{
			if (!string.IsNullOrEmpty(value.Key))
			{
				XmlAttribute attr = common.CreateAttribute(value.Key);
				attr.Value = value.Value;
				common.DocumentElement.Attributes.Append(attr);
			}
		}
	}

	/// <summary>
	/// Get common information
	/// </summary>
	/// <returns></returns>
	public Dictionary<string, string> GetCommonInfo()
	{
		XmlDocument commonXml = FilesXml;
		Dictionary<string, string> values = new Dictionary<string, string>();
		foreach (XmlAttribute attr in commonXml.DocumentElement.Attributes)
		{
			values.Add(attr.LocalName, attr.Value);
		}
		return values;
	}
}