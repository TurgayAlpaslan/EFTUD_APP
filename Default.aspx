<%@ Page Language="C#" MasterPageFile="~/DefaultMaster.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box carousel">
        <h3>
            Baþlýk</h3>        
        <div class="top" style="left: 0px; top: 0px">
            <a href="newsarchive.aspx" class="hdr"><b>Haberler</b></a>
            <div class="pgr">
                <a href="javascript:;" class="prv">Geri</a> <a href="javascript:;" class="nxt">Ýleri</a>
            </div>
        </div>
        <div class="mdm">
            <div class="tmb tmb-big">
                <ul>
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="objNews">
                        <ItemTemplate>
                            <li>
                                <div>
                                    <a href="NewsDetails.aspx?NewsID=<%# Eval("NewsID") %>" class="lnk">
                                        <img src='Handler.ashx?TargetSize=177&NewsID=<%# Eval("NewsID") %>' alt='<%# Eval("Caption") %>'
                                            style="border-width: 0px" />
                                        <asp:Label runat="server" Text='<%# Eval("Caption") %>'></asp:Label>
                                    </a>
                                </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource ID="objNews" runat="server" SelectMethod="GetTopNineNews" TypeName="NewsManager">
                    </asp:ObjectDataSource>
                </ul>
            </div>
        </div>
    </div>
    <div class="box mainbox">
        <h3>
            Manþetler</h3>
        <div class="inr-btm">
            <div class="authors carousel jrc">
                <a class="ttl" href="#">Yazarlar</a>
                <div class="pgr">
                    <a href="javascript:;" class="prv">Geri</a> <a href="javascript:;" class="nxt">Ýleri</a>
                </div>
                <div class="tmb tmb-ath">
                    <ul>
                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="objAuthors">
                            <ItemTemplate>
                                <li><a href="Authors.aspx?AuthorID=<%# Eval("UserID") %>&ArticleID=<%# Eval("LastArticle.ArticleID") %>" class="lnk">
                                    <img src="Handler.ashx?TargetSize=60&UserID=<%# Eval("UserID") %>" alt='<%# Eval("Name") %> <%# Eval("Surname") %> ' /><b><%# Eval("Name") + " " + Eval("Surname") %></b><span><%# Eval("LastArticle.Title")%></span></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:ObjectDataSource ID="ObjAuthors" runat="server" SelectMethod="GetAllAuthorsWithLastArticle"
                            TypeName="AuthorManager"></asp:ObjectDataSource>                       
                    </ul>
                </div>
            </div>
        </div>        
    </div>
    <div class="box carousel">
        <h3>
            Baþlýk</h3>        
        <div class="top" style="left: 0px; top: 0px">
            <a href="#" class="hdr"><b>Basýnda Biz</b></a>
            <div class="pgr">
                <a href="javascript:;" class="prv">Geri</a> <a href="javascript:;" class="nxt">Ýleri</a>
            </div>
        </div>
        <div class="mdm">
            <div class="tmb tmb-big">
                <ul>
                    <asp:Repeater ID="Repeater4" runat="server" DataSourceID="objNewspapers">
                        <ItemTemplate>
                            <li>
                                <div>
                                    <a href="handler.ashx?PhotoType=1&NewspaperID=<%# Eval("ID") %>" rel="lightbox" class="lnk">
                                        <img src='Handler.ashx?TargetSize=177&PhotoType=0&NewspaperID=<%# Eval("ID") %>' alt='<%# Eval("Description") %>'
                                            style="border-width: 0px" />
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                                    </a>
                                </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource ID="objNewspapers" runat="server" SelectMethod="GetNewspapers"
                        TypeName="NewspaperManager"></asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetTopNineNews" TypeName="NewsManager">
                    </asp:ObjectDataSource>
                </ul>
            </div>
        </div>
    </div>
    <div class="box">
    <div class="inr-btm">
            <div class="authors carousel jrc">
                <a class="ttl" href="BiographyList.aspx">Biyografiler</a>
                <div class="pgr">
                    <a href="javascript:;" class="prv">Geri</a> <a href="javascript:;" class="nxt">Ýleri</a>
                </div>
                <div class="tmb tmb-ath">
                    <ul>
                        <asp:Repeater ID="Repeater3" runat="server" DataSourceID="objRandomBiographies">
                            <ItemTemplate>
                                <li><a href="BiographyDetail.aspx?BiographyID=<%# Eval("Id") %>" class="lnk">
                                    <img src="Handler.ashx?TargetSize=60&BiographyID=<%# Eval("Id") %>" alt='<%# Eval("Title") %> <%# Eval("Name") %> <%# Eval("Surname") %> ' /><b><%# Eval("Title") + " " + Eval("Name") + " " + Eval("Surname") %></b><span></span></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:ObjectDataSource ID="objRandomBiographies" runat="server" SelectMethod="GetRandomBiographies"
                            TypeName="BiographyManager"></asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllAuthorsWithLastArticle"
                            TypeName="AuthorManager"></asp:ObjectDataSource>                       
                    </ul>
                </div>
            </div>
        </div>       
    </div>
    <div class="box">
    <center>
    <object id="MediaPlayer1" height="45" 
	classid="CLSID:22D6F312-B0F6-11D0-94AB-0080C74C7E95"
	codebase=
	"http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,0,02,902"
        standby="Loading Microsoft® Windows® Media Player components..." 
        type="application/x-oleobject">
                      <param name="FileName" value="mp3/ses.wma">
                      <param name="animationatStart" value="true">
                      <param name="transparentatStart" value="true">
                      <param name="autoStart" value="true">
                      <param name="showControls" value="true">
                      <param name="uiMode" value="full">
                      <embed type="application/x-mplayer2" 
	pluginspage = "http://www.microsoft.com/Windows/MediaPlayer/"
	src="flash//ses.wma"
	name="MediaPlayer1"
	height="45"
	autostart="true"> </embed>
                    </object></center>
                    </div>


    <%--<div class="box">
    <h3>Biyografiler</h3>
        <div class="top" style="left: 0px; top: 0px">
            <a href="BiographyList.aspx" class="hdr"><b>Biyografiler</b></a>
            
        </div>
        <div class="mdm">
            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="objBiography">
                <ItemTemplate>
                    <div style="font-size:10pt; font-weight:bold; margin:5px 0 10px 0;"><%# Eval("Title") + " " + Eval("Name") + " " + Eval("Surname") %></div>
                    <div style="float:left; margin:0 7px 7px 0;">
                    <img src="handler.ashx?BiographyID=<%# Eval("ID") %>&TargetSize=120" alt="<%# Eval("Title") + " " + Eval("Name") + " " + Eval("Surname") %>" /></div>
                    <a style="display:block;" href="biographydetail.aspx?BiographyID=<%# Eval("ID") %>"><%# Eval("LContent") %></a>
                </ItemTemplate>
            </asp:Repeater>
            
            <asp:ObjectDataSource ID="objBiography" runat="server" SelectMethod="GetBiography"
                TypeName="BiographyManager"></asp:ObjectDataSource>
        
        
        </div>
    </div>--%>
    
</asp:Content>
