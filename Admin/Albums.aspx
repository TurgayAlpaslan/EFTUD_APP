<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true"
    CodeFile="Albums.aspx.cs" Inherits="Admin_Albums" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h3>
            Yeni Albüm Ekle</h3>
        <p>
            Resimlerinizi organize etmek için öncelikle bir albüm oluþturmalýsýnýz.</p>
        <br />
        <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource1" DefaultMode="Insert" CellPadding="4" ForeColor="#333333">
            <InsertItemTemplate>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bir baþlýk seçmelisiniz."
                    ControlToValidate="TextBox1" Display="Dynamic" ValidationGroup="Insert" />
                <p>
                    <b>Albüm Baþlýðý:</b><br />
                    <asp:TextBox ID="TextBox1" runat="server" Width="200" Text='<%# Bind("Caption") %>' ValidationGroup="Insert" MaxLength="255" />
                </p>
                <p style="text-align: right;">
                    <%--<asp:ImageButton ID="ImageButton1" Runat="server" CommandName="Insert" />--%>
                    <asp:Button ID="Button1" runat="server" CommandName="Insert" Text="Ekle" ValidationGroup="Insert" />
                </p>
            </InsertItemTemplate>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#EEEEEE" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        </asp:FormView>
        <hr />
        <div>
            <h3>
                Albümler</h3>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" DataKeyNames="AlbumID"
                CellPadding="4" AutoGenerateColumns="False"
                Width="100%" ShowHeader="False" ForeColor="#333333" GridLines="None" AllowPaging="True">
                <EmptyDataTemplate>
                    Gösterilecek albüm yok.
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField>
                        <ItemStyle Width="170px" />
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
                                        <a href='Photos.aspx?AlbumID=<%# Eval("AlbumID") %>'>
                                            <img src="../Handler.ashx?AlbumID=<%# Eval("AlbumID") %>&targetSize=150" style="border: 4px solid white"
                                                alt="Album No: <%# Eval("AlbumID") %>" /></a></td>
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
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div style="padding: 8px 0">
                                <b>
                                    <%# Server.HtmlEncode(Eval("Caption").ToString()) %>
                                </b>
                                <br />
                                <%# Eval("Count") %>
                                fotoðraf
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemStyle Width="300px" />
                        <ItemTemplate>
                            <div style="width: 100%; text-align: left;">
                                <asp:Button ID="Button2" runat="server" CommandName="Edit" Text="Yeniden Adlandýr" />
                                <%--<asp:ImageButton ID="ImageButton2" Runat="server" CommandName="Edit" />--%>
                                <%--<a href='Photos.aspx?AlbumID=<%# Eval("AlbumID") %>'><asp:Button ID="Image1" runat="server" Text="Düzenle" /></a>--%>
                                <%--<asp:ImageButton ID="ImageButton3" Runat="server" CommandName="Delete" />--%>
                                <asp:Button ID="Button3" runat="server" OnClientClick="if (confirm('Bu albümü silmek istiyor musunuz?') == false) return false;" CommandName="Delete" Text="Sil" />
                            </div>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <div style="padding: 8px 0;">
                                <asp:TextBox ID="Caption" runat="server" Width="160px" Text='<%# Bind("Caption") %>' ValidationGroup="edit" MaxLength="255" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Caption"
                                    Display="Dynamic" ErrorMessage="Bir baþlýk yazmalýsýnýz." ValidationGroup="edit"></asp:RequiredFieldValidator></div>
                            <div style="width: 100%; text-align: left;">
                                <asp:Button ID="Button4" runat="server" CommandName="Update" Text="Güncelle" ValidationGroup="edit" />
                                <asp:Button ID="Button5" runat="server" CommandName="Cancel" Text="Ýptal" />
                                <%--<asp:ImageButton ID="ImageButton4" Runat="server" CommandName="Update" />
								<asp:ImageButton ID="ImageButton5" Runat="server" CommandName="Cancel" />--%>
                            </div>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <EditRowStyle BackColor="#EEEEEE" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
        </div>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="PhotoManager"
            SelectMethod="GetAlbums" InsertMethod="AddAlbum" DeleteMethod="RemoveAlbum" UpdateMethod="EditAlbum">
            <UpdateParameters>
                <asp:Parameter Name="Caption" Type="String" ConvertEmptyStringToNull="false"/>
                <asp:Parameter Name="AlbumID" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="AlbumID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Caption" Type="String" ConvertEmptyStringToNull="false" />
            </InsertParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
