<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
   
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Menu ID="Menu1" runat="server" BackColor="#FFFBD6" DynamicHorizontalOffset="2"
            DynamicHoverStyle-CssClass="menuHover" DynamicMenuItemStyle-CssClass="menuItem"
            Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" StaticHoverStyle-CssClass="menuHover"
            StaticMenuItemStyle-CssClass="menuItem" StaticSubMenuIndent="10px" Width="165px">
            <StaticMenuItemStyle CssClass="menuItem" HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicHoverStyle BackColor="#990000" CssClass="menuHover" ForeColor="White" />
            <DynamicMenuStyle BackColor="#FFFBD6" />
            <StaticSelectedStyle BackColor="#FFCC66" />
            <DynamicSelectedStyle BackColor="#FFCC66" />
            <DynamicMenuItemStyle CssClass="menuItem" HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticItemTemplate>
                <%# Eval("Text") %>
                <asp:Label ID="lbItmCount" runat="server">[<%#Eval("ChildItems.Count")%>]</asp:Label>
            </StaticItemTemplate>
            <StaticHoverStyle BackColor="#990000" CssClass="menuHover" ForeColor="White" />
        </asp:Menu>
    
    </div>
    </form>
</body>
</html>
