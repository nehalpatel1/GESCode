<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="ReportViewerCounterList.aspx.cs" Inherits="HelloGES.ReportViewer" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
        <rsweb:ReportViewer ID="rvGESReports" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="100%" 
            Width="100%">
            <LocalReport ReportPath="Reports\CounterList.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="odsCounterList" Name="dsCounterList" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="odsCounterList" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="HelloGES.DAL.CounterListTableAdapters.vCounterListTableAdapter">
        </asp:ObjectDataSource>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</asp:Content> 

