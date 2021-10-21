<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Pages.aspx.cs" Inherits="Admin_Pages" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br /><center><a href="AddUpdatePage.aspx" title="Yeni bir sayfa eklemek için týklayýn.">Sayfa Ekle</a></center><br /><hr />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        CellPadding="4" DataKeyNames="ID" DataSourceID="AccessDataSource1" ForeColor="#333333"
        GridLines="None" Width="100%" AllowSorting="True">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                
                
                    <a href="AddUpdatePage.aspx?ID=<%# Eval("ID") %>"><img src="images/aspnet/edit.gif" style="border:none" alt="Deðiþtir" /></a>
                </ItemTemplate>
                <ItemStyle Width="20px" />
            </asp:TemplateField>
            <asp:CommandField DeleteText="Sil" ShowDeleteButton="True" ButtonType="Image" DeleteImageUrl="~/Admin/images/aspnet/delete.gif" >
            </asp:CommandField>
            <asp:BoundField DataField="Name" HeaderText="Adý" SortExpression="Name" >
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Description" HeaderText="A&#231;ýklama" SortExpression="Description" >
                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
            </asp:BoundField>
        </Columns>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EditRowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            Gösterilecek veri yok.
        </EmptyDataTemplate>
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" ConflictDetection="CompareAllValues"
        DataFile="~/App_Data/SiteData.mdb" DeleteCommand="DELETE FROM [Pages] WHERE [ID] = ?"       
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Pages]" >
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />            
        </DeleteParameters>
       
    </asp:AccessDataSource>


</asp:Content>

