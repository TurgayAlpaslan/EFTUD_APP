<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="AddUpdateArticle.aspx.cs" Inherits="Admin_ArticleDetails" Title="Untitled Page" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript" src="images/date-picker.js"></script>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource1" DefaultMode="Edit" Width="100%" CellPadding="4" ForeColor="#333333">
        <EditItemTemplate>
            <table style="width: 100%">
                <tr>
                    <td style="width: 120px">
                        Eklenme Tarihi:</td>
                    <td>
                        <asp:TextBox ID="AddedDate" runat="server" Text='<%# Bind("AddedDate") %>'></asp:TextBox><a
                            href="#" onclick="javascript:displayDatePicker('<%=FormView1.FindControl("AddedDate").ClientID %>');return false;">
                            <img style="border: 0px none;" src="images/cal.jpg" alt="calculator" align="absMiddle" />
                        </a>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="AddedDate" ErrorMessage="Bir tarih girmelisiniz." ValidationGroup="edit" Display="Dynamic"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 120px">
                        Baþlýk:</td>
                    <td>
                        <asp:TextBox ID="Title" runat="server" Text='<%# Bind("Title") %>' MaxLength="255" Width="100%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Title" ErrorMessage="Bir baþlýk girmelisiniz." ValidationGroup="edit" Display="Dynamic"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 120px" valign="top">
                        Ýçerik:</td>
                    <td>
                        <FCKeditorV2:FCKeditor ID="Content" Value='<%# Bind("Content") %>' runat="server" Height="500px" Width="100%">
                        </FCKeditorV2:FCKeditor>
                        &nbsp;
                    </td>
                </tr>               
                <tr>
                    <td align="right" colspan="2">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Kaydet" ValidationGroup="edit"></asp:LinkButton></td>
                </tr>
            </table>
            <br />
           
        </EditItemTemplate>      
        <EmptyDataTemplate>
            Gösterilecek yazý yok.
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <table style="width: 100%">
                <tr>
                    <td style="width: 120px">
                        Eklenme Tarihi:</td>
                    <td>
                        <asp:TextBox ID="AddedDate" runat="server" Text='<%# Bind("AddedDate") %>'></asp:TextBox><a
                            href="#" onclick="javascript:displayDatePicker('<%=FormView1.FindControl("AddedDate").ClientID %>');return false;">
                            <img style="border: 0px none;" src="images/cal.jpg" alt="calculator" align="absMiddle" />
                        </a>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="AddedDate"
                            Display="Dynamic" ErrorMessage="Tarih girmelisiniz." ValidationGroup="insert"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 120px">
                        Baþlýk:</td>
                    <td>
                        <asp:TextBox ID="Title" runat="server" Text='<%# Bind("Title") %>' MaxLength="255" Width="100%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Title"
                            Display="Dynamic" ErrorMessage="Baþlýk girmelisiniz." ValidationGroup="insert"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 120px" valign="top">
                        Ýçerik:</td>
                    <td>
                        <FCKeditorV2:FCKeditor ID="Content" Value='<%# Bind("Content") %>' runat="server" Height="500px" Width="100%">
                        </FCKeditorV2:FCKeditor>
                    </td>
                </tr>                
                <tr>
                    <td align="right" colspan="2">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Kaydet" ValidationGroup="insert"></asp:LinkButton></td>
                </tr>
            </table>
        </InsertItemTemplate>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#EFEFEF" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    </asp:FormView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetArticle"
        TypeName="ArticleManager" UpdateMethod="EditArticle" InsertMethod="AddArticle">
        <SelectParameters>
            <asp:QueryStringParameter Name="ArticleID" QueryStringField="ArticleID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="AddedDate" Type="DateTime" />
            <asp:Parameter Name="Title" Type="String"  ConvertEmptyStringToNull="False"/>
            <asp:Parameter Name="Content" Type="String" ConvertEmptyStringToNull="False" />            
            <asp:QueryStringParameter Name="ArticleID" QueryStringField="ArticleID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:QueryStringParameter Name="UserID" QueryStringField="UserID" Type="Int32" />            
            <asp:Parameter Name="AddedDate" Type="DateTime" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Content" Type="String" ConvertEmptyStringToNull="false" />            
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>

