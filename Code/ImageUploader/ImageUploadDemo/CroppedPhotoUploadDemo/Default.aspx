<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs"
	Inherits="CropImages_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<script type="text/javascript" src="croppedphotouploaddemo.js"></script>
	<script type="text/javascript">

		var uploaderID = '<%= Uploader1.ClientID %>';

	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<aur:Uploader EnableAutoRotation="true" ID="Uploader1" runat="server" OnFileUploaded="Uploader1_FileUploaded"
		Width="100%" Height="500px" LicenseKey="<%$ AppSettings:ImageUploaderLicenseKey %>"
		EnableDescriptionEditor="false" EnableRotation="false">
		<Converters>
			<aur:Converter Mode="*.*=Thumbnail" ThumbnailWidth="90" ThumbnailHeight="120" ThumbnailApplyCrop="true" />
		</Converters>
		<ClientEvents>
			<aur:ClientEvent EventName="BeforeUpload" HandlerName="onBeforeUpload" />
			<aur:ClientEvent EventName="UploadFileCountChange" HandlerName="onUploadFileCountChange" />
		</ClientEvents>
		<FolderPane Height="500" />
		<Restrictions FileMask="*.jpg;*.jpeg;*.png;*.gif;*.bmp" MaxFileCount="1" />
		<UploadSettings RedirectUrl="Gallery.aspx" />
		<ImageEditor CropRatio="0.75" />
		<Messages MaxFileCountExceeded="You can select only one file for upload." />
	</aur:Uploader>
	<aur:InstallationProgress ID="InstallationProgress1" TargetControlID="Uploader1"
		runat="server" ProgressImageUrl="../../Images/installation_progress.gif" ProgressCssClass="ip-progress"
		InstructionsCssClass="ip-instructions">
	</aur:InstallationProgress>
</asp:Content>
