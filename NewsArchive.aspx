<%@ Page Language="C#" MasterPageFile="~/DetailsMaster.master" AutoEventWireup="true" CodeFile="NewsArchive.aspx.cs" Inherits="NewsArchive" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        BorderStyle="None" BorderWidth="0px" GridLines="None" Width="100%" DataSourceID="ObjectDataSource1">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <li style="margin-bottom:10px;"><a class="lnk" href='NewsDetails.aspx?NewsID=<%# Eval("NewsID") %>'>
                        <i style="color:Red;">
                            <%# Eval("AddedDate", "{0:d}") %>
                        </i><b> - <%#Eval("Caption") %>
                        </b></a></li>
                </ItemTemplate>
                <ItemStyle BorderStyle="None" BorderWidth="0px" />
            </asp:TemplateField>
        </Columns>
        <PagerStyle CssClass="aspnetPager" HorizontalAlign="Center" VerticalAlign="Middle" />
        <HeaderStyle BorderStyle="None" />
        <EditRowStyle BorderStyle="None" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetNews"
        TypeName="NewsManager"></asp:ObjectDataSource>
   
</asp:Content>

