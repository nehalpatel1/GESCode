<%@ Page Title="Global Earthmoving Solutions - Add Used Equipment Wizard - Step 2 of 3" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddUsedEquipment_Page2.aspx.cs" Inherits="HelloGES.AddUsedEquipment_Page2" %>
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
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="menuheading">
        Add Used Equipment Wizard - Step 2 of 3
    </div>

    <div  style="height:100%" class="defaultpage">
        <div>
            <h1 runat="server" id="SearchResultBar">Equipment Information</h1>
        </div>    
    
        <div style="float:left; width:50%">
            Make
            <br />
            <asp:ListBox ID="lbManufacturer" runat="server" 
                DataTextField="ManufacturerName" 
                DataValueField="ManufacturerID" Width="100%" Height="100px"></asp:ListBox>

            <div id="AdminSection" runat="server" style="float:left; width:50%">
                <asp:TextBox ID="txtAddManu" runat="server"></asp:TextBox>
                <asp:Button ID="btnAddManu" runat="server" Text="Add" Width="53px" 
                    onclick="btnAddManu_Click" CausesValidation="False" />
                <asp:Label ID="lblAddManu" runat="server" style="font-size: x-small"></asp:Label>
                <asp:Label ID="lblAddManuError" runat="server" 
                    style="font-size: x-small; color: #FF3300"></asp:Label>
            </div>
        </div>

        <div style="float:left; width:5%">
        </div>
        <div style="float:right; width:44%">
            Model
            <br />
            <asp:TextBox ID="tbModel" runat="server" Width="100%"></asp:TextBox>
            <br />
            Year
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                ErrorMessage="Numeric characters only" ForeColor="Red" 
                ValidationExpression="^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$" 
                ControlToValidate="txtYear" CssClass="style8"></asp:RegularExpressionValidator>
            <br />
            <asp:TextBox ID="txtYear" runat="server" Width="100%"></asp:TextBox>
            <br />
            Cost Price
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ErrorMessage="Numeric characters only" ForeColor="Red" 
                ValidationExpression="^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$" 
                ControlToValidate="txtCostPrice" CssClass="style8"></asp:RegularExpressionValidator>
            <br />
            <asp:TextBox ID="txtCostPrice" runat="server" Width="100%"></asp:TextBox>
            <br />
            Sale Price
            * <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtSalesPrice" 
                CssClass="style8"></asp:RequiredFieldValidator>

        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                   ErrorMessage="Numeric characters only" ForeColor="Red" 
                ValidationExpression="^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$" 
                ControlToValidate="txtSalesPrice" CssClass="style8"></asp:RegularExpressionValidator>
            <br />

            <asp:TextBox ID="txtSalesPrice" runat="server" Width="100%"></asp:TextBox>
            &nbsp;
        </div>
        <div>
            <h1 runat="server" id="H1">Additional Information</h1>
        </div>    
        <div style="float:left; width:50%; height: 311px;">
            Description
            <br />
            <asp:TextBox ID="txtMachineDescription" runat="server" Width="100%" 
                Height="294px" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div style="float:left; width:5%">
        </div>
        <div style="float:right; width:44%">
            Condition
            <br />
            <asp:TextBox ID="txtMachineGrade" runat="server" Width="100%"></asp:TextBox>
            <br />
            Serial
            <br />
            <asp:TextBox ID="txtSerial" runat="server" Width="100%"></asp:TextBox>
            <br />
            Mileage / Hours
            <br />
            <asp:TextBox ID="txtMileage" runat="server" Width="100%"></asp:TextBox>
            <br />
            Location
            <br />
            <asp:TextBox ID="txtLocation" runat="server" Width="100%"></asp:TextBox>
            <br />
            Contact Person *                     
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ErrorMessage="Required" ForeColor="Red" 
                        ControlToValidate="txtContactPerson" CssClass="style8"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="txtContactPerson" runat="server" Width="100%"></asp:TextBox>
            <br />
            Email Address *
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ErrorMessage="Required" ForeColor="Red" 
                        ControlToValidate="txtEmailAddress" CssClass="style8"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="txtEmailAddress" runat="server" Width="100%"></asp:TextBox>
            <br />
            Contact number *
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ErrorMessage="Required" ForeColor="Red" 
                        ControlToValidate="txtContactNumber" CssClass="style8"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="txtContactNumber" runat="server" Width="100%"></asp:TextBox>
            <br />
            Status
            <br />
            <asp:DropDownList ID="listStatus" runat="server" Width="100%">
                <asp:ListItem>Active</asp:ListItem>
                <asp:ListItem>Inactive</asp:ListItem>
                <asp:ListItem>Sold</asp:ListItem>
            </asp:DropDownList>
            
        </div>
        <br />
        <br />
        <div style="float:left; width:100%; height:50px" align="center">
            <br />
            <asp:Button ID="btnAddMachine" runat="server" onclick="btnAddMachine_Click" 
                Text="Proceed to Step 3 &gt;&gt;" CssClass="btnSubmit" />
            &nbsp;<asp:Label ID="lblStatus" runat="server"></asp:Label>
        </div>

        <!--
        <asp:EntityDataSource ID="MachineEntityDataSource" runat="server" ContextTypeName="HelloGES.DAL.GESEntities"
            EnableFlattening="False" EntitySetName="Machines" 
            ConnectionString="name=GESEntities" DefaultContainerName="GESEntities" 
            EnableInsert="True">
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="ManufacturerEntityDataSource" runat="server" ConnectionString="name=GESEntities"
            DefaultContainerName="GESEntities" EnableDelete="True" EnableFlattening="False"
            EntitySetName="Manufacturers" EntityTypeFilter="Manufacturer">
        </asp:EntityDataSource>
        -->
    </div>
    </asp:Content>
