<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Authors.aspx.cs" Inherits="Authors" %>
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
                <div style="background-color:#FFFFFF;background-image:url('images/banner3.jpg'); background-repeat:no-repeat; width:100%; height:142px;"></div>
                <div id="topMenuBar" style="width:100%; background-color:#ffffff;">
                <uc1:TopMenuControl ID="TopMenuControl1" runat="server" />
                </div>
            </div>
        <div id="body">
            <div id="lastminute">
            </div>
            <div class="cnt-man">
                
                <div class="cnt-lft">
                    <div class="box authors adetail">
                        <h3>
                            Yazarlar</h3>
                        <div class="top">
                            <a href="#" class="hdr"><b>Yazarlar</b></a>
                        </div>
                        <div class="mdm">
                        <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource2">
                                <ItemTemplate>
                                    <div class="att">
                                <p>
                                    <a href="javascript:;"><%# Eval("Name")%> <%# Eval("Surname") %></a> <i><%# Eval("CurrentArticle.AddedDate", "{0:d}") %></i></p>
                                <p>
                                    <b><%# Eval("CurrentArticle.Title") %></b></p>                              
                            </div>
                             <div class="aim">
                                <a href="javascript:;">
                                    <img src="Handler.ashx?TargetSize=150&UserID=<%# Eval("UserID") %>"
                                       alt='<%# Eval("Name") %> <%# Eval("Surname") %>' class="img" /></a>
                            </div>
                             <div class="abx asm jrc">
                                <b><%# Eval("Name")%> <%# Eval("Surname") %></b>
                                <p>
                                    <a href='mailto:<%# Eval("Email") %>'><%# Eval("Email")%></a>
                                    <br />
                                    <%# Eval("Description") %></p>
                            </div>
                            <div class="abx atr jrc">
                                <b>Diğer Yazıları</b>
                                <ul>                               
                                    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="GetOtherArticles"
                                TypeName="AuthorManager">
                                <SelectParameters>
                                 <asp:QueryStringParameter Name="UserID" QueryStringField="AuthorID" Type="Int32" />
                                    <asp:QueryStringParameter Name="ArticleID" QueryStringField="ArticleID" Type="Int32" />
                                </SelectParameters></asp:ObjectDataSource>
                                    <asp:Repeater ID="Repeater2" DataSourceID="ObjectDataSource3" runat="server">
                                    <ItemTemplate>
                                        <li><a href="Authors.aspx?AuthorID=<%# Eval("UserID") %>&ArticleID=<%# Eval("ArticleID") %>"><%# Eval("Title") %>
                                    </a></li>
                                    </ItemTemplate>
                                    </asp:Repeater>                                                                
                                </ul>
                               <a href="AllArticles.aspx?AuthorID=<%# Eval("UserID") %>" class="all">tüm yazıları</a>
                            </div>
                            <div class="acn">
                            <%# Eval("CurrentArticle.Content") %>
                            
                            </div>                                                             
                                </ItemTemplate>
                            <EmptyDataTemplate>
                                Gösterilecek yazı yok.
                            </EmptyDataTemplate>
                            </asp:FormView>
                            
                           <%-- <div class="shr">
                                <b class="ttl">Yazıyı Paylaş:</b> <a href="http://www.facebook.com/share.php?u=%url"
                                    target="_blank" title="Facebook'da paylaş"><b class="icn icn-s03">»</b> Facebook</a>
                                <a href="http://www.google.com/bookmarks/mark?op=edit&bkmk=%url" target="_blank"
                                    title="Google'da paylaş"><b class="icn icn-s09">»</b> Google</a> <a href="http://twshot.com/share.aspx?url=%url"
                                        target="_blank" title="Twitter'da paylaş"><b class="icn icn-s08">»</b> Twitter</a>
                                <a href="http://www.mixx.com/submit/story?page_url=%url" target="_blank" title="Mixx'de paylaş">
                                    <b class="icn icn-s01">»</b> Mixx</a> <a href="http://digg.com/submit?phase=2&url=%url"
                                        target="_blank" title="Digg'de paylaş"><b class="icn icn-s02">»</b> Digg</a>
                                <a href="http://del.icio.us/post?url=%url" target="_blank" title="del.icio.us'da paylaş">
                                    <b class="icn icn-s04">»</b> del.icio.us</a> <a href="http://reddit.com/submit?url=%url"
                                        target="_blank" title="Reddit'te paylaş"><b class="icn icn-s05">»</b> reddit</a>
                                <a href="http://www.myspace.com/Modules/PostTo/Pages/u=%url" target="_blank" title="MySpace'de paylaş">
                                    <b class="icn icn-s07">»</b> MySpace</a> <a href="http://www.stumbleupon.com/submit?url=%url"
                                        target="_blank" title="Stumble Upon'da paylaş"><b class="icn icn-s06">»</b> Stumble
                                        Upon</a>
                            </div>--%>
                            
                            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetAuthorWithArticle"
                                TypeName="AuthorManager">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="UserID" QueryStringField="AuthorID" Type="Int32" />
                                    <asp:QueryStringParameter Name="ArticleID" QueryStringField="ArticleID" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            
                            
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
                                            <li>
                                                <a href="Authors.aspx?AuthorID=<%# Eval("UserID") %>&ArticleID=<%# Eval("LastArticle.ArticleID") %>">
                                                    <img src="Handler.ashx?TargetSize=60&UserID=<%# Eval("UserID") %>" alt='<%# Eval("Name") %> <%# Eval("Surname") %> ' /> <%# Eval("Name") + " " + Eval("Surname") %>
                                                 </a>
                                            </li>
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
    <div>
    </div>
    </form>
</body>
</html>
