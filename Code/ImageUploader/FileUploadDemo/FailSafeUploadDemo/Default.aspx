<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs"
	Inherits="ReliableUpload_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<script type="text/javascript">

		var redirectUrl = 'Gallery.aspx',
			uploaderId = '<%= Uploader1.ClientID %>';

		$(function () {
			$('#hashCheck').bind('change', function (ev) {
				var uploader = $au.uploader(uploaderId);
				if (this.checked) {
					// Upload hashes first
					uploader.uploadSettings().filesPerPackage(0);
					uploader.converters([{ mode: '*.*=None'}]);
				} else {
					// Upload source files
					uploader.uploadSettings().filesPerPackage(1);
					uploader.converters([{ mode: '*.*=SourceFile'}]);
				}
			});
		});

		function onBeforeUpload() {
			this.uploadPane().saveUploadList(1);

			if (this.converters().get(0).mode() == '*.*=None') {
				// Upload hashes only
				this.uploadPane().saveUploadList(2);
				this.metadata().addCustomField('hashcheck', '1');
				this.uploadSettings().redirectUrl('');
			} else {
				this.uploadPane().resetUploadList(2);
				this.metadata().removeCustomField('hashcheck');
				this.uploadSettings().redirectUrl(redirectUrl);

				if (!$('#hashCheck').attr('checked')) {
					this.metadata().addCustomField('clean', '1');
				}
			}
		}

		function onAfterPackageUpload() {
			this.uploadPane().saveUploadList(1);
		}

		function onAfterUpload(data) {
			// Remove saved upload list
			this.uploadPane().resetUploadList(1);

			if (this.converters().get(0).mode() == '*.*=None') {
				// Hashes only has been uploaded.
				// Now upload actual files
				this.uploadSettings().filesPerPackage(1);
				this.converters([{ mode: '*.*=SourceFile'}]);
				this.uploadPane().loadUploadList(2);

				if (data) {
					if (confirm('Some files already exists on the server. Do you want to remove them from upload list?')) {
						var indexes = data.split(';');
						// Remove duplicates from upload list
						for (var i = indexes.length - 1; i >= 0; i--) {
							this.files().remove(parseInt(indexes[i], 10));
						}
					}
				}

				if (this.files().count() > 0) {
					// Upload files
					var u = this;
					setTimeout(function () {
						u.upload();
					}, 100);
				} else {
					// No files in upload pane, redirect to gallery
					location = redirectUrl;
				}
			}
		}

		function onInitComplete() {
			if (this.files().count() > 0) {
				return;
			}

			// Load upload list
			this.uploadPane().loadUploadList(1);

			// Check if upload list loaded
			var count = this.files().count();
			if (count > 0) {
				// Ask user if we should load files from previous upload attempt
				if (!confirm('Some files was not uploaded since your last visit. Do you want to add them to upload list?')) {
					// Remove loaded files
					for (var i = count - 1; i >= 0; i--) {
						this.files().remove(i);
					}

					this.uploadPane().resetUploadList(1);
				}
			}
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<fieldset class="content-block">
		<legend>Duplicates</legend>
		<div class="row">
			<input type="checkbox" id="hashCheck" /><label for="hashCheck">&nbsp;Check whether selected
				files were already uploaded before</label>
		</div>
	</fieldset>
	<aur:Uploader ID="Uploader1" runat="server" OnFileUploaded="Uploader1_FileUploaded"
		LicenseKey="<%$ AppSettings:ImageUploaderLicenseKey %>" Width="100%" Height="500px"
		EnableImageEditor="false" EnableRotation="false">
		<ClientEvents>
			<aur:ClientEvent EventName="AfterPackageUpload" HandlerName="onAfterPackageUpload" />
			<aur:ClientEvent EventName="AfterUpload" HandlerName="onAfterUpload" />
			<aur:ClientEvent EventName="BeforeUpload" HandlerName="onBeforeUpload" />
			<aur:ClientEvent EventName="InitComplete" HandlerName="onInitComplete" />
		</ClientEvents>
		<Converters>
			<aur:Converter Mode="*.*=SourceFile" />
		</Converters>
		<Metadata Hash="MD5" />
		<FolderPane ViewMode="Details" Height="500" />
		<UploadPane ViewMode="List" />
		<DetailsViewColumns DimensionsText="" InfoText="" />
		<UploadSettings AutoRecoveryMaxAttemptCount="10" AutoRecoveryTimeout="10000" FilesPerPackage="1"
			ChunkSize="1048576" RedirectUrl="Gallery.aspx" />
	</aur:Uploader>
	<aur:InstallationProgress ID="InstallationProgress1" TargetControlID="Uploader1"
		runat="server" ProgressImageUrl="../../Images/installation_progress.gif" ProgressCssClass="ip-progress"
		InstructionsCssClass="ip-instructions">
	</aur:InstallationProgress>
</asp:Content>
