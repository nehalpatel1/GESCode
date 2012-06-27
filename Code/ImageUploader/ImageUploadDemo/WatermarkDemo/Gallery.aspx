<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Gallery.aspx.cs"
	Inherits="WatermarkDemo_Gallery" %>

<%@ Import Namespace="System.Collections.Generic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link rel="stylesheet" type="text/css" href="../../Libraries/fancybox/jquery.fancybox-1.3.1.css" />
	<script src="../../Libraries/fancybox/jquery.fancybox-1.3.1.pack.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function () { $('a.fancybox').fancybox(); });
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<div class="gallery">
		<ul class="gallery-image-list">
			<asp:Repeater ID="UploadedFilesRepeater" runat="server">
				<ItemTemplate>
					<li class="item"><a class="fancybox" rel="original" target="_blank" href="<%# ((Dictionary<string, string>)(Container.DataItem))["url"] %>">
						<img class="preview" alt="<%# Server.HtmlEncode(((Dictionary<string, string>)(Container.DataItem))["name"])%>"
							title="<%# Server.HtmlEncode(((Dictionary<string, string>)(Container.DataItem))["name"])%>"
							src="<%# ((Dictionary<string, string>)(Container.DataItem))["thumbnailUrl0"] %>" />
					</a></li>
				</ItemTemplate>
			</asp:Repeater>
		</ul>
	</div>
</asp:Content>
