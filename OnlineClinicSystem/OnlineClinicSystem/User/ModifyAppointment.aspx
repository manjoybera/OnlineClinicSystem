<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/User.Master" AutoEventWireup="true" CodeBehind="ModifyAppointment.aspx.cs" Inherits="OnlineClinicSystem.User.ModifyAppointments" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>MODIFY APPOINTMENT</title>
</asp:Content>
<asp:Content ID="BodyCP" ContentPlaceHolderID="BodyCP" runat="server">
<div class="Tab">
    <div class="TabItem"><a href="BookAppointment.aspx">NEW APPOINTMENT</a></div>
    <div class="TabItem"><a href="Appointment.aspx">MY APPOINTMENTS</a></div>
</div>

<div class="DivHeading">
    Modify Appointment
</div>

<div class="DivMessage">
Alter your Appointment details here:<br />
<asp:Label id="lblMesg" runat="server" CssClass="LabelMessage" Text=""></asp:Label>
</div>

<div class="DivTable" runat="server" id="divTable">

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Appointment ID:</div>
        <div class="DivColumns AlignLeft">
            <asp:Label ID="lblID" CssClass="TextBorder" runat="server" Text="-NA-"></asp:Label>
        </div>
        <div class="DivColumns AlignLeft">
        </div>
    </div>


    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Doctor's Name:</div>
        <div class="DivColumns AlignLeft">
            <asp:Label ID="lblDoctor" CssClass="TextBorder" runat="server" Text="-NA-"></asp:Label>
        </div>
        <div class="DivColumns AlignLeft">
        </div>
    </div>

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Patient's Name:</div>
        <div class="DivColumns AlignLeft">
            <asp:Label ID="lblPatient" CssClass="TextBorder" runat="server" Text="-NA-"></asp:Label>
        </div>
        <div class="DivColumns AlignLeft">
        </div>
    </div>

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Appt. Date:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtDate" CssClass="TextBorder" runat="server" Text="-NA-" 
                ValidationGroup="GrpAppt"></asp:TextBox>
            <asp:CalendarExtender ID="txtDateCalendarExtender" runat="server" 
                ClearTime="True" Enabled="True" PopupPosition="Right" 
                TargetControlID="txtDate" Format="MMMM d, yyyy">
            </asp:CalendarExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="reqDate" runat="server"
                ErrorMessage="Enter Correct Appt Date"  ValidationGroup="GrpAppt" 
                ControlToValidate="txtDate"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Preferred Time:</div>
        <div class="DivColumns AlignLeft">
            <asp:DropDownList ID="ddlSlot" CssClass="TextBorder" runat="server" 
                ValidationGroup="GrpAppt" DataTextField="select preferred Slot">
                <asp:ListItem Value="1">Morning Slot</asp:ListItem>
                <asp:ListItem Value="2">Evening Slot</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="ddlSlot" ErrorMessage="Choose Proper Slot Type" 
                ValidationGroup="GrpAppt"></asp:RequiredFieldValidator>
        </div>
    </div>


    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Ailment Name:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtAilment" CssClass="TextBorder" runat="server" Text="-NA-"></asp:TextBox>
        </div>
        <div class="DivColumns AlignLeft"></div>
    </div>

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Infected Since:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtDays" CssClass="TextBorder" runat="server" Text="-NA-"></asp:TextBox>
            <asp:MaskedEditExtender ID="txtDays_MaskedModifyAppt" runat="server" 
                Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                Mask="99" MaskType="Number" TargetControlID="txtDays">
            </asp:MaskedEditExtender>
        </div>
        <div class="DivColumns AlignLeft"></div>
    </div>


    <div class="DivRow"><div class="DivColumns"></div></div>
    <div class="DivRow">
        <div class="DivColumns FixWidth"></div>
        <div class="DivColumns ButtonTextBlack">
                <asp:ImageButton ID="imgSubmit" runat="server" 
                    ImageUrl="~/Resources/Confirm.png" Height="25px" onclick="imgSubmit_Click" 
                    ValidationGroup="GrpAppt" />
                UPDATE&nbsp;&nbsp;&nbsp;
        </div>
        <div class="DivColumns ButtonTextBlack">
                <asp:ImageButton ID="imgReset" runat="server" ImageUrl="~/Resources/Cancel.png" 
                    Height="25px" PostBackUrl="~/User/ModifyAppointment.aspx" 
                    onclick="imgReset_Click"/>
                RESET
                </div>
    </div>
</div>
</asp:Content>
