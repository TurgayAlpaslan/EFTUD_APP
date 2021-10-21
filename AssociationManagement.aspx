<%@ Page Language="C#" MasterPageFile="~/DetailsMaster.master" AutoEventWireup="true" CodeFile="AssociationManagement.aspx.cs" Inherits="AssociationManagement" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" Width="100%" BorderStyle="None" BorderWidth="0px" BorderColor="White" AllowPaging="True">
        <Columns>
            <asp:TemplateField ShowHeader="False">
            <ItemStyle BorderStyle="None" Font-Bold="True"  BorderWidth="0px" />
               <ItemTemplate>
                    <center>
                        <img style="border:outset 1px;" class="img" src="Handler.ashx?TargetSize=120&AdministratorID=<%# Eval("ID") %>" alt="<%# Eval("Name") %> <%# Eval("Surname") %>" /><br />
                        <span style="font-size:9pt; padding-top:10px;"><%# Eval("Name") %> <%# Eval("Surname") %><br />
                        <%# Eval("Description") %></span>
                        
                    </center>
                    <br />
                    <br />
                </ItemTemplate>
                
                <ControlStyle BorderStyle="None" BorderWidth="0px" />
                <FooterStyle BorderStyle="None" BorderWidth="0px" />
                <HeaderStyle BorderStyle="None" BorderWidth="0px" />
            </asp:TemplateField>
            
        </Columns>
        <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" />
        <HeaderStyle BorderStyle="None" BorderWidth="0px" />
        <EditRowStyle BorderStyle="None" BorderWidth="0px" />
        <RowStyle BorderStyle="None" BorderWidth="0px" />
        <FooterStyle BorderStyle="None" BorderWidth="0px" />
        <SelectedRowStyle BorderStyle="None" BorderWidth="0px" />
    </asp:GridView>
    <br />
   <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAdministrators"
        TypeName="AdministrationManager"></asp:ObjectDataSource>
</asp:Content>

