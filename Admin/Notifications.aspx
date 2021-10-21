<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Notifications.aspx.cs" Inherits="Admin_Notifications" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><center><a href="AddUpdateNotification.aspx" title="Yeni bir duyuru eklemek için týklayýn.">Duyuru Ekle</a></center><br /><hr />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="NewsID" CellPadding="4"
        DataSourceID="ObjectDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:TemplateField>
            <ItemTemplate>
                <a href="AddUpdateNotification.aspx?NotificationID=<%# Eval("NewsID") %>"><img src="images/aspnet/edit.gif" alt="Deðiþtir" /></a>
            </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="imgBtnDelete" ImageUrl="~/Admin/images/aspnet/delete.gif" runat="server" CausesValidation="False" CommandName="Delete"
                        AlternateText="Sil" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Caption" HeaderText="Baþlýk" SortExpression="Caption">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="AddedDate" HeaderText="Eklenme Tarihi" SortExpression="AddedDate">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
        </Columns>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <EmptyDataTemplate>
            Gösterilecek veri yok.
        </EmptyDataTemplate>
        <EditRowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    &nbsp;
    <br />
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="RemoveNotification"
        InsertMethod="AddNotification" SelectMethod="GetNotifications" TypeName="NotificationManager"
        UpdateMethod="EditNotification">
        <DeleteParameters>
            <asp:Parameter Name="NewsID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Caption" Type="String" />
            <asp:Parameter Name="Content" Type="String" />
            <asp:Parameter Name="AddedDate" Type="String" />
            <asp:Parameter Name="NotificationID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Caption" Type="String" />
            <asp:Parameter Name="Content" Type="String" />
            <asp:Parameter Name="AddedDate" Type="DateTime" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>

