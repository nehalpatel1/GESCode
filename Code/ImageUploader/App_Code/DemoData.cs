using System.Collections.Generic;
using System.Web;
using System.Xml;

/// <summary>
/// Summary description for DemoData
/// </summary>
public static class DemoData
{
	private static Dictionary<string, XmlElement> _xmlDemo = null;

	private static Dictionary<string, XmlElement> XmlDemo
	{
		get
		{
			if (_xmlDemo == null)
			{
				XmlDocument xmlDoc = new XmlDocument();
                xmlDoc.Load(HttpContext.Current.Server.MapPath("/ImageUploader/demos.xml"));
				XmlNodeList list = xmlDoc.SelectNodes("//demo[@key]");
				_xmlDemo = new Dictionary<string, XmlElement>(list.Count);
				foreach (XmlElement node in list)
				{
					_xmlDemo.Add(node.GetAttribute("key"), node);
				}
			}
			return _xmlDemo;
		}
	}

	public static string GetShortDescription(string key)
	{
		return GetNodeValue(key, "shortDescription");
	}

	public static string GetFullDescription(string key)
	{
		return GetNodeValue(key, "fullDescription");
	}

	public static XmlElement GetDemoNode(string key)
	{
		if (key != null && XmlDemo.ContainsKey(key))
		{
			return XmlDemo[key];
		}
		else
		{
			return null;
		}
	}

	public static string GetSourcePath(string key, string platform, string file)
	{
		XmlElement demoNode = GetDemoNode(key);
		if (demoNode == null)
			return "";
		
		demoNode.OwnerDocument.DocumentElement.SetAttribute("paramPlatform", platform);
		demoNode.OwnerDocument.DocumentElement.SetAttribute("paramFile", file);

		return demoNode.SelectSingleNode("files/platform[@title=/demos/@paramPlatform]/file[@name=/demos/@paramFile]/@location").Value;
	}

	private static string GetNodeValue(string key, string nodeName)
	{
		if (XmlDemo.ContainsKey(key))
		{
			return XmlDemo[key].SelectSingleNode(nodeName).InnerXml;
		}
		else
		{
			return "";
		}
	}
}