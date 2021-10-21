<%@ Page Language="C#" MasterPageFile="~/DetailsMaster.master" AutoEventWireup="true" CodeFile="Notifications.aspx.cs" Inherits="Notifications" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource1" Width="100%">
        <ItemTemplate>           
            <asp:Label ID="ContentLabel" runat="server" Text='<%# Bind("Content") %>'></asp:Label><br />                      
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetNotification"
        TypeName="NotificationManager">
        <SelectParameters>
            <asp:QueryStringParameter Name="NotificationID" QueryStringField="NotificationID"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    &nbsp;
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource2">
    <HeaderTemplate>
    <div style="width:100%; padding:5px 0 5px 5px; font-weight:bold;  background-color:#efefef; font-size:12pt;">Duyurularýmýz</div>
    </HeaderTemplate>   
    <ItemTemplate>
    <ul>    
    <li style="padding:5px 0 5px 5px;"><a href="notifications.aspx?NotificationID=<%# Eval("NewsID") %>"><%# Eval("AddedDate", "{0:d}") %> - <%# Eval("Caption") %></a></li>
    </ul>
    </ItemTemplate>
    </asp:Repeater>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetNotifications"
        TypeName="NotificationManager"></asp:ObjectDataSource>

</asp:Content>

