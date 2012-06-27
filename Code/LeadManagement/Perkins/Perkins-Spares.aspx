<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Perkins-Spares.aspx.cs" Inherits="HelloGES.LeadManagement.Perkins.Perkins_Spares" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Want a great deal on Perkins Spares? Perkins Spares suppliers competing for your business</title>
    <meta name="description" content="Want a great deal on a Perkins Spares? We'll help you get the best deal on Perkins Spares through our network of suppliers." /> 
    <link href="http://www.marketingmotor.net/themes/1/css/default.css" rel="stylesheet" type="text/css" /> 

    </head>
<body>
    <form id="form1" runat="server">
        <div class="container"> 
            <div class="header bgColor1"> 
                <h1 class="color1">Great deals on Perkins Spares</h1> 
            </div> 
 
            <div class="contentContainer"> 
                <div class="sidebar1" style="width: 25%">
                    <h2>We can help you with all of this:</h2> 
                    <ul> 
                        <li>perkins engine</li>
                        <li>perkins engines</li>
                        <li>perkins parts</li>
                        <li>perkins diesel</li>
                        <li>perkins diesel engine</li>
                        <li>perkins spares</li>
                        <li>perkins engine parts</li>
                        <li>perkins diesel engines</li>
                        <li>perkins motors</li>
                        <li>perkins motor parts</li>
                        <li>perkins engine spares</li>
                        <li>perkins engines parts</li>
                        <li>perkins 1004</li>
                    </ul> 
                    <p>&nbsp;</p>
                </div> 
 
                <div class="content" style="width: 70%"><h2>Looking for a great deal on Perkins Spares?</h2> 
                    <p>We figured you'd rather have a Perkins Spares supplier chasing you than  having to waste your time phoning people who didn't answer their phones,  or played lousy hold music only to tell you that they didn't have what  you're looking for in stock.</p> 
                    <h2>We get Perkins Spares suppliers to compete for your business.</h2> 
                    <p>Fill your details in and we'll pass them on to an <strong>approved and recommended Perkins Spares specialist in your area</strong>. They'll call you  with their best offer, exclusive to customers from this website. It's a  100% free, no obligation service . They know you're serious about buying and they know they have to give a great price or we drop them. This  means that you're going to get a good deal from someone who actually wants your business.</p> 
                    <div style="width: 100%"> 
                        <div class="formHolder" style="width: 40%; float:left">
                            <br />
                            First Name
                            *
                            <asp:TextBox ID="txtFirstName" runat="server" Width = "100%"></asp:TextBox>
                            <br />
                            Surname
                            *
                            <asp:TextBox ID="txtSurname" runat="server" Width = "100%"></asp:TextBox>
                            <br />
                            E-Mail Address
                            <br />
                            <asp:TextBox ID="txtEmail" runat="server" Width = "100%"></asp:TextBox>
                            <br />
                            Cell No
                            *
                            <asp:TextBox ID="txtCellNo" runat="server" Width = "100%"></asp:TextBox>
                            <br />
                            Town
                            <asp:TextBox ID="txtTown" runat="server" Width = "100%"></asp:TextBox>
                            <br />
                            Please give us a little more detail about how we can help you
                            <asp:TextBox ID="txtComments" TextMode="MultiLine" runat="server" Width = "100%" Height="100px"></asp:TextBox>
                            <br />
                            <br />
                            <div style="width:100%" align="right">
                                <asp:Button ID="btnEnquiry" runat="server" Text="Submit Enquiry" onclick="btnEnquiry_Click" class = "site_formSubmit"/>
                                <br />
                            </div>
                        </div>
                            <div class="pictureHolder" 
                            style="width: 50%; float:left; text-align: center; vertical-align: middle;">
                                <asp:ScriptManager ID="ScriptManager1" runat="server" />
                                <asp:Timer ID="Timer1" Interval="5000" runat="server" />
                                <asp:UpdatePanel ID="up1" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                                    </Triggers>

                                    <ContentTemplate>
                                        <asp:AdRotator
                                        id="AdRotator2"
                                        AdvertisementFile="Perkins-Ads.xml"
                                        Runat="server" BorderStyle="None" style="width: 100%; display:block;"/>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="clearfloat">
                        </div>
                    </div> 

                    <h2>Here's how we make sure you always get a great deal on Perkins Spares.</h2> 
                    <p>We're  deadly serious about making sure you always get a great deal. After  all, we have to uphold our reputation as the best place to buy Perkins Spares online .</p> 
                    <ul> 
                        <li>We conduct frequent random price  checks.</li> 
                        <li>We make 'mystery shopper' purchases to make sure that the Perkins Spares supplier is giving our customers the best possible deal.</li> 
                        <li>We get your feedback and rate the supplier or manufacturer. A couple of bad comments and we kick them off our list. </li> 
                    </ul> 
                </div> 
            </div> 
 
            <div class="footer bgColor1"> 
                <p  class="color1">Copyright 2011</p> 
            </div> 
        </div> 
    </form>
</body>
</html>
