<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs"
	Inherits="RestrictionsDemo_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<script type="text/javascript">

		$(function () {
			var uploaderID = '<%= Uploader1.ClientID %>';
			function updateInfo() {
				var restrictions = $au.uploader(uploaderID).restrictions();
				var params = {
					enableCmyk: restrictions.enableCmyk() && restrictions.enableCmyk() !== "false" ? 'True' : 'False',
					fileMask: restrictions.fileMask() || '*.*',
					maxFileCount: parseInt(restrictions.maxFileCount()) || 'any',
					maxFileSize: parseInt(restrictions.maxFileSize()) || 'any',
					maxImageHeight: parseInt(restrictions.maxImageHeight()) || 'any',
					maxImageWidth: parseInt(restrictions.maxImageWidth()) || 'any'
				};


				var infoHtml = '<li>Enable CMYK: ${enableCmyk}</li>' +
				  '<li>File mask: ${fileMask}</li>' +
				  '<li>Max file count: ${maxFileCount}</li>' +
				  '<li>Max file size: ${maxFileSize}</li>' +
				  '<li>Max image height: ${maxImageHeight}</li>' +
				  '<li>Max image width: ${maxImageWidth}</li>';

				infoHtml = infoHtml.replace(/\$\{(\w+)\}/g, function (str0, str1, offset, s) { return params[str1]; });

				$('#info').html(infoHtml);
			}

			updateInfo();

			$(':radio[name=restrictionsRBL]').change(function () {
				var r = {
					enableCmyk: true,
					fileMask: '*.*',
					maxFileCount: 0,
					maxFileSize: 0,
					maxImageHeight: 0,
					maxImageWidth: 0
				};

				switch ($(this).val()) {
					case "1":
						r.enableCmyk = false;
						r.fileMask = '*.jpg;*.jpeg;*.png;*.bmp;*.gif';
						r.maxImageHeight = 2048;
						r.maxImageWidth = 2048;
						break;
					case "2":
						r.fileMask = '*.txt;*.doc;*.docx;*.pdf;*.rtf';
						r.maxFileCount = 5;
						r.maxFileSize = 5 * 1024 * 1024; // 5 MB
						break;
				}

				$au.uploader(uploaderID).restrictions(r);

				updateInfo();
			});
		});
  
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<fieldset class="content-block">
		<legend>Restriction settings</legend>
		<div class="col">
			<div class="row">
				<input id="restrictionsRBL_0" type="radio" name="restrictionsRBL" value="0" /><label
					for="restrictionsRBL_0">All files</label>
			</div>
			<div class="row">
				<input id="restrictionsRBL_1" type="radio" name="restrictionsRBL" value="1" checked="checked" /><label
					for="restrictionsRBL_1">Images</label>
			</div>
			<div class="row">
				<input id="restrictionsRBL_2" type="radio" name="restrictionsRBL" value="2" /><label
					for="restrictionsRBL_2">Documents</label>
			</div>
		</div>
		<div class="col">
			<div class="row">
				<ul id='info'>
				</ul>
			</div>
		</div>
	</fieldset>
	<aur:Uploader ID="Uploader1" runat="server" OnFileUploaded="Uploader1_FileUploaded"
		LicenseKey="<%$ AppSettings:ImageUploaderLicenseKey %>" Width="100%" Height="500px">
		<Converters>
			<aur:Converter Mode="*.*=SourceFile" />
		</Converters>
		<FolderPane Height="500" ViewMode="Details">
		</FolderPane>
		<UploadPane ViewMode="List">
		</UploadPane>
		<DetailsViewColumns InfoText="" DimensionsText="" />
		<UploadSettings RedirectUrl="Gallery.aspx" />
		<%-- Configure restrictions --%>
		<Restrictions FileMask="*.jpg;*.jpeg;*.png;*.gif;*.bmp" EnableCmyk="false" MaxImageWidth="2048"
			MaxImageHeight="2048" />
	</aur:Uploader>
	<aur:InstallationProgress ID="InstallationProgress1" TargetControlID="Uploader1"
		runat="server" ProgressImageUrl="../../Images/installation_progress.gif" ProgressCssClass="ip-progress"
		InstructionsCssClass="ip-instructions">
	</aur:InstallationProgress>
</asp:Content>
