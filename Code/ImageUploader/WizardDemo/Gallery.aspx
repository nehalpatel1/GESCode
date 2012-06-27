<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Gallery.aspx.cs"
	Inherits="WizardDemo_Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link href="../Libraries/fancybox/jquery.fancybox-1.3.1.css" rel="stylesheet" type="text/css" />
	<link href="../Styles/fancybox-ie.ashx" rel="stylesheet" type="text/css" />
	<link href="multistepwizard.css" rel="stylesheet" type="text/css" />
	<script src="../Libraries/fancybox/jquery.fancybox-1.3.1.pack.js" type="text/javascript"></script>
	<script type="text/javascript">

		$(function () { $('a.fancybox').fancybox(); });
  
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<div class="gallery">
		<fieldset class="content-block">
			<div class="row">
				<span class="caption">Type&nbsp;of&nbsp;property</span><span class="value"><%= CommonInfo["propertytype"] %></span>
			</div>
			<div class="row">
				<span class="caption">Headline</span><span class="value"><%= CommonInfo["headline"]%></span>
			</div>
			<div class="row">
				<span class="caption">Description</span><span class="value"><%= CommonInfo["description"]%></span>
			</div>
			<div class="row">
				<span class="caption">Price</span><span class="value"><%= CommonInfo["price"]%></span>
			</div>
		</fieldset>
		<fieldset class="content-block">
			<legend>Address</legend>
			<div class="row">
				<span class="caption">Building Number</span><span class="value"><%= CommonInfo["number"]%></span>
			</div>
			<div class="row">
				<span class="caption">Street</span><span class="value"><%= CommonInfo["street"]%></span>
			</div>
			<div class="row">
				<span class="caption">City</span><span class="value"><%= CommonInfo["city"]%></span>
			</div>
			<div class="row">
				<span class="caption">Zip Code</span><span class="value"><%= CommonInfo["zipcode"]%></span>
			</div>
		</fieldset>
		<fieldset class="content-block">
			<legend>Details</legend>
			<div class="row">
				<span class="caption">#&nbsp;Bedrooms</span><span class="value"><%= CommonInfo["bedrooms"]%></span>
			</div>
			<div class="row">
				<span class="caption">#&nbsp;Bathrooms</span><span class="value"><%= CommonInfo["bathrooms"]%></span>
			</div>
			<div class="row">
				<span class="caption">Square Feet</span><span class="value"><%= CommonInfo["square"]%></span>
			</div>
		</fieldset>
		<fieldset class="content-block">
			<legend>Photos</legend>
			<ul class="gallery-image-list">
				<asp:Repeater ID="UploadedFilesRepeater" runat="server">
					<ItemTemplate>
						<li class="item"><a class="fancybox" rel="original" target="_blank" href="<%# ((Dictionary<string, string>)(Container.DataItem))["url"] %>">
							<img class="preview" alt="<%# Server.HtmlEncode(((Dictionary<string, string>)(Container.DataItem))["name"])%>"
								title="<%# Server.HtmlEncode(((Dictionary<string, string>)(Container.DataItem))["name"])%>"
								src="<%# ((Dictionary<string, string>)(Container.DataItem))["thumbnailUrl0"] %>" />
						</a>
							<div>
								<%# Server.HtmlEncode(((Dictionary<string, string>)(Container.DataItem))["description"])%></div>
						</li>
					</ItemTemplate>
				</asp:Repeater>
			</ul>
		</fieldset>
	</div>
</asp:Content>
