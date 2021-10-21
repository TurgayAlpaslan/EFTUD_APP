<%@ Page Language="C#" MasterPageFile="~/DetailsMaster.master" AutoEventWireup="true" CodeFile="BiographyDetail.aspx.cs" Inherits="BiographyDetail" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <asp:FormView ID="FormView1" runat="server" DataSourceID="objBiography" Width="100%">
                                        <ItemTemplate>
                                            <div class="content">
                                                <div class="fontsize">
                                                    <span>Yazý boyutu</span> <a href="javascript:;" class="btn btn-mns">Azalt</a> <a
                                                        href="javascript:;" class="btn btn-pls">Arttýr</a></div>
                                                <div style="float: left;">
                                                    <div style="margin:0 20px 10px 0;">
                                                        <ul class="lst">
                                                            <li class="act">
                                                                <img style="border:none;" src="Handler.ashx?BiographyID=<%# Eval("ID") %>" alt="" />
                                                            </li>                                                            
                                                        </ul>                                                        
                                                    </div>
                                                </div>
                                                <div class="htm">
                                                    <%# Eval("Content") %>                                                   
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                        <EmptyDataTemplate>
                                            Gösterilecek veri yok.
                                        </EmptyDataTemplate>
                                    </asp:FormView>
            <asp:ObjectDataSource ID="objBiography" runat="server" SelectMethod="GetBiography"
                TypeName="BiographyManager">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ID" QueryStringField="BiographyID" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        
</asp:Content>

