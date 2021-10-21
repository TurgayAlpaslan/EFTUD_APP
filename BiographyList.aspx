<%@ Page Language="C#" MasterPageFile="~/DetailsMaster.master" AutoEventWireup="true" CodeFile="BiographyList.aspx.cs" Inherits="BiographyList" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="letter">
<a href="biographyList.aspx?Letter=A">A</a>
<a href="biographyList.aspx?Letter=B">B</a>
<a href="biographyList.aspx?Letter=C">C</a>
<a href="biographyList.aspx?Letter=Ç">Ç</a>
<a href="biographyList.aspx?Letter=D">D</a>
<a href="biographyList.aspx?Letter=E">E</a>
<a href="biographyList.aspx?Letter=F">F</a>
<a href="biographyList.aspx?Letter=G">G</a>
<a href="biographyList.aspx?Letter=Ð">Ð</a>
<a href="biographyList.aspx?Letter=H">H</a>
<a href="biographyList.aspx?Letter=I">I</a>
<a href="biographyList.aspx?Letter=Ý">Ý</a>
<a href="biographyList.aspx?Letter=J">J</a>
<a href="biographyList.aspx?Letter=K">K</a>
<a href="biographyList.aspx?Letter=L">L</a>
<a href="biographyList.aspx?Letter=M">M</a>
<a href="biographyList.aspx?Letter=N">N</a>
<a href="biographyList.aspx?Letter=O">O</a>
<a href="biographyList.aspx?Letter=Ö">Ö</a>
<a href="biographyList.aspx?Letter=P">P</a>
<a href="biographyList.aspx?Letter=R">R</a>
<a href="biographyList.aspx?Letter=S">S</a>
<a href="biographyList.aspx?Letter=Þ">Þ</a>
<a href="biographyList.aspx?Letter=T">T</a>
<a href="biographyList.aspx?Letter=U">U</a>
<a href="biographyList.aspx?Letter=Ü">Ü</a>
<a href="biographyList.aspx?Letter=V">V</a>
<a href="biographyList.aspx?Letter=Y">Y</a>
<a href="biographyList.aspx?Letter=Z">Z</a>
   

</div>
<br />
 <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        BorderStyle="None" BorderWidth="0px" DataSourceID="ObjectDataSource1" GridLines="None"
        Width="100%">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <li style="margin-bottom: 10px;"><a class="lnk" href='BiographyDetail.aspx?BiographyID=<%# Eval("ID") %>'>
                       <b>
                            <%# Eval("Title") + " " + Eval("Name") + " " + Eval("Surname") %>
                        </b></a></li>
                </ItemTemplate>
                <ItemStyle BorderStyle="None" BorderWidth="0px" />
            </asp:TemplateField>
        </Columns>
        <PagerStyle CssClass="aspnetPager" HorizontalAlign="Center" VerticalAlign="Middle" />
        <HeaderStyle BorderStyle="None" />
        <EditRowStyle BorderStyle="None" />
     <EmptyDataTemplate>
         Gösterilecek veri yok.
     </EmptyDataTemplate>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetBiographies"
        TypeName="BiographyManager">
        <SelectParameters>
            <asp:QueryStringParameter Name="Letter" QueryStringField="Letter" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>


</asp:Content>

