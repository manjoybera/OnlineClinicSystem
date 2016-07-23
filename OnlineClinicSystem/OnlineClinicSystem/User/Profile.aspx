<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/User.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="OnlineClinicSystem.User.Profile" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>PROFILE SETTINGS</title>
</asp:Content>
<asp:Content ID="BodyCP" ContentPlaceHolderID="BodyCP" runat="server">
    <div class="DivHeading">
    Account Details
</div>
<div class="DivMessage">
Find your Account Details below:<br />
<asp:Label id="lblAccountMsg" runat="server" CssClass="LabelMessage" Text=""></asp:Label>
</div>
<div class="DivTable">
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">First Name:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtFirstName" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpDetails"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtFirstName_FilteredAppt" runat="server" 
                Enabled="True" FilterType="UppercaseLetters" TargetControlID="txtFirstName">
            </asp:FilteredTextBoxExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtFirstName" ErrorMessage="Enter Your Name" 
                ValidationGroup="grpDetails"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Last Name:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtLastName" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpDetails"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtLastName_FilteredAppt" runat="server" 
                Enabled="True" FilterType="UppercaseLetters" TargetControlID="txtLastName">
            </asp:FilteredTextBoxExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="txtLastName" ErrorMessage="Enter Your Last Name" 
                ValidationGroup="grpDetails"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Date of Birth:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtDOB" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpDetails"></asp:TextBox>
            <asp:CalendarExtender ID="txtDOB_CalendarAppt" runat="server" Enabled="True" 
                TargetControlID="txtDOB" PopupPosition="Right" Format="MMMM d, yyyy">
            </asp:CalendarExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtDOB" ErrorMessage="Provide Your DOB" 
                ValidationGroup="grpDetails"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Gender:</div>
        <div class="DivColumns AlignLeft">
            <asp:RadioButtonList ID="rblGender" runat="server" 
                RepeatDirection="Horizontal" CssClass="TextBorder" 
                ValidationGroup="grpDetails" >
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
                <asp:ListItem>Others</asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div class="DivColumns AlignLeft"></div>
    </div>
    
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Address Line 1:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtAddress1" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpDetails"></asp:TextBox>
            
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtAddress1" ErrorMessage="Enter your Address" 
                ValidationGroup="grpDetails"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Address Line 2:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtAddress2" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpDetails"></asp:TextBox>
        </div>
        <div class="DivColumns AlignLeft"></div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Phone No.:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtPhoneNo" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpDetails"></asp:TextBox>
            <asp:MaskedEditExtender ID="txtPhoneNo_MaskedAppt" runat="server" 
                Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                Mask="99999999999" MaskType="Number" TargetControlID="txtPhoneNo">
            </asp:MaskedEditExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtPhoneNo" ErrorMessage="Enter Your Contact no." 
                ValidationGroup="grpDetails"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Email ID:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtEmail" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpDetails"></asp:TextBox>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txtEmail" ErrorMessage="Enter Valid E-mail Address" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ValidationGroup="grpDetails"></asp:RegularExpressionValidator>
        </div>
    </div>

    <div class="DivRow"><div class="DivColumns"></div></div>
    <div class="DivRow">
        <div class="DivColumns FixWidth"></div>
        
        <div class="DivColumns">
                <asp:ImageButton runat="server" id="btnEdit" 
                    ImageUrl="~/Resources/Edit.png" Height="25px" onclick="btnEdit_Click" />
                EDIT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        <div class="DivColumns">
                <asp:ImageButton runat="server" id="btnUpdateDetails" 
                    ImageUrl="~/Resources/Confirm.png" Height="25px" 
                    onclick="btnUpdateDetails_Click" ValidationGroup="grpDetails"/>
                UPDATE
        </div>
    </div>
</div>    

<div class="DivHeading"><br />
    Change Password
</div>
<div class="DivMessage">
Enter your Old Password to Change Password:<br />
<asp:Label id="lblPassMsg" CssClass="LabelMessage" runat="server" Text=""></asp:Label>
</div>
<div class="DivTable">

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Old Password:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtOld" CssClass="TextBorder" runat="server" 
                TextMode="Password" ValidationGroup="grpPassword"></asp:TextBox>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtOld" ErrorMessage="Enter Your Old Password" 
                ValidationGroup="grpPassword"></asp:RequiredFieldValidator>
        </div>
    </div>
    
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Choose Password:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtNewPass" CssClass="TextBorder" runat="server" 
                TextMode="Password" ValidationGroup="grpPassword"></asp:TextBox>
            <asp:PasswordStrength ID="txtNewPass_PasswordCHangePassword" runat="server" 
                Enabled="True" MinimumLowerCaseCharacters="1" MinimumNumericCharacters="1" 
                MinimumSymbolCharacters="1" PreferredPasswordLength="8" 
                TargetControlID="txtNewPass">
            </asp:PasswordStrength>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="txtNewPass" 
                ErrorMessage="Please Enter Eight Digit Password" ValidationGroup="grpPassword"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Confirm Password:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtConPass" CssClass="TextBorder" runat="server" 
                TextMode="Password" ValidationGroup="grpPassword"></asp:TextBox>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="txtNewPass" ControlToValidate="txtConPass" 
                ErrorMessage="Mismatch in Password" ValidationGroup="grpPassword"></asp:CompareValidator>
        </div>
    </div>

    <div class="DivRow"><div class="DivColumns"></div></div>
    <div class="DivRow">
        <div class="DivColumns FixWidth"></div>
        <div class="DivColumns">
                <asp:ImageButton runat="server" id="btnSubmit" 
                    ImageUrl="~/Resources/Confirm.png" Height="25px" 
                    onclick="btnSubmit_Click" ValidationGroup="grpPassword"/>
                UPDATE&nbsp;&nbsp;&nbsp;
        </div>
        <div class="DivColumns">
                <asp:ImageButton runat="server" id="btnReset" 
                    ImageUrl="~/Resources/Cancel.png" Height="25px" onclick="btnReset_Click"/>
                RESET
        </div>
    </div>
</div> 

</asp:Content>

