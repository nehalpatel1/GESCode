<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs"
	Inherits="GpsDemo_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<aur:Uploader ID="Uploader1" runat="server" OnFileUploaded="Uploader1_FileUploaded"
		EnableAutoRotation="true" LicenseKey="<%$ AppSettings:ImageUploaderLicenseKey %>"
		Width="100%" Height="500px">
		<Converters>
			<aur:Converter Mode="*.*=SourceFile" />
			<aur:Converter Mode="*.*=Thumbnail" ThumbnailWidth="30" ThumbnailHeight="30" />
			<aur:Converter Mode="*.*=Thumbnail" ThumbnailWidth="300" ThumbnailHeight="300" />
		</Converters>
		<FolderPane Height="500" />
		<Metadata Exif="ExifGpsLatitude;ExifGpsLongitude;ExifGpsLatitudeRef;ExifGpsLongitudeRef" />
		<Restrictions FileMask="*.jpg;*.jpeg;*.png;*.gif;*.bmp" />
		<UploadSettings RedirectUrl="Gallery.aspx" FilesPerPackage="1" />
	</aur:Uploader>
	<aur:InstallationProgress ID="InstallationProgress1" TargetControlID="Uploader1"
		runat="server" ProgressImageUrl="../../Images/installation_progress.gif" ProgressCssClass="ip-progress"
		InstructionsCssClass="ip-instructions">
	</aur:InstallationProgress>
</asp:Content>
