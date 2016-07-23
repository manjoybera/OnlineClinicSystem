<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="RegTrue.aspx.cs" Inherits="OnlineClinicSystem.Authentication.RegTrue" %>
<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>REGISTRATION SUCCESSFULL</title>
</asp:Content>
<asp:Content ID="BodyCP" ContentPlaceHolderID="BodyCP" runat="server">

<div class="DivHeading">
    Success
</div>
<div class="DivMessage">
    You have successfully registered with us.
    <br />Your system generated User ID is: <asp:Label CssClass="LabelMessage" ID="lblUserID" runat="server" Text=""></asp:Label>.
    <br /><br /> We suggest you to rememeber this, as it will be required if you try to login to our website.
    Click <a class="DivMessage" href="Login.aspx">here</a> to login.
</div>

</asp:Content>
