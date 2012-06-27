<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs"
	Inherits="LocalizationDemo_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link href="localization.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<fieldset class="content-block">
		<legend>Languages</legend>
		<ul class="languages">
			<li>
				<asp:LinkButton runat="server" CssClass="lang" CommandArgument="Czech" OnCommand="ChangeLanguage_Command">Czech</asp:LinkButton></li>
			<li>
				<asp:LinkButton runat="server" CssClass="lang" CommandArgument="Dutch" OnCommand="ChangeLanguage_Command">Dutch</asp:LinkButton></li>
			<li>
				<asp:LinkButton runat="server" CssClass="lang" CommandArgument="English" OnCommand="ChangeLanguage_Command">English</asp:LinkButton></li>
			<li>
				<asp:LinkButton runat="server" CssClass="lang" CommandArgument="French" OnCommand="ChangeLanguage_Command">French</asp:LinkButton></li>
			<li>
				<asp:LinkButton runat="server" CssClass="lang" CommandArgument="German" OnCommand="ChangeLanguage_Command">German</asp:LinkButton></li>
			<li>
				<asp:LinkButton runat="server" CssClass="lang" CommandArgument="Hebrew" OnCommand="ChangeLanguage_Command">Hebrew</asp:LinkButton></li>
			<li>
				<asp:LinkButton runat="server" CssClass="lang" CommandArgument="Italian" OnCommand="ChangeLanguage_Command">Italian</asp:LinkButton></li>
			<li>
				<asp:LinkButton runat="server" CssClass="lang" CommandArgument="Japanese" OnCommand="ChangeLanguage_Command">Japanese</asp:LinkButton></li>
			<li>
				<asp:LinkButton runat="server" CssClass="lang" CommandArgument="Korean" OnCommand="ChangeLanguage_Command">Korean</asp:LinkButton></li>
			<li>
				<asp:LinkButton runat="server" CssClass="lang" CommandArgument="Norwegian" OnCommand="ChangeLanguage_Command">Norwegian</asp:LinkButton></li>
			<li>
				<asp:LinkButton runat="server" CssClass="lang" CommandArgument="Russian" OnCommand="ChangeLanguage_Command">Russian</asp:LinkButton></li>
			<li>
				<asp:LinkButton runat="server" CssClass="lang" CommandArgument="SimplifiedChinese" OnCommand="ChangeLanguage_Command">Simplified Chinese</asp:LinkButton></li>
			<li>
				<asp:LinkButton runat="server" CssClass="lang" CommandArgument="Spanish" OnCommand="ChangeLanguage_Command">Spanish</asp:LinkButton></li>
			<li>
				<asp:LinkButton runat="server" CssClass="lang" CommandArgument="Swedish" OnCommand="ChangeLanguage_Command">Swedish</asp:LinkButton></li>
			<li>
				<asp:LinkButton runat="server" CssClass="lang" CommandArgument="TraditionalChinese" OnCommand="ChangeLanguage_Command">Traditional Chinese</asp:LinkButton></li>
			<li>
				<asp:LinkButton runat="server" CssClass="lang" CommandArgument="Turkish" OnCommand="ChangeLanguage_Command">Turkish</asp:LinkButton></li>
		</ul>
	</fieldset>
	<aur:Uploader ID="Uploader1" runat="server" OnFileUploaded="Uploader1_FileUploaded"
		LicenseKey="<%$ AppSettings:ImageUploaderLicenseKey %>" Width="100%" Height="500px">
		<Converters>
			<aur:Converter Mode="*.*=SourceFile" />
		</Converters>
		<FolderPane Height="500" ViewMode="Details" />
		<UploadSettings RedirectUrl="Gallery.aspx" />
	</aur:Uploader>
	<aur:InstallationProgress ID="InstallationProgress1" TargetControlID="Uploader1"
		runat="server" ProgressImageUrl="../../Images/installation_progress.gif" ProgressCssClass="ip-progress"
		InstructionsCssClass="ip-instructions">
	</aur:InstallationProgress>
</asp:Content>
