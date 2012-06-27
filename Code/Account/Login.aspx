<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HelloGES.Account.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
	<title>Global Earthmoving Solutions - Login</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="menuheading">
        Login
    </div>
    <br />
    <div class="defaultpage" style="height: 40%; width: 100%; float: left">
        <div style="width: 20%; float: left"> 
            <asp:Label ID="Label1" runat="server" Text="Please enter Email Address"></asp:Label> 
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Please enter Password"> </asp:Label> 
        </div>
     
        <div style="width: 40%; float: left"> 
            <asp:TextBox ID="txtUserName" runat="server" Width="100%"></asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Width="100%"></asp:TextBox>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" 
                NavigateUrl="PasswordRecovery.aspx" Visible="False">Forgot Password?</asp:HyperLink>
        </div>

        <div style="width: 2%; float: left"> 
            <br />
            <br />
            <br />
            <br />
        </div>

        <div style="width: 20%; float: left"> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Please supply a Username" ControlToValidate="txtUserName" 
                ForeColor="Red">*</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="Please supply a Password" ControlToValidate="txtPassword" 
                ForeColor="Red">*</asp:RequiredFieldValidator>
        </div>

        <div style="height: 20%; width: 100%; float: left">
            <div style="clear:both; width: 60%; float: left" align="right"> 
                <br />
                <br />
                <asp:Button ID="btnLogin" runat="server" Text="Login" onclick="btnLogin_Click" 
                    Width="85px" CssClass="btnSubmit" />
            </div>
            <div style="width: 2%; float: left"> 
                <br />
                <br />
                <br />
            </div>
            <div style="width: 37%; float: left"> 
                <br />
                <br />
                <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
