<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs"
	Inherits="PhotoOptimization_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<style type="text/css">
		.content .content-block .row .caption { min-width: 100px; }
	</style>
	<script type="text/javascript">

		$(function () {
			var formatDDL = 'formatDDL';
			var dpiDDL = 'dpiDDL';
			var uploaderID = '<%= Uploader1.ClientID %>';

			$('#' + formatDDL + ',#' + dpiDDL).bind('change', function () {

				var width, height, dpi, size, pixelWidth, pixelHeight;

				// Get selected dpi value
				dpi = $('#' + dpiDDL).val() || 300;

				// Get selected size value
				size = ($('#' + formatDDL).val() || '4x6').split('x');
				width = size[0];
				height = size[1];

				// Calculate pixel size
				pixelWidth = width * dpi;
				pixelHeight = height * dpi;

				var uploader = $au.uploader(uploaderID);

				// Set quality meter format string
				var formats = width + ' x ' + height + ',' + pixelWidth + ',' + pixelHeight + ',1.5';
				uploader.paneItem().qualityMeter().formats(formats);

				// Configure converter
				var c = uploader.converters().get(0);
				size = Math.max(pixelWidth, pixelHeight);
				c.thumbnailWidth(size);
				c.thumbnailHeight(size);

				// Update message
				$('#sizePlaceholder').text(pixelWidth + ' x ' + pixelHeight);
			});
		});

	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<fieldset class="content-block">
		<legend>Print settings</legend>
		<div class="row">
			<label for="formatDDL" class="caption">
				Print size
			</label>
			<select id="formatDDL" class="value">
				<option value="4x6" selected="selected">4 x 6</option>
				<option value="5x7">5 x 7</option>
				<option value="8x10">8 x 10</option>
				<option value="10x13">10 x 13</option>
			</select>
		</div>
		<div class="row">
			<label for="dpiDDL" class="caption">
				DPI
			</label>
			<select id="dpiDDL" class="value">
				<option value="300" selected="selected">300 dpi</option>
				<option value="600">600 dpi</option>
			</select>
		</div>
	</fieldset>
	<fieldset class="content-block">
		<legend>Quality Meter</legend>
		<p>
			Quality meter indicates whether photos are suitable for printing on the paper size.
			To get the best quality prints it is recommended to select photos with green marks.
			The recommended image dimensions are <span id="sizePlaceholder">1600x1800</span>.
		</p>
	</fieldset>
	<aur:Uploader ID="Uploader1" runat="server" OnFileUploaded="Uploader1_FileUploaded"
		LicenseKey="<%$ AppSettings:ImageUploaderLicenseKey %>" EnableDescriptionEditor="false"
		EnableAutoRotation="true" Width="100%" Height="500px">
		<Converters>
			<aur:Converter Mode="*.*=Thumbnail" ThumbnailApplyCrop="true" ThumbnailCopyExif="true"
				ThumbnailHeight="1800" ThumbnailWidth="1800" />
		</Converters>
		<FolderPane Height="370" />
		<PaneItem>
			<QualityMeter Formats="4 x 6,1800,1200,1.5;" Height="20" />
		</PaneItem>
		<Restrictions FileMask="*.jpg;*.jpeg;*.png;*.gif;*.bmp" />
		<UploadPane ViewMode="Thumbnails" PreviewSize="50">
		</UploadPane>
		<UploadSettings RedirectUrl="Gallery.aspx" FilesPerPackage="1" />
	</aur:Uploader>
	<aur:InstallationProgress ID="InstallationProgress1" TargetControlID="Uploader1"
		runat="server" ProgressImageUrl="../../Images/installation_progress.gif" ProgressCssClass="ip-progress"
		InstructionsCssClass="ip-instructions">
	</aur:InstallationProgress>
</asp:Content>
