<%@ Page Title="Global Earthmoving Solutions - Add Used Equipment Wizard - Step 1 of 3" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddUsedEquipment_Page1.aspx.cs" Inherits="HelloGES.AddUsedEquipment_Page1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="menuheading">
        Add Used Equipment Wizard - Step 1 of 3</div>
    
    <div style="height:100%" class="defaultpage">
        <div>
            <h1 runat="server" id="SearchResultBar">Categorise Machine</h1>
        </div>    
    
        <div style="float:left; width:50%">
            Choose an Industry
            <br />
            <br />
            <asp:ListBox ID="lbIndustry" runat="server" 
                DataTextField="IndustryName" 
                DataValueField="IndustryID" Width="100%" Height="300px"></asp:ListBox>
        </div>
        <div style="float:left; width:5%">
        </div>
        <div style="float:right; width:44%">
            Choose an Equipment Type
            <br />
            <br />
            <asp:ListBox ID="lbMachineType" runat="server" 
                DataTextField="MachineTypeName" 
                DataValueField="MachineTypeID" Width="100%" Height="300px"></asp:ListBox>
        </div>

        <div id="AdminSection" runat="server">
            <div style="float:left; width:50%">
                    Industry Creation
                    <asp:TextBox ID="txtAddIndustry" runat="server"></asp:TextBox>
                    <asp:Button ID="btnAddIndustry" runat="server" Text="Add" Width="53px" 
                        onclick="btnAddIndustry_Click" CausesValidation="False" 
                        CssClass="btnSubmit" />
                    <asp:Label ID="lblAddIndustry" runat="server" style="font-size: x-small"></asp:Label>
                    <asp:Label ID="lblAddIndustryError" runat="server" 
                        style="font-size: x-small; color: #FF3300"></asp:Label>
            </div>
            <div style="float:left; width:5%">
            </div>
            <div style="float:right; width:44%">
                    Machine Creation
                    <asp:TextBox ID="txtAddMachType" runat="server"></asp:TextBox>
                    <asp:Button ID="btnAddMachType" runat="server" Text="Add" Width="53px" 
                        onclick="btnAddMachType_Click" CausesValidation="False" 
                        CssClass="btnSubmit" />
                    <asp:Label ID="lblAddMach" runat="server" style="font-size: x-small"></asp:Label>
                    <asp:Label ID="lblAddMachTypeError" runat="server" 
                        style="font-size: x-small; color: #FF3300"></asp:Label>
            </div>
        </div>

        <div style="float:left; width:100%; height:50px" align="center">
            <br />
            <asp:Button ID="btnAddMachine" runat="server" onclick="btnAddMachine_Click" 
                    Text="Proceed to Step 2 &gt;&gt;" CssClass="btnSubmit" />
        </div>
        <!--
        <asp:EntityDataSource ID="MachineTypeEntityDataSource" runat="server" ConnectionString="name=GESEntities"
            DefaultContainerName="GESEntities" EnableDelete="True" EnableFlattening="False"
            EntitySetName="MachineTypes" EntityTypeFilter="MachineType">
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="IndustryEntityDataSource" runat="server" ConnectionString="name=GESEntities"
            DefaultContainerName="GESEntities" EnableDelete="True" EnableFlattening="False"
            EntitySetName="Industries" EntityTypeFilter="Industry">
        </asp:EntityDataSource>
        -->
    </div>
    </asp:Content>
