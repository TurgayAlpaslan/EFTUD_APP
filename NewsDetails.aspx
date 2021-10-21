<%@ Page Language="C#" MasterPageFile="~/DetailsMaster.master" AutoEventWireup="true" CodeFile="NewsDetails.aspx.cs" Inherits="NewsDetails" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource1" Width="100%">
                                        <ItemTemplate>
                                            <div class="content">
                                                <div class="fontsize">
                                                    <span>Yazý boyutu</span> <a href="javascript:;" class="btn btn-mns">Azalt</a> <a
                                                        href="javascript:;" class="btn btn-pls">Arttýr</a></div>
                                                <div style="float: left;">
                                                    <div class="photobox">
                                                        <ul class="lst">
                                                            <li class="act">
                                                                <img src="Handler.ashx?NewsID=<%# Eval("NewsID") %>&TargetSize=" alt="" />
                                                            </li>
                                                        </ul>
                                                        <div class="pgr">
                                                            <a href="javascript:;" class="prv">Geri</a> <a href="javascript:;" class="nxt">Ýleri</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="htm">
                                                    <%# Eval("Content") %>                                                   
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                        <EmptyDataTemplate>
                                            Gösterilecek haber yok.
                                        </EmptyDataTemplate>
                                    </asp:FormView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetNews"
        TypeName="NewsManager">
        <SelectParameters>
            <asp:QueryStringParameter Name="NewsID" QueryStringField="NewsID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

