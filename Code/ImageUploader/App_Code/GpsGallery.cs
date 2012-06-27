using System;
using System.Collections.Generic;
using System.Web;
using System.Text.RegularExpressions;
using System.Globalization;

/// <summary>
/// Summary description for ExifGallery
/// </summary>
public class GpsGallery : ThumbnailsGallery
{
	private const string LatitudeAttributeName = "latitude";
	private const string LongitudeAttributeName = "longitude";

	public GpsGallery()
		: base()
	{ }

	public void Add(string name, string sourceFile, string[] thumbnails, string description, double? latitude, double? longitude, string size, string dimension)
	{
		Dictionary<string, string> attributes = FillAttributes(name, sourceFile, thumbnails, description, latitude, longitude, size, dimension);
		Add(attributes);
	}

	protected Dictionary<string, string> FillAttributes(string name, string sourceFile, string[] thumbnails, string description, double? latitude, double? longitude, string size, string dimension)
	{
		Dictionary<string, string> attributes = base.FillAttributes(name, sourceFile, thumbnails, description);

		if (latitude.HasValue)
		{
			attributes.Add(LatitudeAttributeName, latitude.Value.ToString(CultureInfo.InvariantCulture));
		}
		else
		{
			attributes.Add(LatitudeAttributeName, "");
		}

		if (longitude.HasValue)
		{
			attributes.Add(LongitudeAttributeName, longitude.Value.ToString(CultureInfo.InvariantCulture));
		}
		else
		{
			attributes.Add(LongitudeAttributeName, "");
		}

		attributes.Add("size", size);
		attributes.Add("dimension", dimension);

		return attributes;
	}

	protected override Dictionary<string, string> GetItem(System.Xml.XmlElement node)
	{
		Dictionary<string, string> item = base.GetItem(node);

		item.Add("latitude", node.GetAttribute(LatitudeAttributeName));
		item.Add("longitude", node.GetAttribute(LongitudeAttributeName));
		item.Add("size", node.GetAttribute("size"));
		item.Add("dimension", node.GetAttribute("dimension"));

		return item;
	}

	public double? ParseCoordinate(string coordinate, string coordinateRef)
	{
		if (string.IsNullOrEmpty(coordinate) || string.IsNullOrEmpty(coordinateRef))
		{
			return null;
		}

		Regex rg = new Regex(@"^(\d+)/(\d+) (\d+)/(\d+) (\d+)/(\d+)$", RegexOptions.Compiled);
		Match m = rg.Match(coordinate);

		if (!m.Success)
		{
			return null;
		}

		double[] matches = new double[] {1, double.Parse(m.Groups[1].Value), double.Parse(m.Groups[2].Value), double.Parse(m.Groups[3].Value), 
			double.Parse(m.Groups[4].Value), double.Parse(m.Groups[5].Value), double.Parse(m.Groups[6].Value)};

		if (coordinateRef.ToLower() == "w" || coordinateRef.ToLower() == "s")
		{
			matches[0] = -1;
		}
		return (matches[5] / matches[6] / 3600 + matches[3] / matches[4] / 60 + matches[1] / matches[2]) * matches[0];
	}
}