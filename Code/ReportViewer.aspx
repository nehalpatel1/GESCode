<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="ReportViewer.aspx.cs" Inherits="HelloGES.ReportViewer" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
        <rsweb:ReportViewer ID="rvGESReports" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="100%" 
            Width="100%">
            <LocalReport ReportPath="Reports\UsedEquipmentList.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="edsGES" Name="dsUsedMachineList" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
    
        <asp:EntityDataSource ID="edsGES" runat="server" 
            ConnectionString="name=GESEntities" DefaultContainerName="GESEntities" 
            EnableFlattening="False" EntitySetName="vUsedMachineLists">
        </asp:EntityDataSource>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</asp:Content> 

