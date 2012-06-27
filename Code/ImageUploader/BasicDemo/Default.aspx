<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BasicDemoDefault.aspx.cs" Inherits="BasicDemo_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<aur:Uploader ID="Uploader1" runat="server" OnFileUploaded="Uploader1_FileUploaded"
		LicenseKey="<%$ AppSettings:ImageUploaderLicenseKey %>" Width="100%" Height="500px"
		EnableDescriptionEditor="false" EnableRotation="false">
		<Converters>
			<aur:Converter Mode="*.*=SourceFile" />
		</Converters>
		<UploadSettings RedirectUrl="Gallery.aspx" FilesPerPackage="1" />
		<FolderPane Height="370" />
		<UploadPane ViewMode="List">
		</UploadPane>
		<PaneItem ShowFileNameInThumbnailsView="true">
		</PaneItem>
		<DetailsViewColumns InfoText="" />
	</aur:Uploader>
	<aur:InstallationProgress TargetControlID="Uploader1" runat="server" ProgressImageUrl="../Images/installation_progress.gif"
		ProgressCssClass="ip-progress" InstructionsCssClass="ip-instructions">
	</aur:InstallationProgress>
</asp:Content>
