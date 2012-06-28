<%@ Page  Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UsedEquipmentDetail.aspx.cs" Inherits="HelloGES.UsedEquipmentDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">\
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="scripts/lightbox/prototype.js"></script>
    <script type="text/javascript" src="scripts/lightbox/scriptaculous.js?load=effects,builder"></script>
    <script type="text/javascript" src="scripts/lightbox/lightbox.js"></script>

    <div class="menuheading">
        <asp:Label ID="lblSearchResultLabel" runat="server" Text="Used Equipment Detail"></asp:Label>
    </div>
    <div style="height:100%" class="defaultpage">
        <div style="width:100%">
            <div style="width:100%; float:left">
                <div style="width:83%; float:left">
                    <br />
                    <a href='UsedEquipment.aspx?searchtype=<%= Request.QueryString["searchtype"] %>&orderby=<%= Request.QueryString["orderby"] %>&direction=<%= Request.QueryString["direction"] %>&machinetypeid=<%= Request.QueryString["machinetypeid"] %>' 
                        style="color: #D8D8D8">[ << Go back to search results ]</a>
                    <br />
                    <br />
                    <asp:FormView ID="FormView_Product" runat="server" DataKeyNames="MachineID">
                        <ItemTemplate>
                        <td id="Td1" runat="server">
                            <table border="0">
                                <tr>
                                    <td style="width:300px; padding-right: 5px">
                                        <a href='<%#Eval("PhotoUrl") %>' rel="lightbox[roadtrip]"> 
                                            <asp:Image ID="MachineImage" runat="server" class="photo_big" ImageUrl='<%#Eval("PhotoUrl") %>' border="0" Visible="True" AlternateText = '<%#Eval("PhotoName") %>'/>
                                        </a>
                                    </td>
                                    <td style="text-align:left; left:305px">
                                            <div class="ContentHead"><b>Manufacturer:</b>&nbsp; <%# Eval("ManufacturerName") %></div><br />
                                            <div class="ModelNumber"><b>Machine Type:</b>&nbsp; <%# Eval("MachineTypeName") %></div><br />
                                            <div class="ContentHead"><b>Model:</b>&nbsp; <%# Eval("ModelName") %></div><br />
                                            <div class="ContentHead"><b>Machine Description:</b>&nbsp; <%# Eval("MachineDescription")%></div><br />
                                            <div class="ModelNumber"><b>Grade:</b>&nbsp;<%# Eval("MachineGrade") %></div><br />
                                            <div class="ModelNumber"><b>Mileage:</b>&nbsp;<%# Eval("Mileage") %></div><br />
                                            <div class="ModelNumber"><b>Year:</b>&nbsp;<%# Eval("Year") %></div><br />
                                            <div class="ModelNumber"><b>Location:</b>&nbsp;<%# Eval("Location") %></div><br />
                                            <div class="ModelNumber"><b>Serial Number:</b>&nbsp;<%# Eval("SerialNo") %></div><br />
                                            <div style="font-size: larger; font-weight: bold; color:White"><b>Selling Price (Excl. VAT): </b>&nbsp;<%# Eval("SellPrice", "{0:#,##0 ZAR;(#,##0 ZAR);''}")%></div><br />
                                            <a style="color:#DC4903" href='Enquire.aspx?machineID=<%# Eval("MachineID") %>&source=used-equipment'><span><b>Enquire<b></font></span></a><br>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        </ItemTemplate>
                    </asp:FormView>

                    <div class="menuheading">
                        Images (Click on image for a full view)
                    </div>
                    <br />
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="MachineID" DataSourceID="EDSPhotos">
                         <ItemTemplate>
                            <a href='<%#Eval("PhotoUrl") %>' rel="lightbox[roadtrip]"><img src='<%#Eval("PhotoUrl") %>' height="75" border="0" alt=""/></a>
                        </ItemTemplate>
                    </asp:ListView>
                    <br />

                    <!--
                    <div class="menuheading">
                        Technical Specifications
                    </div>
                    -->

                </div>
                <!--
                <div style="width:15%; float:left; text-align: center">
                    <a href='Enquire.aspx?machineID=0&source=post-ad' style="text-align: center"> 
                        <asp:Image ID="Image1" runat="server" 
                        ImageUrl="~/BannerPics/Place-a-Private-Ad-border.gif" BorderStyle="Solid" 
                        BorderColor="White" BorderWidth="1px" />
                    </a>
                </div>
                -->
            </div>
        </div>
    </div>        
    <asp:EntityDataSource ID="EDSPhotos" runat="server" AutoGenerateWhereClause="True"
        ConnectionString="name=GESEntities" DefaultContainerName="GESEntities" 
        EnableFlattening="False" EntitySetName="Photos" Where="">
        <WhereParameters>
            <asp:QueryStringParameter Name="MachineID" QueryStringField="MachineID"  Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    </asp:Content>

