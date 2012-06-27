<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs"
	Inherits="WizardDemo_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link rel="stylesheet" type="text/css" href="multistepwizard.css" />
	<script type="text/javascript">

		var uploaderID = '<%= Uploader1.ClientID %>';

		$(function () {
			var tabs = $("#wizard").tabs({
				select: function (event, ui) {
					if (ui.index == 2) {
						updateConfirmTab();
					}
				}
			});

			$('button').button();

			$('button.next').click(function () {
				tabs.tabs('select', tabs.tabs('option', 'selected') + 1);
			});

			$('#uploadButton').button('disable').click(function () {
				var th = $(this);
				if (th.data('uploading') == true) {
					$au.uploader(uploaderID).cancelUpload();
					$('.ui-button-text', th).text('Upload');
					th.data('uploading', false);
				} else {
					$au.uploader(uploaderID).upload();
					$('.ui-button-text', th).text('Cancel');
					th.data('uploading', true);
				}
			});

			$('#progressbar').progressbar({ value: 0 });

			// Render uploader after tabs created
			$('#uploader-container').html($au.uploader(uploaderID).getHtml());

			function updateConfirmTab() {
				$('#details').empty();
				var values = {};
				$('#details-form').find(':input').each(function (index, el) {
					el = $(el);
					values[el.attr('id')] = el.val();
				});
				$('#details-form').clone().find(':input').each(function (index, el) {
					el = $(el);
					var value = values[el.attr('id')];
					if (value == '' || value.toLowerCase() == 'select') {
						el.replaceWith('<span class="value">' + '&mdash;' + '</span>');
					} else {
						el.replaceWith('<span class="value">' + value + '</span>');
					}
				}).end().find('label').each(function (index, el) {
					$(el).removeAttr('for');
				}).end().appendTo('#details');

				var u = $au.uploader(uploaderID),
					thumbConf = {
						parentControlName: u.id(),
						width: '100px',
						height: '100px',
						javaControl: {
							codeBase: u.javaControl().codeBase()
						},
						activeXControl: {
							codeBase: u.activeXControl().codeBase(),
							codeBase64: u.activeXControl().codeBase64()
						}
					},
					html = '';

				for (var i = 0, imax = u.files().count(); i < imax; i++) {
					thumbConf.id = 'th' + Math.round(Math.random() * 1000000); // Generate unique id
					var f = u.files().get(i);
					thumbConf.guid = f.guid();
					html += '<div class="thumbnail-item-outer">';
					html += $au.thumbnail(thumbConf).getHtml();
					html += '<div class="thumbnail-item-description">' + f.description() + '</div>';
					html += '</div>';

				}
				$('#thumbnails').find('object').remove().end().empty().append(html);

				if (imax > 0) {
					$('#uploadButton').button('enable');
				} else {
					$('#uploadButton').button('disable');
				}
			}
		});

		function onProgress(percent, uploadedFiles, totalFiles, uploadedBytes, totalBytes) {
			$('#progressbar').progressbar('value', percent * 1);
		}
	
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<div id="wizard">
		<ul>
			<li><a href="#wizard-1">Step&nbsp;1</a></li>
			<li><a href="#wizard-2">Step&nbsp;2</a></li>
			<li><a href="#wizard-3">Confirm</a></li>
		</ul>
		<div id="wizard-1">
			<div id="details-form">
				<fieldset class="content-block">
					<div class="row">
						<label for="propertyTypeDropDownList" class="caption">
							Type of property</label>
						<select id="propertyTypeDropDownList" name="propertyTypeDropDownList">
							<option>Apartment</option>
							<option>Multi Family House</option>
							<option>Multi Family Townhouse</option>
							<option>Single Family House</option>
							<option>Single Family Townhouse</option>
						</select>
					</div>
					<div class="row">
						<label for="headlineTextBox" class="caption">
							Headline</label>
						<input id="headlineTextBox" name="headlineTextBox" type="text" />
					</div>
					<div class="row">
						<label for="descriptionTextBox" class="caption">
							Description</label>
						<input id="descriptionTextBox" name="descriptionTextBox" type="text" />
					</div>
					<div class="row">
						<label for="priceTextBox" class="caption">
							Price</label>
						<input id="priceTextBox" name="priceTextBox" type="text" />
					</div>
				</fieldset>
				<fieldset class="content-block">
					<legend>Address</legend>
					<div class="row">
						<label for="numberTextBox" class="caption">
							Building Number</label>
						<input id="numberTextBox" name="numberTextBox" type="text" />
					</div>
					<div class="row">
						<label for="streetTextBox" class="caption">
							Street</label>
						<input id="streetTextBox" name="streetTextBox" type="text" />
					</div>
					<div class="row">
						<label for="cityTextBox" class="caption">
							City</label>
						<input id="cityTextBox" name="cityTextBox" type="text" />
					</div>
					<div class="row">
						<label for="zipCodeTextBox" class="caption">
							Zip Code</label>
						<input id="zipCodeTextBox" name="zipCodeTextBox" type="text" />
					</div>
				</fieldset>
				<fieldset class="content-block">
					<legend>Details</legend>
					<div class="row">
						<label for="bedroomsDropDownList" class="caption">
							#&nbsp;Bedrooms</label>
						<select id="bedroomsDropDownList" name="bedroomsDropDownList">
							<option value="">Select</option>
							<option>---</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7+</option>
						</select>
					</div>
					<div class="row">
						<label for="bathroomsDropDownList" class="caption">
							#&nbsp;Bathrooms</label>
						<select id="bathroomsDropDownList" name="bathroomsDropDownList">
							<option value="">Select</option>
							<option>---</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select>
					</div>
					<div class="row">
						<label for="squareTextBox" class="caption">
							Square Feet</label>
						<input id="squareTextBox" name="squareTextBox" type="text" />
					</div>
				</fieldset>
			</div>
			<div class="nav">
				<button type="button" class="next">
					Next</button>
			</div>
		</div>
		<div id="wizard-2">
			<div class="content-block">
				Select photos you want to upload. 10 files allowed.
			</div>
			<aur:Uploader runat="server" ID="Uploader1" LicenseKey="<%$ AppSettings:ImageUploaderLicenseKey %>"
				Width="100%" Height="500px" EnableUploadProgress="false" UploadButtonText=""
				ManualRendering="true" OnFileUploaded="Uploader1_FileUploaded">
				<Converters>
					<aur:Converter Mode="*.*=SourceFile" />
					<aur:Converter Mode="*.*=Thumbnail" ThumbnailHeight="120" ThumbnailWidth="120" />
				</Converters>
				<ClientEvents>
					<aur:ClientEvent EventName="Progress" HandlerName="onProgress" />
				</ClientEvents>
				<Restrictions MaxFileCount="10" />
				<FolderPane Height="500" />
				<UploadSettings RedirectUrl="Gallery.aspx" />
			</aur:Uploader>
			<aur:InstallationProgress ID="InstallationProgress1" TargetControlID="Uploader1"
				runat="server" ProgressImageUrl="../Images/installation_progress.gif" ProgressCssClass="ip-progress"
				InstructionsCssClass="ip-instructions">
			</aur:InstallationProgress>
			<div id="uploader-container">
			</div>
			<div class="nav">
				<button type="button" class="next">
					Next</button>
			</div>
		</div>
		<div id="wizard-3">
			<div id="details">
			</div>
			<fieldset class="content-block">
				<legend>Photos</legend>
				<div id="thumbnails">
				</div>
			</fieldset>
			<div class="nav">
				<button type="button" id="uploadButton">
					Upload</button>
				<div id="progressbar">
				</div>
			</div>
		</div>
	</div>
</asp:Content>
