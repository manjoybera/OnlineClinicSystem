<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/User.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="OnlineClinicSystem.User.UserHome" %>
<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>USER HOME</title>
</asp:Content>
<asp:Content ID="BodyCP" ContentPlaceHolderID="BodyCP" runat="server">
<div class="DivHeading">
    Welcome <asp:Label id="lblName" runat="server" Text="-NA-"></asp:Label>,
</div>
<div class="DivMessage">
You are at your home page.<br /><br />
Navigate through the tabs for a new appointment or modify an existing one.<br /><br />
Please regularly check your active appointments, as schedules may change<br />
without prior notice due to absence of doctor or other unforseen calamity.<br /><br />
</div>

<div class="DivMessage" runat="server" id="divLastLoginInfo">
Your Account was last accessed from: 
<asp:Label CssClass="LabelMessage" id="lblLastLoginIP" runat="server" Text="-NA-"></asp:Label> on 
<asp:Label CssClass="LabelMessage" id="lblLastLoginTime" runat="server" Text="-NA-"></asp:Label>
</div>
<div class="DivMessage" runat="server" id="divFailedLoginInfo">
Someone tried to access your Account from: 
<asp:Label CssClass="LabelMessage" id="lblFailedLoginIP" runat="server" Text="-NA-"></asp:Label> on 
<asp:Label CssClass="LabelMessage" id="lblFailedLoginTime" runat="server" Text="-NA-"></asp:Label>
</div>
</asp:Content>
