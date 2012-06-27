using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Configuration;
using System.Collections.Specialized;
using System.Xml;
using System.IO;

/// <summary>
/// Base gallery class
/// </summary>
public class BaseGallery
{
	private NameValueCollection _settings;
	private HttpContext _context;
	private XmlDocument _filesXml;
	private string _uploadedFilesAbsolutePath;
	private string _thumbnailsAbsolutePath;

	public BaseGallery()
	{ }

	public BaseGallery(HttpContext context, NameValueCollection settings)
	{
		_context = context;
		_settings = settings;
	}

	public virtual NameValueCollection Settings
	{
		get
		{
			if (_settings == null)
			{
				_settings = WebConfigurationManager.AppSettings;
			}
			return _settings;
		}
		set
		{
			_settings = value;
		}
	}

	protected virtual HttpContext Context
	{
		get
		{
			if (_context == null)
			{
				_context = HttpContext.Current;
			}
			return _context;
		}
		set
		{
			_context = value;
		}
	}

	public virtual string UploadedFilesVirtualPath
	{
		get
		{
			return Settings["UploadedFilesPath"].TrimEnd('/', '\\');
		}
	}

	public virtual string ThumbnailsVirtualPath
	{
		get
		{
			return UploadedFilesVirtualPath + "/Thumbnails";
		}
	}

	public virtual string UploadedFilesAbsolutePath
	{
		get
		{
			if (_uploadedFilesAbsolutePath == null)
			{
				_uploadedFilesAbsolutePath = Context.Server.MapPath(UploadedFilesVirtualPath);

				if (!Directory.Exists(_uploadedFilesAbsolutePath))
				{
					Directory.CreateDirectory(_uploadedFilesAbsolutePath);
				}
			}

			return _uploadedFilesAbsolutePath;
		}
	}

	public virtual string ThumbnailsAbsolutePath
	{
		get
		{
			if (_thumbnailsAbsolutePath == null)
			{
				_thumbnailsAbsolutePath = Context.Server.MapPath(ThumbnailsVirtualPath);

				if (!Directory.Exists(_thumbnailsAbsolutePath))
				{
					Directory.CreateDirectory(_thumbnailsAbsolutePath);
				}
			}

			return _thumbnailsAbsolutePath;
		}
	}

	protected XmlDocument FilesXml
	{
		get
		{
			if (_filesXml == null)
			{
				_filesXml = LoadFilesXml();
			}
			return _filesXml;
		}
	}

	private XmlDocument LoadFilesXml()
	{
		if (_filesXml == null)
		{
			_filesXml = new XmlDocument();

			string filePath = Path.Combine(UploadedFilesAbsolutePath, "files.xml");
			if (File.Exists(filePath))
			{
				_filesXml.Load(filePath);
			}
			else
			{
				_filesXml.AppendChild(_filesXml.CreateXmlDeclaration("1.0", "UTF-8", "yes"));
				_filesXml.AppendChild(_filesXml.CreateElement("files"));
			}
		}

		return _filesXml;
	}

	/// <summary>
	/// Save gallery xml files to the disk
	/// </summary>
	public virtual void Save()
	{
		if (_filesXml != null)
		{
			_filesXml.Save(Path.Combine(UploadedFilesAbsolutePath, "files.xml"));
		}
	}

	/// <summary>
	/// Clear gallery
	/// </summary>
	public void Empty()
	{
		foreach (string file in Directory.GetFiles(UploadedFilesAbsolutePath))
		{
			File.Delete(file);
		}

		foreach (string directory in Directory.GetDirectories(UploadedFilesAbsolutePath))
		{
			try
			{
				Directory.Delete(directory, true);
			}
			catch { }
		}

		_filesXml = null;
	}

	public virtual IEnumerable<Dictionary<string, string>> GetItems()
	{
		foreach (XmlElement node in FilesXml.DocumentElement.ChildNodes)
		{
			yield return GetItem(node);
		}
	}

	protected virtual Dictionary<string, string> GetItem(XmlElement node)
	{
		return new Dictionary<string, string>();
	}

	protected XmlElement Add(Dictionary<string, string> attributes)
	{
		XmlDocument filesXml = FilesXml;
		XmlElement fileElement = filesXml.CreateElement("file");

		foreach (KeyValuePair<string, string> a in attributes)
		{
			if (!string.IsNullOrEmpty(a.Key) && !string.IsNullOrEmpty(a.Value))
			{
				XmlAttribute attribute = filesXml.CreateAttribute(a.Key);
				attribute.Value = a.Value;
				fileElement.Attributes.Append(attribute);
			}
		}

		filesXml.DocumentElement.AppendChild(fileElement);
		return fileElement;
	}
}