<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs"
	Inherits="MultipleDescriptions_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link href="multipledescriptions.css" rel="stylesheet" type="text/css" />
	<script src="multipledescriptions.js" type="text/javascript"></script>
	<script type="text/javascript">

		var uploaderId = '<%= Uploader1.ClientID %>',
			uploadPaneId = uploaderId + '_UploadPane';

		$(function () {
			$('#' + uploadPaneId).bind('dragenter dragover', function (e) {
				e.originalEvent.dataTransfer.dropEffect = 'none';
				e.stopPropagation();
				e.preventDefault();
			});
		});

	</script>
	<!-- Template for an item in custom upload pane -->
	<script id="item-template" type="text/x-template"> 
        <li class="upload-pane-item">
          <table class="item" cellpadding="0" cellspacing="0">
            <tr>
              <td rowspan="4">
                <div class="thumnail">
                  ${thumbnail}
                </div>
              </td>
              <td>
                Title
              </td>
            </tr>
            <tr>
              <td>
                <input type="text" class="title-field" />
              </td>
            </tr>
            <tr>
              <td>
                Description
              </td>
            </tr>
            <tr>
              <td>
                <textarea class="description-field" rows="3" cols="17"></textarea>
              </td>
            </tr>
          </table>
          <a class="remove" href="javascript:;" title="remove">X</a></li>
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<aur:Uploader ID="Uploader1" runat="server" OnFileUploaded="Uploader1_FileUploaded"
		LicenseKey="<%$ AppSettings:ImageUploaderLicenseKey %>" Width="100%" EnableUploadPane="false"
		EnableDragAndDrop="false" EnableDescriptionEditor="false">
		<Converters>
			<aur:Converter Mode="*.*=Thumbnail" ThumbnailHeight="120" ThumbnailWidth="120" />
			<aur:Converter Mode="*.*=Thumbnail" ThumbnailHeight="700" ThumbnailWidth="700" />
		</Converters>
		<ClientEvents>
			<aur:ClientEvent EventName="BeforeUpload" HandlerName="onBeforeUpload" />
			<aur:ClientEvent EventName="UploadFileCountChange" HandlerName="onUploadFileCountChange" />
		</ClientEvents>
		<Restrictions FileMask="*.jpg;*.jpeg;*.png;*.gif;*.bmp" />
		<UploadSettings RedirectUrl="Gallery.aspx" />
	</aur:Uploader>
	<aur:InstallationProgress ID="InstallationProgress1" TargetControlID="Uploader1"
		runat="server" ProgressImageUrl="../Images/installation_progress.gif" ProgressCssClass="ip-progress"
		InstructionsCssClass="ip-instructions">
	</aur:InstallationProgress>
	<ul id="<%= Uploader1.ClientID %>_UploadPane" class="upload-pane">
	</ul>
</asp:Content>