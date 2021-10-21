<%@ Page Language="C#" MasterPageFile="~/Admin/AuthorMaster.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="Admin_MyProfile" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript" src="images/accordion.js"></script>
    <div id="accordion">
        <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource1" DefaultMode="Edit"
            Width="100%">
            <EditItemTemplate>
                <h3 class="toggler">
                    Kişisel Bilgiler</h3>
                <div class="element">
                    <table>
                        <tr>
                            <td align="right" bgcolor="lightskyblue" bordercolor="white" style="width: 132px;
                                color: white; background-color: #5d7b9d">
                                Adı:</td>
                            <td style="width: 156px">
                                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' MaxLength="20"></asp:TextBox></td>
                            <td style="width: 156px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox"
                                    ErrorMessage="*" ValidationGroup="EditValidationGroup"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" bgcolor="lightskyblue" bordercolor="white" style="width: 132px;
                                color: white; background-color: #5d7b9d">
                                Soyadı:</td>
                            <td style="width: 156px">
                                <asp:TextBox ID="SurnameTextBox" runat="server" Text='<%# Bind("Surname") %>' MaxLength="20"></asp:TextBox></td>
                            <td style="width: 156px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="SurnameTextBox"
                                    ErrorMessage="*" ValidationGroup="EditValidationGroup"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" bgcolor="lightskyblue" bordercolor="white" style="width: 132px;
                                color: white; background-color: #5d7b9d">
                                Kullanıcı Adı:</td>
                            <td style="width: 156px">
                                <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' MaxLength="20"></asp:TextBox></td>
                            <td style="width: 156px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="UserNameTextBox"
                                    ErrorMessage="*" ValidationGroup="EditValidationGroup"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" bgcolor="lightskyblue" bordercolor="white" style="width: 132px;
                                color: white; background-color: #5d7b9d">
                                Şifre:</td>
                            <td style="width: 156px">
                                <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' MaxLength="10"></asp:TextBox></td>
                            <td style="width: 156px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="PasswordTextBox"
                                    ErrorMessage="*" ValidationGroup="EditValidationGroup"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" bgcolor="lightskyblue" bordercolor="white" style="width: 132px;
                                color: white; background-color: #5d7b9d">
                                Email:</td>
                            <td style="width: 156px">
                                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' MaxLength="100"></asp:TextBox></td>
                            <td style="width: 156px">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" bgcolor="lightskyblue" bordercolor="white" style="width: 132px;
                                color: white; background-color: #5d7b9d">
                                Açıklama:</td>
                            <td style="width: 156px">
                                <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' MaxLength="255"></asp:TextBox></td>
                            <td style="width: 156px">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 132px">
                            </td>
                            <td align="right" style="width: 156px">
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Güncelle" ValidationGroup="EditValidationGroup"></asp:LinkButton></td>
                            <td align="right" style="width: 156px">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 132px">
                            </td>
                            <td style="width: 156px">
                            </td>
                            <td style="width: 156px">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 132px">
                            </td>
                            <td style="width: 156px">
                            </td>
                            <td style="width: 156px">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 132px">
                            </td>
                            <td style="width: 156px">
                            </td>
                            <td style="width: 156px">
                            </td>
                        </tr>
                    </table>
                    <br />
                </div>
            </EditItemTemplate>
            <EmptyDataTemplate>
                Gösterilecek bilgi yok.
            </EmptyDataTemplate>
        </asp:FormView>
        <asp:Panel ID="Panel1" runat="server" Height="50px" Width="100%">
            <h3 class="toggler">
                Profil Resmi</h3>
            <div class="element">
                <table border="0" style="float: left;" align="left" cellpadding="0" cellspacing="0"
                    class="photo-frame">
                    <tr>
                        <td class="topx--">
                        </td>
                        <td class="top-x-">
                        </td>
                        <td class="top--x">
                        </td>
                    </tr>
                    <tr>
                        <td class="midx--">
                        </td>
                        <td>
                            <asp:Image ID="ProfilePhoto" runat="server" />
                            <%--<img src='../Handler.ashx?UserID=<%# Eval("UserID") %>' style="border: 2px solid white;
                                width: 50px;" alt='Thumbnail of Photo Number <%# Eval("UserID") %>' />--%></td>
                        <td class="mid--x">
                        </td>
                    </tr>
                    <tr>
                        <td class="botx--">
                        </td>
                        <td class="bot-x-">
                        </td>
                        <td class="bot--x">
                        </td>
                    </tr>
                </table>
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:ImageButton ID="SaveProfilePhotoButton" runat="server" Text="Kaydet" ImageUrl="~/Admin/images/aspnet/save.gif" OnClick="SaveProfilePhotoButton_Click"  />
                <asp:ImageButton ID="DeleteButton" runat="server" Text="Sil" ImageUrl="~/Admin/images/aspnet/delete.gif" OnClick="DeleteButton_Click" /><br />
                &nbsp;</div>
           
        </asp:Panel>
    </div>
    &nbsp; &nbsp;&nbsp;
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetUsers"
        TypeName="UserManager" UpdateMethod="EditUser">
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" ConvertEmptyStringToNull="False" />
            <asp:Parameter Name="Surname" Type="String" ConvertEmptyStringToNull="False" />
            <asp:Parameter Name="UserName" Type="String" ConvertEmptyStringToNull="False" />
            <asp:Parameter Name="Password" Type="String" ConvertEmptyStringToNull="False" />
            <asp:Parameter Name="Email" Type="String" ConvertEmptyStringToNull="False" />
            <asp:Parameter Name="Description" Type="String" ConvertEmptyStringToNull="False" />
            <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
</asp:Content>
