<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="OnlineClinicSystem.Admin.Profile" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>PROFILE SETTINGS</title>
</asp:Content>
<asp:Content ID="BodyCP" ContentPlaceHolderID="BodyCP" runat="server">

<div class="DivHeading">
    Change Password
</div>
<div class="DivMessage">
Enter your Old Password to Change Password:<br />
<asp:Label id="lblMessage" runat="server" CssClass="LabelMessage" Text=""></asp:Label>
</div>
<div class="DivTable">

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Old Password:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtOld" CssClass="TextBorder" runat="server" 
                TextMode="Password" ValidationGroup="grp ChangPwd"></asp:TextBox>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtOld" ErrorMessage="Enter Your Old Password" 
                SetFocusOnError="True" ValidationGroup="grp ChangPwd"></asp:RequiredFieldValidator>
        </div>
    </div>
    
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Choose Password:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtNewPass" CssClass="TextBorder" runat="server" 
                TextMode="Password" ValidationGroup="grp ChangPwd"></asp:TextBox>
            <asp:PasswordStrength ID="txtNewPass_PasswordStrength" runat="server" 
                Enabled="True" MinimumNumericCharacters="1" MinimumSymbolCharacters="1" 
                MinimumUpperCaseCharacters="1" PreferredPasswordLength="8" 
                TargetControlID="txtNewPass">
            </asp:PasswordStrength>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtNewPass" ErrorMessage="Enter Eight Digit Password" 
                ValidationGroup="grp ChangPwd"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Confirm Password:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtConPass" CssClass="TextBorder" runat="server" 
                TextMode="Password" ValidationGroup="grp ChangPwd"></asp:TextBox>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="txtNewPass" ControlToValidate="txtConPass" 
                ErrorMessage="Please Give The Same Password as Above" 
                ValidationGroup="grp ChangPwd"></asp:CompareValidator>
        </div>
    </div>

    <div class="DivRow"><div class="DivColumns"></div></div>
    <div class="DivRow">
        <div class="DivColumns FixWidth"></div>
        <div class="DivColumns ButtonTextBlack">&nbsp;&nbsp;
                <asp:ImageButton runat="server" id="btnSubmit" 
                    ImageUrl="~/Resources/Confirm.png" Height="25px" 
                onclick="btnSubmit_Click" ValidationGroup="grp ChangPwd"/>
                UPDATE
        </div>
        <div class="DivColumns ButtonTextBlack">
                <asp:ImageButton runat="server" id="btnReset" 
                    ImageUrl="~/Resources/Cancel.png" Height="25px" onclick="btnReset_Click"/>
                RESET
        </div>
    </div>
</div> 

</asp:Content>


