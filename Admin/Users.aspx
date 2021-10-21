<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true"
    CodeFile="Users.aspx.cs" Inherits="Admin_Users" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    &nbsp;<asp:FormView ID="FormView1"  runat="server" DataSourceID="ObjectDataSource1"
        DefaultMode="Insert">
        <InsertItemTemplate>
            <table>
                <tr>
                    <td style="width: 113px; background-color:#F7F6F3; color:#333333" align="right" height="28">
                        Profil Resmi:</td>
                    <td style="background-color:#F7F6F3; color:#333333; width: 207px;" height="28">
                        <asp:FileUpload ID="ProfilePhoto" runat="server" FileBytes='<%# Bind("ImageFile") %>' /></td>
                    <td style="width: 17px" height="28">
                        (160x120)</td>
                    <td style="width: 112px" rowspan="8" valign="top" height="28">
                        &nbsp;</td>
                    <td style="width: 152px" height="28">
                    </td>                    
                </tr>
                <tr>
                    <td style="width: 113px" align="right" height="28">
                        Adý:</td>
                    <td height="28" style="width: 207px">
                        <asp:TextBox ID="Name" runat="server" Text='<%# Bind("Name") %>' Width="200px" MaxLength="20" /></td>
                    <td style="width: 17px" height="28">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td style="width: 152px" height="28">
                    </td>
                   
                </tr>
                <tr>
                    <td style="width: 113px; background-color:#F7F6F3; color:#333333" align="right" height="28">
                        Soyadý:</td>
                    <td style="background-color:#F7F6F3; color:#333333; width: 207px;" height="28">
                        <asp:TextBox ID="Surname" runat="server" Text='<%# Bind("Surname") %>' Width="200px" MaxLength="20" /></td>
                    <td style="width: 17px" height="28">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Surname"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td style="width: 152px" height="28">
                    </td>
                    
                </tr>
                <tr>
                    <td style="width: 113px" align="right" height="28">
                        Kullanýcý Adý:</td>
                    <td height="28" style="width: 207px">
                        <asp:TextBox ID="UserName" runat="server" Text='<%# Bind("UserName") %>' Width="200px" MaxLength="20" /></td>
                    <td style="width: 17px" height="28">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="UserName"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td style="width: 152px" height="28">
                    </td>
                   
                </tr>
                <tr>
                    <td style="width: 113px; background-color:#F7F6F3; color:#333333" align="right" height="28">
                        Þifre:</td>
                    <td style="background-color:#F7F6F3; color:#333333; width: 207px;" height="28">
                        <asp:TextBox ID="Password" runat="server" Text='<%# Bind("Password") %>' Width="200px" MaxLength="10" /></td>
                    <td style="width: 17px" height="28">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Password"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td style="width: 152px" height="28">
                    </td>
                   
                </tr>
                <tr>
                    <td style="width: 113px" align="right" height="28">
                        Email:</td>
                    <td height="28" style="width: 207px">
                        <asp:TextBox ID="Email" runat="server" Text='<%# Bind("Email") %>' Width="200px" MaxLength="100" /></td>
                    <td style="width: 17px" height="28">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Email"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    <td style="width: 152px" height="28">
                    </td>
                    
                </tr>
                <tr>
                    <td style="width: 113px; background-color:#F7F6F3; color:#333333" align="right" height="28">
                        Açýklama</td>
                    <td style="background-color:#F7F6F3; color:#333333; width: 207px;" height="28">
                        <asp:TextBox ID="Description" runat="server" Text='<%# Bind("Description") %>' Width="200px" MaxLength="255" /></td>
                    <td style="width: 17px" height="28">
                    </td>
                    <td style="width: 152px" height="28">
                    </td>
                   
                </tr>
                 <tr>
                    <td style="width: 113px" align="right" height="35">
                        </td>
                    <td align="right" height="35" style="width: 207px">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Ekle" Font-Bold="True" /></td>
                    <td style="width: 17px" height="35">
                    </td>
                    <td style="width: 152px" height="35">                    
                    </td>
                </tr>
                <tr>
                    <td align="right" height="35" style="width: 113px">
                    </td>
                    <td align="right" height="35" style="width: 207px">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="UserName"
                            ErrorMessage="Kullanýcý adý minumum 4-10 karakter olmalý" ValidationExpression="^[A-Za-z0-9]{4,10}$"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="regex" runat="server" ControlToValidate="Password"
                            ErrorMessage="Þifre 6-10 karakter olmalý" ValidationExpression="^[A-Za-z0-9]{6,10}$"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Email"
                            ErrorMessage="Email adresi hatalý" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                    <td height="35" style="width: 17px">
                    </td>
                    <td height="28" rowspan="1" style="width: 112px" valign="top">
                    </td>
                    <td height="35" style="width: 152px">
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
        <HeaderTemplate>
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
                <tr>
                    <td style="height:30px; font-weight:bold; background-color:#5D7B9D; color:White; text-align:center;">
                    Yeni Kullanýcý Kaydý
                    </td>
                </tr>
                
            </table>
        </HeaderTemplate>
    </asp:FormView>
    <br /><hr /><br />    
    <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" DataKeyNames="UserID"
        Width="100%" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="5">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <a href='UserDetails.aspx?UserID=<%# Eval("UserID") %>'>Deðiþtir</a>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <a href='UserDetails.aspx?UserID=<%# Eval("UserID") %>'><img src="images/aspnet/edit.gif" alt="Deðiþtir" /></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="imgBtnDelete" ImageUrl="~/Admin/images/aspnet/delete.gif" OnClientClick="if (confirm('Bu kullanýcýyý silmek istiyor musunuz?') == false) return false;"  runat="server" CausesValidation="False" CommandName="Delete"
                        AlternateText="Sil" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Profil Resmi">
                <ItemTemplate>
                    <table border="0" align="center" cellpadding="0" cellspacing="0" class="photo-frame">
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
                                    <img src='../Handler.ashx?TargetSize=50&UserID=<%# Eval("UserID") %>' style="border: 2px solid white;  width: 50px;" alt='Thumbnail of Photo Number <%# Eval("UserID") %>' /></a></td>
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
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Adý" SortExpression="Name">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Soyadý" SortExpression="Surname">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Surname") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kullanýcý Adý" SortExpression="UserName">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Þifre" SortExpression="Password">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="A&#231;ýklama" SortExpression="Description">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Oluþturulma Tarihi" SortExpression="CreateDate">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("CreateDate") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Son Oturum Tarihi" SortExpression="LastLoginDate">
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("LastLoginDate") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Baþarýsýz Þifre Giriþimi" SortExpression="FailedPasswordAttemptCount">
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("FailedPasswordAttemptCount") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Right" />
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            Gösterilecek kullanýcý yok.
        </EmptyDataTemplate>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <PagerSettings NextPageText="Sonraki" PreviousPageText="&#214;nceki" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetUsers"
        InsertMethod="AddUser" DeleteMethod="RemoveUser" TypeName="UserManager"></asp:ObjectDataSource>
</asp:Content>
