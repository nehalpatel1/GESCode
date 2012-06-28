<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="HelloGES.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Global Earthmoving Solutions - Contact Us</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="menuheading">
        Contact Us
    </div>
    <td id="Td1" runat="server">
        <table border="0">
            <tr>
                <td>    
                    <asp:Image ID="Image2" runat="server" Height="371px" 
                    ImageUrl="http://maps.google.com/maps/api/staticmap?zoom=15&amp;size=512x512&amp;maptype=roadmap\&amp;markers=size:mid|color:red|6+Tassan+Road,Walmer,Port+Elizabeth,South+Africa&amp;sensor=false" 
                    Width="365px" />
                </td>
                <td style="vertical-align:top; text-align:left">
                    <b>Port Elizabeth</b><i><br />
                    </i>6 Tassan Road<br />
                    Walmer Dunes Industrial Park<br />
                    Port Elizabeth<br />
                    Tel: +27415810774<br />
                    Fax: +27415816002<br />
                    <br />
                    <!--<a href="mailto:mark@globalearthmoving.co.za">mark@globalearthmoving.co.za</a>-->
                    <a href="mailto:graham@globalearthmoving.co.za">graham@globalearthmoving.co.za</a><br />
                    Cell: +27832855240
                    <br />
                </td>
                <td width = "25px">
                </td>
                <td valign="top">
                    <asp:Panel ID="Panel1" runat="server" 
                        style="text-align: center; vertical-align:top; font-size: medium;" 
                        BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px">
                        <asp:Image ID="Image3" runat="server" Height="86px" 
                            ImageUrl="~/images/submit.jpg" Width="353px" />
                        <br />
                        <b>
                        <br />
                        Haven&#39;t found what your were looking for? </b>
                        <br />
                        <br />
                        We can personally assist in buying and/or selling your plant. Visit our <a href="Enquire.aspx?machineID=0&source=contact-us">enquiry page</a>, 
                        add your contact details together with your requirements and we&#39;ll get back to 
                        you.</asp:Panel>
                </td>
            </tr>
        </table>
    </td>    

    <!--
    <td id="Td2" runat="server">
        <table border="0">
            <tr>
                <td>    
                    <asp:Image ID="Image1" runat="server" Height="371px" 
                    ImageUrl="http://maps.google.com/maps/api/staticmap?zoom=15&amp;size=512x512&amp;maptype=roadmap\&amp;markers=size:mid|color:red|8+Ray+Craib+Crescent,Beacon+Bay,East+London,South+Africa&amp;sensor=false" 
                    Width="365px" />
                </td>
                <td style="vertical-align:top; text-align:left" class="style5">
                    <b>East London (Branch)<br />
                    </b>8 Ray Craib Crescent<br />
                    Beacon Bay<br />
                    East London<br />
                    Tel: +27437485472<br />
                    Fax: +27862180170<br />
                    <br />
                    <a href="mailto:mark@globalearthmoving.co.za">mark@globalearthmoving.co.za</a>
                    <br />
                </td>
            </tr>
        </table>
    </td>    
    -->

</asp:Content>
