<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ErrorAdmin.aspx.cs" Inherits="OnlineClinicSystem.ErrorPages.ErrorAdmin" %>
<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>ERROR PAGE</title>
</asp:Content>
<asp:Content ID="BodyCP" ContentPlaceHolderID="BodyCP" runat="server">

<div class="DivHeading">
    Sorry :(
</div>
<div class="DivMessage">
    Stay Calm! Looks like something went wrong. Please <a class="DivMessage" href="../Admin/AdminHome.aspx">navigate</a> through rest of the site while we fix it for you.
</div>
<div class="DivMessage">
    ERROR MESSAGE:<br />
    <asp:Label ID="lblErrorMsg" runat="server" CssClass="LabelMessage" Text=""></asp:Label>  
</div>
</asp:Content>
