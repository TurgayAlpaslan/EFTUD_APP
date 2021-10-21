<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="AddUpdatePage.aspx.cs" Inherits="Admin_AddUpdatePage" Title="Untitled Page" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="width:99%;">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="AccessDataSource1" DefaultMode="Edit" Width="100%" CellPadding="4" ForeColor="#333333">
        <EditItemTemplate><table width="100%">
            <tr>
                <td style="width: 15%">
                    Adý:</td>
                <td style="width: 70%">
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' MaxLength="20" Width="100%"></asp:TextBox></td>
                <td style="width: 15%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
            <tr style="color: #000000">
                <td style="width: 15%" valign="top">
                    Sayfa Ýçeriði:</td>
                <td style="width: 70%">
                    <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Height="500px" Value='<%# Bind("Content") %>'
                            Width="100%">
                    </FCKeditorV2:FCKeditor>
                </td>
                <td style="width: 15%">
                </td>
            </tr>
            <tr>
                <td style="width: 15%">
                    Açýklama:</td>
                <td style="width: 70%">
            <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' MaxLength="255" TextMode="MultiLine" Width="100%"></asp:TextBox></td>
                <td style="width: 15%">
                </td>
            </tr>
            <tr>
                <td style="width: 15%">
                </td>
                <td align="right" style="width: 70%">
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Kaydet"></asp:LinkButton></td>
                <td style="width: 15%">
                </td>
            </tr>
        </table>
        </EditItemTemplate>
        <InsertItemTemplate>
            <table width="100%">
                <tr>
                    <td style="width: 15%">
                        Adý:</td>
                    <td style="width: 70%">
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' Width="100%" MaxLength="20"></asp:TextBox></td>
                    <td style="width: 15%">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameTextBox"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 15%" valign="top">
                        Sayfa Ýçeriði:</td>
                    <td style="width: 70%">
                        <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Height="500px" Value='<%# Bind("Content") %>'
                            Width="100%">
                        </FCKeditorV2:FCKeditor>
                    </td>
                    <td style="width: 15%">
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%">
                        Açýklama:</td>
                    <td style="width: 70%">
            <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine" MaxLength="255" Width="100%"></asp:TextBox></td>
                    <td style="width: 15%">
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%">
                    </td>
                    <td align="right" style="width: 70%">
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Ekle"></asp:LinkButton></td>
                    <td style="width: 15%">
                    </td>
                </tr>
            </table>
            <br />
            &nbsp;
        </InsertItemTemplate>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#EFEFEF" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    </asp:FormView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" ConflictDetection="CompareAllValues"
        DataFile="~/App_Data/SiteData.mdb" 
        InsertCommand="INSERT INTO [Pages] ([Name], [Content], [Description]) VALUES (?, ?, ?)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Pages] WHERE ([ID] = ?)"
        UpdateCommand="UPDATE [Pages] SET [Name] = ?, [Content] = ?, [Description] = ? WHERE [ID] = ?">       
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Content" Type="String" ConvertEmptyStringToNull="false"  />
            <asp:Parameter Name="Description" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="original_ID" Type="Int32" />            
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="ID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
        <InsertParameters>            
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Content" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Description" Type="String" ConvertEmptyStringToNull="false" />
        </InsertParameters>
    </asp:AccessDataSource>

</div>

</asp:Content>


