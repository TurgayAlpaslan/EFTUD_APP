<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GetAlbum.aspx.cs" Inherits="GetAlbum" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="tr" xmlns:fb="http://www.facebook.com/2008/fbml">
<head id="header1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link rel="stylesheet" type="text/css" href="general.css" />
    <link rel="stylesheet" type="text/css" href="index.css" />
    <link rel="stylesheet" type="text/css" href="player.css" />
    <link rel="stylesheet" type="text/css" href="gallery.css" />
    <link rel="stylesheet" type="text/css" href="inner.css" />
    <!--[if IE 6]><link rel="stylesheet" type="text/css" href="index.ie.css" /><![endif]-->   
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   
</head>
<body>
    <form runat="server" id="form1">
        <div id="banner">
            <div id="cnnturk_dunya_980x100" class="banner">
            </div>
        </div>
        <div id="header">
            <div id="hsrc">
                <h1>
                    Foto Galeri</h1>
                <h2>
                    Ekhod</h2>
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
                        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetAlbums"
                            TypeName="PhotoManager"></asp:ObjectDataSource>
                        <div class="photogal">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"
                                PageSize="1" AllowPaging="True" DataKeyNames="PhotoID" BorderStyle="None" BorderWidth="0px" GridLines="None">
                                <Columns>                               
                                    <asp:TemplateField>
                                        <ItemStyle BorderStyle="None" BorderWidth="0px" />
                                        <ItemTemplate>
                                            <div class="pht">
                                                <img src='Handler.ashx?PhotoID=<%# Eval("PhotoID") %>' class="img" alt="" />
                                                <div class="ttl">
                                                    <span><b>
                                                        <%# Eval("Caption") %>
                                                    </b></span>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerStyle BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Italic="False"
                                    Font-Names="Onyx" CssClass="aspnetPager" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <PagerSettings Mode="NumericFirstLast" />
                                <HeaderStyle BorderStyle="None" CssClass="0" />
                            </asp:GridView>
                            <br />
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetPhotos"
                                TypeName="PhotoManager">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="AlbumID" QueryStringField="AlbumID" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </div>
                        <div class="playlist">
                            <h3>
                                Play List</h3>
                            <div class="tab tab-pls">
                                <ul>
                                    <li class="act frs"><a href="javascript:;">DİĞER ALBÜMLER</a></li>
                                </ul>
                            </div>
                            <div class="cnt">
                                <div class="lst">
                                    <ul class="vls">
                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource2">
                                            <ItemTemplate>
                                                <li class=""><a href='GetAlbum.aspx?AlbumID=<%# Eval("AlbumID") %>'>
                                                    <img src='Handler.ashx?AlbumID=<%# Eval("AlbumID") %>&targetSize=45' alt='Album No: <%# Eval("AlbumID") %>' />
                                                    <span>
                                                        <%# Eval("Caption") %>
                                                    </span></a></li>
                                            </ItemTemplate>
                                        </asp:Repeater>
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
                            <%--<a id="ctl00_ctl00_ContentPlaceHolder1_CnnTurkFooter1_Footerlist_ctl00_MainHyperLink"
                                title="Ana Sayfa" href="/default.aspx">Ana Sayfa</a> &nbsp;|&nbsp; <a id="ctl00_ctl00_ContentPlaceHolder1_CnnTurkFooter1_Footerlist_ctl02_MainHyperLink"
                                    title="Türkiye" href="/turkiye/default.aspx">Türkiye</a> &nbsp;|&nbsp; <a id="ctl00_ctl00_ContentPlaceHolder1_CnnTurkFooter1_Footerlist_ctl04_MainHyperLink"
                                        title="Dünya" href="/dunya/default.aspx">Dünya</a> &nbsp;|&nbsp; <a id="ctl00_ctl00_ContentPlaceHolder1_CnnTurkFooter1_Footerlist_ctl06_MainHyperLink"
                                            title="Ekonomi" href="/ekonomi/default.aspx">Ekonomi</a> &nbsp;|&nbsp;
                            <a id="ctl00_ctl00_ContentPlaceHolder1_CnnTurkFooter1_Footerlist_ctl08_MainHyperLink"
                                title="Spor" href="/spor/default.aspx">Spor</a> &nbsp;|&nbsp; <a id="ctl00_ctl00_ContentPlaceHolder1_CnnTurkFooter1_Footerlist_ctl10_MainHyperLink"
                                    title="Sağlık" href="/saglik/default.aspx">Sağlık</a> &nbsp;|&nbsp; <a id="ctl00_ctl00_ContentPlaceHolder1_CnnTurkFooter1_Footerlist_ctl12_MainHyperLink"
                                        title="Kültür Sanat" href="/kultur.sanat/default.aspx">Kültür Sanat</a>
                            &nbsp;|&nbsp; <a id="ctl00_ctl00_ContentPlaceHolder1_CnnTurkFooter1_Footerlist_ctl14_MainHyperLink"
                                title="Yaşam" href="/yasam/default.aspx">Yaşam</a> &nbsp;|&nbsp; <a id="ctl00_ctl00_ContentPlaceHolder1_CnnTurkFooter1_Footerlist_ctl16_MainHyperLink"
                                    title="Bilim Teknoloji" href="/bilim.teknoloji/default.aspx">Bilim Teknoloji</a>
                            &nbsp;|&nbsp; <a id="ctl00_ctl00_ContentPlaceHolder1_CnnTurkFooter1_Footerlist_ctl18_MainHyperLink"
                                title="Tatil" href="http://tatil.cnnturk.com/index.aspx">Tatil</a> &nbsp;|&nbsp;
                            <a id="ctl00_ctl00_ContentPlaceHolder1_CnnTurkFooter1_Footerlist_ctl20_MainHyperLink"
                                title="Hava Yol" href="/havadurumu/default.aspx">Hava Yol</a> &nbsp;|&nbsp;
                            <a id="ctl00_ctl00_ContentPlaceHolder1_CnnTurkFooter1_Footerlist_ctl22_MainHyperLink"
                                title="Haber SMS" href="/servisler/sms/default.aspx">Haber SMS</a> &nbsp;|&nbsp;
                            <a id="ctl00_ctl00_ContentPlaceHolder1_CnnTurkFooter1_Footerlist_ctl24_MainHyperLink"
                                title="RSS" href="/servisler/rss/default.aspx">RSS</a> &nbsp;|&nbsp; <a id="ctl00_ctl00_ContentPlaceHolder1_CnnTurkFooter1_Footerlist_ctl26_MainHyperLink"
                                    title="Yayın Akışı" href="/cnnturktv/yayin_akisi/default.aspx">Yayın Akışı</a>
                            &nbsp;|&nbsp; <a id="ctl00_ctl00_ContentPlaceHolder1_CnnTurkFooter1_Footerlist_ctl28_MainHyperLink"
                                title="TV" href="/cnnturktv/index.aspx">TV</a> &nbsp;|&nbsp; <a id="ctl00_ctl00_ContentPlaceHolder1_CnnTurkFooter1_Footerlist_ctl30_MainHyperLink"
                                    title="Basın Odası" href="/kurumsaliletisim/default.aspx">Basın Odası</a>
                            &nbsp;|&nbsp; <a id="ctl00_ctl00_ContentPlaceHolder1_CnnTurkFooter1_Footerlist_ctl32_MainHyperLink"
                                title="Sanal Stadyum" href="http://sanalstadyum.cnnturk.com">Sanal Stadyum</a>
                            &nbsp;|&nbsp; <a id="ctl00_ctl00_ContentPlaceHolder1_CnnTurkFooter1_Footerlist_ctl34_MainHyperLink"
                                title="Fantezi Futbol" href="http://fantezifutbol.cnnturk.com/Site">Fantezi Futbol</a>--%>
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
    </form>
</body>
</html>
