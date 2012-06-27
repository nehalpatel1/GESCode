﻿<%@ WebHandler Language="C#" Class="fancybox_ie" %>

using System;
using System.Web;

/// <summary>
/// CSS AlphaImageLoader filter requires path relative to the page, but not to the css file.
/// </summary>
public class fancybox_ie : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/css";
		context.Response.Cache.SetExpires(DateTime.Now.AddYears(1));
		
		string siteRoot = VirtualPathUtility.ToAbsolute("~/");
		string css = string.Format(@"
			/* IE */

			#fancybox-loading.fancybox-ie div	{{ background: transparent; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='{0}Libraries/fancybox/fancy_loading.png', sizingMethod='scale'); }}
			.fancybox-ie #fancybox-close		{{ background: transparent; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='{0}Libraries/fancybox/fancy_close.png', sizingMethod='scale'); }}

			.fancybox-ie #fancybox-title-over	{{ background: transparent; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='{0}Libraries/fancybox/fancy_title_over.png', sizingMethod='scale'); zoom: 1; }}
			.fancybox-ie #fancybox-title-left	{{ background: transparent; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='{0}Libraries/fancybox/fancy_title_left.png', sizingMethod='scale'); }}
			.fancybox-ie #fancybox-title-main	{{ background: transparent; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='{0}Libraries/fancybox/fancy_title_main.png', sizingMethod='scale'); }}
			.fancybox-ie #fancybox-title-right	{{ background: transparent; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='{0}Libraries/fancybox/fancy_title_right.png', sizingMethod='scale'); }}

			.fancybox-ie #fancybox-left-ico		{{ background: transparent; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='{0}Libraries/fancybox/fancy_nav_left.png', sizingMethod='scale'); }}
			.fancybox-ie #fancybox-right-ico	{{ background: transparent; filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='{0}Libraries/fancybox/fancy_nav_right.png', sizingMethod='scale'); }}

			.fancybox-ie .fancy-bg {{ background: transparent !important; }}

			.fancybox-ie #fancy-bg-n	{{ filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='{0}Libraries/fancybox/fancy_shadow_n.png', sizingMethod='scale'); }}
			.fancybox-ie #fancy-bg-ne	{{ filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='{0}Libraries/fancybox/fancy_shadow_ne.png', sizingMethod='scale'); }}
			.fancybox-ie #fancy-bg-e	{{ filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='{0}Libraries/fancybox/fancy_shadow_e.png', sizingMethod='scale'); }}
			.fancybox-ie #fancy-bg-se	{{ filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='{0}Libraries/fancybox/fancy_shadow_se.png', sizingMethod='scale'); }}
			.fancybox-ie #fancy-bg-s	{{ filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='{0}Libraries/fancybox/fancy_shadow_s.png', sizingMethod='scale'); }}
			.fancybox-ie #fancy-bg-sw	{{ filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='{0}Libraries/fancybox/fancy_shadow_sw.png', sizingMethod='scale'); }}
			.fancybox-ie #fancy-bg-w	{{ filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='{0}Libraries/fancybox/fancy_shadow_w.png', sizingMethod='scale'); }}
			.fancybox-ie #fancy-bg-nw	{{ filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='{0}Libraries/fancybox/fancy_shadow_nw.png', sizingMethod='scale'); }}
		", siteRoot);

		context.Response.Write(css);
    }
 
    public bool IsReusable {
        get {
			return true; ;
        }
    }

}