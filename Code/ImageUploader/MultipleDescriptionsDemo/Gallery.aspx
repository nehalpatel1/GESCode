<%@ Page Title="" Language="C#" AutoEventWireup="true"
	CodeFile="Gallery.aspx.cs" Inherits="MultipleDescriptions_Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link href="../Libraries/fancybox/jquery.fancybox-1.3.1.css" rel="stylesheet" type="text/css" />
	<link href="../Styles/fancybox-ie.ashx" rel="stylesheet" type="text/css" />
	<script src="../Libraries/fancybox/jquery.fancybox-1.3.1.pack.js" type="text/javascript"></script>
	<script type="text/javascript">

		$(function () {
			$('a.fancybox').fancybox({
				'titlePosition': 'inside',
				'titleFormat': function (title, currentArray, currentIndex, currentOpts) {
					// Get image description
					var desciption = $(currentArray[currentIndex]).children('.description').val();
					return '<div>' + (title && title.length ? '<b>' + title + '</b>' : '') + '<br/>' + desciption + '</div>';
				}
			});
		});
	
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<div class="gallery">
		<ul class="gallery-image-list">
			<asp:Repeater ID="UploadedFilesRepeater" runat="server">
				<ItemTemplate>
					<li class="item"><a class="fancybox" rel="gallery" target="_blank" href="<%# ((Dictionary<string, string>)(Container.DataItem))["thumbnailUrl1"] %>"
						title="<%# Server.HtmlEncode(((Dictionary<string, string>)(Container.DataItem))["name"])%>">
						<img class="preview" alt="<%# Server.HtmlEncode(((Dictionary<string, string>)(Container.DataItem))["name"])%>"
							src="<%# ((Dictionary<string, string>)(Container.DataItem))["thumbnailUrl0"] %>" />
						<input type="hidden" class="description" value="<%# HttpUtility.HtmlEncode(HttpUtility.HtmlEncode(((Dictionary<string, string>)(Container.DataItem))["description"]))%>" />
					</a></li>
				</ItemTemplate>
			</asp:Repeater>
		</ul>
	</div>
</asp:Content>
