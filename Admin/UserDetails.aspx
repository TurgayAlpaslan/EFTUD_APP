<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true"
    CodeFile="UserDetails.aspx.cs" Inherits="Admin_UserDetails" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript" src="images/accordion.js"></script>
    <div id="accordion">
        <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource1" DefaultMode="Edit"
            Width="100%">
            <EditItemTemplate>
                <h3 class="toggler">
                    Kiþisel Bilgiler</h3>
                <div class="element">
                    <table>
                        <tr>
                            <td align="right" bgcolor="lightskyblue" bordercolor="white" style="width: 132px;
                                color: white; background-color: #5d7b9d">
                                Adý:</td>
                            <td style="width: 156px">
                                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' MaxLength="20"></asp:TextBox></td>
                            <td style="width: 156px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox"
                                    ErrorMessage="*" ValidationGroup="EditValidationGroup"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" bgcolor="lightskyblue" bordercolor="white" style="width: 132px;
                                color: white; background-color: #5d7b9d">
                                Soyadý:</td>
                            <td style="width: 156px">
                                <asp:TextBox ID="SurnameTextBox" runat="server" Text='<%# Bind("Surname") %>' MaxLength="20"></asp:TextBox></td>
                            <td style="width: 156px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="SurnameTextBox"
                                    ErrorMessage="*" ValidationGroup="EditValidationGroup"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" bgcolor="lightskyblue" bordercolor="white" style="width: 132px;
                                color: white; background-color: #5d7b9d">
                                Kullanýcý Adý:</td>
                            <td style="width: 156px">
                                <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' MaxLength="20"></asp:TextBox></td>
                            <td style="width: 156px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="UserNameTextBox"
                                    ErrorMessage="*" ValidationGroup="EditValidationGroup"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" bgcolor="lightskyblue" bordercolor="white" style="width: 132px;
                                color: white; background-color: #5d7b9d">
                                Þifre:</td>
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
                                Açýklama:</td>
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
                            <td align="right" colspan="3">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="UserNameTextBox"
                                    ErrorMessage="Kullanýcý adý minumum 4-10 karakter olmalý" ValidationExpression="^[A-Za-z0-9]{4,10}$"
                                    ValidationGroup="EditValidationGroup"></asp:RegularExpressionValidator><br />
                                <asp:RegularExpressionValidator ID="regex" runat="server" ControlToValidate="PasswordTextBox"
                                    ErrorMessage="Þifre 6-10 karakter olmalý" ValidationExpression="^[A-Za-z0-9]{6,10}$"
                                    ValidationGroup="EditValidationGroup"></asp:RegularExpressionValidator><br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="EmailTextBox"
                                    ErrorMessage="Email adresi hatalý" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ValidationGroup="EditValidationGroup"></asp:RegularExpressionValidator></td>
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
            <h3 class="toggler">
                Kullanýcý Haklarý</h3>
            <div class="element">
                <asp:Panel ID="Panel2" runat="server" Height="50px" Width="100%">
                </asp:Panel>
            </div>
        </asp:Panel>
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" InsertMethod="AddUserRole"
        SelectMethod="UsersInRoles" TypeName="RoleManager" UpdateMethod="AddUserRole">
        <UpdateParameters>
            <asp:Parameter Name="RoleID" Type="Object" />
            <asp:Parameter Name="UserID" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="UserID" QueryStringField="UserID" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="RoleID" Type="Object" />
            <asp:Parameter Name="UserID" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    &nbsp; &nbsp;
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetUsers"
        TypeName="UserManager" UpdateMethod="EditUser">
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Surname" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="UserName" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Password" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Email" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Description" Type="String" ConvertEmptyStringToNull="false" />
            <asp:QueryStringParameter Name="UserID" QueryStringField="UserID" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="UserID" QueryStringField="UserID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetRoles"
        TypeName="RoleManager"></asp:ObjectDataSource>
    &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
</asp:Content>
