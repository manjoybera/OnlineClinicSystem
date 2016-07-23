<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="OnlineClinicSystem.General.AboutUs" %>
<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>ABOUT US</title>
</asp:Content>
<asp:Content ID="BodyCP" ContentPlaceHolderID="BodyCP" runat="server">

<div class="DivHeading">
    About Us
</div>
<div class="DivMessage">A Few lines about us:<br />
<asp:Label id="Message" runat="server" Text=""></asp:Label>
</div>
<div class="DivTable">
    
    <div class="DivRow">
        <div class="DivColumns AlignJustify" style="width:700px">
        We are taking care of people for over 20 years now. 
        XYZ Health Networks was established in the  year 1992 
        with a very few facilities which has now turned into 
        a world class Medical Centre. Our clinic houses the 
        world's best instrument and we offer highly experienced 
        Doctors. We are basically located at Hosur Road,  but we 
        have plans to extend our branches at different locations 
        in West Bengal. 
        </div>
        
    </div>
</div>    

</asp:Content>
