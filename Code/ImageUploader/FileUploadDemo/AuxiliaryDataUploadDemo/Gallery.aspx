<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Gallery.aspx.cs"
	Inherits="AuxiliaryDataUpload_Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<div class="gallery">
		<table class="gallery-link-table" cellpadding="0" cellspacing="0">
			<thead>
				<tr class="head">
					<th class="col-name">
						Name
					</th>
					<th class="col-size">
						Size
					</th>
					<th class="col-description">
						Description
					</th>
				</tr>
			</thead>
			<tbody>
				<% int i = 0; %>
				<% foreach (Dictionary<string, string> item in new FolderGallery().GetItems(Request.QueryString["path"]))
	   {
		   bool isDir = item.ContainsKey("directory");
		   i++;
				%>
				<tr class="<%= (i%2 == 0 ? "even" : "odd") + " " + (isDir ? "directory" : "") %>">
					<td class="col-name">
						<a <% if (!isDir) { %>target="_blank" <% } %> href="<%= item["url"] %>">
							<%= Server.HtmlEncode(item["name"])%></a>
					</td>
					<td class="col-size">
						<% if (item.ContainsKey("size")) Response.Write(HttpUtility.HtmlEncode(item["size"])); %>
					</td>
					<td class="col-description">
						<% if (item.ContainsKey("description")) Response.Write(HttpUtility.HtmlEncode(item["description"])); %>
					</td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</asp:Content>
