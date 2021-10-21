<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="AddUpdateNotification.aspx.cs" Inherits="Admin_AddUpdateNotification" Title="Untitled Page" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script type="text/javascript" src="images/date-picker.js"></script>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource1" DefaultMode="Edit" Width="100%">
        <EditItemTemplate>
            <table width="100%">
                <tr>
                    <td style="width: 120px">
                        Duyuru Baþlýðý:</td>
                    <td>
                        <asp:TextBox ID="Caption" runat="server" Text='<%# Bind("Caption") %>' Width="512px" MaxLength="200"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Caption"
                            Display="Dynamic" ErrorMessage="Duyuru baþlýðý girmelisiniz."></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td style="width: 120px" valign="top">
                        Duyuru Ýçeriði</td>
                    <td>
                        <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Height="600px" Value='<%# Bind("Content") %>' Width="100%">
                        </FCKeditorV2:FCKeditor>
                    </td>
                </tr>               
                <tr>
                    <td style="width: 120px">
                        Eklenme Tarihi:</td>
                    <td>
                        <asp:TextBox ID="AddedDate" runat="server" Text='<%# Bind("AddedDate", "{0:d}") %>'></asp:TextBox>
                        <a href="#" onclick="javascript:displayDatePicker('<%=FormView1.FindControl("AddedDate").ClientID %>');return false;">
                            <img align="absMiddle" alt="calculator" src="images/cal.jpg" style="border-right: 0px;
                                border-top: 0px; border-left: 0px; border-bottom: 0px" />
                        </a>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="AddedDate"
                            Display="Dynamic" ErrorMessage="Bir tarih girmelisiniz"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Font-Bold="True" Font-Size="10pt" Text="Kaydet"></asp:LinkButton></td>
                </tr>
            </table>
        </EditItemTemplate>
        <InsertItemTemplate>
            <table width="100%">
                <tr>
                    <td style="width: 120px">
                        Duyuru Baþlýðý:</td>
                    <td>
                        <asp:TextBox ID="Caption" runat="server" Text='<%# Bind("Caption") %>' Width="384px" MaxLength="200"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Caption"
                            Display="Dynamic" ErrorMessage="Bir haber baþlýðý girmelisiniz."></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 120px" valign="top">
                        Ýçerik:</td>
                    <td>
                        <FCKeditorV2:FCKeditor ID="Content" runat="server" Height="600px" Value='<%# Bind("Content") %>'
                            Width="100%" Visible="true">
                        </FCKeditorV2:FCKeditor>
                    </td>
                </tr>               
                <tr>
                    <td style="width: 120px">
                        Eklenme Tarihi:</td>
                    <td>
                        <asp:TextBox ID="AddedDate" runat="server" Text='<%# Bind("AddedDate", "{0:d}") %>'></asp:TextBox>
                        <a href="#" onclick="javascript:displayDatePicker('<%=FormView1.FindControl("AddedDate").ClientID %>');return false;">
                            <img align="absMiddle" alt="calculator" src="images/cal.jpg" style="border-right: 0px;
                                border-top: 0px; border-left: 0px; border-bottom: 0px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="AddedDate"
                                Display="Dynamic" ErrorMessage="Bir tarih girmelisiniz."></asp:RequiredFieldValidator></a></td>
                </tr>
                <tr>
                    <td style="width: 120px">
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td style="width: 120px">
                    </td>
                    <td align="right">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Font-Bold="True" Font-Size="10pt" Text="Kaydet"></asp:LinkButton></td>
                </tr>
            </table>
        </InsertItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="AddNotification"
        SelectMethod="GetNotification" TypeName="NotificationManager" UpdateMethod="EditNotification">
        <UpdateParameters>
            <asp:Parameter Name="Caption" Type="String" />
            <asp:Parameter Name="Content" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="AddedDate" Type="String" />
            <asp:QueryStringParameter Name="NotificationID" QueryStringField="NotificationID"/>
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="NotificationID" QueryStringField="NotificationID"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="Caption" Type="String" />
            <asp:Parameter Name="Content" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="AddedDate" Type="DateTime" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>

