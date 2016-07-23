<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineClinicSystem.Authentication.Login" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>LOGIN PAGE</title>
</asp:Content>
<asp:Content ID="BodyCP" ContentPlaceHolderID="BodyCP" runat="server">
<div class="DivHeading">
    Sign In:
</div>
<div class="DivMessage">
Enter your Credentials to Sign In.<br />
<asp:Label id="lblMessage" runat="server" CssClass="LabelMessage" Text=""></asp:Label>
</div>
<div class="DivTable" >
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">
        User ID:
        </div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtUserID" CssClass="TextBorder" runat="server" 
                ValidationGroup="Login"></asp:TextBox>
                  
            <asp:FilteredTextBoxExtender ID="UserIDNum" runat="server" Enabled="True" 
                FilterType="Numbers" TargetControlID="txtUserID">
            </asp:FilteredTextBoxExtender>
             <asp:MaskedEditExtender ID="DocID_MaskedAppt" runat="server" Century="2000" 
                CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                Mask="9999" MaskType="Number" TargetControlID="txtUserID">
            </asp:MaskedEditExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="reqUserID" ControlToValidate="txtUserID" 
                runat="server" ErrorMessage="Please Enter UserID" ValidationGroup="Login"></asp:RequiredFieldValidator><br />
           
            </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">
            Password:      
        </div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="TextBorder" 
                runat="server" ValidationGroup="Login"></asp:TextBox>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="reqPassword" ControlToValidate="txtPassword" 
                runat="server" ErrorMessage="Please Enter Password" 
                ValidationGroup="Login"></asp:RequiredFieldValidator><br />
        </div>
    </div>
    <div class="DivRow"><div class="DivColumns"></div></div>
    <div class="DivRow">
        <div class="DivColumns FixWidth"></div>
        <div class="DivColumns ButtonTextBlack">
                <asp:ImageButton runat="server" id="btnSubmit" 
                    ImageUrl="~/Resources/Confirm.png" Height="25px" onclick="btnSubmit_Click" 
                    ValidationGroup="Login" />
                SIGN IN&nbsp&nbsp&nbsp
        </div>
        <div class="DivColumns ButtonTextBlack">
                <asp:ImageButton runat="server" id="btnReset" 
                    ImageUrl="~/Resources/Confirm.png" Height="25px" 
                    onclick="btnReset_Click" />
                RESET
        </div>
    </div>
</div>    

</asp:Content>
