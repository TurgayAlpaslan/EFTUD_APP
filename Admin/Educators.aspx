<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Educators.aspx.cs" Inherits="Admin_Educators" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataSourceID="ObjectDataSource1"
        DefaultMode="Insert" ForeColor="#333333" Width="100%">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#EAEAEA" />       
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <InsertItemTemplate>
            <br />
            <br />
            <table>
                <tr>
                    <td style="width: 120px">
                        Resim:</td>
                    <td>
                        <asp:FileUpload ID="ImageFile" Runat="server" FileBytes='<%# Bind("ImageFile") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="width: 120px">
                        Adý:</td>
                    <td>
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' MaxLength="20"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 120px; height: 26px;">
                        Soyadý:</td>
                    <td style="height: 26px">
            <asp:TextBox ID="SurnameTextBox" runat="server" Text='<%# Bind("Surname") %>' MaxLength="20"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 120px">
                        Açýklama:</td>
                    <td>
            <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' MaxLength="100"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 120px">
                    </td>
                    <td align="right">
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Kaydet"></asp:LinkButton></td>
                </tr>
            </table>
            <br />
            &nbsp;
        </InsertItemTemplate>        
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
                <tr>
                    <td style="height:30px; font-weight:bold; background-color:#5D7B9D; color:White; text-align:center;">
                    Yeni Eðitmen Kaydý
                    </td>
                </tr>
                
            </table>
        </HeaderTemplate>
        <InsertRowStyle BackColor="White" />
    </asp:FormView>
    <br />
    <hr />
    <br />
    <asp:GridView ID="GridView1" DataKeyNames="ID" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AllowPaging="True">
        <Columns>         
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Image" CancelImageUrl="~/Admin/images/aspnet/cancel.gif" CancelText="Ýptal" DeleteImageUrl="~/Admin/images/aspnet/delete.gif" DeleteText="Sil" EditImageUrl="~/Admin/images/aspnet/edit.gif" EditText="D&#252;zenle" InsertText="Ekle" NewText="Yeni" SelectText="Se&#231;" UpdateImageUrl="~/Admin/images/aspnet/save.gif" UpdateText="G&#252;ncelle" />
            <asp:TemplateField>
                <ItemStyle Width="10px" />
                <ItemTemplate>
                    <asp:ImageButton ID="Up" runat="server" ImageUrl="~/Admin/images/aspnet/up.gif"  CommandArgument='<%# Eval("OrderNr") %>' OnCommand="Up_Command" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemStyle Width="10px" />
                 <ItemTemplate>
                    <asp:ImageButton ID="Down" runat="server" ImageUrl="~/Admin/images/aspnet/down.gif" CommandArgument='<%# Eval("OrderNr") %>' OnCommand="Down_Command" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Resim">
            <ItemStyle Width="200px" HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemTemplate>
                <table align="center" border="0" cellpadding="0" cellspacing="0" class="photo-frame">
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
                            <img src='../Handler.ashx?TargetSize=120&EducatorID=<%# Eval("ID") %>' style="border: 2px solid white;"
                                alt='Fotoðraf No: <%# Eval("ID") %>' />
                        </td>
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
            <EditItemTemplate>
                <asp:FileUpload ID="ImageFile" Runat="server" FileBytes='<%# Bind("ImageFile") %>' />
            </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Adý" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" MaxLength="20" Text='<%# Bind("Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Soyadý" SortExpression="Surname">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" MaxLength="20" Text='<%# Bind("Surname") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Surname") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="A&#231;ýklama" SortExpression="Description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="100" Text='<%# Bind("Description") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EmptyDataTemplate>
            Gösterilecek veri yok.
        </EmptyDataTemplate>
        <EditRowStyle BackColor="#EAEAEA" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="RemoveEducator"
        InsertMethod="AddEducator" SelectMethod="GetEducators" TypeName="EducatorManager"
        UpdateMethod="EditEducator">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Surname" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="ImageFile" Type="Object" />
            <asp:Parameter Name="Description" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Surname" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="ImageFile" Type="Object" />
            <asp:Parameter Name="Description" Type="String" ConvertEmptyStringToNull="false"/>
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>

