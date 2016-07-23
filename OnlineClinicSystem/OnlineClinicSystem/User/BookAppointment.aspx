<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/User.Master" AutoEventWireup="true" CodeBehind="BookAppointment.aspx.cs" Inherits="OnlineClinicSystem.User.BookAppointment" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="MainHead" ContentPlaceHolderID="MainHead" runat="server">
<title>BOOK APPOINTMENTS</title>
 <script language="javascript" type="text/javascript">
     function UncheckRadio(rb) {
         var isChecked = rb.checked;
         var row = rb.parentNode.parentNode;

         var currentRdbID = rb.id;
         parent = document.getElementById("<%= gridViewDoc.ClientID %>");
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
    <div class="Tab">
    <div class="TabItem"><a href="BookAppointment.aspx">NEW APPOINTMENT</a></div>
    <div class="TabItem"><a href="Appointment.aspx">MY APPOINTMENTS</a></div>
</div>



<div class="DivHeading">
    New Appointment
</div>

<div class="DivMessage">Enter Date and Preferred Specialist Catagory:<br />
<asp:Label id="lblDocID" runat="server" CssClass="LabelMessage" Text=""></asp:Label>
</div>


<div class="DivTable">

     <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Appointment Date:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtDate" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpBookAppt"></asp:TextBox>
            <asp:CalendarExtender ID="txtDateCalendarExtender" runat="server" 
                ClearTime="True" Enabled="True" TargetControlID="txtDate" 
                PopupPosition="Right" Format="MMMM d, yyyy">
            </asp:CalendarExtender>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtDate" ErrorMessage="Enter Valid Appointment Date" 
                ValidationGroup="grpBookAppt"></asp:RequiredFieldValidator>
        </div>
    </div>

     <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Preferred Time:</div>
        <div class="DivColumns AlignLeft">
            <asp:DropDownList ID="ddlSlot" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpBookAppt" DataTextField="select preferred Slot" 
                Height="25px">
                <asp:ListItem Selected="True" Value="1">Morning Slot</asp:ListItem>
                <asp:ListItem Value="2">Evening Slot</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="DivColumns AlignLeft">
            <asp:RequiredFieldValidator ID="reqSlot" runat="server" 
                ControlToValidate="ddlSlot" ErrorMessage="Select prefferd Slot" 
                ValidationGroup="grpBookAppt"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Specialization:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtSpec" CssClass="TextBorder" runat="server" 
                ValidationGroup="grpBookAppt"></asp:TextBox>
            <asp:FilteredTextBoxExtender ID="txtSpec_FilteredApptBook" runat="server" 
                Enabled="True" FilterType="UppercaseLetters" TargetControlID="txtSpec">
            </asp:FilteredTextBoxExtender>
        </div>
        <div class="DivColumns AlignLeft">
            
        </div>
    </div>

    <div class="DivRow"><div class="DivColumns"></div></div>
    <div class="DivRow">
        <div class="DivColumns FixWidth"></div>
        <div class="DivColumns">
                <asp:ImageButton ID="imgSubmit" runat="server" ImageUrl="~/Resources/View.png" 
                    Height="25px" ValidationGroup="grpBookAppt" onclick="imgSubmit_Click" />
                SEARCH&nbsp;&nbsp;&nbsp;
        </div>
    </div>
</div>

<div class="DivMessage" runat="server" id="divDocMsg"><br /><br />
Select one of the available Doctors:<br />
<asp:Label id="lblGrid" runat="server" CssClass="LabelMessage" Text=""></asp:Label>
</div>

<div class="DivTable"  runat="server" id="divDocGrid">
    <asp:GridView ID="gridViewDoc" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" CellSpacing="2" DataKeyNames="DoctorID" 
        Font-Names="Calibri">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ButtonType="Image"
                SelectImageUrl="~/Resources/Select.png" SelectText="SELECT" 
                ShowCancelButton="False" ShowHeader="True" ShowSelectButton="True" />
            <asp:TemplateField HeaderText="SELECT" ConvertEmptyStringToNull="False">
                <ItemTemplate>
                    <asp:RadioButton ID="rdbtnDocID" runat="server" onclick="javascript:UncheckRadio(this);"/>
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


<div class="DivMessage" runat="server" id="divBookMsg">
Please fill up these optional details:<br />
<asp:Label id="lblOptn" CssClass="LabelMessage" runat="server" Text=""></asp:Label>
</div>

<div class="DivTable" runat="server" id="divBookFields">

   

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Ailment Name:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtName" CssClass="TextBorder" runat="server"></asp:TextBox>
            
        </div>
        <div class="DivColumns AlignLeft">
        </div>
    </div>

    <div class="DivRow">
        <div class="DivColumns AlignRight FixWidth">Infected Since:</div>
        <div class="DivColumns AlignLeft">
            <asp:TextBox ID="txtDays" CssClass="TextBorder" runat="server"></asp:TextBox>
            <asp:MaskedEditExtender ID="txtDays_MaskedInfectedDays" runat="server" 
                Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" 
                CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" 
                CultureThousandsPlaceholder="" CultureTimePlaceholder="" Enabled="True" 
                Mask="99" MaskType="Number" TargetControlID="txtDays">
            </asp:MaskedEditExtender>
        </div>
        <div class="DivColumns AlignLeft">
        </div>
    </div>


    <div class="DivRow"><div class="DivColumns"></div></div>
    <div class="DivRow">
        <div class="DivColumns FixWidth"></div>
        <div class="DivColumns">
                <asp:ImageButton ID="imgBook" runat="server" ImageUrl="~/Resources/Confirm.png" 
                    Height="25px" onclick="imgBook_Click" />
                CONFIRM
        </div>
        <div class="DivColumns">
                <asp:ImageButton ID="imgReset" runat="server" ImageUrl="~/Resources/Cancel.png" Height="25px" />
                RESET
        </div>
    </div>
</div>

</asp:Content>
