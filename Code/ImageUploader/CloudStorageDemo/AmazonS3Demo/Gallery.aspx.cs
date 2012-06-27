using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using com.amazonaws.s3.doc;
using System.IO;

public partial class AmazonS3_Gallery : System.Web.UI.Page
{
	private readonly string _destinationFolder = "ImageUploader7/";

	public AmazonS3_Gallery()
	{
		if (!_destinationFolder.EndsWith("/"))
		{
			_destinationFolder += "/";
		}
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			string bucket = ConfigurationManager.AppSettings["AmazonS3_Bucket"];
			string AWSAccessKeyId = ConfigurationManager.AppSettings["AmazonS3_AWSAccessKeyId"];
			string secretAccessKey = ConfigurationManager.AppSettings["AmazonS3_SecretAccessKey"];

			AmazonS3 service = new com.amazonaws.s3.doc.AmazonS3();
			DateTime dt = new DateTime(DateTime.Now.ToUniversalTime().Ticks, DateTimeKind.Utc);
			dt = new DateTime(dt.Year, dt.Month, dt.Day, dt.Hour, dt.Minute, dt.Second, DateTimeKind.Utc);
			// Signature is concatenation of "AmazonS3" + OPERATION + Timestamp
			string signature = "AmazonS3" + "ListBucket" + dt.ToString("s") + ".000Z";
			// and create HMAC-SHA1 digest for concatenated string
			signature = AmazonS3Helper.CreateSignature(signature, secretAccessKey);

			// Get list of objects from Amazon S3
			ListBucketResult result = service.ListBucket(bucket, _destinationFolder + "original/", null, 0, false, "/", AWSAccessKeyId, dt, true, signature, null);

			if (result.Contents != null)
			{
				List<Dictionary<string, string>> images = new List<Dictionary<string, string>>(result.Contents.Length);
				string baseUrl = Request.Url.Scheme + "://" + bucket + ".s3.amazonaws.com/";

				foreach (ListEntry item in result.Contents)
				{
					string key = item.Key;

					string url = baseUrl + HttpUtility.UrlPathEncode(key);

					string thumbnailUrl0 = key.Replace("/original/", "/small/") + "_Thumbnail0.jpg";
					thumbnailUrl0 = baseUrl + HttpUtility.UrlPathEncode(thumbnailUrl0);

					string thumbnailUrl1 = key.Replace("/original/", "/large/") + "_Thumbnail1.jpg";
					thumbnailUrl1 = baseUrl + HttpUtility.UrlPathEncode(thumbnailUrl1);

					string name = Path.GetFileName(key);

					Dictionary<string, string> image = new Dictionary<string, string>();
					image.Add("name", name);
					image.Add("thumbnailUrl0", thumbnailUrl0);
					image.Add("thumbnailUrl1", thumbnailUrl1);
					image.Add("url", url);

					images.Add(image);
				}

				UploadedFilesRepeater.DataSource = images;
				UploadedFilesRepeater.DataBind();
			}
		}
	}
}