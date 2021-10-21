<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="AddUpdateVideo.aspx.cs" Inherits="Admin_AddUpdateVideo" Title="Untitled Page" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <script type="text/javascript" src="images/date-picker.js"></script>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource1" DefaultMode="Edit">
        <InsertItemTemplate>
            <table>
                <tr>
                    <td align="right" height="28" style="width: 113px; background-color: #F7F6F3; color: #333333">
                        Küçük Resim:</td>
                    <td height="28" style="background-color: #F7F6F3; color: #333333; width: 242px;">
                        <asp:FileUpload ID="Thumbnail" runat="server" FileBytes='<%# Bind("Thumbnail") %>' /></td>
                    <td height="28" style="width: 17px">
                        (160x120)</td>
                    <td height="28" rowspan="8" style="width: 112px" valign="top">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Thumbnail"
                            ErrorMessage="*"></asp:RequiredFieldValidator>&nbsp;</td>
                    <td height="28" style="width: 152px">
                    </td>
                </tr>
                <tr>
                    <td align="right" height="28" style="width: 113px">
                        Başlık:</td>
                    <td height="28" style="width: 242px">
                        <asp:TextBox ID="Title" runat="server" MaxLength="100" Text='<%# Bind("Title") %>'
                            Width="200px"></asp:TextBox></td>
                    <td height="28" style="width: 17px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Title"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td height="28" style="width: 152px">
                    </td>
                </tr>
                <tr>
                    <td align="right" height="28" style="width: 113px; background-color: #F7F6F3; color: #333333">
                        Video Adresi:</td>
                    <td height="28" style="background-color: #F7F6F3; color: #333333; width: 242px;">
                        <asp:TextBox ID="VideoPath" runat="server" MaxLength="255" Text='<%# Bind("VideoPath") %>'
                            Width="200px"></asp:TextBox></td>
                    <td height="28" style="width: 17px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="VideoPath"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td height="28" style="width: 152px">
                    </td>
                </tr>
                <tr>
                    <td align="right" height="28" style="width: 113px">
                        Eklenme Tarihi:</td>
                    <td height="28" style="width: 242px">
                        <asp:TextBox ID="AddedDate" runat="server" MaxLength="20" Text='<%# Bind("AddedDate") %>'
                            Width="200px"></asp:TextBox>
                        <a href="#" onclick="javascript:displayDatePicker('<%=FormView1.FindControl("AddedDate").ClientID %>');return false;">
                            <img style="border: 0px none;" src="images/cal.jpg" alt="calculator" align="absMiddle" />
                        </a>
                    </td>
                    <td height="28" style="width: 17px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="AddedDate"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td height="28" style="width: 152px">
                    </td>
                </tr>
                <tr>
                    <td align="right" height="35" style="width: 113px">
                    </td>
                    <td align="right" height="35" style="width: 242px">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Font-Bold="True" Text="Ekle"></asp:LinkButton></td>
                    <td height="35" style="width: 17px">
                    </td>
                    <td height="35" style="width: 152px">
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
        <HeaderTemplate>
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
                <tr>
                    <td style="height: 30px; font-weight: bold; background-color: #5D7B9D; color: White;
                        text-align: center;">
                        Yeni Kullanıcı Kaydı
                    </td>
                </tr>
            </table>
        </HeaderTemplate>
        <EditItemTemplate>
            <table>
                <tr>
                    <td align="right" height="28" style="width: 113px; background-color: #F7F6F3; color: #333333">
                        Küçük Resim:</td>
                    <td height="28" style="background-color: #F7F6F3; color: #333333; width: 242px;">
                        <asp:FileUpload ID="Thumbnail" runat="server" FileBytes='<%# Bind("Thumbnail") %>' /></td>
                    <td height="28" style="width: 17px">
                        (160x120)</td>
                    <td height="28" rowspan="8" style="width: 112px" valign="top">
                        &nbsp;</td>
                    <td height="28" style="width: 152px">
                    </td>
                </tr>
                <tr>
                    <td align="right" height="28" style="width: 113px">
                        Başlık:</td>
                    <td height="28" style="width: 242px">
                        <asp:TextBox ID="Title" runat="server" MaxLength="100" Text='<%# Bind("Title") %>'
                            Width="200px"></asp:TextBox></td>
                    <td height="28" style="width: 17px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Title"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td height="28" style="width: 152px">
                    </td>
                </tr>
                <tr>
                    <td align="right" height="28" style="width: 113px; background-color: #F7F6F3; color: #333333">
                        Video Adresi:</td>
                    <td height="28" style="background-color: #F7F6F3; color: #333333; width: 242px;">
                        <asp:TextBox ID="VideoPath" runat="server" MaxLength="255" Text='<%# Bind("VideoPath") %>'
                            Width="200px"></asp:TextBox></td>
                    <td height="28" style="width: 17px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="VideoPath"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td height="28" style="width: 152px">
                    </td>
                </tr>
                <tr>
                    <td align="right" height="28" style="width: 113px">
                       Eklenme Tarihi:</td>
                    <td height="28" style="width: 242px">
                        <asp:TextBox ID="AddedDate" runat="server" MaxLength="20" Text='<%# Bind("AddedDate", "{0:d}") %>'
                            Width="200px"></asp:TextBox>
                        <a href="#" onclick="javascript:displayDatePicker('<%=FormView1.FindControl("AddedDate").ClientID %>');return false;">
                            <img style="border: 0px none;" src="images/cal.jpg" alt="calculator" align="absMiddle" />
                        </a>
                    </td>
                    <td height="28" style="width: 17px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="AddedDate"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td height="28" style="width: 152px">
                    </td>
                </tr>
                <tr>
                    <td align="right" height="35" style="width: 113px">
                    </td>
                    <td align="right" height="35" style="width: 242px">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Font-Bold="True" Text="Kaydet"></asp:LinkButton></td>
                    <td height="35" style="width: 17px">
                    </td>
                    <td height="35" style="width: 152px">
                    </td>
                </tr>
            </table>
        </EditItemTemplate>
    </asp:FormView>
    <br />
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="AddVideo"
        SelectMethod="GetVideo" TypeName="VideoManager" UpdateMethod="EditVideo">
        <UpdateParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="VideoPath" Type="String" />
            <asp:Parameter Name="Thumbnail" Type="Object" />
            <asp:Parameter Name="AddedDate" Type="DateTime" />
            <asp:QueryStringParameter Name="VideoID" QueryStringField="VideoID" Type="Int32" />
            
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="VideoID" QueryStringField="VideoID" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="VideoPath" Type="String" />
            <asp:Parameter Name="Thumbnail" Type="Object" />
            <asp:Parameter Name="AddedDate" Type="DateTime" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>

