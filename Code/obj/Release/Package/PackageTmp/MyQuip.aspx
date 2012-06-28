<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyQuip.aspx.cs" Inherits="HelloGES.MyQuip" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
	<title>Global Earthmoving Solutions - My Quip</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">    
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
        Text="Add New Equipment" />
</asp:Content>
