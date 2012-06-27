<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs"
	Inherits="AuxiliaryDataUpload_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<script type="text/javascript">

		$(function () {
			$('input[name=folder-type]').click(function (ev) {
				$('.folder-name').attr('disabled', 'disabled').parent().addClass('disabled');
				$(this).parents('.row').removeClass('disabled').children('.folder-name').attr('disabled', '');
			});

			$('#fodler-type-new').change(function () {
				$('#<%= folderNameTextBox.ClientID %>').select().focus();
			});

			$('#fodler-type-existing').change(function () {
				$('#folderNameDropDownList').focus();
			});

			if ($('#<%= folderNameDropDownList.ClientID %>')[0].options.length == 0) {
				$('#fodler-type-existing').attr('disabled', true);
			}

			$('#<%= folderNameTextBox.ClientID %>').focus();

		});

		function onBeforeUpload() {
			// Get folder name
			var folderName = $('input[name=folder-type]:checked').parents('.row').children('.folder-name').val();

			if (!folderName) {
				alert('Specify folder name');
				return false;
			}

			// Add folder name field
			this.metadata().addCustomField('folder', folderName);
		}

	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<fieldset class="folder-settings content-block">
		<legend>Folder name</legend>
		<div class="row">
			<label for="fodler-type-new" class="caption">
				<input type="radio" name="folder-type" id="fodler-type-new" checked="checked" />&nbsp;New
				folder
			</label>
			<asp:TextBox ID="folderNameTextBox" runat="server" Text="" CssClass="folder-name"></asp:TextBox>
		</div>
		<div class="row disabled">
			<label for="fodler-type-existing" class="caption">
				<input type="radio" name="folder-type" id="fodler-type-existing" />&nbsp;Existing
				folder
			</label>
			<asp:DropDownList ID="folderNameDropDownList" runat="server" CssClass="folder-name"
				Enabled="false">
			</asp:DropDownList>
		</div>
	</fieldset>
	<aur:Uploader ID="Uploader1" runat="server" OnFileUploaded="Uploader1_FileUploaded"
		LicenseKey="<%$ AppSettings:ImageUploaderLicenseKey %>" EnableImageEditor="false"
		EnableRotation="false" Width="100%" Height="500px">
		<ClientEvents>
			<aur:ClientEvent EventName="BeforeUpload" HandlerName="onBeforeUpload" />
		</ClientEvents>
		<Converters>
			<aur:Converter Mode="*.*=SourceFile" />
		</Converters>
		<FolderPane ViewMode="Details" Height="500" />
		<UploadPane ViewMode="List" />
		<DetailsViewColumns DimensionsText="" />
		<UploadSettings RedirectUrl="Gallery.aspx" />
	</aur:Uploader>
	<aur:InstallationProgress ID="InstallationProgress1" TargetControlID="Uploader1"
		runat="server" ProgressImageUrl="../../Images/installation_progress.gif" ProgressCssClass="ip-progress"
		InstructionsCssClass="ip-instructions">
	</aur:InstallationProgress>
</asp:Content>
