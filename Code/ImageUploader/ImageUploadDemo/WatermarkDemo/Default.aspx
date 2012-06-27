<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs"
	Inherits="WatermarkDemo_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<style type="text/css">
		.watermark-image { max-width: 180px; vertical-align: middle; }
	</style>
	<script type="text/javascript">

		$(function () {
			$('#watermark-type-text').change(function () {
				if ($(this).attr('checked')) {
					$('#watermarkTextBox').select().focus();
				}
			});
		});


		var uploaderID = '<%= Uploader1.ClientID %>';

		function onBeforeUpload() {
			var uploader = $au.uploader(uploaderID);
			var type = $('input[name=watermark-type]:checked').val();
			var watermarkFormat = 'Position=BottomRight;';
			var watermarkFormat1 = 'Position=BottomRight;';
			switch (type) {
				case 'image':
					watermarkFormat += 'ImageUrl=Watermark.png;Width=155;Height=30;';
					watermarkFormat1 += 'ImageUrl=Watermark.png;Width=60;Height=12;';
					break;
				case 'text':
					var text = $('#watermarkTextBox').val().replace(/['"]/g, '\\$&');
					watermarkFormat += 'Text="' + text + '";Font=Arial;Size=20;FillColor=#5BEE10';
					watermarkFormat1 += 'Text="' + text + '";Font=Arial;Size=12;FillColor=#5BEE10';
					break;
			}
			uploader.converters().get(0).thumbnailWatermark(watermarkFormat);
			uploader.converters().get(1).thumbnailWatermark(watermarkFormat1);
		}
	
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<fieldset class="content-block">
		<legend>Watermark settings</legend>
		<div class="row">
			<label for="watermark-type-image" class="caption">
				<input type="radio" name="watermark-type" id="watermark-type-image" value="image"
					checked="checked" />&nbsp;Image watermark
			</label>
			<img id="watermarkImage" alt="Watermark" src="Watermark.png" class="watermark-image" />
		</div>
		<div class="row">
			<label for="watermark-type-text" class="caption">
				<input type="radio" name="watermark-type" id="watermark-type-text" value="text" />&nbsp;Text
				watermark
			</label>
			<input type="text" id="watermarkTextBox" value="<%= DateTime.Now.ToShortDateString() %>" />
		</div>
	</fieldset>
	<aur:Uploader ID="Uploader1" runat="server" OnFileUploaded="Uploader1_FileUploaded"
		EnableAutoRotation="true" LicenseKey="<%$ AppSettings:ImageUploaderLicenseKey %>"
		Width="100%" Height="500px">
		<Converters>
			<aur:Converter Mode="*.*=Thumbnail" ThumbnailFitMode="ActualSize" ThumbnailWatermark="ImageUrl=Watermark.png;Width=155;Height=30;Position=BottomRight;" />
			<aur:Converter Mode="*.*=Thumbnail" ThumbnailFitMode="Fit" ThumbnailHeight="120"
				ThumbnailWidth="120" ThumbnailWatermark="ImageUrl=Watermark.png;Width=60;Height=12;Position=BottomRight;" />
		</Converters>
		<ClientEvents>
			<aur:ClientEvent EventName="BeforeUpload" HandlerName="onBeforeUpload" />
		</ClientEvents>
		<FolderPane Height="500" />
		<Restrictions FileMask="*.jpg;*.jpeg;*.png;*.gif;*.bmp" />
		<UploadSettings RedirectUrl="Gallery.aspx" FilesPerPackage="1" />
	</aur:Uploader>
	<aur:InstallationProgress ID="InstallationProgress1" TargetControlID="Uploader1"
		runat="server" ProgressImageUrl="../../Images/installation_progress.gif" ProgressCssClass="ip-progress"
		InstructionsCssClass="ip-instructions">
	</aur:InstallationProgress>
</asp:Content>
