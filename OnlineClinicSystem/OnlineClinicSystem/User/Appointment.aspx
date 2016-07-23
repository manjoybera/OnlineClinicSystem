<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/User.Master" AutoEventWireup="true" CodeBehind="Appointment.aspx.cs" Inherits="OnlineClinicSystem.User.Appointment" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>APPOINTMENTS</title>
    <script language="javascript" type="text/javascript">
     function UncheckButtons(rbtn) {
         var isChecked = rbtn.checked;
         var row = rbtn.parentNode.parentNode;

         var currentRdbID = rbtn.id;
         parent = document.getElementById("<%= gridViewAppt.ClientID %>");
         var item = parent.getElementsByTagName('input');

         for (i = 0; i < item.length; i++) {
             if (item[i].id != currentRdbID && item[i].type == "radio") {
                 if (item[i].checked) {
                     item[i].checked = false;
                 }
             }
         }
     }
</script>
</asp:Content>
<asp:Content ID="BodyCP" ContentPlaceHolderID="BodyCP" runat="server">
    <div class="Tab">
    <div class="TabItem"><a href="BookAppointment.aspx">NEW APPOINTMENT</a></div>
    <div class="TabItem"><a href="Appointment.aspx">MY APPOINTMENTS</a></div>
</div>

<div class="DivHeading">
    Your Appointments
</div>

<div class="DivMessage">View Appointments by Doctor's ID(optional):<br />
You may leave the field to view all appointments.<br />
<asp:Label id="lblDocID" runat="server" CssClass="LabelMessage" Text=""></asp:Label>
</div>


<div class="DivTable">
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Enter Doctor's ID:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtDocID" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpAppt"></asp:TextBox>
            <asp:MaskedEditExtender ID="DocID_MaskedAppt" runat="server" Century="2000" 
                CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                Mask="9999" MaskType="Number" TargetControlID="txtDocID">
            </asp:MaskedEditExtender>
        </div>
        <div class="DivColumns">
                <asp:ImageButton ID="Confirm" runat="server" ImageUrl="~/Resources/Confirm.png" 
                    Height="25px" onclick="Confirm_Click" ValidationGroup="grpAppt" />
                FETCH APPOINTMENTS
        </div>
    </div>
</div>

<div class="DivMessage" runat="server" id="divMsg"><br /><br />
The details of all appointments are as follows:<br />
<asp:Label id="lblMesg" CssClass="LabelMessage" runat="server" Text=""></asp:Label>
</div>

<div class="DivTable" runat="server" id="divTable">
    <asp:GridView ID="gridViewAppt" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" CellSpacing="2" DataKeyNames="ApptID,Cancelled" 
        Font-Names="Calibri">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ButtonType="Image"
                SelectImageUrl="~/Resources/Select.png" SelectText="SELECT" 
                ShowCancelButton="False" ShowHeader="True" ShowSelectButton="True" />
            <asp:TemplateField HeaderText="SELECT" ConvertEmptyStringToNull="False">
                <ItemTemplate>
                    <asp:RadioButton ID="rdbtnApptID" runat="server" onclick="javascript:UncheckButtons(this);"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#999999" Font-Bold="True" ForeColor="White" 
            Font-Names="Calibri" HorizontalAlign="Center" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    
</div>
<div class="DivTable" runat="server"  id="divButtons">
        <div class="DivColumns ButtonTextBlack">
                <asp:ImageButton ID="btnView" runat="server" ImageUrl="~/Resources/View.png" 
                    Height="25px" onclick="btnView_Click" />
                VIEW&nbsp;&nbsp;
        </div>
        <div class="DivColumns ButtonTextBlack">
                <asp:ImageButton ID="btnModify" runat="server" ImageUrl="~/Resources/Edit.png" 
                    Height="25px" onclick="btnModify_Click" />
                MODIFY&nbsp;&nbsp;
        </div>
        <div class="DivColumns ButtonTextBlack">
                <asp:ImageButton ID="btnDelete" runat="server" 
                    ImageUrl="~/Resources/Delete.png" Height="25px" onclick="btnDelete_Click" />
                DELETE
        </div>  
</div>

</asp:Content>
