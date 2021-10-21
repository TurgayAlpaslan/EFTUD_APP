<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Biographies.aspx.cs" Inherits="Admin_Biographies" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br /><center><a href="AddUpdateBiography.aspx" title="Yeni bir biyografi eklemek için týklayýn.">Biyografi Ekle</a></center><br /><hr />
    <asp:GridView ID="GridView1" DataKeyNames="ID" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        DataSourceID="ObjectDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" PageSize="5">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>                    
                    <a href="AddUpdateBiography.aspx?BiographyID=<%# Eval("ID") %>" title="Deðiþtir"><img alt="Deðiþtir" src="images/aspnet/edit.gif" /></a>
                </ItemTemplate>
                <ItemStyle Width="30px" />
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="imgBtnDelete" ImageUrl="~/Admin/images/aspnet/delete.gif" AlternateText="Sil" runat="server" CausesValidation="False" CommandName="Delete"
                         />
                </ItemTemplate>
                <ItemStyle Width="30px" />
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
										<img src="../Handler.ashx?BiographyID=<%# Eval("ID") %>&TargetSize=176" style="border:4px solid white" alt="<%# Eval("ID") %>" />
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
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
            </asp:TemplateField> 
            <asp:TemplateField>
                <ItemTemplate><%# Eval("Title") + " " + Eval("Name") + " " + Eval("Surname") %></ItemTemplate>
            </asp:TemplateField>           
        </Columns>
        <EmptyDataTemplate>
            Gösterilecek veri yok.
        </EmptyDataTemplate>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    &nbsp;
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="RemoveBiography"
        SelectMethod="GetBiographies" TypeName="BiographyManager">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>
</asp:Content>

