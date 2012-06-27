<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Gallery.aspx.cs"
	Inherits="PhotoOptimization_Gallery" %>

<asp:content id="Content1" contentplaceholderid="head" runat="Server">
</asp:content>
<asp:content id="Content2" contentplaceholderid="content" runat="Server">
	<div class="gallery">
		<ul class="gallery-link-list">
			<asp:Repeater ID="UploadedFilesRepeater" runat="server">
				<ItemTemplate>
					<li><a target="_blank" href="<%# ((Dictionary<string, string>)(Container.DataItem))["url"] %>">
						<%# Server.HtmlEncode(((Dictionary<string, string>)(Container.DataItem))["name"])%></a></li>
				</ItemTemplate>
			</asp:Repeater>
		</ul>
	</div>
</asp:content>
