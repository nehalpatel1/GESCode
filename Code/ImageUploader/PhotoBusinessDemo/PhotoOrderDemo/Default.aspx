<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs"
	Inherits="PhotoOrder_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link rel="stylesheet" type="text/css" href="photoorder.css" />
	<script src="photoorder.js" type="text/javascript"></script>
	<style type="text/css">
		#<%= Uploader1.ClientID + "_aspnetcontrol_wrapper" %> { height: 100%; }
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<div class="sidebar">
		<p class="thumbnail-note">
			Add photos and specify formats you want to print.</p>
		<div class="thumbnail">
			<aur:Thumbnail ID="Thumbnail1" runat="server" Width="210" Height="200" ParentControlName="Uploader1">
			</aur:Thumbnail>
		</div>
		<div class="nav">
			<a class="nav-prev disabled" href="#" onclick="changeThumbnail(-1);return false;">&lt;&nbsp;prev</a>
			<a class="nav-next disabled" href="#" onclick="changeThumbnail(1);return false;">next&nbsp;&gt;</a>
			<div class="clear">
			</div>
		</div>
		<div class="attrs">
			<table>
				<tbody>
					<tr>
						<td>
							Size
						</td>
						<td>
							Paper
						</td>
						<td>
							Quantity
						</td>
					</tr>
					<tr>
						<td>
							<select class="attr-field" onchange="itemChange()" name="size" id="size">
								<option value="4x6">4x6</option>
								<option value="5x7">5x7</option>
								<option value="8x10">8x10</option>
								<option value="16x20">16x20</option>
								<option value="20x30">20x30</option>
							</select>
						</td>
						<td>
							<select class="attr-field" onchange="itemChange()" name="paper" id="paper">
								<option value="Glossy">Glossy</option>
								<option value="Matt">Matt</option>
							</select>
						</td>
						<td>
							<table cellpadding="0" cellspacing="0">
								<tbody>
									<tr>
										<td rowspan="2">
											<input id="quantity" class="attr-field" maxlength="3" onkeydown="return filterQuantity(event);"
												onchange="itemChange()" name="quantity" value="1" type="text" />
										</td>
										<td>
											<button onclick="changeQuantity(+1);" class="numeric-button numeric-button-up" type="button">
												&#9650;</button>
										</td>
									</tr>
									<tr>
										<td>
											<button onclick="changeQuantity(-1);" class="numeric-button numeric-button-down"
												type="button">
												&#9660;</button>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="buttons">
			<button id="phoApplyAll" disabled="disabled" onclick="itemChange(true);" type="button">
				Apply to all photos</button>
			<button id="phoAdd" onclick="addFiles();" type="button">
				Add photos...</button>
			<button id="phoUpload" disabled="disabled" onclick="startUpload();" type="button">
				Upload and continue &gt;&gt;</button>
		</div>
	</div>
	<div class="uploader">
		<aur:Uploader ID="Uploader1" runat="server" Width="100%" Height="100%" LicenseKey="<%$ AppSettings:ImageUploaderLicenseKey %>"
			PaneLayout="OnePane" BorderStyle="None" BackgroundColor="#fafafa" EnableDescriptionEditor="false"
			EnableImageEditor="false" EnableRotation="false" UploadButtonText="" OnFileUploaded="Uploader1_FileUploaded">
			<Restrictions FileMask="*.jpeg;*.jpg;*.png;*.gif;*.bmp" MaxFileCount="20" />
			<Converters>
				<aur:Converter Mode="*.*=SourceFile" />
				<aur:Converter Mode="*.*=Thumbnail" ThumbnailHeight="150" ThumbnailWidth="150" />
			</Converters>
			<UploadSettings RedirectUrl="Gallery.aspx" FilesPerPackage="1" />
			<ClientEvents>
				<aur:ClientEvent EventName="BeforeUpload" HandlerName="onBeforeUpload" />
				<aur:ClientEvent EventName="SelectionChange" HandlerName="onSelectionChanged" />
				<aur:ClientEvent EventName="UploadFileCountChange" HandlerName="onUploadFileCountChange" />
			</ClientEvents>
			<PaneItem>
				<QualityMeter Formats="4 x 6,1800,1200,1.5;5 x 7,2100,1500,1.5;8 x 10,3000,2400,1.5;16 x 20,4000,3200,2;30 x 20,6000,4000,2" />
			</PaneItem>
			<UploadPane ViewMode="Tiles" TilePreviewSize="100" TileHeight="100"
				TileTemplate="<p></p>"></UploadPane>
		</aur:Uploader>
		<aur:InstallationProgress ID="InstallationProgress1" TargetControlID="Uploader1"
			runat="server" ProgressImageUrl="../../Images/installation_progress.gif" ProgressCssClass="ip-progress"
			InstructionsCssClass="ip-instructions">
		</aur:InstallationProgress>
	</div>
	<div class="legend">
		<p>
			<span style="background-color: #5bc529;"></span>Recommended print format. Image
			dimensions are good for high quality prints for print size.
		</p>
		<p>
			<span style="background-color: #ffc600;"></span>Acceptable print format. Image dimensions
			are good enough to provide acceptable quality.
		</p>
		<p>
			<span style="background-color: #ececec;"></span>Not recommended for printing. Image
			dimensions are too small for print size.
		</p>
	</div>
	<script type="text/javascript">

		var u = $au.uploader('<%= Uploader1.ClientID %>');
		var th = $au.thumbnail('<%= Thumbnail1.ClientID %>');
	
	</script>
</asp:Content>
