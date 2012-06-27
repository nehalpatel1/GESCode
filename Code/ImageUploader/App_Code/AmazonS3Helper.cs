using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for AmazonS3Helper
/// </summary>
public static class AmazonS3Helper
{
	public static string ConstructPolicy(string bucket, DateTime expirationDate, string acl, string key)
	{
		// See about policy construction 
		// http://docs.amazonwebservices.com/AmazonS3/2006-03-01/dev/HTTPPOSTForms.html#HTTPPOSTConstructPolicy	

		string policy = string.Format(@"
			{{ 'expiration': '{0}.000Z',
				'conditions': [
					{{ 'acl': '{1}' }},
					{{ 'bucket': '{2}' }},
					{{ 'success_action_status': '200' }},
					[ 'starts-with', '$key', '' ]
				]
			}}", expirationDate.ToString("s"), acl, bucket);

		// Encode the policy using UTF-8.
		byte[] pb = System.Text.Encoding.UTF8.GetBytes(policy.ToString());

		// Encode those UTF-8 bytes using Base64 and return.
		return Convert.ToBase64String(pb);
	}

	public static string CreateSignature(string policy, string secretAccessKey)
	{
		// Sign the policy with your Secret Access Key using HMAC SHA-1.
		System.Security.Cryptography.HMACSHA1 hmac = new System.Security.Cryptography.HMACSHA1();
		hmac.Key = System.Text.Encoding.UTF8.GetBytes(secretAccessKey);

		byte[] signb = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(policy));

		// Encode the SHA-1 signature using Base64.
		return Convert.ToBase64String(signb);
	}
}
