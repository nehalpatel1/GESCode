<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShantuiList.aspx.cs" Inherits="HelloGES.ShantuiList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="menuheading">
        Shantui Products
    </div>
    <div class="productsidebar">
        <div class="productsidebarmenu">
            <asp:Menu ID="ProductMenu" runat="server" CssClass="productmenu" 
                EnableViewState="false" IncludeStyleBlock="false" Orientation="Vertical">
                <Items>
                    <asp:MenuItem NavigateUrl="~/Default.aspx" Text="BullDozers"/>
                    <asp:MenuItem NavigateUrl="~/Shantui.aspx" Text="Wheel Loaders"/>
                </Items>
            </asp:Menu>
        </div>
    </div>

    <div class="productcontentarea">
        <div>
            <h1 runat="server" id="SearchResultBar"><%= Request.QueryString["Category"] %></h1>
        </div>
        <div style="width: 100%">
            <asp:GridView ID="gridShantuiList" runat="server" AutoGenerateColumns="False"  DataKeyNames="Category" onrowcommand="gridShantuiList_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Spec Sheet" ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="false" 
                                CommandName="DownloadSpec" ImageUrl="~/Images/pdf.gif" Text='<%# Eval("SpecsheetURL") %>' CommandArgument='<%#Eval("SpecsheetURL") %>'/>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Send Enquiry" ShowHeader="False">
                        <ItemTemplate>
                            <a style="color:#DC4903" href='Enquire.aspx?machineID=<%# Eval("ProductID") %>&source=shantui-list-page'><span class="ProductListItem"><b>Enquire<b></font></span></a><br>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Spec Sheet" ItemStyle-Width="10%" 
                        Visible="False">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink2" runat="server" 
                                NavigateUrl='<%# Eval("SpecsheetURL") %>' Text='Download Spec Sheet'  BorderStyle="NotSet" ImageUrl="~/Images/pdf.gif">
                            </asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="Model" HeaderText="Model" 
                        ReadOnly="True" SortExpression="Model" ItemStyle-Width="10%" >
<ItemStyle Width="10%"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="OperatingWeight" HeaderText="Operating Weight" 
                        ReadOnly="True" SortExpression="OperatingWeight" ItemStyle-Width="10%" >
<ItemStyle Width="10%"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Engine" HeaderText="Engine" ReadOnly="True" 
                        SortExpression="Engine" ItemStyle-Width="20%">
<ItemStyle Width="20%"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Power" HeaderText="Power" ReadOnly="True" 
                        SortExpression="Power" ItemStyle-Width="10%">
<ItemStyle Width="10%"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Capacity" HeaderText="Capacity" ReadOnly="True" 
                        SortExpression="Capacity" ItemStyle-Width="10%">
<ItemStyle Width="10%"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="TrackWidth" HeaderText="Track Width" ReadOnly="True" 
                        SortExpression="TrackWidth" ItemStyle-Width="10%">
<ItemStyle Width="10%"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="BladeWidth" HeaderText="Blade Width" ReadOnly="True" 
                        SortExpression="BladeWidth" ItemStyle-Width="10%">
<ItemStyle Width="10%"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="DrumWidth" HeaderText="Drum Width" ReadOnly="True" 
                        SortExpression="DrumWidth" ItemStyle-Width="10%">
<ItemStyle Width="10%"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="SpecsheetURL" HeaderText="SpecsheetURL" 
                        SortExpression="SpecsheetURL" Visible="False" />
                </Columns>
            </asp:GridView>
        </div>
    </div>


    </asp:Content>
