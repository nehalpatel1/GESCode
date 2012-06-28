<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddUsedEquipment.aspx.cs" Inherits="HelloGES.AddUsedEquipment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 96px;
            height: 21px;
        }
        .style2
        {
            width: 385px;
            height: 21px;
        }
        .style3
        {
            width: 178px;
            height: 21px;
        }
        .style5
    {
            width: 203px;
            height: 21px;
        }
        .style8
        {
            font-size: x-small;
        }
        .style9
        {
            width: 106px;
            height: 21px;
            font-size: x-small;
        }
        .style10
        {
            width: 106px;
            height: 21px;
        }
        .style11
        {
            width: 197px;
            height: 21px;
        }
        .style13
        {
            width: 223px;
            height: 11px;
        }
        .style14
        {
            width: 223px;
            height: 21px;
        }
        .style15
        {
            width: 285px;
            height: 28px;
        }
        .style16
        {
            width: 698px;
            height: 28px;
        }
        .style17
        {
            width: 223px;
        }
        .style18
        {
            width: 698px;
        }
        .style19
        {
            width: 698px;
            height: 11px;
        }
        .style20
        {
            width: 285px;
            height: 41px;
        }
        .style21
        {
            width: 698px;
            height: 41px;
        }
        .style22
        {
            width: 108px;
            height: 21px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="menuheading">
        Add a machine to the showroom
    </div>
    <asp:EntityDataSource ID="MachineEntityDataSource" runat="server" ContextTypeName="HelloGES.DAL.GESEntities"
        EnableFlattening="False" EntitySetName="Machines" 
        ConnectionString="name=GESEntities" DefaultContainerName="GESEntities" 
        EnableInsert="True">
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="ManufacturerEntityDataSource" runat="server" ConnectionString="name=GESEntities"
        DefaultContainerName="GESEntities" EnableDelete="True" EnableFlattening="False"
        EntitySetName="Manufacturers" EntityTypeFilter="Manufacturer">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="MachineTypeEntityDataSource" runat="server" ConnectionString="name=GESEntities"
        DefaultContainerName="GESEntities" EnableDelete="True" EnableFlattening="False"
        EntitySetName="MachineTypes" EntityTypeFilter="MachineType">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="ModelEntityDataSource" runat="server" ConnectionString="name=GESEntities"
        DefaultContainerName="GESEntities" EnableDelete="True" EnableFlattening="False"
        EntitySetName="Models" EntityTypeFilter="Model">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="IndustryEntityDataSource" runat="server" ConnectionString="name=GESEntities"
        DefaultContainerName="GESEntities" EnableDelete="True" EnableFlattening="False"
        EntitySetName="Industries" EntityTypeFilter="Industry">
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="PhotosEntityDataSource" runat="server" ConnectionString="name=GESEntities" 
        DefaultContainerName="GESEntities" EnableFlattening="False" EntitySetName="Photos" 
        EntityTypeFilter="Photo" AutoGenerateWhereClause="True" 
        EnableDelete="True" >
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="SpecsEntityDataSource" runat="server" ConnectionString="name=GESEntities" 
        DefaultContainerName="GESEntities" EnableFlattening="False" EntitySetName="Specifications" 
        EntityTypeFilter="Specification" AutoGenerateWhereClause="True" 
        EnableDelete="True" >
    </asp:EntityDataSource>

    <br />
  
    <td id="Td1" runat="server">
        <table border="0" style="width: 874px">
            <tr >
                <td colspan="4">
                    <div class="left">
                        <h1 runat="server" id="H2">Machine Details</h1>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="style22">Manufacturer *</td>
                <td style="vertical-align:middle; text-align:left" class="style5">
                    <asp:DropDownList ID="listManufacturer" runat="server" Height="16px" 
                        Width="100%" DataSourceID="ManufacturerEntityDataSource" 
                        DataTextField="ManufacturerName" DataValueField="ManufacturerID" 
                        onselectedindexchanged="listManufacturer_SelectedIndexChanged" 
                        AutoPostBack="True" ondatabound="listManufacturer_DataBound">
                    </asp:DropDownList>
                </td>
                <td class="style10" width="100">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Required" ForeColor="Red" 
                        ControlToValidate="listManufacturer" CssClass="style8" InitialValue="-1"></asp:RequiredFieldValidator>
                </td>
                <td class="style11">
                    <asp:TextBox ID="txtAddManu" runat="server"></asp:TextBox>
                    <asp:Button ID="btnAddManu" runat="server" Text="Add" Width="53px" 
                        onclick="btnAddManu_Click" CausesValidation="False" />
                    <asp:Label ID="lblAddManu" runat="server" style="font-size: x-small"></asp:Label>
                    <asp:Label ID="lblAddManuError" runat="server" 
                        style="font-size: x-small; color: #FF3300"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style22">Machine Type *</td>
                <td style="vertical-align:middle; text-align:left" class="style5">
                    <asp:DropDownList ID="listMachineType" runat="server" Width="100%" 
                        DataSourceID="MachineTypeEntityDataSource" DataTextField="MachineTypeName" 
                        DataValueField="MachineTypeID" AutoPostBack="True" 
                        onselectedindexchanged="listMachineType_SelectedIndexChanged" 
                        ondatabound="listMachineType_DataBound">
                    </asp:DropDownList>
                </td>
                <td class="style10" width="100">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Required" ForeColor="Red" 
                        ControlToValidate="listMachineType" CssClass="style8" InitialValue="-1"></asp:RequiredFieldValidator>
                </td>
                <td class="style11">
                    <asp:TextBox ID="txtAddMachType" runat="server"></asp:TextBox>
                    <asp:Button ID="btnAddMachType" runat="server" Text="Add" Width="53px" 
                        onclick="btnAddMachType_Click" CausesValidation="False" />
                    <asp:Label ID="lblAddMach" runat="server" style="font-size: x-small"></asp:Label>
                    <asp:Label ID="lblAddMachTypeError" runat="server" 
                        style="font-size: x-small; color: #FF3300"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style22">Model *</td>
                <td style="vertical-align:middle; text-align:left" class="style5">
                    <asp:DropDownList ID="listModel" runat="server" Width="100%" 
                        DataSourceID="ModelEntityDataSource" DataTextField="ModelName" 
                        DataValueField="ModelID" ondatabound="listModel_DataBound">
                    </asp:DropDownList>
                </td>
                <td class="style10" width="100">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="Required" ForeColor="Red" ControlToValidate="listModel" 
                        CssClass="style8" InitialValue="-1"></asp:RequiredFieldValidator>
                </td>
                <td class="style11">
                    <asp:TextBox ID="txtAddModel" runat="server"></asp:TextBox>
                    <asp:Button ID="btnAddModel" runat="server" Text="Add" Width="53px" 
                        onclick="btnAddModel_Click" CausesValidation="False" />
                    <asp:Label ID="lblAddModel" runat="server" style="font-size: x-small"></asp:Label>
                    <asp:Label ID="lblAddModelError" runat="server" 
                        style="font-size: x-small; color: #FF3300"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style22">Industry *</td>
                <td style="vertical-align:middle; text-align:left" class="style5">
                    <asp:DropDownList ID="listIndustry" runat="server" Width="100%" 
                        DataSourceID="IndustryEntityDataSource" DataTextField="IndustryName" 
                        DataValueField="IndustryID" ondatabound="listIndustry_DataBound">
                    </asp:DropDownList>
                </td>
                <td class="style10" width="100">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="Required" ForeColor="Red" ControlToValidate="listIndustry" 
                        CssClass="style8" InitialValue="-1"></asp:RequiredFieldValidator>
                </td>
                <td class="style11">
                    <asp:TextBox ID="txtAddIndustry" runat="server"></asp:TextBox>
                    <asp:Button ID="btnAddIndustry" runat="server" Text="Add" Width="53px" 
                        onclick="btnAddIndustry_Click" CausesValidation="False" />
                    <asp:Label ID="lblAddIndustry" runat="server" style="font-size: x-small"></asp:Label>
                    <asp:Label ID="lblAddIndustryError" runat="server" 
                        style="font-size: x-small; color: #FF3300"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style22">Description</td>
                <td style="vertical-align:middle; text-align:left" class="style5">
                    <asp:TextBox ID="txtMachineDescription" runat="server" Width="100%" 
                        Height="153px" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td class="style10" width="100"></td>
            </tr>
            <tr>
                <td class="style22">Condition</td>
                <td style="vertical-align:middle; text-align:left" class="style5">
                    <asp:TextBox ID="txtMachineGrade" runat="server" Width="100%"></asp:TextBox>
                </td>
                <td class="style10" width="100"></td>
            </tr>
            <tr>
                <td class="style22">Serial #</td>
                <td style="vertical-align:middle; text-align:left" class="style5">
                    <asp:TextBox ID="txtSerial" runat="server" Width="100%"></asp:TextBox>
                </td>
                <td class="style10" width="100"></td>
            </tr>
            <tr>
                <td class="style22">Year</td>
                <td style="vertical-align:middle; text-align:left" class="style5">
                    <asp:TextBox ID="txtYear" runat="server" Width="100%"></asp:TextBox>
                </td>
                <td class="style10" width="100"></td>
            </tr>
            <tr>
                <td class="style22">Mileage</td>
                <td style="vertical-align:middle; text-align:left" class="style5">
                    <asp:TextBox ID="txtMileage" runat="server" Width="100%"></asp:TextBox>
                </td>
                <td class="style10" width="100"></td>
            </tr>
            <tr>
                <td class="style22">Location</td>
                <td style="vertical-align:middle; text-align:left" class="style5">
                    <asp:TextBox ID="txtLocation" runat="server" Width="100%"></asp:TextBox>
                </td>
                <td class="style10" width="100"></td>
            </tr>
            <tr>
                <td class="style22">Contact Person *</td>
                <td style="vertical-align:middle; text-align:left" class="style5">
                    <asp:TextBox ID="txtContactPerson" runat="server" Width="100%"></asp:TextBox>
                </td>
                <td class="style10" width="100">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ErrorMessage="Required" ForeColor="Red" 
                        ControlToValidate="txtContactPerson" CssClass="style8"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style22">Email Address *</td>
                <td style="vertical-align:middle; text-align:left" class="style5">
                    <asp:TextBox ID="txtEmailAddress" runat="server" Width="100%"></asp:TextBox>
                </td>
                <td class="style10" width="100">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ErrorMessage="Required" ForeColor="Red" 
                        ControlToValidate="txtEmailAddress" CssClass="style8"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style22">Contact Number *</td>
                <td style="vertical-align:middle; text-align:left" class="style5">
                    <asp:TextBox ID="txtContactNumber" runat="server" Width="100%"></asp:TextBox>
                </td>
                <td class="style10" width="100">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ErrorMessage="Required" ForeColor="Red" 
                        ControlToValidate="txtContactNumber" CssClass="style8"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style22">Cost Price</td>
                <td style="vertical-align:middle; text-align:left" class="style5">
                    <asp:TextBox ID="txtCostPrice" runat="server" Width="100%"></asp:TextBox>
                </td>
                <td class="style10" width="100">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ErrorMessage="Numeric characters only" ForeColor="Red" 
                        ValidationExpression="^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$" 
                        ControlToValidate="txtCostPrice" CssClass="style8"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style22">Sales Price *</td>
                <td style="vertical-align:middle; text-align:left" class="style5">
                    <asp:TextBox ID="txtSalesPrice" runat="server" Width="100%"></asp:TextBox>
                </td>
                <td class="style9" width="100">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="Numeric characters only" ForeColor="Red" 
                        ValidationExpression="^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$" 
                        ControlToValidate="txtSalesPrice"></asp:RegularExpressionValidator>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtSalesPrice"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style22">Status *</td>
                
                <td style="vertical-align:middle; text-align:left" class="style5">
                    <asp:DropDownList ID="listStatus" runat="server" Width="100%" 
                        ondatabound="listStatus_DataBound" 
                        onselectedindexchanged="listStatus_SelectedIndexChanged">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Inactive</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style10" width="100">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtSalesPrice" 
                        CssClass="style8"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style22">Dealer Machine *</td>
                
                <td style="vertical-align:middle; text-align:left" class="style5">
                    <asp:DropDownList ID="listDealerMachine" runat="server" Width="100%" 
                        ondatabound="listDealerMachine_DataBound" 
                        onselectedindexchanged="listDealerMachine_SelectedIndexChanged">
                        <asp:ListItem>Y</asp:ListItem>
                        <asp:ListItem>N</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style10" width="100">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtSalesPrice" 
                        CssClass="style8"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </td>
    <asp:Button ID="btnAddMachine" runat="server" onclick="btnAddMachine_Click" 
        Text="Add Machine" />
    &nbsp;
    <asp:Button ID="btnUpdateMachine" runat="server" onclick="btnUpdateMachine_Click" 
        Text="Update Machine" Width="141px" />
    &nbsp;
    <asp:Button ID="btnAddAnother" runat="server" onclick="btnAddAnother_Click" 
        Text="Add a New Machine" />
    <asp:Label ID="lblMachineID" runat="server"></asp:Label>
    <asp:Label ID="lblStatus" runat="server"></asp:Label>
    <br />
    <br />
    <asp:Panel ID="panelUpload" runat="server" BorderStyle="None" Visible="False">
        <table border="0" style="width: 692px">
            <tr>
                <td colspan="2">
                    <div class="left">
                        <h1 runat="server" id="H1">Upload Pics Here</h1>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="style20">
                    Choose an image to upload</td>
                <td style="vertical-align:middle; text-align:left" class="style21">
                    <asp:FileUpload ID="uploadFile" runat="server" Width="485px" />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="style15">
                    </td>
                <td style="vertical-align:middle; text-align:left" class="style16">
                    <asp:Button ID="btnUpload" runat="server" onclick="btnUpload_Click" 
                    Text="Upload Selected File" CausesValidation="False" />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td style="vertical-align:middle; text-align:left" class="style2">
                    <asp:Label ID="UploadDetails" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
 
    <br />
    <br />
    <asp:GridView ID="gridPhotos" runat="server" AutoGenerateColumns="False" 
        DataSourceID="PhotosEntityDataSource" Visible="False" 
        onrowcommand="gridPhotos_RowCommand">
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
                    <asp:Button ID="Button1" runat="server" CommandName="setThumbnail" CausesValidation="false" CommandArgument="<%# Container.DataItemIndex %>" Text="Set as thumbnail" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnDeletePhoto" runat="server" CommandName="deletePhoto" CausesValidation="false" CommandArgument="<%# Container.DataItemIndex %>" Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <asp:Panel ID="panelUploadSpecs" runat="server" BorderStyle="None" 
    Visible="False">
        <table border="0" style="width: 692px">
            <tr>
                <td colspan="2">
                    <div class="left">
                        <h1 runat="server" id="SearchResultBar">Upload Specifications Here</h1>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="style17">
                    Choose document/s to upload
                </td>
                <td style="vertical-align:middle; text-align:left" class="style18">
                </td>
            </tr>
            <tr>
                <td class="style13">
                    </td>
                <td style="vertical-align:middle; text-align:left" class="style19">
                    <asp:Button ID="btnUploadSpec" runat="server"  
                    Text="Upload Selected File" CausesValidation="False" 
                        onclick="btnUploadSpec_Click" />
                </td>
            </tr>
            <tr>
                <td class="style14">
                    &nbsp;</td>
                <td style="vertical-align:middle; text-align:left" class="style2">
                    <asp:Label ID="UploadTechDetails" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>

    <br />
    <asp:GridView ID="gridSpecs" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SpecsEntityDataSource" Visible="False" 
        onrowcommand="gridPhotos_RowCommand">
        <Columns>
            <asp:BoundField DataField="SpecID" HeaderText="SpecID" ReadOnly="True" 
                SortExpression="SpecID" />
            <asp:BoundField DataField="PhotoUrl" HeaderText="Url" />
            <asp:BoundField DataField="SpecUrl" HeaderText="SpecUrl" 
                SortExpression="SpecUrl" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnDeletePhoto0" runat="server" CommandName="deletePhoto" 
                        CausesValidation="false" CommandArgument="<%# Container.DataItemIndex %>" 
                        Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <br />
    <br />
    <asp:HiddenField ID="hfManufacturer" runat="server" />
    <asp:HiddenField ID="hfMachineType" runat="server" />
    <asp:HiddenField ID="hfModel" runat="server" />
    <asp:HiddenField ID="hfIndustry" runat="server" />
    <asp:HiddenField ID="hfStatus" runat="server" />
    <asp:HiddenField ID="hfDealerMachine" runat="server" />
    <br />
    </asp:Content>
