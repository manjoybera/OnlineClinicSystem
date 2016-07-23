<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="LoginFalse.aspx.cs" Inherits="OnlineClinicSystem.Authentication.RegFalse" %>
<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>LOGIN FAILED</title>
</asp:Content>
<asp:Content ID="BodyCP" ContentPlaceHolderID="BodyCP" runat="server">

<div class="DivHeading">
    Sorry :(
</div>
<div class="DivMessage">
    OOOPS!! Something went wrong. Possible reasons could be invalid credentials or multiple sessions.<br />
    Click <a class="DivMessage" href="Login.aspx">here</a> to try again.
</div>

</asp:Content>
