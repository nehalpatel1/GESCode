<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Gallery.aspx.cs"
	Inherits="CropImages_Gallery" %>

<%@ Import Namespace="System.Collections.Generic" %>
<asp:content id="Content1" contentplaceholderid="head" runat="Server">
</asp:content>
<asp:content id="Content2" contentplaceholderid="content" runat="Server">
	<div class="gallery">
		<ul class="gallery-image-list">
			<asp:Repeater ID="UploadedFilesRepeater" runat="server">
				<ItemTemplate>
					<li class="item">
						<img class="preview" alt="<%# Server.HtmlEncode(((Dictionary<string, string>)(Container.DataItem))["name"])%>"
							title="<%# Server.HtmlEncode(((Dictionary<string, string>)(Container.DataItem))["name"])%>"
							src="<%# ((Dictionary<string, string>)(Container.DataItem))["thumbnailUrl0"] %>" />
					</li>
				</ItemTemplate>
			</asp:Repeater>
		</ul>
	</div>
</asp:content>
