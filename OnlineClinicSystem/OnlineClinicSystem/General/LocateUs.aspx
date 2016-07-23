<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="LocateUs.aspx.cs" Inherits="OnlineClinicSystem.General.LocateUs" %>
<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>LOCATE US</title>
</asp:Content>
<asp:Content ID="BodyCP" ContentPlaceHolderID="BodyCP" runat="server">

<div class="DivHeading">
    Locate Us
</div>
<div class="DivMessage">Track Us on your GPS via Google Maps.<br />
Near Madiwala Bus Stop, Hosur Road, Kolkata-700003, WB
<asp:Label id="Message" runat="server" Text=""></asp:Label>
</div>
<div class="DivTable" >
    
    <div class="DivRow">
        <div class="DivColumns Cursor">
            <asp:Image ID="imgHappy" runat="server" ImageUrl="~/Resources/Map.jpg" Width="700px"/>
        </div>
        
    </div>
</div>    

</asp:Content>

