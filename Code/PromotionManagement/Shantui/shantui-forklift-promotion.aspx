<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shantui-forklift-promotion.aspx.cs" Inherits="HelloGES.PromotionManagement.Shantui.shantui_forklift_promotion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Looking for a Brand New Forklift for under R150 000?</title>
    <link href="promo.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
	    <div class="wrap">

            <!-- start of header -->
		    <div id="header">
				    <h1>Looking for a Forklift?</h1>
   		    </div>
		    <!-- end of header -->
	    </div>

	    <div id="featured_area">

            <!-- start of wrap -->
            <div class="wrap">
                <!-- start of featured_text -->
                <div style="float:left; width:100%">
                    <div class="featured_text" style="float:left; width:48%">
				        <h2>Shantui 3T Series: SF30</h2>
                        <h4>Specifications: <asp:ImageButton ID="imgSpecSheet" runat="server" CausesValidation="false" 
                                CommandName="DownloadSpec" ImageUrl="../../Images/pdf.gif" 
                                Text='Download Forklift Spec Sheet' 
                                CommandArgument="../../ShantuiPics/forklift/SF30.pdf" 
                                onclick="imgSpecSheet_Click"/></h4>
                        <ul id="features">
                            <li>Rated Load : 3000kg</li>
                            <li>Power : Diesel</li>
                            <li>Operating Weight : 4500kg</li>
                        </ul>
                        <h4>Features:</h4>
                        <ul id="features">
                            <li>The working device has a roller type, "J"-shaped mast, "C"-shaped outer mast with free hoist, and secondary telescopic mast, providing excellent lift performance</li>
                            <li>With a hydraulic drive system, front axle drive and rear axle steering, the machine has excellent travel and traction capabilities</li>
                            <li>The electric system uses intelligent electronic instruments, which can automatically measure water temperature, fuel level, and engine oil pressure; the connectors have a special water-proof seal structure, ensuring safe and reliable operation</li>
                            <li>The ergonomically designed, comfortable cab with FOP function provides operators with a safe work environment</li>
                            <li>The steering system uses a steering gear with hydraulic boost, which can achieve faster steering speeds</li>
                            <li>Shock absorption system: the cab/cab canopy is equipped with a shock absorption system. The control device, canopy, and operator seat are installed on the cab/cab canopy, which greatly reduces overall machine vibrations and provides the operator with a comfortable work environment</li>
                        </ul>
			        </div>
			        <!-- end of featured_text -->
                    <div style="float:left; width:3%;">
				    </div>
                    <div style="float:left; width:45%;">
                        <div style="float:left; width:100%;">
                            <img style="width:100%;" src="/shantuipics/forklift/forklift-shantui-sf30.jpg" alt="Image" />
    				    </div>
                        <div style="float:left; width:100%; height:30px">
    				    </div>
                        <div style="float:left; width:100%; text-align: center;">
                            <asp:Button ID="btnSubmit" class="btnSubmit" runat="server" Text="  Enquire Here " 
                                onclick="btnSubmit_Click" />
				        </div>
				    </div>

				</div>
            </div>
				<!-- end of action_buttons -->
		</div>
		<!-- end of wrap -->
    </form>
</body>
</html>
