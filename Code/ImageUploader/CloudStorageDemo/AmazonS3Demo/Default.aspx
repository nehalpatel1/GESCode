<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs"
	Inherits="AmazonS3_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<aur:Uploader ID="Uploader1" runat="server" LicenseKey="<%$ AppSettings:ImageUploaderLicenseKey %>"
		Width="100%" Height="500px" EnableDescriptionEditor="false" EnableRotation="false">
		<Converters>
			<aur:Converter Mode="*.*=Thumbnail" ThumbnailWidth="120" ThumbnailHeight="120" />
			<aur:Converter Mode="*.*=Thumbnail" ThumbnailWidth="600" ThumbnailHeight="600" />
			<aur:Converter Mode="*.*=SourceFile" />
		</Converters>
		<FolderPane Height="370" />
		<Restrictions FileMask="*.jpg;*.png;*.gif;*.bmp;*.jpeg" MaxFileSize="<%$ AppSettings:AmazonS3_MaxFileSize %>" />
		<UploadSettings RedirectUrl="Gallery.aspx" />
		<UploadPane PreviewSize="50">
		</UploadPane>
	</aur:Uploader>
	<aur:InstallationProgress ID="InstallationProgress1" TargetControlID="Uploader1"
		runat="server" ProgressImageUrl="../../Images/installation_progress.gif" ProgressCssClass="ip-progress"
		InstructionsCssClass="ip-instructions">
	</aur:InstallationProgress>
	<aur:AmazonS3Extender ID="AmazonS3Extender1" runat="server" AWSAccessKeyId="<%$ AppSettings:AmazonS3_AWSAccessKeyId %>"
		Bucket="<%$ AppSettings:AmazonS3_Bucket %>" SecretAccessKey="<%$ AppSettings:AmazonS3_SecretAccessKey %>"
		TargetControlID="Uploader1">
		<aur:FileSettings Acl="public-read" Key="ImageUploader7/small/${filename}" MaxFileSize="<%$ AppSettings:AmazonS3_MaxFileSize %>">
		</aur:FileSettings>
		<aur:FileSettings Acl="public-read" Key="ImageUploader7/large/${filename}" MaxFileSize="<%$ AppSettings:AmazonS3_MaxFileSize %>">
		</aur:FileSettings>
		<aur:FileSettings Acl="public-read" Key="ImageUploader7/original/${filename}" MaxFileSize="<%$ AppSettings:AmazonS3_MaxFileSize %>">
		</aur:FileSettings>
	</aur:AmazonS3Extender>
	<fieldset class="error content-block" runat="server" id="errorMessage">
		<legend>Error</legend>
		<p>
			Please, check the Amazon S3 account settings in the <em>web.config</em> file. There
			are three settings should be present and shouldn't be empty: <em>AmazonS3_AWSAccessKeyId</em>,
			<em>AmazonS3_Bucket</em>, <em>AmazonS3_SecretAccessKey</em>.</p>
	</fieldset>
</asp:Content>
