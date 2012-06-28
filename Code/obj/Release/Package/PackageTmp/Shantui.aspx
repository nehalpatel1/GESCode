<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shantui.aspx.cs" Inherits="HelloGES.Shantui" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
	<meta name="author" content="Global Earthmoving Solutions - South Africa" />
	<meta name="copyright" content="Copyright 2011 Global Earthmoving Solutions" />
	<meta name="distribution" content="global" />	
    <meta name="revisit-after" content="1 day"/>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <meta name="document-state" content="dynamic" />
    <meta name="robots" content="index,follow" />

	<meta name="description" content="Global Earthmoving Solutions is the authorised Shantui Equipment dealer for the Eastern Cape in South Africa." />	
    <meta name="Keywords" lang="EN" content="Shantui, Shantui South Africa, Shantui SA, earthmoving equipment, bulldozer, excavator, motor grader, roller, wheel loader, pipe layer,
    port elizabeth, Shantui bulldozers, Shantui bulldozer, Shantui excavators, Shantui excavator,
    Shantui motor graders, Shantui motor grader, Shantui rollers, Shantui roller, Shantui forklifts, Shantui forklifts, forklifts, forklift, fork lift,
    Shantui wheel loaders, Shantui wheel loader, Shantui pipe layers, Shantui pipe layer, global earthmoving solutions, global earthmoving, ges" /> 

	<title>Global Earthmoving Solutions - Shantui Bulldozers, Shantui Excavators, Shantui Motor Graders, Shantui Rollers, Shantui Forklifts, Shantui Wheel Loaders, Shantui Pipe Layers</title>


    <style type="text/css">
        .style3
        {
            width: 256px;
            height: 132px;
        }
        .style4
        {
            width: 216px;
            height: 110px;
        }
        .style5
        {
            width: 144px;
            height: 118px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="menuheading">
                Shantui Product Range - Bulldozers, Excavators, Motor Graders, Rollers, Forklifts, Wheel Loaders, Pipe Layers
        </div>

        <br />
        <asp:ListView ID="ListView1" runat="server" DataSourceID="edsShantui" GroupItemCount="4">
            <GroupTemplate>
                <tr runat="server" id="productRow" style="height:150px">
                      <td runat="server" id="itemPlaceholder">
                      </td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td id="Td1" valign="top" align="center" runat="server">
                    <a href='ShantuiList.aspx?Category=<%# Eval("Category") %>'> 
                        <asp:Image ID="Image1" runat="server" AlternateText = 'Shantui-<%# Eval("Category") %>' 
                        ImageUrl='<%#Eval("PictureURL") %>' Height="150px" border="0"/>
                    </a>
                    <br />
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Category") %>' />
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table cellpadding="2" runat="server" id="tblProducts" style="height:320px">
                    <tr runat="server" id="groupPlaceholder">
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <asp:EntityDataSource ID="edsShantui" runat="server" 
            AutoGenerateOrderByClause="True" AutoGenerateWhereClause="True" 
            ConnectionString="name=GESEntities" DefaultContainerName="GESEntities" 
            EnableFlattening="False" EntitySetName="Shantuis" 
            Select="it.[Category], it.[PictureURL], it.[MainPicture], it.[MainPictureOrder]">
            <WhereParameters>
                <asp:Parameter DefaultValue="Y" Name="MainPicture" />
            </WhereParameters>
            <OrderByParameters>
                <asp:Parameter DefaultValue="MainPictureOrder"/> 
            </OrderByParameters>
        </asp:EntityDataSource>
<br />
</asp:Content>
