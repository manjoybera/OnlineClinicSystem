<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/User.Master" AutoEventWireup="true" CodeBehind="ViewAppointment.aspx.cs" Inherits="OnlineClinicSystem.User.ViewAppointment" %>
<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>APPOINTMENT DETAILS</title>
</asp:Content>
<asp:Content ID="BodyCP" ContentPlaceHolderID="BodyCP" runat="server">
 <div class="Tab">
    <div class="TabItem"><a href="BookAppointment.aspx">NEW APPOINTMENT</a></div>
    <div class="TabItem"><a href="Appointment.aspx">MY APPOINTMENTS</a></div>
</div>

<div class="DivHeading">
    <asp:Label ID="lblHeader" runat="server" Text=""></asp:Label>
</div>

<div class="DivMessage">
Your Appointment Details are as follows:<br />
<asp:Label id="lblMesg" runat="server" CssClass="LabelMessage" Text=""></asp:Label>
</div>

<div class="DivTable" runat="server" id="divTable">

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Appointment ID:</div>
        <div class="DivColumns AlignLeft">
            <asp:Label ID="lblID" CssClass="TextBorder" runat="server" Text="-NA-" width="200px"></asp:Label>
        </div>
        <div class="DivColumns AlignLeft">
        </div>
    </div>


    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Doctor's Name:</div>
        <div class="DivColumns AlignLeft">
            <asp:Label ID="lblDoctor" CssClass="TextBorder" runat="server" Text="-NA-" width="200px"></asp:Label>
        </div>
        <div class="DivColumns AlignLeft">
        </div>
    </div>

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Patient's Name:</div>
        <div class="DivColumns AlignLeft">
            <asp:Label ID="lblPatient" CssClass="TextBorder" runat="server" Text="-NA-" width="200px"></asp:Label>
        </div>
        <div class="DivColumns AlignLeft">
        </div>
    </div>

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Appt. Date:</div>
        <div class="DivColumns AlignLeft">
            <asp:Label ID="lblDate" CssClass="TextBorder" runat="server" Text="-NA-" width="200px"></asp:Label>
        </div>
        <div class="DivColumns AlignLeft">
        </div>
    </div>

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Appt. Time:</div>
        <div class="DivColumns AlignLeft">
            <asp:Label ID="lblTime" CssClass="TextBorder" runat="server" Text="-NA-" width="200px"></asp:Label>
        </div>
        <div class="DivColumns AlignLeft">
        </div>
    </div>

    

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Ailment Name:</div>
        <div class="DivColumns AlignLeft">
            <asp:Label ID="lblAilment" CssClass="TextBorder" runat="server" Text="-NA-" width="200px"></asp:Label>
        </div>
        <div class="DivColumns AlignLeft"></div>
    </div>

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Infected Since:</div>
        <div class="DivColumns AlignLeft">
            <asp:Label ID="lblDays" CssClass="TextBorder" runat="server" Text="-NA-" width="200px"></asp:Label>
        </div>
        <div class="DivColumns AlignLeft"></div>
    </div>

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Current Status:</div>
        <div class="DivColumns AlignLeft">
            <asp:Label ID="lblStatus" CssClass="TextBorder" runat="server" Text="-NA-" width="200px"></asp:Label>
        </div>
        <div class="DivColumns AlignLeft">
        </div>
    </div>

    <div class="DivRow"><div class="DivColumns"></div></div>
    <div class="DivRow">
        <div class="DivColumns FixWidth"></div>
        <div class="DivColumns ButtonTextBlack">
                <asp:ImageButton ID="imgSubmit" runat="server" ImageUrl="~/Resources/Confirm.png" Height="25px" PostBackUrl="~/User/Appointment.aspx" />
                OKAY&nbsp;&nbsp;&nbsp;
        </div>
    </div>
</div>
</asp:Content>

