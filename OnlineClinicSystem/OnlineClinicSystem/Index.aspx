<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="OnlineClinicSystem.Index" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>XYZ HEALTH NETWORKS</title>
</asp:Content>
<asp:Content ID="BodyCP" ContentPlaceHolderID="BodyCP" runat="server">

    <div class="Slider FloatLeft">
        <asp:Image ID="Slider" runat="server"/>
        <asp:SlideShowExtender 
        ID="SliderExtender" runat="server" Loop="True"
            AutoPlay="true"
            TargetControlID="Slider"
            SlideShowAnimationType="FadeInOut"
            PlayInterval="5000"
            SlideShowServicePath="~/MainServices.asmx"
            SlideShowServiceMethod="GetPhotos">
        </asp:SlideShowExtender>
    </div>
    <div class="Welcome FloatRight">
    <asp:Image runat="server" imageUrl="~/Resources/Welcome.jpg" CssClass="WelcomeImage"/>
    </div>
</asp:Content>
