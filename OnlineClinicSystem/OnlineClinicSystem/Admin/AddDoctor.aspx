<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AddDoctor.aspx.cs" Inherits="OnlineClinicSystem.Admin.AddDoctor" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>ADD DOCTOR</title>
</asp:Content>
<asp:Content ID="BodyCP" ContentPlaceHolderID="BodyCP" runat="server">
    <div class="Tab">
    <div class="TabItem"><a href="AddDoctor.aspx"> NEW DOCTOR</a></div>
    <div class="TabItem"><a href="ExistingDoctor.aspx">EXISTING DOCTOR</a></div>
</div>

<div class="DivHeading">
    New Doctor
</div>
<div class="DivMessage">
Enter all the mandatory details of the Doctor.<br />
<asp:Label id="lblMessage" runat="server" CssClass="LabelMessage" Text=""></asp:Label>
</div>
<div class="DivTable" runat="server" id="divDetails">
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Doctor's Name:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtName" CssClass="TextBorder" runat="server" 
                ValidationGroup="GrpAddDoctor"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtNameFilter" runat="server" Enabled="True" 
                FilterType="UppercaseLetters" TargetControlID="txtName">
            </asp:FilteredTextBoxExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtName" 
                ErrorMessage="Please Enter Doctor Name in CAPS" ValidationGroup="GrpAddDoctor"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Date Of Birth:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtDOB" CssClass="TextBorder" runat="server" 
                ValidationGroup="GrpAddDoctor"></asp:TextBox>
            <asp:CalendarExtender ID="txtDOBCalender" runat="server" Enabled="True" 
                TargetControlID="txtDOB" ClearTime="True" PopupPosition="Right" Format="MMMM d, yyyy">
            </asp:CalendarExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtDOB" ErrorMessage="Enter  DOB" 
                ValidationGroup="GrpAddDoctor"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Date of Joining:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtDOJ" CssClass="TextBorder" runat="server" 
                ValidationGroup="GrpAddDoctor"></asp:TextBox>
            <asp:CalendarExtender ID="txtDOJCalender" runat="server" Enabled="True" 
                TargetControlID="txtDOJ" ClearTime="True" Format="MMMM d, yyyy" PopupPosition="Right">
            </asp:CalendarExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtDOJ" ErrorMessage="Enter  Date of Joining" 
                ValidationGroup="GrpAddDoctor"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Gender:</div>
        <div class="DivColumns AlignLeft">
            <asp:RadioButtonList ID="rblGender" runat="server" 
                RepeatDirection="Horizontal" CssClass="TextBorder" 
                ValidationGroup="GrpAddDoctor" >
                <asp:ListItem Selected="True">Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
                <asp:ListItem>Others</asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div class="DivColumns AlignLeft"></div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Qualification:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtQualification" CssClass="TextBorder" runat="server" 
                ValidationGroup="GrpAddDoctor"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtQualificationDoctor" runat="server" 
                Enabled="True" FilterType="UppercaseLetters" TargetControlID="txtQualification">
            </asp:FilteredTextBoxExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="txtQualification" 
                ErrorMessage="EnterThe Qualification of Doctor" 
                ValidationGroup="GrpAddDoctor"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Specialization:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtSpec" CssClass="TextBorder" runat="server" 
                ValidationGroup="GrpAddDoctor"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtDoctorSpecialization" runat="server" 
                Enabled="True" FilterType="UppercaseLetters" TargetControlID="txtSpec">
            </asp:FilteredTextBoxExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtSpec" 
                ErrorMessage="Enter the specialization of Doctor" 
                ValidationGroup="GrpAddDoctor"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Total Experience:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtYOE" CssClass="TextBorder" runat="server" 
                ValidationGroup="GrpAddDoctor"></asp:TextBox>
             
            <asp:MaskedEditExtender ID="txtYOEMask" runat="server" AutoCompleteValue="0" 
                Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                Mask="99" MaskType="Number" TargetControlID="txtYOE">
            </asp:MaskedEditExtender>
             
            <asp:FilteredTextBoxExtender ID="txtDoctorYOE" runat="server" Enabled="True" 
                FilterType="Numbers" TargetControlID="txtYOE">
            </asp:FilteredTextBoxExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="txtYOE" ErrorMessage="Mention Total Experience" 
                ValidationGroup="GrpAddDoctor"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Address Line 1:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtAddress1" CssClass="TextBorder" runat="server" 
                ValidationGroup="GrpAddDoctor"></asp:TextBox>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="txtAddress1" ErrorMessage="Enter The Valid Address" 
                ValidationGroup="GrpAddDoctor"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Address Line 2:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtAddress2" CssClass="TextBorder" runat="server" 
                ValidationGroup="GrpAddDoctor"></asp:TextBox>
        </div>
        <div class="DivColumns AlignLeft"></div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Phone No.:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtPhoneNo" CssClass="TextBorder" runat="server" 
                ValidationGroup="GrpAddDoctor"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="DocIDview" runat="server" Enabled="True" 
                FilterType="Numbers" TargetControlID="txtPhoneNo">
            </asp:FilteredTextBoxExtender><br />
            <asp:MaskedEditExtender ID="txtPhoneNoMask" runat="server" Century="2000" 
                CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                Mask="999\-99999999" MaskType="Number" TargetControlID="txtPhoneNo">
            </asp:MaskedEditExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                ControlToValidate="txtPhoneNo" ErrorMessage="Enter The Contact of Doctor" 
                ValidationGroup="GrpAddDoctor"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="DivRow"><div class="DivColumns"></div></div>
    <div class="DivRow">
        <div class="DivColumns FixWidth"></div>
        <div class="DivColumns">
              <asp:ImageButton runat="server" id="btnAdd" Height="25px"
                  ImageUrl="~/Resources/Add.png" onclick="btnAdd_Click" 
                  ValidationGroup="GrpAddDoctor" />
                ADD DOCTOR&nbsp;&nbsp;
        </div>
        <div class="DivColumns">
            <asp:ImageButton runat="server" id="btnReset" Height="25px"
                  ImageUrl="~/Resources/Cancel.png" onclick="btnReset_Click" />
                RESET
        </div>
    </div>
</div> 
</asp:Content>
