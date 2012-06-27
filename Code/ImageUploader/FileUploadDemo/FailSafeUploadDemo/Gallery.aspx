<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Gallery.aspx.cs"
	Inherits="ReliableUpload_Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
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
</asp:Content>
