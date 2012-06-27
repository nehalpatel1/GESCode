<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs"
	Inherits="Nirvanix_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<aur:Uploader ID="Uploader1" runat="server" Width="100%" Height="500px" EnableDescriptionEditor="false"
		EnableRotation="false" LicenseKey="<%$ AppSettings:ImageUploaderLicenseKey %>">
		<Converters>
			<aur:Converter Mode="*.*=Thumbnail" ThumbnailWidth="120" ThumbnailHeight="120" />
			<aur:Converter Mode="*.*=Thumbnail" ThumbnailWidth="600" ThumbnailHeight="600" />
			<aur:Converter Mode="*.*=SourceFile" />
		</Converters>
		<FolderPane Height="370" />
		<Restrictions FileMask="*.jpg;*.png;*.gif;*.bmp;*.jpeg" MaxFileSize="<%$ AppSettings:Nirvanix_MaxFileSize %>" />
		<UploadSettings RedirectUrl="Gallery.aspx" />
		<UploadPane PreviewSize="50">
		</UploadPane>
	</aur:Uploader>
	<aur:InstallationProgress ID="InstallationProgress1" TargetControlID="Uploader1"
		runat="server" ProgressImageUrl="../../Images/installation_progress.gif" ProgressCssClass="ip-progress"
		InstructionsCssClass="ip-instructions">
	</aur:InstallationProgress>
	<aur:NirvanixExtender ID="NirvanixExtender1" runat="server" TargetControlID="Uploader1"
		AppKey="<%$ AppSettings:Nirvanix_AppKey %>" DestFolderPath="ImageUploader7/"
		Username="<%$ AppSettings:Nirvanix_Username %>" Password="<%$ AppSettings:Nirvanix_Password %>"
		FileOverwrite="true" SizeBytes="<%$ AppSettings:Nirvanix_MaxFileSize %>">
	</aur:NirvanixExtender>
	<fieldset class="error content-block" runat="server" id="errorMessage">
		<legend>Error</legend>
		<p>
			Please, check the Nirvanix account settings in the <em>web.config</em> file. There
			are three settings should be present and shouldn't be empty: <em>Nirvanix_AppKey</em>,
			<em>Nirvanix_Username</em>, <em>Nirvanix_Password</em>.</p>
	</fieldset>
</asp:Content>
