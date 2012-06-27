﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JCB-Parts.aspx.cs" Inherits="HelloGES.LeadManagement.JCB.JCB_Parts" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Want a great deal on JCB parts? JCB parts suppliers competing for your business</title>
    <meta name="description" content="Want a great deal on JCB parts? We'll help you get the best deal on JCB parts through our network of suppliers." /> 
    <link href="http://www.marketingmotor.net/themes/1/css/default.css" rel="stylesheet" type="text/css" /> 

    </head>
<body>
    <form id="form1" runat="server">
        <div class="container"> 
            <div class="header bgColor1"> 
                <h1 class="color1">Great deals on JCB parts</h1> 
            </div> 
 
            <div class="contentContainer"> 
                <div class="sidebar1">
                    <h2>We can help you with all of this:</h2> 
                    <ul> 
                        <li>parts for jcb</li>
                        <li>jcb spares parts</li>
                        <li>jcb spare parts</li>
                        <li>spare parts for jcb</li>
                        <li>jcb 3cx parts</li>
                        <li>jcb 3cx</li>
                        <li>jcb spares</li>
                        <li>jcb transmission</li>
                        <li>jcb gearbox</li>
                    </ul> 
                    <p>&nbsp;</p>
                </div> 
 
                <div class="content"><h2>Looking for a great deal on a JCB parts?</h2> 
                    <p>We figured you'd rather have a JCB parts supplier chasing you than  having to waste your time phoning people who didn't answer their phones,  or played lousy hold music only to tell you that they didn't have what  you're looking for in stock.</p> 
                    <h2>We get JCB parts suppliers to compete for your business.</h2> 
                    <p>Fill your details in and we'll pass them on to an <strong>approved and recommended JCB parts specialist in your area</strong>. They'll call you  with their best offer, exclusive to customers from this website. It's a  100% free, no obligation service . They know you're serious about buying and they know they have to give a great price or we drop them. This  means that you're going to get a good deal from someone who actually wants your business.</p> 
                    <div class="formHolder">
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
                    <!--
                        <form id="lead_form" method="post" action="http://www.marketingmotor.net/index.php/public/lead/process_web_to_lead_form">
                            <input type=hidden name=id_webpage value="fad536a6ea3b3a3ed169195b29425981">
                            <input type=hidden name=ip_address value="196.211.2.18">
                            <input type=hidden name=id_adword value="">
                            <label for="first_name" class="label color2">Your first name please</label>
                            <div class="inputField">     
			                    <input type="text" name="first_name" id="first_name"  class="input" />
                            </div>
                            <label for="last_name" class="label color2">Your last name please</label>
                            <div class="inputField">     
			                    <input type="text" name="last_name" id="last_name"  class="input" />
                            </div>
                            <label for="email" class="label color2">Email address</label>
                            <div class="inputField">     
			                    <input type="text" name="email" id="email"  class="input" />
                            </div>
                            <label for="phone" class="label color2">Phone number</label>
                            <div class="inputField">     
			                    <input type="text" name="phone" id="phone"  class="input" />
                            </div>
                            <label for="custom_5"  class="label color2">Please give us a little more detail about how we can help you</label>
                            <br />
                            <div class="textArea">
                                <textarea id="custom_5" name="custom_5" class="text"></textarea>
                            </div>
                            <div style="display: none;">
                                <input type=text name=text1>
                                <input type=text name=text2>
                            </div>
                            <input type="submit" id ="lead_form_submit" value ="Continue" class = "site_formSubmit">
                        </form>
                    </div> 
	                -->
                    <div class="pictureHolder">
                        <img alt="JCB Parts" longdesc="JCB Parts" src="Images/JCB-Parts.jpg" /><br />
                        </div>
                    <div class="clearfloat">
                    </div> 

                    <h2>Here's how we make sure you always get a great deal on JCB parts.</h2> 
                    <p>We're  deadly serious about making sure you always get a great deal. After  all, we have to uphold our reputation as the best place to buy JCB parts online .</p> 
                    <ul> 
                        <li>We conduct frequent random price  checks.</li> 
                        <li>We make 'mystery shopper' purchases to make sure that the JCB parts supplier is giving our customers the best possible deal.</li> 
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