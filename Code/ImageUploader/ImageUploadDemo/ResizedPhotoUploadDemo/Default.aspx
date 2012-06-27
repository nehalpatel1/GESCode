<%@ Page Title="Aurigma Image Uploader 7 Demo Applications &mdash; Resized Photos"
	Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="ResizeImages_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<style type="text/css">
		.buttons { text-align: left; }
		.buttons button { width: 150px; height: 30px; }
	</style>
	<script type="text/javascript">

		var uploaderID = '<%= Uploader1.ClientID %>';

		function addFiles() {
			$au.uploader(uploaderID).uploadPane().addFiles();
		}

		function addFolder() {
			$au.uploader(uploaderID).uploadPane().addFolders();
		}
	
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<div class="buttons">
		<button type="button" onclick="addFiles();">
			Add Files...</button>
		<button type="button" onclick="addFolder();">
			Add Folder...</button></div>
	<aur:Uploader ID="Uploader1" runat="server" OnFileUploaded="Uploader1_FileUploaded"
		PaneLayout="OnePane" EnableAutoRotation="true" LicenseKey="<%$ AppSettings:ImageUploaderLicenseKey %>"
		Width="100%" Height="500px">
		<Converters>
			<aur:Converter Mode="*.*=Thumbnail" ThumbnailWidth="120" ThumbnailHeight="120" />
			<aur:Converter Mode="*.*=Thumbnail" ThumbnailWidth="600" ThumbnailHeight="600" />
			<aur:Converter Mode="*.*=Thumbnail" ThumbnailWidth="1024" ThumbnailHeight="1024" />
		</Converters>
		<Restrictions FileMask="*.jpg;*.jpeg;*.png;*.gif;*.bmp" />
		<UploadSettings RedirectUrl="Gallery.aspx" EnableInstantUpload="true" FilesPerPackage="1" />
	</aur:Uploader>
	<aur:InstallationProgress ID="InstallationProgress1" TargetControlID="Uploader1"
		runat="server" ProgressImageUrl="../../Images/installation_progress.gif" ProgressCssClass="ip-progress"
		InstructionsCssClass="ip-instructions">
	</aur:InstallationProgress>
</asp:Content>
