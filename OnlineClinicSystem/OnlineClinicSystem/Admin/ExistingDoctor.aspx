<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ExistingDoctor.aspx.cs" Inherits="OnlineClinicSystem.Admin.ModifyDoctor" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>EXISTING DOCTOR</title>
</asp:Content>
<asp:Content ID="BodyCP" ContentPlaceHolderID="BodyCP" runat="server">
    <div class="Tab">
    <div class="TabItem"><a href="AddDoctor.aspx">NEW DOCTOR</a></div>
    <div class="TabItem"><a href="ExistingDoctor.aspx">EXISTING </a>DOCTOR</div>
</div>

<div class="DivHeading">
    Doctor Details
</div>

<div class="DivMessage">
Enter the ID of the Doctor you want to view:<br />
<asp:Label id="lblDocID" runat="server" CssClass="LabelMessage" Text=""></asp:Label>
</div>

<div class="DivTable">
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Enter Doctor's ID:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtDocID" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpViewDetails"></asp:TextBox>
            <asp:MaskedEditExtender ID="DocID_Masked" runat="server" Century="2000" 
                CultureTimePlaceholder="" Enabled="True" 
                Mask="9999" MaskType="Number" TargetControlID="txtDocID">
            </asp:MaskedEditExtender>
            <asp:FilteredTextBoxExtender ID="DocIDview" runat="server" Enabled="True" 
                FilterType="Numbers" TargetControlID="txtDocID">
            </asp:FilteredTextBoxExtender><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
            ErrorMessage="*To View Details Enter Valid DocID" ControlToValidate="txtDocID" 
                ValidationGroup="grpViewDetails"></asp:RequiredFieldValidator>
        </div>
        <div class="DivColumns ButtonTextBlack">
            <asp:ImageButton runat="server" id="btnView" Height="25px"
                  ImageUrl="~/Resources/View.png" onclick="btnView_Click" 
                ValidationGroup="grpViewDetails"  />
                VIEW DETAILS
        </div>
        
    </div>
</div>

<div id="divDtailsMsg" runat="server" class="DivMessage"><br /><br />
Here you can modify/delete Doctor's details.<br />
</div>

<div class="DivTable"  runat="server" id="divDetails">
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Doctor's Name:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtName" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpExistngDoc"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtDoctorName_Filter" runat="server" 
                Enabled="True" FilterType="UppercaseLetters" TargetControlID="txtName">
            </asp:FilteredTextBoxExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtName" ErrorMessage="Enter Doctor Name" 
                ValidationGroup="grpExistngDoc"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Date Of Birth:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtDOB" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpExistngDoc"></asp:TextBox>
            <asp:CalendarExtender ID="txtDoctorDOB_Calendar" runat="server" Enabled="True" 
                TargetControlID="txtDOB" ClearTime="True" Format="MMMM d, yyyy" PopupPosition="Right">
            </asp:CalendarExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtDOB" ErrorMessage="Enter Valid DOB" 
                ValidationGroup="grpExistngDoc"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Date of Joining:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtDOJ" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpExistngDoc"></asp:TextBox>
            <asp:CalendarExtender ID="txtDoctorDOJ_Calendar" runat="server" Enabled="True" 
                TargetControlID="txtDOJ" ClearTime="True" Format="MMMM d, yyyy" PopupPosition="Right">
            </asp:CalendarExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtDOJ" ErrorMessage="EnterValid DOJ" 
                ValidationGroup="grpExistngDoc"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Gender:</div>
        <div class="DivColumns AlignLeft">
            <asp:RadioButtonList ID="rblGender" runat="server" 
                RepeatDirection="Horizontal" CssClass="TextBorder" 
                ValidationGroup="grpExistngDoc" >
                <asp:ListItem>Male</asp:ListItem>
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
                ValidationGroup="grpExistngDoc"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtQualification_Filtered" runat="server" 
                Enabled="True" FilterType="UppercaseLetters" TargetControlID="txtQualification">
            </asp:FilteredTextBoxExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtQualification" 
                ErrorMessage="Enter Doctor's Qualification" 
                ValidationGroup="grpExistngDoc"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Specialization:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtSpec" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpExistngDoc"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtSpec_Filter" runat="server" Enabled="True" 
                FilterType="UppercaseLetters" TargetControlID="txtSpec">
            </asp:FilteredTextBoxExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ErrorMessage="Enter Doctor's Specialization" ControlToValidate="txtSpec" 
                ValidationGroup="grpExistngDoc"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Total Experience:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtYOE" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpExistngDoc"></asp:TextBox>
            <asp:MaskedEditExtender ID="txtYOE_Masked" runat="server" Century="2000" 
                CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                Mask="99" MaskType="Number" TargetControlID="txtYOE">
            </asp:MaskedEditExtender>
            <asp:FilteredTextBoxExtender ID="txtYOE_Filter" runat="server" Enabled="True" 
                FilterType="Numbers" TargetControlID="txtYOE">
            </asp:FilteredTextBoxExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="txtYOE" ErrorMessage="Mention Experience of Doctor" 
                ValidationGroup="grpExistngDoc"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Address Line 1:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtAddress1" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpExistngDoc"></asp:TextBox>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="txtAddress1" ErrorMessage="Enter The Address of Doctor" 
                ValidationGroup="grpExistngDoc"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Address Line 2:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtAddress2" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpExistngDoc"></asp:TextBox>
        </div>
        <div class="DivColumns AlignLeft"></div>
    </div>
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Phone No.:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtPhoneNo" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpExistngDoc"></asp:TextBox>
            <asp:MaskedEditExtender ID="txtPhoneNo_Masked" runat="server" Century="2000" 
                CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                Mask="999-9999999999" MaskType="Number" TargetControlID="txtPhoneNo">
            </asp:MaskedEditExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ErrorMessage="Enter Valid Phone No." ControlToValidate="txtPhoneNo" 
                ValidationGroup="grpExistngDoc"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="DivRow"><div class="DivColumns"></div></div>
    <div class="DivRow">
        <div class="DivColumns FixWidth"></div>
        <div class="DivColumns ButtonTextBlack">
                <asp:ImageButton ID="btnEdit" runat="server" ImageUrl="~/Resources/Edit.png" 
                    Height="25px" onclick="btnEdit_Click" />
                EDIT
        </div>
        <div class="DivColumns ButtonTextBlack">
                <asp:ImageButton runat="server" id="btnUpdate" Height="25px"
                  ImageUrl="~/Resources/Add.png" onclick="btnUpdate_Click" 
                    ValidationGroup="grpExistngDoc" />
                UPDATE
        </div>
        <div class="DivColumns ButtonTextBlack">
                <asp:ImageButton ID="btnDelete" runat="server" 
                    ImageUrl="~/Resources/Delete.png" Height="25px" onclick="btnDelete_Click" />
                DELETE
        </div>
    </div>
</div> 
</asp:Content>
