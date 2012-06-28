<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="HelloGES._Default" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <meta name="author" content="Global Earthmoving Solutions - South Africa" />
	<meta name="copyright" content="Copyright 2011 Global Earthmoving Solutions" />
	<meta name="distribution" content="global" />	
    <meta name="revisit-after" content="1 day"/>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <meta name="robots" content="index,follow" />

	<meta name="description" content="Africa's favourite marketplace for buying, selling and hiring new and used machinery and transportation equipment specialising in the areas of construction, agriculture, material handing, groundscare and forestry." />	
    <meta name="Keywords" lang="EN" content="Equipment, Plant hire, Plant for hire, Global, Global Earthmoving, Global Earthmoving Solutions, 
            Earthmoving, TLB, FEL, 
            front end loader, motor grader, grader, excavators, equipment rental, forklift hire, construction plant, hire services,
            plant hire companies, plant hire rates, mini diggers, trench digger, plant hire south africa, mini digger, plant services,
            plant hire gauteng, plant and tool hire, atlas plant hire, mcc plant hire, plant hire cape town, construction plant hire,
            plant hire durban, small plant hire, roller hire, sandton plant hire, plant hire pretoria, digger hire,
            komatsu, bulldozers, bulldozer, dozer, backhoe, heavy machinery,
            excavator, road roller, tlb for sale, used machinery, used equipment, farm equipment, loaders, diggers, plant machinery, 
            used tractors, used crane, used excavator, used loader, used backhoe loader, used telescopic handler, used forklift truck, 
            used container handler, Used Plant and Equipments, Used Plant & Equipment, new and used Plant Equipment prices, 
            New Plant & Equipments, New Plant & Equipment , Used Plant & Equipment classifieds, Plant & Equipment reviews, 
            buy a Plant & Equipment , sell a Plant & Equipment , Sell my Plant & Equipment , Plant & Equipment classifieds, 
            Plant & Equipments for sale, Plant & Equipment parts and accessories, shantui, jcb, volvo, bell,
            HIGH QUALITY USED PLANT FOR SALE SOUTH AFRICA, USED PLANT FOR SALE, USED PLANT SALES, CAT, KUBOTA, EXCAVATOR, DOZER, BULL DOZER, CASE, MINING MACHINES, MINING EQUIPMENT FOR SALE,
            EARTHMOVING EQUIPMENT FOR SALE ANGOLA, TLB FOR SALE ANGOLA, TRUCK FOR SALE ANGOLA, IMPORT EXPORT ANGOLA, USED PLANT FOR SALE ANGOLA, BULL DOZER FOR SALE ANGOLA, DOZER CRAWLER FOR SALE ANGOLA, EXCAVATOR FOR SALE ANGOLA, DUMP TRUCK FOR SALE ANGOLA, WATER TRUCK TANKER FOR SALE ANGOLA, BOBCAT SKIDSTEER FOR SALE ANGOLA, MINI EXCAVATOR FOR SALE ANGOLA,
            EARTHMOVING EQUIPMENT FOR SALE ZAMBIA, TLB FOR SALE ZAMBIA, TRUCK FOR SALE ZAMBIA, IMPORT EXPORT ZAMBIA, USED PLANT FOR SALE ZAMBIA, BULL DOZER FOR SALE ZAMBIA, DOZER CRAWLER FOR SALE ZAMBIA, EXCAVATOR FOR SALE ZAMBIA, DUMP TRUCK FOR SALE ZAMBIA, WATER TRUCK TANKER FOR SALE ZAMBIA, BOBCAT SKIDSTEER FOR SALE ZAMBIA, MINI EXCAVATOR FOR SALE ZAMBIA,
            EARTHMOVING EQUIPMENT FOR SALE CONGO, TLB FOR SALE CONGO, TRUCK FOR SALE CONGO, IMPORT EXPORT CONGO, USED PLANT FOR SALE CONGO, BULL DOZER FOR SALE CONGO, DOZER CRAWLER FOR SALE CONGO, EXCAVATOR FOR SALE CONGO, DUMP TRUCK FOR SALE CONGO, WATER TRUCK TANKER FOR SALE CONGO, BOBCAT SKIDSTEER FOR SALE CONGO, MINI EXCAVATOR FOR SALE CONGO,
            EARTHMOVING EQUIPMENT FOR SALE MOZAMBIQUE, TLB FOR SALE MOZAMBIQUE, TRUCK FOR SALE MOZAMBIQUE, IMPORT EXPORT MOZAMBIQUE, USED PLANT FOR SALE MOZAMBIQUE, BULL DOZER FOR SALE MOZAMBIQUE, DOZER CRAWLER FOR SALE MAZAMBIQUE, EXCAVATOR FOR SALE MOZAMBIQUE, DUMP TRUCK FOR SALE MOZAMBIQUE, WATER TRUCK TANKER FOR SALE MOZAMBIQUE, BOBCAT SKIDSTEER FOR SALE MOZAMBIQUE, MINI EXCAVATOR FOR SALE MOZAMBIQUE,
            EARTHMOVING EQUIPMENT FOR SALE ZIMBABWE, TLB FOR SALE ZIMBABWE, TRUCK FOR SALE ZIMBABWE, IMPORT EXPORT ZIMBABWE, USED PLANT FOR SALE ZIMBABWE, BULL DOZER FOR SALE ZIMBABWE, DOZER CRAWLER FOR SALE ZIMBABWE, EXCAVATOR FOR SALE ZIMBABWE, DUMP TRUCK FOR SALE ZIMBABWE, WATER TRUCK TANKER FOR SALE ZIMBABWE, BOBCAT SKIDSTEER FOR SALE ZIMBABWE, MINI EXCAVATOR FOR SALE ZIMBABWE,
            EARTHMOVING EQUIPMENT FOR SALE BOTSWANA, TLB FOR SALE BOTSWANA, TRUCK FOR SALE BOTSWANA, IMPORT EXPORT BOTSWANA, USED PLANT FOR SALE BOTSWANA, BULL DOZER FOR SALE BOTSWANA, DOZER CRAWLER FOR SALE BOTSWANA, EXCAVATOR FOR SALE BOTSWANA, DUMP TRUCK FOR SALE BOTSWANA, WATER TRUCK TANKER FOR SALE BOTSWANA, BOBCAT SKIDSTEER FOR SALE BOTSWANA, MINI EXCAVATOR FOR SALE BOTSWANA" /> 

	<title>Global Earthmoving Solutions - New/Used Equipment & Machinery - Buy, Sell & Hire</title>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <div align="center" class="defaultpage" style="float:left; width:100%">
        <div align="center" style="width:100%">
            <!--
            <div style="float:left; width:5%">
                    <br />
            </div>
            <div style="border: 0.5px solid #FFFFFF; float:left; width:22%; text-align: left;">
                <div class="menuheading">
                    Looking for New Equipment?
                </div>
                <br />
                <a href="Shantui-Bulldozers" style="color: #D8D8D8">Shantui Bulldozers</a>
                <br />
                <a href="Shantui-Excavators" style="color: #D8D8D8">Shantui Excavators</a>
                <br />
                <a href="Shantui-Motor-Graders" style="color: #D8D8D8">Shantui Motor Graders</a>
                <br />
                <a href="Shantui-Rollers" style="color: #D8D8D8">Shantui Rollers</a>
                <br />
                <a href="Shantui-Forklifts" style="color: #D8D8D8">Shantui Forklifts</a>
                <br />
                <a href="Shantui-Wheel-Loaders" style="color: #D8D8D8">Shantui Wheel Loaders</a>
                <br />
                <a href="Shantui-Pipe-Layers" style="color: #D8D8D8">Shantui Pipe Layers</a>
                <br />
            </div>
            <div style="float:left; width:2%">
                    <br />
            </div>
            <div style="float:left; width:2%">
                    <br />
            </div>
            -->
            <div style="border: 0.5px solid #FFFFFF; float:left; width:100%; text-align: left;">
                <div class="menuheading">
                    Looking For Used Equipment?
                </div>
                <div style="float:left; width:48%" >
                    <br />
                    <a href="tlb-for-sale" style="color: #D8D8D8">Used TLBs</a>
                    <br />
                    <a href="excavator-for-sale" style="color: #D8D8D8">Used Excavators</a>
                    <br />
                    <a href="bulldozer-for-sale" style="color: #D8D8D8">Used Bulldozers</a>
                    <br />
                    <a href="water-trucks-for-sale" style="color: #D8D8D8">Used Water Trucks</a>
                    <br />
                    <a href="compactors-for-sale" style="color: #D8D8D8">Used Compactors</a>
                    <br />
                    <a href="motor-grader-for-sale" style="color: #D8D8D8">Used Motor Graders</a>
                    <br />
                    <a href="dump-truck-for-sale" style="color: #D8D8D8">Used Dump Trucks</a>
                    <br />
                </div>
                <div style="float:left; width:3%">
                    <br />
                </div>
                <div style="float:left; width:48%">
                    <br />
                    <a href="flatbed-truck-for-sale" style="color: #D8D8D8">Used Flatbed Trucks</a>
                    <br />
                    <a href="tipper-truck-for-sale" style="color: #D8D8D8">Used Tipper Trucks</a>
                    <br />
                    <a href="wheel-loader-for-sale" style="color: #D8D8D8">Used Wheel Loaders</a>
                    <br />
                    <a href="front-end-loader-for-sale" style="color: #D8D8D8">Used Front End Loaders</a>
                    <br />
                    <a href="road-roller-for-sale" style="color: #D8D8D8">Used Road Rollers</a>
                    <br />
                    <a href="bowser-for-sale" style="color: #D8D8D8">Used Bowsers</a>
                    <br />
                    <a href="tow-tractor-for-sale" style="color: #D8D8D8">Used Tow Tractors</a>
                </div>
                <br />
            </div>
                        
            <!--
            <div style="float:left; width:22%">
                    <a href='Enquire.aspx?machineID=0&source=post-ad'> 
                        <asp:Image ID="Image4" runat="server" ImageUrl="~/BannerPics/Private-ad-250x120.gif" BorderStyle="None" />
                    </a>
            </div>
            -->
            
            <!--
            <div style="border: 0.5px solid #FFFFFF; float:left; width:22%; text-align: left; color: #FFFFFF;" visible=false>
                <div class="menuheading">
                    Selling Equipment?
                </div>
                    <br />
                    Do you have used equipment for sale?
                
                    <br />
                <br />
                Sell your used equipment online now!
                    <br />
                <br />
                Post it on Global Earthmoving Solutions 
                now
                <br />
                and we&#39;ll have our network of buyers contact you! 
                <br />
                <a href="Enquire.aspx?machineID=0&source=post-ad" style="color: #DC4903">Click here to start</a></div>
            -->
            <div style="float:left; width:5%">
                    <br />
            </div>
        </div>
        <div align="center" style="float:left; width:100%">
            <!--
            <br />
            <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <asp:Timer ID="Timer1" Interval="5000" runat="server" />
            <asp:UpdatePanel ID="up1" runat="server">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                </Triggers>
                <ContentTemplate>
                    <asp:AdRotator
                    id="AdRotator2"
                    AdvertisementFile="/App_Data/Ads.xml"
                    Runat="server" BorderStyle="None" Height="330px" />
                    <br />
                    <br />

                </ContentTemplate>
            </asp:UpdatePanel>
            -->   
        </div>
    </div>

</asp:Content>
