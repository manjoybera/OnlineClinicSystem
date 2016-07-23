<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="OnlineClinicSystem.Authentication.SignUp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>REGISTRATION PAGE</title>
</asp:Content>
<asp:Content ID="BodyCP" ContentPlaceHolderID="BodyCP" runat="server">
<div class="DivHeading">
    SignUp:
</div>
<div class="DivMessage">
Welcome to Registration Page.<br />
<asp:Label id="lblMessage" runat="server" CssClass="LabelMessage" Text=""></asp:Label>
</div>
<div class="DivTable">
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">First Name:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtFirstName" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpAddUserDetails"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtFirstNameCharacter" runat="server" 
                Enabled="True" TargetControlID="txtFirstName" 
                FilterType="UppercaseLetters">
            </asp:FilteredTextBoxExtender>
        </div>
        <div class="DivColumns AlignLeft">
            * Please enter only in CAPS<br />
            <asp:RequiredFieldValidator ID="reqFirstName" ControlToValidate="txtFirstName" 
                runat="server" ErrorMessage="* Field can not be left blank" 
                ValidationGroup="grpAddUserDetails"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Last Name:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtLastName" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpAddUserDetails"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="LastNameCharacter" runat="server" 
                Enabled="True" FilterType="UppercaseLetters" TargetControlID="txtLastName">
            </asp:FilteredTextBoxExtender>
        </div>
        <div class="DivColumns AlignLeft">
            * Please enter only in CAPS<br />
            <asp:RequiredFieldValidator ID="reqLastName" ControlToValidate="txtLastName" 
                runat="server" ErrorMessage="* Field can not be left blank" 
                ValidationGroup="grpAddUserDetails"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Date of Birth:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtDOB" CssClass="TextBorder" runat="server" ToolTip="hrkko" 
                ValidationGroup="grpAddUserDetails"></asp:TextBox>
            <asp:CalendarExtender ID="DOBCalender" runat="server" Enabled="True" 
                FirstDayOfWeek="Monday" PopupPosition="Right" TargetControlID="txtDOB" 
                ClearTime="True" Format="MMMM d, yyyy">
            </asp:CalendarExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ControlToValidate="txtDOB" ID="reqDOB" 
                runat="server" ErrorMessage="* Field can not be left blank" 
                ValidationGroup="grpAddUserDetails"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Gender:</div>
        <div class="DivColumns AlignLeft">
            <asp:RadioButtonList ID="rblGender" runat="server" 
                RepeatDirection="Horizontal" CssClass="TextBorder" >
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
                <asp:ListItem>Others</asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div class="DivColumns AlignLeft"></div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Choose Password:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtChoosePass" CssClass="TextBorder" TextMode="Password" 
                runat="server" ValidationGroup="grpAddUserDetails"></asp:TextBox>
            <asp:PasswordStrength ID="PasswordStrenght" runat="server" Enabled="True" 
                TargetControlID="txtChoosePass" MinimumLowerCaseCharacters="1" 
                MinimumNumericCharacters="1" MinimumSymbolCharacters="1" 
                MinimumUpperCaseCharacters="0" PreferredPasswordLength="8" 
                RequiresUpperAndLowerCaseCharacters="True">
            </asp:PasswordStrength>
            
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ControlToValidate="txtChoosePass" ValidationGroup="grpAddUserDetails"
            ID="reqPassword" runat="server" ErrorMessage="* Password is required."></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Confirm Password:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtConfirmPass" CssClass="TextBorder" TextMode="Password" 
                runat="server" ValidationGroup="grpAddUserDetails"></asp:TextBox>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:CompareValidator id="cmpPassMatch" runat="server" 
                ControlToValidate="txtConfirmPass" ControlToCompare="txtChoosePass" 
                ErrorMessage="* Passwords do not match." ValidationGroup="grpAddUserDetails"></asp:CompareValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Address Line 1:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtAddress1" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpAddUserDetails"></asp:TextBox>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="reqAddress1" ControlToValidate="txtAddress1" 
                runat="server" ErrorMessage="* Address is required." 
                ValidationGroup="grpAddUserDetails"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Address Line 2:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtAddress2" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpAddUserDetails"></asp:TextBox>
        </div>
        <div class="DivColumns AlignLeft"></div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Phone No.:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtPhoneNo" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpAddUserDetails"></asp:TextBox>
            <asp:MaskedEditExtender ID="txtPhoneNoMaskedEdit" runat="server" 
                Century="2000" MaskType="Number" Mask="999\-99999999" Enabled="True"
                TargetControlID="txtPhoneNo">
            </asp:MaskedEditExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="reqPhoneNo" ControlToValidate="txtPhoneNo" 
                runat="server" ErrorMessage="* Phone Number is required." 
                ValidationGroup="grpAddUserDetails"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Email ID:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtEmail" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpAddUserDetails"></asp:TextBox>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RegularExpressionValidator ID="regEmail" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ControlToValidate="txtEmail" runat="server" 
                ErrorMessage="* Enter a valid Email Address." 
                ValidationGroup="grpAddUserDetails"></asp:RegularExpressionValidator>
        </div>
    </div>

    <div class="DivRow"><div class="DivColumns"></div></div>
    <div class="DivRow">
        <div class="DivColumns FixWidth"></div>
        <div id="divSubmit" class="DivColumns ButtonTextBlack">
              <asp:ImageButton runat="server" id="btnSubmit" Height="25px"
                  ImageUrl="~/Resources/Confirm.png" onclick="btnSubmit_Click" 
                  ValidationGroup="grpAddUserDetails" />
              SIGN UP&nbsp;&nbsp;&nbsp;
        </div>
        <div class="DivColumns ButtonTextBlack">
                <asp:ImageButton runat="server" id="btnReset" Height="25px"
                  ImageUrl="~/Resources/Cancel.png" onclick="btnReset_Click"  />
                RESET
        </div>
    </div>
</div>    

</asp:Content>
