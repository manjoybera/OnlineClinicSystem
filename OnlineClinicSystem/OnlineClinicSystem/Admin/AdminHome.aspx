<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="OnlineClinicSystem.Admin.AdminHome" %>
<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>ADMIN HOME</title>
</asp:Content>
<asp:Content ID="BodyCP" ContentPlaceHolderID="BodyCP" runat="server">

<div class="DivHeading">
    Welcome <asp:Label id="lblName" runat="server" Text="-NA-"></asp:Label>,
</div>
<div class="DivMessage">
    You are at the Administrator home page.<br />Navigate through the tabs to manage Schedules, Doctors etc.
</div>

<div class="DivMessage" runat="server" id="divLastLoginInfo"><br /><br />
Your Account was last accessed from: 
<asp:Label ForeColor="Red" id="lblLastLoginIP" runat="server" Text="-NA-"></asp:Label> on 
<asp:Label ForeColor="Red" id="lblLastLoginTime" runat="server" Text="-NA-"></asp:Label>
</div>
<div class="DivMessage" runat="server" id="divFailedLoginInfo">
Someone tried to access your Account from: 
<asp:Label ForeColor="Red" id="lblFailedLoginIP" runat="server" Text="-NA-"></asp:Label> on 
<asp:Label ForeColor="Red" id="lblFailedLoginTime" runat="server" Text="-NA-"></asp:Label>
</div>

</asp:Content>
