<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GetVideo.aspx.cs" Inherits="GetVideo" %>

<%@ Register Src="ControlVideo.ascx" TagName="ControlVideo" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="tr" xmlns:fb="http://www.facebook.com/2008/fbml">
<head id="header1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link rel="stylesheet" type="text/css" href="general.css" />
    <link rel="stylesheet" type="text/css" href="index.css" />
    <link rel="stylesheet" type="text/css" href="player.css" />
    <link rel="stylesheet" type="text/css" href="gallery.css" />
    <link rel="stylesheet" type="text/css" href="inner.css" />

    <script type="text/javascript" src="swfobject.js"></script>

    <script type="text/javascript" src="jwplayer.js"></script>

    <!--[if IE 6]><link rel="stylesheet" type="text/css" href="index.ie.css" /><![endif]-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
    <form runat="server" id="form1">
        <div id="banner">
            <div id="a" class="banner">
            </div>
        </div>
        <div id="header">
            <div id="hsrc">
                <h1>
                    Video Galeri</h1>
                <h2>
                    Eftud</h2>
                <div class="top">
                    <a href="default.aspx">« eftud.com Ana Sayfa</a></div>
            </div>
        </div>
        <div id="container">
            <div id="body">
                <div class="cnt-man">
                    <h2>
                        İndex</h2>
                    <a name="photogal"></a>
                    <div class="cnt-top">
                        <div class="photogal">
                            <uc1:ControlVideo ID="Video1" runat="server" />
                        </div>
                        <div class="playlist">
                            <h3>
                                Play List</h3>
                            <div class="tab tab-pls">
                                <ul>
                                    <li class="act frs"><a href="javascript:;">DİĞER VİDEOLAR</a></li>
                                </ul>
                            </div>
                            <div class="cnt">
                                <div class="lst">
                                    <ul class="vls">
                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
                                            <ItemTemplate>
                                                <li class=""><a href='GetVideo.aspx?VideoID=<%# Eval("VideoID") %>'>
                                                    <img src='Handler.ashx?VideoID=<%# Eval("VideoID") %>&targetSize=45' alt='Album No: <%# Eval("VideoID") %>' />
                                                    <span>
                                                        <%# Eval("Title") %>
                                                    </span></a></li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllVideoes"
                                            TypeName="VideoManager"></asp:ObjectDataSource>
                                </div>
                                <div class="btm">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="src-btm">
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
                            <p style="text-align: center;">
                                <span>&copy; 2010 Designed and Programmed by Emre METE. All rights reserved</span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
