<%@ Page Language="C#" AutoEventWireup="true" CodeFile="photo.aspx.cs" Inherits="photo" %>

<%@ Register Src="PhotoGallery.ascx" TagName="PhotoGallery" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="tr">
<head id="ctl00_ctl00_head1">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title>CNNTÜRK anasayfa - Türkiye, Dünya, Ekonomi, Finans, Döviz, Borsa, Spor, Futbol,
        Basketbol, Sağlık, Kültür Sanat, Müzik, Sinema, Magazin, Moda, Bilim Teknoloji,
        Küresel Isınma, Köşe Yazıları, Tatil, Hava Durumu, TV, Canlı Yayın, Radyo, Video,
        Foto Galeri, Son Dakika Haberleri - CNNTurk.com </title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="cnn türk, cnnturk, cnn turk, cnn, haber, türkiye, news, news agents, cnn türk kanalı" />
    <!-- (C)2000-2009 Gemius SA - gemiusTraffic / ver 11.1 / Main page -->

    <script type="text/javascript" src="script.min.js"></script>

    <meta name="description" content="CNNTurk.com, Türkiye ve dünya gündeminden güncel haberler, videolar ve foto galerilerin yer aldığı haber portalıdır. CNN TÜRK televizyonun resmi internet sitesi olan CNNTurk.com'dan CNN TÜRK haberleri, programları ve canlı yayınına da ulaşılabilmektedir." />
    <link rel="stylesheet" type="text/css" href="general.css" />
    <link rel="stylesheet" type="text/css" href="index.css" />
    <link rel="stylesheet" type="text/css" id="ctl00_ctl00_head_head_Css1" href="main.css" />
    <meta http-equiv="refresh" content="180" />
    <meta name="verify-v1" content="NFOiYjqGrPVtfZ+IOOb4eX54fdjvUyCcGJ49x7Hvn3Q=" />
    <!--[if IE 6]><link rel="stylesheet" type="text/css" href="http://cdn1.cnnturk.com/App_Themes/Default/index.ie.css?ver=1" /><![endif]-->
    <link rel="shortcut icon" href="http://cdn1.cnnturk.com/images/favicon.ico" />
    <link rel="Alternate" type="application/rss+xml" title="CNNTurk.com - Türkiye, Dünya, Ekonomi, Finans, Spor, Sağlık, Kültür-Sanat, Yaşam, Bilim-Teknoloji, Hava-Yol Haberleri (RSS 2.0)"
        href="http://www.cnnturk.com/servisler/Rss" />
    <link title="CNN TÜRK Arama" rel="search" type="application/opensearchdescription+xml"
        href="http://www.cnnturk.com/searchprovider.xml" />
</head>
<body>

    <script type="text/javascript" src="script.min1.js"></script>

    <div id="container">
        <div id="body">
            <div id="lastminute">
            </div>
            <div class="cnt-man">
                <h2>
                    CNN Türk</h2>
                <div class="cnt-rgt">
                    <div class="box photo carousel">
                        <h3>
                            Foto Galeri</h3>
                        <div class="hdr jrt">
                            <a href="/fotogaleri" class="hdr"><b>Foto Galeri</b> »</a>
                        </div>
                        <div class="cnt" id="photoGalleryContent">
                            <a href="javascript:;" class="img">&nbsp;</a>
                        </div>
                        <div class="ftr">
                            <div class="tmb tmb-glr">
                                <ul>
                                    <uc1:PhotoGallery ID="PhotoGallery1" runat="server" />
                                   <%-- <li><a href="javascript:;" rev="5662">
                                        <img src="http://cdn1.cnnturk.com/handlers/file.ashx?FileID=263500&Width=50&Height=33&BlackWhite=False"
                                            alt="Günün fotoğrafları..." /></a></li>
                                    <li><a href="javascript:;" rev="5661">
                                        <img src="http://cdn1.cnnturk.com/handlers/file.ashx?FileID=263508&Width=50&Height=33&BlackWhite=False"
                                            alt="Modanın kalbi Lizbon'da atıyor" /></a></li>
                                    <li><a href="javascript:;" rev="5660">
                                        <img src="http://cdn1.cnnturk.com/handlers/file.ashx?FileID=263577&Width=50&Height=33&BlackWhite=False"
                                            alt="Massa kazadan sonra ilk kez!" /></a></li>
                                    <li><a href="javascript:;" rev="5659">
                                        <img src="http://cdn1.cnnturk.com/handlers/file.ashx?FileID=263459&Width=50&Height=33&BlackWhite=False"
                                            alt="Şimdi de sahte deterjan çetesi" /></a></li>
                                    <li><a href="javascript:;" rev="5658">
                                        <img src="http://cdn1.cnnturk.com/handlers/file.ashx?FileID=263454&Width=50&Height=33&BlackWhite=False"
                                            alt="Bir gaddarlık haberi daha!" /></a></li>
                                    <li><a href="javascript:;" rev="5657">
                                        <img src="http://cdn1.cnnturk.com/handlers/file.ashx?FileID=263441&Width=50&Height=33&BlackWhite=False"
                                            alt="Ekran yüzleri D-Smart dergisine konuştu" /></a></li>
                                    <li><a href="javascript:;" rev="5656">
                                        <img src="http://cdn1.cnnturk.com/handlers/file.ashx?FileID=263414&Width=50&Height=33&BlackWhite=False"
                                            alt="İşte beyaz perdenin en güzel kadınları..." /></a></li>
                                    <li><a href="javascript:;" rev="5655">
                                        <img src="http://cdn1.cnnturk.com/handlers/file.ashx?FileID=263371&Width=50&Height=33&BlackWhite=False"
                                            alt="Greenpeace Meclis çatısına çıktı" /></a></li>
                                    <li><a href="javascript:;" rev="5654">
                                        <img src="http://cdn1.cnnturk.com/handlers/file.ashx?FileID=263365&Width=50&Height=33&BlackWhite=False"
                                            alt="Bolivya-Brezilya" /></a></li>
                                    <li><a href="javascript:;" rev="5653">
                                        <img src="http://cdn1.cnnturk.com/handlers/file.ashx?FileID=263261&Width=50&Height=33&BlackWhite=False"
                                            alt="Altın Portakal heyecanı başladı" /></a></li>--%>
                                </ul>
                            </div>
                        </div>
                        <div class="ftr jrb">
                            <div class="pgr">
                                <a href="javascript:;" class="prv">Geri</a> <a href="javascript:;" class="nxt">İleri</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
