<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="ViewAppointments.aspx.cs" Inherits="OnlineClinicSystem.Admin.ViewAppointments" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>VIEW APPOINTMENTS</title>
 <script language="javascript" type="text/javascript">
     function UncheckRadio(rb) {
         var isChecked = rb.checked;
         var row = rb.parentNode.parentNode;

         var currentRdbID = rb.id;
         parent = document.getElementById("<%= gridViewAllAppt.ClientID %>");
         var items = parent.getElementsByTagName('input');

         for (i = 0; i < items.length; i++) {
             if (items[i].id != currentRdbID && items[i].type == "radio") {
                 if (items[i].checked) {
                     items[i].checked = false;
                 }
             }
         }
     }
</script>
</asp:Content>
<asp:Content ID="BodyCP" ContentPlaceHolderID="BodyCP" runat="server">
<div class="DivHeading">
    Doctor's Appointments
</div>

<div class="DivMessage">
Enter the Doctor's ID to view appointments:<br />
<asp:Label id="lblDocID" runat="server" CssClass="LabelMessage" Text=""></asp:Label>
</div>


<div class="DivTable">
    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Enter Doctor's ID:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtDocID" CssClass="TextBorder" runat="server"></asp:TextBox>
            <asp:MaskedEditExtender ID="DocID_MaskedtoView" runat="server" Century="2000" 
                CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                Mask="9999" MaskType="Number" TargetControlID="txtDocID">
            </asp:MaskedEditExtender>
            <asp:FilteredTextBoxExtender ID="DocIDview" runat="server" Enabled="True" 
                FilterType="Numbers" TargetControlID="txtDocID">
            </asp:FilteredTextBoxExtender><br />
        </div>
        <div class="DivColumns ButtonTextBlack">
                <asp:ImageButton ID="btnConfirm" runat="server" ImageUrl="~/Resources/View.png" 
                    Height="25px" onclick="btnConfirm_Click" />
                VIEW APPOINTMENTS
        </div>
    </div>
</div>

<div class="DivMessage" runat="server" id="divMsg"><br /><br />
The details of all appointments are as follows:<br />
<asp:Label id="lblGridMsg" runat="server" CssClass="LabelMessage" Text=""></asp:Label>
</div>

<div class="DivTable" runat="server" id="divTable">
    <asp:GridView ID="gridViewAllAppt" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" CellSpacing="2" DataKeyNames="ApptID" 
        Font-Names="Calibri">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ButtonType="Image"
                SelectImageUrl="~/Resources/Select.png" SelectText="SELECT" 
                ShowCancelButton="False" ShowHeader="True" ShowSelectButton="True" />
            <asp:TemplateField HeaderText="SELECT" ConvertEmptyStringToNull="False">
                <ItemTemplate>
                    <asp:RadioButton ID="rdbtnApptID" runat="server" onclick="javascript:UncheckRadio(this);"/>
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
                VIEW DETAILED INFO
        </div>       
</div>
</asp:Content>
