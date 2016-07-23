<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="OnlineClinicSystem.General.ContactUs" %>
<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>CONTACT US</title>
</asp:Content>
<asp:Content ID="BodyCP" ContentPlaceHolderID="BodyCP" runat="server">
<div class="DivHeading">
    Contact Us
</div>
<div class="DivMessage">
<asp:Label id="Message" runat="server" Text="Get in touch with us through any of these means. We will surely respond you."></asp:Label>
</div>
<div class="DivTable" >
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">
        <asp:Image ID="imgMobile" runat="server" ImageUrl="~/Resources/Mobile.png" Height="25px" />
        </div>
        <div class="DivColumns AlignLeft">
        033-25408019, 033-25408021
        </div>
    </div>

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">
        <asp:Image ID="imgMail" runat="server" ImageUrl="~/Resources/Email.png" Height="23px" />
        </div>
        <div class="DivColumns AlignLeft">
        help.desk@xyznetworks.org
        </div>
    </div>

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">
        <asp:Image ID="imgFB" runat="server" ImageUrl="~/Resources/Facebook.png" Height="25px" />
        </div>
        <div class="DivColumns AlignLeft">
        facebook.com/xyz.networks
        </div>
    </div>

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">
        <asp:Image ID="imgTwitter" runat="server" ImageUrl="~/Resources/Twitter.png" Height="25px" />
        </div>
        <div class="DivColumns AlignLeft">
        twitter.com/xyz.networks
        </div>
    </div>
    
</div>    

</asp:Content>

