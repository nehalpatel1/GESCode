<%@ Page Title="Global Earthmoving Solutions - Add Used Equipment Wizard - Step 3 of 3" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddUsedEquipment_Page3.aspx.cs" Inherits="HelloGES.AddUsedEquipment_Page3" %>
<%@ Register assembly="Aurigma.ImageUploader" namespace="Aurigma.ImageUploader" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="menuheading">
        Add Used Equipment Wizard - Step 3 of 3
    </div>
        
    <div style="height:100%" class="defaultpage">
        <div>
            <h1 runat="server" id="SearchResultBar">Upload Equipment Pictures</h1>
        </div>    
    
        <asp:Panel ID="Panel1" runat="server">
                <asp:Button ID="btnToggleUpload" runat="server" Text="Toggle Upload Method" 
                    CausesValidation="False" CssClass="btnSubmit" 
                    onclick="btnToggleUpload_Click" />
        </asp:Panel>

        <asp:Panel ID="pnNormalUpload" runat="server" Visible="False">
            <div style="float:left; width:100%; " align="center">
                Choose images to upload
                <br />
                <asp:FileUpload ID="uploadFile" runat="server" Width="100%" />
                        
                <br />
                <br />
                <asp:Button ID="btnUpload" runat="server" Text="Upload Selected File" 
                    CausesValidation="False" onclick="btnUpload_Click" CssClass="btnSubmit" />
                <br />
                <br />
                <asp:Label ID="UploadDetails" runat="server"></asp:Label>
                <br />
            </div>
        </asp:Panel>
        
        <asp:Panel ID="pnArigmaUpload" runat="server" Visible="True">
            <div style="float:left; width:100%">
                <cc1:Uploader ID="Uploader1" runat="server" Language="English" 
                    Width="100%" height="500px" EnableDescriptionEditor="true" EnableRotation="true" 
                    onfileuploaded="Uploader1_FileUploaded" 
                    LicenseKey="76FF1-0011B-FFF10-00099-8E2BD-A3C5F9" 
                    onallfilesuploaded="Uploader1_AllFilesUploaded">
        		    <Converters>
                        <cc1:Converter Mode="*.*=SourceFile" />
                    </Converters>
                    <FolderPane Height="370" />
		            <UploadPane ViewMode="List">
		            </UploadPane>
		            <PaneItem ShowFileNameInThumbnailsView="true">
		            </PaneItem>
		            <DetailsViewColumns InfoText="" />

                </cc1:Uploader>
                <cc1:InstallationProgress ID="InstallationProgress1" targetcontrolid="Uploader1" runat="server" progressimageurl="/Images/installation_progress.gif"
		                progresscssclass="ip-progress" instructionscssclass="ip-instructions">
                </cc1:InstallationProgress>
                <a href="http://www.aurigma.com/Products/ImageUploader/" title="Aurigma Image Uploader - powerful user-friendly file upload solution for a wide range of websites.">Aurigma file upload solution</a> is used to upload photos to this website.
            </div>
        </asp:Panel>

        <div style="float:left; height:5%">
        </div>
        <div style="float:Left; width:100%">
            <asp:GridView ID="gridPhotos" runat="server" AutoGenerateColumns="False" onrowcommand="gridPhotos_RowCommand">
                <Columns>
                    <asp:BoundField DataField="PhotoID" HeaderText="Photo ID" />
                    <asp:BoundField DataField="ShowThumbnail" HeaderText="ShowThumbnail" 
                        SortExpression="ShowThumbnail" />
                    <asp:ImageField DataImageUrlField="PhotoUrl" HeaderText="Photo">
                        <ControlStyle Height="75px" />
                    </asp:ImageField>
                    <asp:BoundField DataField="PhotoUrl" HeaderText="Url" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" cssclass="btnSubmit" CommandName="setThumbnail" CausesValidation="false" CommandArgument="<%# Container.DataItemIndex %>" Text="Set as thumbnail" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnDeletePhoto" runat="server" cssclass="btnSubmit" CommandName="deletePhoto" CausesValidation="false" CommandArgument="<%# Container.DataItemIndex %>" Text="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <div style="float:left; width:100%" align="center">
            <br />
            <asp:Button ID="btnAddMachine" runat="server" onclick="btnAddMachine_Click" 
                    Text="Complete &gt;&gt;" CssClass="btnSubmit" />
        </div>
    </div>
</asp:Content>
