<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PhotoGallery.ascx.cs"
    Inherits="PhotoGallery" %>
<asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
    <ItemTemplate>
        <li><a href="javascript:;" rev="<%# Eval("PhotoID") %>">
            <img src='Handler.ashx?TargetSize=50&PhotoID=<%# Eval("PhotoID") %>' alt="<%# Eval("Caption") %>" />
        </a></li>
    </ItemTemplate>
</asp:Repeater>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetPhotos"
    TypeName="PhotoManager"></asp:ObjectDataSource>
