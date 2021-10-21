<%@ Page Language="C#" MasterPageFile="~/DetailsMaster.master" AutoEventWireup="true"
    CodeFile="Pages.aspx.cs" Inherits="Pages" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="PageID" DataSourceID="ObjectDataSource1" Width="100%">
        <ItemTemplate>
            <asp:Label ID="ContentLabel" runat="server" Text='<%# Bind("Content") %>'></asp:Label><br />
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetPage"
        TypeName="PageManager">
        <SelectParameters>
            <asp:QueryStringParameter Name="PageID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
   
</asp:Content>
