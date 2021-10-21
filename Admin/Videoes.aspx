<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Videoes.aspx.cs" Inherits="Admin_Videoes" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <br /><center><a href="AddUpdateVideo.aspx" title="Yeni bir video eklemek için tıklayın.">Video Ekle</a></center><br /><hr />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        CellPadding="4" DataKeyNames="VideoID" DataSourceID="ObjectDataSource1" ForeColor="#333333"
        GridLines="None" ShowHeader="False" Width="100%">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:TemplateField>
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
                                <a href='AddUpdateVideo.aspx?VideoID=<%# Eval("VideoID") %>'>
                                    <img alt='Album No: <%# Eval("VideoID") %>' src='../Handler.ashx?VideoID=<%# Eval("VideoID") %>&targetSize=150'
                                        style="border: 4px solid white" /></a></td>
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
                <ItemStyle Width="170px" />
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <div style="padding: 8px 0">
                        <b>
                            <%# Server.HtmlEncode(Eval("Title").ToString()) %>
                        </b>
                        <br />
                      
                        fotoğraf
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                
                <ItemTemplate>
                    <div style="width: 100%; text-align: left;">                    
                        <%--<asp:ImageButton ID="ImageButton2" Runat="server" CommandName="Edit" />--%>
                        <%--<a href='Photos.aspx?AlbumID=<%# Eval("AlbumID") %>'><asp:Button ID="Image1" runat="server" Text="Düzenle" /></a>--%>
                        <%--<asp:ImageButton ID="ImageButton3" Runat="server" CommandName="Delete" />--%>
                        <asp:Button ID="Button3" runat="server" CommandName="Delete" OnClientClick="if (confirm('Bu videoyu silmek istiyor musunuz?') == false) return false;"
                            Text="Sil" />
                    </div>
                </ItemTemplate>
                <ItemStyle Width="300px" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <EmptyDataTemplate>
            Gösterilecek video yok.
        </EmptyDataTemplate>
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#EEEEEE" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="RemoveVideo"
        SelectMethod="GetAllVideoes" TypeName="VideoManager">
        <DeleteParameters>
            <asp:Parameter Name="VideoID" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>
</asp:Content>

