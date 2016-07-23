<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ModifySchedule.aspx.cs" Inherits="OnlineClinicSystem.Admin.ModifySchedule" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>MODIFY SCHEDULE</title>
</asp:Content>
<asp:Content ID="BodyCP" ContentPlaceHolderID="BodyCP" runat="server">
<div class="Tab">
    <div class="TabItem"><a href="AddSchedule.aspx">NEW SCHEDULE</a></div>
    <div class="TabItem"><a href="ModifySchedule.aspx">MODIFY SCHEDULE</a></div>
</div>

<div class="DivHeading">
    Daily Schedule
</div>

<div class="DivMessage">
Enter the Doctor's ID and Month of this Schedule.<br />
<asp:Label id="lblDocID" runat="server" CssClass="LabelMessage" Text=""></asp:Label>
</div>

<div class="DivTable">
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Enter Doctor's ID:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtDocID" CssClass="TextBorder" runat="server" 
                ValidationGroup="GrpUpdate"></asp:TextBox>
            <asp:MaskedEditExtender ID="txtDocID_MaskedAddSch" runat="server" 
                Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                Mask="9999" MaskType="Number" TargetControlID="txtDocID">
            </asp:MaskedEditExtender>
            <asp:FilteredTextBoxExtender ID="txtDocIDFilter" runat="server" Enabled="True" 
                FilterType="Numbers" TargetControlID="txtDocID">
            </asp:FilteredTextBoxExtender>
        </div>
        <div class="DivColumns">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Enter DoctorID" ControlToValidate="txtDocID" 
                ValidationGroup="GrpUpdate"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Schedule Date:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtDate" CssClass="TextBorder" runat="server" 
                ValidationGroup="GrpUpdate"></asp:TextBox>
            <asp:CalendarExtender ID="txtMonth_CalendarAddSch" runat="server" 
                Enabled="True" TargetControlID="txtDate" Format="MMMM d, yyyy" PopupPosition="Right">
            </asp:CalendarExtender>
        </div>
        <div class="DivColumns">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtDate" ErrorMessage="Please Select Date of Schedule" 
                ValidationGroup="GrpUpdate"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Doctor Availability:</div>
        <div class="DivColumns AlignLeft">
            <asp:DropDownList ID="ddlAvailability" CssClass="TextBorder" runat="server" ValidationGroup="GrpUpdate">
                <asp:ListItem Selected="True" Value="true">Available</asp:ListItem>
                <asp:ListItem Value="false">Unavailable</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="DivColumns">
            
        </div>
    </div>

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Timings:</div>
        <div class="DivColumns AlignLeft">
        <asp:TextBox ID="txtStart1" CssClass="TextBorder DateWidth" runat="server" 
                ValidationGroup="GrpUpdate" />
            <asp:MaskedEditExtender ID="txtStart1_MaskedAddSCH" runat="server" 
                Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                Mask="99:99:99" MaskType="Time" TargetControlID="txtStart1">
            </asp:MaskedEditExtender>
        </div>
        <div class="DivColumns AlignLeft">
         &nbsp;&nbsp;TO &nbsp;&nbsp;
        <asp:TextBox ID="txtEnd1" CssClass="TextBorder DateWidth" runat="server" 
                ValidationGroup="GrpUpdate" />
            <asp:MaskedEditExtender ID="txtEnd1_MaskedAddSCH" runat="server" Century="2000" 
                CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                Mask="99:99:99" MaskType="Time" TargetControlID="txtEnd1">
            </asp:MaskedEditExtender>
        </div>
        <div class="DivColumns">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="txtEnd1" ErrorMessage="Enter Valid Timings" 
            ValidationGroup="GrpUpdate"></asp:RequiredFieldValidator>
        </div>
        
    </div>


    <div class="DivRow"><div class="DivColumns"></div></div>
    <div class="DivRow">
        <div class="DivColumns FixWidth"></div>
        <div class="DivColumns">
                <asp:ImageButton ID="imgEdit" runat="server" ImageUrl="~/Resources/Confirm.png" 
                    Height="25px" onclick="imgEdit_Click" ValidationGroup="GrpUpdate" />
                UPDATE&nbsp;&nbsp;&nbsp;
        </div>
        <div class="DivColumns">
                <asp:ImageButton ID="imgReset" runat="server" ImageUrl="~/Resources/Cancel.png" 
                    Height="25px" onclick="imgReset_Click" />
                RESET
        </div>
    </div>
</div>


</asp:Content>
