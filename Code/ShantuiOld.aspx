<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShantuiOld.aspx.cs" Inherits="HelloGES.Shantui" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
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
        .style6
        {
            width: 270px;
            height: 110px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="left">
            <h3 runat="server" id="SearchResultBar">Product Range</h3>
        </div>

        <table style="width:100%;">
         <tr>
            <td align="center">
                <a href='ShantuiList.aspx?MachineTypeID=3'> 
                    <img alt="SD42 Dozer" 
                        src="ShantuiPics/Bulldozers/SD42Dozer.jpg" 
                        style="height: 135px; width: 176px" />
                </a>
            </td>
            <td align="center">
                <a href='ShantuiList.aspx?MachineTypeID=2'> 
                    <img alt="" src="ShantuiPics/Excavator/SE210.jpg" 
                        style="height: 134px; width: 173px" />
                </a>
            </td>

            <td align="center">
                <a href='ShantuiList.aspx?MachineTypeID=17'> 
                    <img alt="" src="ShantuiPics/Motor%20Grader/SG21-3.png" 
                    style="height: 126px; width: 270px" />
                </a>
            </td>
            <td align="center">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center">
                <strong>Bulldozers</strong>
            </td>
            <td align="center">
                <strong>Excavators</strong>
            </td>
            <td align="center">
                <strong>Motor Graders</strong>
            </td>
            <td align="center">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center">
                <a href='ShantuiList.aspx?MachineTypeID=18'> 
                    <img src="ShantuiPics/Pipelayer/SP45Y.jpg" 
                        style="height: 134px; width: 176px" />
                </a>
            </td>
            <td align="center">
                <a href='ShantuiList.aspx?MachineTypeID=34'> 
                    <img src="ShantuiPics/Rollers/SR26T.png" 
                    style="height: 143px; width: 176px" />
                </a>
            </td>
            <td align="center">
                <a href='ShantuiList.aspx?MachineTypeID=31'> 
                    <img class="style6" src="ShantuiPics/wheel%20loader/SL60W.png" />
                </a>
            </td>
            <td align="center">
                <a href='ShantuiList.aspx?MachineTypeID=36'> 
                    <img alt="" src="ShantuiPics/forklift/SF30.jpg" align="middle" 
                                        style="height: 123px; width: 158px" />
                </a>
            </td>
        </tr>
        <tr>
            <td align="center">
                <strong>Pipe</strong> <strong>Layers</strong></td>
            <td align="center">
                <strong>Rollers</strong></td>
            <td align="center">
                <strong>Wheel Loaders</strong></td>
            <td align="center">
                <strong>Forklifts</strong></td>
        </tr>
        <tr>
            <td>
                    <asp:AdRotator id="AdRotator1" runat="server"
                Target="_self"
                AdvertisementFile="~/App_Data/Ads.xml" Visible="False"/>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
