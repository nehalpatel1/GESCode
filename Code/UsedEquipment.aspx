<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UsedEquipment.aspx.cs" Inherits="HelloGES.UsedEquipment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <meta name="author" content="Global Earthmoving Solutions - South Africa" />
	<meta name="copyright" content="Copyright 2011 Global Earthmoving Solutions" />
	<meta name="distribution" content="global" />	
    <meta name="revisit-after" content="1 day"/>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <meta name="document-state" content="dynamic" />
    <meta name="robots" content="index,follow" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="menuheading">
        Used Equipment Showroom
    </div>
    <div class="defaultpage">
        <div style="float:left; width:20%">
            <div>
                <h1 runat="server" id="H1">Search Filter</h1>
            </div>    
            <div style="height: auto">
                <br />
                <b>Machine Type</b><br />
                <asp:DropDownList ID="listMachineType" runat="server" 
                    DataTextField="MachineTypeName" 
                    DataValueField="MachineTypeID" Width="100%" 
                    ondatabound="listMachineType_DataBound" 
                    onselectedindexchanged="listMachineType_SelectedIndexChanged" 
                    AutoPostBack="True">
                </asp:DropDownList>
                <br />
                <br />
                <br />
                <a href="/UsedEquipment.aspx?searchtype=new&orderby=normal&direction=normal" style="color: #D8D8D8">View Recently Added 
                Equipment</a>&nbsp;
                <br />
                <br />
                <br />
                <div style="text-align: center">
                    <!--
                    <a href='Enquire.aspx?machineID=0&source=post-ad' style="text-align: center"> 
                        <asp:Image ID="Image1" runat="server" 
                        ImageUrl="~/BannerPics/Place-a-Private-Ad-border.gif" BorderStyle="Solid" 
                        BorderColor="White" BorderWidth="1px" />
                    </a>
                    <script type="text/javascript"><!--
                        google_ad_client = "ca-pub-5301521664138295";
                        /* Side banner */
                        google_ad_slot = "7359319645";
                        google_ad_width = 120;
                        google_ad_height = 600;
                        //-->
                    <!--
                    </script>
                    <script type="text/javascript"
                        src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
                    </script>
                    -->
                </div>
                <b><asp:Label ID="lblStatus" runat="server" Text="Status"></asp:Label></b><br />
                <asp:DropDownList ID="listStatus" runat="server" Width="100%" 
                    AutoPostBack="True" onselectedindexchanged="listStatus_SelectedIndexChanged">
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>Inactive</asp:ListItem>
                    <asp:ListItem>Sold</asp:ListItem>
                </asp:DropDownList>        
                <br />
                <br />
                <asp:Button ID="btnViewList" runat="server" onclick="btnViewList_Click" 
                    Text="View List" Width="100%" CssClass="btnSubmit" />
                <br />
                <br />
                <b><asp:Label ID="lblManufacturer" runat="server" Text="Model"></asp:Label></b><br />
                <asp:DropDownList ID="listManufacturer" runat="server" 
                    DataSourceID="ManufacturerEntityDataSource" DataTextField="ManufacturerName" 
                    DataValueField="ManufacturerID" Width="100%" 
                    ondatabound="listManufacturer_DataBound" 
                    onselectedindexchanged="listManufacturer_SelectedIndexChanged" 
                    AutoPostBack="True">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
                    Text="Search" Width="100%" CssClass="btnSubmit" />
                <br />
                <b><asp:Label ID="lblModel" runat="server" Text="Model"></asp:Label></b><br />
                <asp:DropDownList ID="listModel" runat="server" 
                    DataSourceID="ModelEntityDataSource" DataTextField="ModelName" 
                    DataValueField="ModelID" Width="100%" ondatabound="listModel_DataBound" 
                    AutoPostBack="True">
                </asp:DropDownList>
                <br />
                <b><asp:Label ID="lblYear" runat="server" Text="Year"></asp:Label></b><br />
                <asp:DropDownList ID="listYear" runat="server" Width="100%" 
                    ondatabound="listYear_DataBound">
                </asp:DropDownList>

            </div>
        </div>            
        <div style="float:left; height:100%; width:1%">
        </div>
        <div style="float:left; width:50%">
            <div style="float: left; width: 100%">
                <h1 runat="server" id="SearchResultBar">
                    <asp:Label ID="lblSearchResultLabel" runat="server" Text="Search Results"></asp:Label>
                </h1>
                <div style="text-align:center">
                    <br />
                    [ 
                    <a href="/UsedEquipment.aspx?searchtype=<%= Request.QueryString["searchtype"] %>&orderby=year&direction=asc&machinetypeid=<%= Request.QueryString["machinetypeid"] %>" style="color: #D8D8D8">Sort By Year (Lo-Hi)</a>
                     ] | [ 
                    <a href="/UsedEquipment.aspx?searchtype=<%= Request.QueryString["searchtype"] %>&orderby=manufacturername&direction=asc&machinetypeid=<%= Request.QueryString["machinetypeid"] %>" style="color: #D8D8D8">Sort By Make (A-Z)</a>
                     ] | [ 
                    <a href="/UsedEquipment.aspx?searchtype=<%= Request.QueryString["searchtype"] %>&orderby=sellprice&direction=asc&machinetypeid=<%= Request.QueryString["machinetypeid"] %>" style="color: #D8D8D8">Sort By Price (Lo-Hi)</a>
                     ]
                    <br />
                    [ 
                    <a href="/UsedEquipment.aspx?searchtype=<%= Request.QueryString["searchtype"] %>&orderby=year&direction=desc&machinetypeid=<%= Request.QueryString["machinetypeid"] %>" style="color: #D8D8D8">Sort By Year (Hi-Lo)</a>
                     ] | [ 
                    <a href="/UsedEquipment.aspx?searchtype=<%= Request.QueryString["searchtype"] %>&orderby=manufacturername&direction=desc&machinetypeid=<%= Request.QueryString["machinetypeid"] %>" style="color: #D8D8D8">Sort By Make (Z-A)</a>
                     ] | [ 
                    <a href="/UsedEquipment.aspx?searchtype=<%= Request.QueryString["searchtype"] %>&orderby=sellprice&direction=desc&machinetypeid=<%= Request.QueryString["machinetypeid"] %>" style="color: #D8D8D8">Sort By Price (Hi-Lo)</a>
                     ]
                    <!--
                    <a href="/UsedEquipment.aspx?searchtype=<%= Request.QueryString["searchtype"] %>&orderby=model&direction=asc&machinetypeid=<%= Request.QueryString["machinetypeid"] %>" style="color: #D8D8D8">Sort By Model (A-Z)</a>
                     ] | [ 
                    <a href="/UsedEquipment.aspx?searchtype=<%= Request.QueryString["searchtype"] %>&orderby=machinetypename&direction=asc&machinetypeid=<%= Request.QueryString["machinetypeid"] %>" style="color: #D8D8D8">Sort By Type (A-Z)</a>
                     ] | [ 
                    <a href="/UsedEquipment.aspx?searchtype=<%= Request.QueryString["searchtype"] %>&orderby=model&direction=desc&machinetypeid=<%= Request.QueryString["machinetypeid"] %>" style="color: #D8D8D8">Sort By Model (Z-A)</a>
                     ] | [ 
                    <a href="/UsedEquipment.aspx?searchtype=<%= Request.QueryString["searchtype"] %>&orderby=machinetypename&direction=desc&machinetypeid=<%= Request.QueryString["machinetypeid"] %>" style="color: #D8D8D8">Sort By Type (Z-A)</a>
                     ] | [ 
                     -->
                </div>
                <asp:ListView ID="lvEquipmentList" runat="server" DataMember="DefaultView" 
                    onitemcreated="lvEquipmentList_ItemCreated">
                    <EmptyDataTemplate>
                        <table id="Table1" runat="server"  border="0" align="left" style="position: static;">
                            <tr>
                                <td>
                                        Your search returned no machines
                                    </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
                        <td id="Td3" runat="server" />
                    </EmptyItemTemplate>
                    <GroupTemplate>
                        <tr ID="itemPlaceholderContainer" runat="server">
                            <td ID="itemPlaceholder" runat="server">
                            </td>
                        </tr>
                    </GroupTemplate>
                    <ItemTemplate>
                        <td id="Td1" runat="server" style="width: 100%">
                            <table border="0" style="width: 100%">
                                <tr>
                                    <td style="width: 5%">
                                        &nbsp</td>
                                    <td style="width: 130px; padding-right:5px; padding-bottom:0px; display:block; margin-left: 11px ">
                                        <a href='UsedEquipmentDetail.aspx?MachineID=<%# Eval("MachineID") %>&searchtype=<%= Request.QueryString["searchtype"] %>&orderby=<%= Request.QueryString["orderby"] %>&direction=<%= Request.QueryString["direction"] %>&machinetypeid=<%= Request.QueryString["machinetypeid"] %>'>
                                        <asp:Image ID="MachineImage" runat="server" class="photo_small" ImageUrl='<%# Eval("PhotoUrl") %>' AlternateText='<%# Eval("PhotoName") %>'/>
                                        </a>
                                    </td>
                                                                        
                                    <!--
                                    <td style="width: 5%">
                                        <asp:Image ID="imgSold" runat="server" ImageUrl="/images/sold1.jpg"/>
                                    </td>
                                    -->
                                    <td style="width: 45%">
                                        <a style="color:#DC4903" href='UsedEquipmentDetail.aspx?MachineID=<%# Eval("MachineID") %>&searchtype=<%= Request.QueryString["searchtype"] %>&orderby=<%= Request.QueryString["orderby"] %>&direction=<%= Request.QueryString["direction"] %>&machinetypeid=<%= Request.QueryString["machinetypeid"] %>'>
                                        <b><span style="text-transform: uppercase;"><%# Eval("ManufacturerName") %>- 
                                        <%# Eval("ModelName") %>. </span></b></a>
                                        <br><span><b>Type: </b><%# Eval("MachineTypeName")%></span>
                                        <br><span><b>Year: </b><%# Eval("Year")%></span>
                                        <br><span><b>Mileage: </b><%# Eval("Mileage")%></span>
                                        <br><span><b>Location: </b><%# Eval("Location")%></span>
                                        <br><span><b>Status: </b><%# Eval("Status")%></span>
                                        <!--<br><span><b>Date Added: </b><%#Eval("DateInserted")%>-->
                                        </span>
                                        <br>
                                    </td>
                                    <td style="width: 19%; vertical-align:top; text-align:right">
                                        <span style="font-size: larger; font-weight: bold; color:White">
                                        <%# Eval("SellPrice", "{0:#,##0 ZAR;(#,##0 ZAR);''}")%></span>
                                        <br>
                                        <span style="font-size: larger; font-weight: bold; color:White">
                                        (Excl. VAT)</span>
                                        <br>
                                        <a style="color:#DC4903" href='Enquire.aspx?machineID=<%# Eval("MachineID") %>&source=used-equipment'>
                                        <span class="ProductListItem"><b>Enquire<b></font></span></a><br>
                                        <br>
                                        <!--
                                            <asp:Label ID="lblSold" runat="server" Text="SOLD" style="font-size: larger; font-weight: bold; color:Red"></asp:Label>
                                        -->
                                        <asp:HyperLink ID="editHyperLink" runat="server" NavigateUrl='<%# String.Format("AddUsedEquipment_Page1.aspx?mode=edit&machineID={0}&industryID={1}&machineTypeID={2}", DataBinder.Eval(Container.DataItem, "MachineID"), DataBinder.Eval(Container.DataItem, "IndustryID"), DataBinder.Eval(Container.DataItem, "MachineTypeID"))%>' ForeColor="#DC4903"><b>Edit<b></asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <div style="line-height:1px; height:1px; font-size:1px; border-top:#666666 1px dotted">
                                    </div>
                                </tr>
                            </table>
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table id="Table2" runat="server" style="width: 100%">
                            <tr id="Tr1" runat="server" style="width: 100%">
                                <td id="Td4" runat="server" style="width: 100%">
                                    <table ID="groupPlaceholderContainer" runat="server" style="width: 100%">
                                        <tr ID="groupPlaceholder" runat="server" style="width: 100%">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="Tr2" runat="server" style="width: 100%">
                                <td id="Td5" runat="server" style="width: 100%">
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>
                
            </div>
            </div>
        <div style="float:right; width:28%">
            <div>
                <asp:Panel ID="Panel1" runat="server" style="text-align: center; vertical-align:top; font-size: medium;" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                        <asp:Image ID="Image3" runat="server" Height="76px" 
                            ImageUrl="~/images/submit.jpg" Width="308px" />
                        <br />
                        <b>
                        <br />
                        Haven&#39;t found what your were looking for? </b>
                        <br />
                        <br />
                        We can personally assist in finding the right equipment for you.
                        <br />
                        Visit our <a href="Enquire.aspx?machineID=0&source=contact-us" style="color: #D8D8D8">enquiry page</a>, 
                        add your contact details together with your requirements and we&#39;ll get back to 
                        you.<br /> &nbsp;</asp:Panel>            
            </div>
            <div>
                <!--
                <asp:Panel ID="Panel2" runat="server" 
                    style="text-align: center; vertical-align:top; font-size: medium;" 
                    BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Visible="False">
                        <br />
                        <b>Looking to sell your equipment?</b>
                        <br />
                        <br />
                        You can load your equipment on My Quip.<br />
                        <br />
                        Get started <a href="/Account/Register.aspx" style="color: #D8D8D8">here </a>
                        <br />
                </asp:Panel>
                -->
            </div>
            <div>
                <!--
                <div style="text-align: center; vertical-align:top; font-size: medium;">
                    <br />
                    <b>Looking for a Grease Gun?</b>
                    <br />
                </div>
                <br />
                <asp:Panel ID="pn140HRimforsale" runat="server" style="text-align: center;" >
                       <a href='Enquire.aspx?machineID=0&source=140h-rim-for-sale-ad' style="text-align: center"> 
                        <asp:Image ID="im140HRimforsale" runat="server" 
                        ImageUrl="~/BannerPics/140H-Rim-for-sale.gif" BorderStyle="Solid" 
                        BorderColor="White" BorderWidth="1px" />
                    </a>
                </asp:Panel>            
                <br />
                <asp:Panel ID="pnRoller320D" runat="server" style="text-align: center;" >
                       <a href='Enquire.aspx?machineID=0&source=roller-320d-ad' style="text-align: center"> 
                        <asp:Image ID="imRoller320D" runat="server" 
                        ImageUrl="~/BannerPics/Roller-320D.gif" BorderStyle="Solid" 
                        BorderColor="White" BorderWidth="1px" />
                    </a>
                </asp:Panel>            
                <asp:Panel ID="Panel3" runat="server" style="text-align: center;" >
                       <a href='Enquire.aspx?machineID=0&source=grease-gun-ad' style="text-align: center"> 
                        <asp:Image ID="Image2" runat="server" 
                        ImageUrl="~/BannerPics/Grease-Gun-Ad.gif" BorderStyle="Solid" 
                        BorderColor="White" BorderWidth="1px" />
                    </a>
                </asp:Panel>            
                -->
            </div>
        </div>    
            
        <div style="width:100%">
        <!--
            <asp:EntityDataSource ID="ManufacturerEntityDataSource" runat="server" ConnectionString="name=GESEntities"
                DefaultContainerName="GESEntities" EnableFlattening="False" 
                EntitySetName="vManufacturerCounts" >
            </asp:EntityDataSource>
            <asp:EntityDataSource ID="ModelEntityDataSource" runat="server" ConnectionString="name=GESEntities"
                DefaultContainerName="GESEntities" EnableDelete="True" EnableFlattening="False"
                EntitySetName="vModelCounts" EntityTypeFilter="vModelCount">
            </asp:EntityDataSource>
            <br />
        -->
            <asp:HiddenField ID="hfUEManufacturer" runat="server" />
            <asp:HiddenField ID="hfUEMachineType" runat="server" />
            <asp:HiddenField ID="hfUEModel" runat="server" />
        </div>    
    </div>
</asp:Content>
