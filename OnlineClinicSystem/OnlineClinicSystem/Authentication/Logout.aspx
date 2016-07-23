<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="OnlineClinicSystem.Authentication.Logout" %>
<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>LOGOUT SUCCESSFULL</title>
</asp:Content>
<asp:Content ID="BodyCP" ContentPlaceHolderID="BodyCP" runat="server">

<div class="DivHeading">
    Success
</div>
<div class="DivMessage">
    You have successfully logged out. Click <a class="DivMessage" href="../Index.aspx">here</a> to go to home page.
</div>

</asp:Content>
