<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AllArticles.aspx.cs" Inherits="AllArticles" %>

<%@ Register Src="TopMenuControl.ascx" TagName="TopMenuControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="tr" xmlns:fb="http://www.facebook.com/2008/fbml">
<head id="header1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link rel="stylesheet" type="text/css" href="general.css" />
    <link rel="stylesheet" type="text/css" href="index.css" />
    <link rel="stylesheet" type="text/css" href="authors.css" />    
    <script type="text/javascript" src="functions.js"></script>

    <link href="style.css" rel="stylesheet" type="text/css" />
    <title>Yazarlar CNNTurk.com </title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   

    <script type="text/javascript" src="script.min.js"></script>

   
</head>
<body>
    <form id="form1" runat="server">

        <script type="text/javascript" src="script.min1.js"></script>

        <div id="container">
            <div id="header">
                <div style="background-color: #FFFFFF; width: 100%; height: 167px;">
                </div>
                <div id="topMenuBar" style="width: 100%; background-color: #ffffff;">
                    <uc1:TopMenuControl ID="TopMenuControl1" runat="server" />
                </div>
            </div>
            <div id="body">
                <div id="lastminute">
                </div>
                <div class="cnt-man">
                    <div class="cnt-lft">
                        <div class="box aauthor authors">
                            <h3>
                                Yazarlar</h3>
                            <div class="top">
                                <a href="#" class="hdr"><b>Yazarlar</b></a>
                            </div>
                            <div class="allArticle">
                                <div class="itc">
                                    <ul>
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2"
                                            BorderStyle="None" Width="100%" AllowPaging="True" BorderWidth="0px" GridLines="None">
                                            <Columns>
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemStyle BorderStyle="None" BorderWidth="0px" />
                                                    <ItemTemplate>
                                                        <li><a class="lnk" href="Authors.aspx?AuthorID=<%# Eval("UserID") %>&ArticleID=<%# Eval("ArticleID") %>">
                                                            <i>
                                                                <%# Eval("AddedDate", "{0:d}") %>
                                                            </i>
                                                            <b><%#Eval("Title") %></b>
                                                            </a>
                                                            </li>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle BorderStyle="None" />
                                            <EditRowStyle BorderStyle="None" />
                                            <PagerStyle CssClass="aspnetPager" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:GridView>
                                        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetAllArticles"
                                            TypeName="ArticleManager">
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="UserID" QueryStringField="AuthorID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="cnt-rgt">
                        <div class="box aothers">
                            <h3>
                                Diğer Yazarlar</h3>
                            <div class="atr">
                                <b>Diğer Yazarlar</b>
                                <div>
                                    <ul>
                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
                                            <ItemTemplate>
                                                <li><a href="Authors.aspx?AuthorID=<%# Eval("UserID") %>&ArticleID=<%# Eval("LastArticle.ArticleID") %>">
                                                    <img src="Handler.ashx?TargetSize=60&UserID=<%# Eval("UserID") %>" alt='<%# Eval("Name") %> <%# Eval("Surname") %> ' />
                                                    <%# Eval("Name") + " " + Eval("Surname") %>
                                                </a></li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllAuthorsWithLastArticle"
                                            TypeName="AuthorManager"></asp:ObjectDataSource>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="footer">
                <div id="fbtm">
                    <h2>
                        Menü</h2>
                    <div class="nav">
                        <h3>
                            Gezinti</h3>
                        <div class="top">                           
                        </div>
                        <div class="btm">
                          
                            <p style="text-align:center;">
                                <span>&copy; 2010 Designed and Programmed by Emre METE. All rights reserved</span>
                            </p>                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
        </div>
    </form>
</body>
</html>
