<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="AddUpdateNewspaper.aspx.cs" Inherits="Admin_AddUpdateNewspaper" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript" src="images/date-picker.js"></script>

    <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource1" DefaultMode="Edit"
        Width="100%" CellPadding="4" ForeColor="#333333">
        <EditItemTemplate>
            <table width="100%">
                <tr>
                    <td style="width: 120px">
                        Haber Başlığı:</td>
                    <td>
                        <asp:TextBox ID="Caption" runat="server" Text='<%# Bind("Description") %>' Width="512px" MaxLength="100"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Caption"
                            ErrorMessage="Haber başlığı girmelisiniz." Display="Dynamic"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td style="width: 120px;">
                        Haber Resmi:</td>
                    <td>
                        <asp:FileUpload ID="ImageFile" runat="server" FileBytes='<%# Bind("ImageFile") %>' />(292
                        * 219)
                    </td>
                </tr>
                <tr>
                    <td style="width: 120px">
                        Eklenme Tarihi:</td>
                    <td>
                        <asp:TextBox ID="AddedDate" runat="server" Text='<%# Bind("AddedDate", "{0:d}") %>'></asp:TextBox>
                        <a href="#" onclick="javascript:displayDatePicker('<%=FormView1.FindControl("AddedDate").ClientID %>');return false;">
                            <img style="border: 0px none;" src="images/cal.jpg" alt="calculator" align="absMiddle" />
                        </a>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="AddedDate"
                            runat="server" ErrorMessage="Bir tarih girmelisiniz" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>              
                <tr>
                    <td align="right" colspan="2">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Kaydet" Font-Bold="True" Font-Size="10pt"></asp:LinkButton></td>
                </tr>
            </table>
        </EditItemTemplate>
        <InsertItemTemplate>
            <table width="100%">
                <tr>
                    <td style="width: 120px">
                        Haber Başlığı:</td>
                    <td>
                        <asp:TextBox ID="Caption" runat="server" Text='<%# Bind("Description") %>' Width="384px" MaxLength="200"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Caption"
                            Display="Dynamic" ErrorMessage="Bir haber başlığı girmelisiniz."></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 120px">
                        Haber Resmi:</td>
                    <td>
                        <asp:FileUpload ID="ImageFile" runat="server" FileBytes='<%# Bind("ImageFile") %>' />(292
                        * 219)
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ImageFile"
                            Display="Dynamic" ErrorMessage="Bir haber resmi girmelisiniz."></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 120px">
                        Eklenme Tarihi:</td>
                    <td>
                        <asp:TextBox ID="AddedDate" runat="server" Text='<%# Bind("AddedDate", "{0:d}") %>'></asp:TextBox>
                        <a href="#" onclick="javascript:displayDatePicker('<%=FormView1.FindControl("AddedDate").ClientID %>');return false;">
                            <img style="border: 0px none;" src="images/cal.jpg" alt="calculator" align="absMiddle" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="AddedDate"
                                Display="Dynamic" ErrorMessage="Bir tarih girmelisiniz."></asp:RequiredFieldValidator></td>
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
                            Text="Kaydet" Font-Bold="True" Font-Size="10pt"></asp:LinkButton></td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </InsertItemTemplate>        
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#EFEFEF" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    </asp:FormView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetNewspaper"
        UpdateMethod="EditNewspaper" TypeName="NewspaperManager" InsertMethod="AddNewspaper">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="NewspaperID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ImageFile" Type="Object" />
            <asp:Parameter Name="AddedDate" Type="DateTime" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:QueryStringParameter Name="ID" QueryStringField="NewspaperID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="ImageFile" Type="Object" />
            <asp:Parameter Name="AddedDate" Type="DateTime" />            
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>

