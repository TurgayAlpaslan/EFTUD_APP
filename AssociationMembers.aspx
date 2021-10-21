<%@ Page Language="C#" MasterPageFile="~/DetailsMaster.master" AutoEventWireup="true" CodeFile="AssociationMembers.aspx.cs" Inherits="AssociationMembers" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderColor="White"
        BorderStyle="None" BorderWidth="0px" DataSourceID="ObjectDataSource1" Width="100%" AllowPaging="True">
        <RowStyle BorderStyle="None" BorderWidth="0px" />
        <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <center>
                        <img alt='<%# Eval("Name") %> <%# Eval("Surname") %>' class="img" src='Handler.ashx?TargetSize=120&MemberID=<%# Eval("ID") %>'
                            style="border: outset 1px;" /><br />
                        <span style="font-size: 9pt; padding-top: 10px;">
                            <%# Eval("Name") %>
                            <%# Eval("Surname") %>
                            <br />
                            <%# Eval("Description") %>
                        </span>
                    </center>
                    <br />
                    <br />
                </ItemTemplate>
                <ControlStyle BorderStyle="None" BorderWidth="0px" />
                <FooterStyle BorderStyle="None" BorderWidth="0px" />
                <HeaderStyle BorderStyle="None" BorderWidth="0px" />
                <ItemStyle BorderStyle="None" BorderWidth="0px" Font-Bold="True" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BorderStyle="None" BorderWidth="0px" />
        <SelectedRowStyle BorderStyle="None" BorderWidth="0px" />
        <HeaderStyle BorderStyle="None" BorderWidth="0px" />
        <EditRowStyle BorderStyle="None" BorderWidth="0px" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetMembers"
        TypeName="MemberManager"></asp:ObjectDataSource>
</asp:Content>

