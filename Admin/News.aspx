<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="Admin_News" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br /><center><a href="AddUpdateNews.aspx" title="Yeni bir haber eklemek için týklayýn.">Haber Ekle</a></center><br /><hr />
    <asp:GridView ID="GridView1" DataKeyNames="NewsID" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" PageSize="5">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>                    
                    <a href="AddUpdateNews.aspx?newsID=<%# Eval("NewsID") %>" title="Deðiþtir"><img alt="Deðiþtir" src="images/aspnet/edit.gif" /></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="imgBtnDelete" ImageUrl="~/Admin/images/aspnet/delete.gif" AlternateText="Sil" runat="server" CausesValidation="False" CommandName="Delete"
                         />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
								<tr>
									<td class="topx--"></td>
									<td class="top-x-"></td>
									<td class="top--x"></td>
								</tr>
								<tr>
									<td class="midx--"></td>
									<td>
										<img src="../Handler.ashx?NewsID=<%# Eval("NewsID") %>&TargetSize=176" style="border:4px solid white" alt="<%# Eval("NewsID") %>" />
								    </td>
									<td class="mid--x"></td>
								</tr>
								<tr>
									<td class="botx--"></td>
									<td class="bot-x-"></td>
									<td class="bot--x"></td>
								</tr>
							</table>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Caption" HeaderText="Haber Baþlýðý" SortExpression="Caption" >
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Eklenme Tarihi" SortExpression="AddedDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AddedDate") %>'></asp:TextBox>
                </EditItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("AddedDate", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            Gösterilecek haber yok.
        </EmptyDataTemplate>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
  
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetNews" DeleteMethod="RemoveNews"
        TypeName="NewsManager"></asp:ObjectDataSource>
</asp:Content>

