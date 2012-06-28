<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShantuiDetail.aspx.cs" Inherits="HelloGES.ShantuiDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="left">
        <h1 runat="server" id="SearchResultBar">
            Product Detail</h1>
    </div>

    <div style="float:left; width:20%; height:100%">
        Categories panel
    </div>

    <div style="float:right; width:80%; height:100%">
        <asp:ListView ID="lvShantuiDetail" runat="server" DataKeyNames="ProductID" DataSourceID="ShantuiDetailEntityDataSource">
             <ItemTemplate>
                <div style="float:left; width:30%; height:100%">
                    <img src='<%#Eval("PictureUrl") %>' width="300px" border="0" alt=""/>
                </div>
                <div style="float:right; width:70%; height:100%">
                    <div style="float:left; width:30%; height:100%">
                        Model:
                        <br />
                        OperatingWeight:
                        <br />
                        Engine:
                        <br />
                        Power:
                        <br />
                        Capacity:
                        <br />
                        TrackWidth:
                        <br />
                        BladeWidth:
                        <br />
                        DrumWidth:
                        <br />
                        SpecsheetURL:
                    </div>
                    <div style="float:right; width:30%; height:100%">
                        <asp:Label ID="ModelLabel" runat="server" Text='<%# Eval("Model") %>' />
                        <br />
                        <asp:Label ID="OperatingWeightLabel" runat="server" Text='<%# Eval("OperatingWeight") %>' />
                        <br />
                        <asp:Label ID="EngineLabel" runat="server" Text='<%# Eval("Engine") %>' />
                        <br />
                        <asp:Label ID="PowerLabel" runat="server" Text='<%# Eval("Power") %>' />
                        <br />
                        <asp:Label ID="CapacityLabel" runat="server" Text='<%# Eval("Capacity") %>' />
                        <br />
                        <asp:Label ID="TrackWidthLabel" runat="server" Text='<%# Eval("TrackWidth") %>' />
                        <br />
                        <asp:Label ID="BladeWidthLabel" runat="server" Text='<%# Eval("BladeWidth") %>' />
                        <br />
                        <asp:Label ID="DrumWidthLabel" runat="server" Text='<%# Eval("DrumWidth") %>' />
                        <br />
                        <asp:HyperLink ID="HyperLink2" runat="server" 
                            NavigateUrl='<%# Eval("SpecsheetURL") %>' Text='Download Spec Sheet' BorderStyle="NotSet" ImageUrl="~/Images/pdf.gif">
                        </asp:HyperLink>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>


    <asp:EntityDataSource ID="ShantuiDetailEntityDataSource" runat="server" 
        ConnectionString="name=GESEntities" DefaultContainerName="GESEntities" 
        EnableFlattening="False" EntitySetName="Shantuis" 
        AutoGenerateWhereClause="True" Where="" 
        Select="">
        <WhereParameters>
            <asp:QueryStringParameter Name="ProductID" QueryStringField="ProductID" Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
</asp:Content>
