<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Gallery.aspx.cs"
	Inherits="Nirvanix_Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link href="../../Libraries/fancybox/jquery.fancybox-1.3.1.css" rel="stylesheet"
		type="text/css" />
	<script src="../../Libraries/fancybox/jquery.fancybox-1.3.1.pack.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function () {
			$('a.fancybox').fancybox();
		});
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<div class="gallery">
		<ul class="gallery-image-list">
			<asp:Repeater ID="UploadedFilesRepeater" runat="server">
				<ItemTemplate>
					<li class="item wide-item">
						<img class="preview" alt="<%# Server.HtmlEncode(((Dictionary<string, string>)(Container.DataItem))["name"])%>"
							title="<%# Server.HtmlEncode(((Dictionary<string, string>)(Container.DataItem))["name"])%>"
							src="<%# ((Dictionary<string, string>)(Container.DataItem))["thumbnailUrl0"] %>" />
						<ul class="data">
							<li><a class="fancybox" target="_blank" rel="small" href="<%# ((Dictionary<string, string>)(Container.DataItem))["thumbnailUrl0"] %>">
								small &gt;&gt;</a></li>
							<li><a class="fancybox" target="_blank" rel="large" href="<%# ((Dictionary<string, string>)(Container.DataItem))["thumbnailUrl1"] %>">
								large &gt;&gt;</a></li>
							<li><a class="fancybox" target="_blank" rel="original" href="<%# ((Dictionary<string, string>)(Container.DataItem))["thumbnailUrl2"] %>">
								original &gt;&gt;</a></li>
						</ul>
					</li>
				</ItemTemplate>
			</asp:Repeater>
		</ul>
	</div>
</asp:Content>
