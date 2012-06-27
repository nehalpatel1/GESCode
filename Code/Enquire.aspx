<%@Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Enquire.aspx.cs" Inherits="HelloGES.Enquire" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Global Earthmoving Solutions - Enquire</title>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
    </div>
    <div class="menuheading">
        Please submit your enquiry
    </div>
    <div class="defaultpage">
        <div style="float:left; width:50%">
            <br />
            First Name
            *
            <asp:TextBox ID="txtFirstName" runat="server" Width = "100%"></asp:TextBox>
            <br />
            Surname
            *
            <asp:TextBox ID="txtSurname" runat="server" Width = "100%"></asp:TextBox>
            <br />
            E-Mail Address
            *<br />
            <asp:TextBox ID="txtEmail" runat="server" Width = "100%"></asp:TextBox>
            <br />
            Cell No
            *
            <asp:TextBox ID="txtCellNo" runat="server" Width = "100%" MaxLength="10"></asp:TextBox>
            <br />
            Town
            <asp:TextBox ID="txtTown" runat="server" Width = "100%"></asp:TextBox>
            <br />
            Additional Comments / Requirements
            <asp:TextBox ID="txtComments" TextMode="MultiLine" runat="server" 
                Width = "100%" Height="250px"></asp:TextBox>
            <br />
            <br />
            <div style="width:100%" align="right">
                <asp:Button ID="btnEnquiry" runat="server" Text="Submit Enquiry" 
                    onclick="btnEnquiry_Click" CssClass="btnSubmit" />
                <br />
                <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>
                <br />
                <!--
                <asp:Button ID="btnZOHO" runat="server" Text="Test ZOHO" CssClass="btnSubmit" 
                    onclick="btnZOHO_Click" />
                <br />
                -->
            </div>
        </div>
        <div style="width: 2%; float: left; height: 100%;"> 
        </div>
        <div style="float:right; width:47%">
            <br />
            <br />
            <asp:Label ID="lblFirstName" runat="server" Text="" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblSurname" runat="server" Text="" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="lblEmailRequired" runat="server" Text="" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblCellNo" runat="server" Text="" ForeColor="Red"></asp:Label>
        </div>
        <div style="float:left; width:100%">
            <asp:EntityDataSource ID="EDSMachine" runat="server" AutoSort="False" 
                ConnectionString="name=GESEntities" DefaultContainerName="GESEntities" 
                EnableFlattening="False" EntitySetName="vUsedMachineLists"
                EntityTypeFilter="" Select="" Where="">
                <WhereParameters>
                    <asp:QueryStringParameter Name="MachineID" QueryStringField="MachineID"  Type="Int32" />
                </WhereParameters>
            </asp:EntityDataSource>
            <asp:HiddenField ID="hfMachineID" runat="server" />
            <asp:HiddenField ID="hfBody" runat="server" />
        </div>
    </div>
</asp:Content>
