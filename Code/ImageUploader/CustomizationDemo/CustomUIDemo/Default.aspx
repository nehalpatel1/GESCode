<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs"
	Inherits="CustomUIDemo_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link href="progressbar.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
		var uploaderId = '<%= Uploader1.ClientID %>',
			uploaderProgressId = '<%= uploadProgressDiv.ClientID %>';

		function completed(success) {
			// Hide progress bar
			$('#' + uploaderProgressId + ' > .progress-background').fadeOut('slow', function () {
				$('#' + uploaderProgressId + ' > .progress-caption').text('');
				$(this).css('width', 0).fadeIn();

				if (success) {
					// Redirect to gallery page
					setTimeout(function () {
						document.location = 'Gallery.aspx';
					}, 1000);
				}
			});
		}

		function onProgress(percent, uploadedFiles, totalFiles, uploadedBytes, totalBytes) {
			$('#' + uploaderProgressId + ' > .progress-background').css('width', percent + '%');
			var size = formatSize(uploadedBytes, totalBytes);
			$('#' + uploaderProgressId + ' > .progress-caption').text(size.uploadedBytes + ' / ' + size.totalBytes);
		}

		function formatSize(uploadedBytes, totalBytes) {
			if (totalBytes > 10485762) {
				uploadedBytes = (uploadedBytes / 1048576).toFixed(1) + ' MB';
				totalBytes = (totalBytes / 1048576).toFixed(1) + ' MB';
			} else if (totalBytes > 1024) {
				uploadedBytes = (uploadedBytes / 1024).toFixed(1) + ' KB';
				totalBytes = (totalBytes / 1024).toFixed(1) + ' KB';
			} else {
				uploadedBytes = uploadedBytes + ' B';
				totalBytes = totalBytes + ' B';
			}
			return { uploadedBytes: uploadedBytes, totalBytes: totalBytes };
		}

		function onAfterUpload() {
			completed(true);
		}

		function onError() {
			completed(false);
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<fieldset class="content-block">
		<legend>Themes</legend>
		<ul class="themes">
			<li>
				<asp:LinkButton ID="grayThemeLinkButton" runat="server" CssClass="theme" OnClick="themeLinkButton_Click">Gray</asp:LinkButton></li>
			<li>
				<asp:LinkButton ID="greenThemeLinkButton" runat="server" CssClass="theme" OnClick="themeLinkButton_Click">Green</asp:LinkButton></li>
		</ul>
	</fieldset>
	<aur:Uploader ID="Uploader1" runat="server" EnableUploadProgress="false" Width="100%"
		Height="500px" OnFileUploaded="Uploader1_FileUploaded" BorderStyle="FixedSingle"
		LicenseKey="<%$ AppSettings:ImageUploaderLicenseKey %>" HeaderTextColor="White">
		<ClientEvents>
			<aur:ClientEvent EventName="AfterUpload" HandlerName="onAfterUpload" />
			<aur:ClientEvent EventName="Error" HandlerName="onError" />
			<aur:ClientEvent EventName="Progress" HandlerName="onProgress" />
		</ClientEvents>
		<Converters>
			<aur:Converter Mode="*.*=SourceFile" />
		</Converters>
		<DetailsViewColumns DimensionsText="" InfoText="" />
		<FolderPane Height="500" ViewMode="Details" />
		<UploadPane ViewMode="List">
		</UploadPane>
		<UploadSettings FilesPerPackage="1" ProgressBytesMode="BySourceSize" />
		<HeaderColor Color1="#636363" Color2="#2d2d2d" />
		<PaneItem HoverBorderColor="#7d7d7d" SelectionBorderColor="#7d7d7d" SelectionHoverBorderColor="#7d7d7d">
			<HoverColor Color1="#f5f5f5" Color2="#dfdfdf" />
			<SelectionColor Color1="#f0f0f0" Color2="#cfcfcf" />
			<SelectionHoverColor Color1="#f5f5f5" Color2="#dfdfdf" />
		</PaneItem>
		<StatusPane>
			<Color Color1="#efefef" Color2="#f6f6f6" />
		</StatusPane>
	</aur:Uploader>
	<aur:InstallationProgress ID="InstallationProgress1" TargetControlID="Uploader1"
		runat="server" ProgressImageUrl="../../Images/installation_progress.gif" ProgressCssClass="ip-progress"
		InstructionsCssClass="ip-instructions">
	</aur:InstallationProgress>
	<div id="uploadProgressDiv" class="progress progress-gray" runat="server">
		<div class="progress-background">
		</div>
		<div class="progress-caption">
		</div>
	</div>
</asp:Content>
