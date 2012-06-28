<%@ Page Title="Global Earthmoving Solutions - Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="HelloGES.Account.Register" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="menuheading">
        Registration
    </div>
    <div class="defaultpage" style="height: 40%; width: 100%; float: left">
        <br />
        <br />
        <div style="width: 20%; float: left; height: 100%;"> 
            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
            <br />
            <br />
            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
            <br />
            <br />
            <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
        </div>
     
        <div style="width: 40%; float: left"> 
            <asp:TextBox ID="Email" runat="server" Width="100%"></asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="100%"></asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" Width="100%"></asp:TextBox>
        </div>

        <div style="width: 2%; float: left; height: 100%;"> 
            <br />
            <br />
            <br />
            <br />
        </div>

        <div style="width: 20%; float: left"> 
            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" 
                    CssClass="failureNotification" ErrorMessage="E-mail is required" 
                ToolTip="E-mail is required" ForeColor="Red">E-mail is required</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                    CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." ForeColor="Red">Password is required</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" 
                CssClass="failureNotification" Display="Dynamic" 
                    ErrorMessage="Confirm Password is required" 
                ID="ConfirmPasswordRequired" runat="server" 
                    ToolTip="Confirm Password is required" ForeColor="Red">Confirm Password is required</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="PasswordCompare" runat="server" 
                ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                    CssClass="failureNotification" Display="Dynamic" 
                ErrorMessage="The Password and Confirmation Password must match" 
                ForeColor="Red">The Password and Confirmation Password must match</asp:CompareValidator>
        </div>
    </div>

    <div style="height: 20%; width: 100%; float: left">
        <div style="clear:both; width: 60%; float: left" align="right"> 
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Register" 
                onclick="CreateUserButton_Click" CssClass="btnSubmit"/>
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
</asp:Content>
