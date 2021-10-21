<%@ Control Language="C#" AutoEventWireup="true" CodeFile="VideoGallery.ascx.cs" Inherits="VideoGallery" %>
<asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
    <ItemTemplate>
       <li><a href="GetVideo.aspx?VideoID=<%# Eval("VideoID") %>">
                                            <img src="handler.ashx?TargetSize=88&&VideoID=<%# Eval("VideoID") %>"
                                                alt="<%# Eval("Title") %>" style="border-width: 0px;" />
                                            <%# Eval("Title") %> </a></li>
    </ItemTemplate>
</asp:Repeater>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetTopNineVideoes"
    TypeName="VideoManager"></asp:ObjectDataSource>
