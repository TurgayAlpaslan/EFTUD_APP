<%@ Page Language="C#" MasterPageFile="~/Admin/AuthorMaster.master" AutoEventWireup="true" CodeFile="MyArticles.aspx.cs" Inherits="Admin_MyArticles" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" DataKeyNames="ArticleID" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AllowPaging="True" PageSize="5">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <a href="AddUpdateMyArticle.aspx?ArticleID=<%# Eval("ArticleID") %>">Değiştir</a>
                </ItemTemplate>
                <ItemStyle Width="70px" />
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                        Text="Sil"></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle Width="70px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Eklenme Tarihi" SortExpression="AddedDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AddedDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("AddedDate", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Başlık" SortExpression="Title">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Height="47px" MaxLength="255" Text='<%# Bind("Title") %>'
                        TextMode="MultiLine" Width="196px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
        </Columns>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            Görüntelenecek yazı yok.
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllArticles"
        TypeName="ArticleManager" DeleteMethod="RemoveArticle">
        <SelectParameters>
            <asp:SessionParameter ConvertEmptyStringToNull="False" Name="UserID" SessionField="UserID"
                Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="ArticleID" Type="Int32" />
        </DeleteParameters>
       
    </asp:ObjectDataSource>
    &nbsp;<br />
</asp:Content>
