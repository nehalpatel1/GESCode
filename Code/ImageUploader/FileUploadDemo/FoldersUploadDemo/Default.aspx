<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs"
	Inherits="FolderUpload_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<aur:Uploader ID="Uploader1" runat="server" OnFileUploaded="Uploader1_FileUploaded"
		LicenseKey="<%$ AppSettings:ImageUploaderLicenseKey %>" FolderProcessingMode="Upload"
		Width="100%" Height="500px" EnableImageEditor="false" EnableRotation="false">
		<Converters>
			<aur:Converter Mode="*.*=SourceFile" />
		</Converters>
		<FolderPane Height="500" ViewMode="Details" />
		<UploadPane ViewMode="List">
		</UploadPane>
		<DetailsViewColumns DimensionsText="" InfoText="" />
		<PaneItem ShowFileNameInThumbnailsView="true" />
		<UploadSettings RedirectUrl="Gallery.aspx" FilesPerPackage="1" />
	</aur:Uploader>
	<aur:InstallationProgress ID="InstallationProgress1" TargetControlID="Uploader1"
		runat="server" ProgressImageUrl="../../Images/installation_progress.gif" ProgressCssClass="ip-progress"
		InstructionsCssClass="ip-instructions">
	</aur:InstallationProgress>
</asp:Content>
