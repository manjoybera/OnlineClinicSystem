<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="OnlineClinicSystem.General.Feedback" %>
<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>FEEDBACK</title>
</asp:Content>
<asp:Content ID="BodyCP" ContentPlaceHolderID="BodyCP" runat="server">

<div class="DivHeading">
    Feedback
</div>
<div class="DivMessage">Please give your valuable feedback.<br />
<asp:Label id="Message" runat="server" Text=""></asp:Label>
</div>
<div class="DivTable" >
    
    <div class="DivRow">
        <div class="DivColumns FixWidth Cursor">
            <asp:ImageButton ID="imgHappy" runat="server" ImageUrl="~/Resources/Happy.png" OnClick="Happy"/>
        </div>
        <div class="DivColumns FixWidth Cursor">
            <asp:ImageButton ID="imgOkay" runat="server" ImageUrl="~/Resources/Okay.png" OnClick="Okay" />
        </div>
        <div class="DivColumns FixWidth Cursor">
            <asp:ImageButton ID="imgSad" runat="server" ImageUrl="~/Resources/Sad.png" OnClick="Sad"/>
        </div>
    </div>
</div>    

</asp:Content>

