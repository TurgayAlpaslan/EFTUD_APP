<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true"
    CodeFile="Albums.aspx.cs" Inherits="Admin_Albums" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h3>
            Yeni Albüm Ekle</h3>
        <p>
            Resimlerinizi organize etmek için öncelikle bir albüm oluþturmalýsýnýz.</p>
        <br />
        <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource1" DefaultMode="Insert"
            BorderWidth="0" CellPadding="0">
            <InsertItemTemplate>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bir baþlýk seçmelisiniz."
                    ControlToValidate="TextBox1" Display="Dynamic" Enabled="false" />
                <p>
                    <b>Albüm Baþlýðý:</b><br />
                    <asp:TextBox ID="TextBox1" runat="server" Width="200" Text='<%# Bind("Caption") %>' />
                </p>
                <p style="text-align: right;">
                    <%--<asp:ImageButton ID="ImageButton1" Runat="server" CommandName="Insert" />--%>
                    <asp:Button ID="Button1" runat="server" CommandName="Insert" Text="Ekle" />
                </p>
            </InsertItemTemplate>
        </asp:FormView>
        <hr />
        <div>
            <h3>
                Albümler</h3>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" DataKeyNames="AlbumID"
                CellPadding="6" AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px"
                Width="100%" ShowHeader="false">
                <EmptyDataTemplate>
                    Gösterilecek albüm yok.
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField>
                        <ItemStyle Width="150px" />
                        <ItemTemplate>
                            <table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
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
                                                alt="Sample Photo from Album Number <%# Eval("AlbumID") %>" /></a></td>
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
                                <asp:Button ID="Button3" runat="server" CommandName="Delete" Text="Sil" />
                            </div>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <div style="padding: 8px 0;">
                                <asp:TextBox ID="Caption" runat="server" Width="160" Text='<%# Bind("Caption") %>' />
                            </div>
                            <div style="width: 100%; text-align: left;">
                                <asp:Button ID="Button4" runat="server" CommandName="Update" Text="Güncelle" />
                                <asp:Button ID="Button5" runat="server" CommandName="Cancel" Text="Ýptal" />
                                <%--<asp:ImageButton ID="ImageButton4" Runat="server" CommandName="Update" />
								<asp:ImageButton ID="ImageButton5" Runat="server" CommandName="Cancel" />--%>
                            </div>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="PhotoManager"
            SelectMethod="GetAlbums" InsertMethod="AddAlbum" DeleteMethod="RemoveAlbum" UpdateMethod="EditAlbum">
            <UpdateParameters>
                <asp:Parameter Name="Caption" Type="string" ConvertEmptyStringToNull="false" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
