<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="BasicSettings.aspx.cs" Inherits="Admin_BasicSettings" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id" DataSourceID="AccessDataSource1" DefaultMode="Edit" Width="100%">
        <EditItemTemplate>
            <table width="100%">
                <tr>
                    <td style="width: 20%; text-align:right;" valign="top">
                        Description:</td>
                    <td style="width: 80%">
                        <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' Height="60px" TextMode="MultiLine" Width="100%"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 20%; text-align:right;" valign="top">
                        Keywords:</td>
                    <td style="width: 80%">
                        <asp:TextBox ID="KeywordsTextBox" runat="server" Text='<%# Bind("Keywords") %>' Height="60px" TextMode="MultiLine" Width="100%"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 20%; text-align:right;" valign="top">
                        Author:</td>
                    <td style="width: 80%">
                        <asp:TextBox ID="AuthorTextBox" runat="server" Text='<%# Bind("Author") %>' Height="60px" TextMode="MultiLine" Width="100%" Enabled="False"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 20%; text-align:right;; height: 70px;" valign="top">
                        Site Başlığı:</td>
                    <td style="width: 80%; height: 70px;">
                        <asp:TextBox ID="SiteTitleTextBox" runat="server" Text='<%# Bind("SiteTitle") %>' Height="60px" TextMode="MultiLine" Width="100%"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 20%; text-align:right;" valign="top">
                        Site Logosu:</td>
                    <td style="width: 80%">
                        <asp:TextBox ID="BannerTextBox" runat="server" Text='<%# Bind("Banner") %>' Height="60px" TextMode="MultiLine" Width="100%"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 20%; text-align:right;" valign="top">
                    </td>
                    <td style="width: 80%; text-align: right;">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Kaydet"></asp:LinkButton></td>
                </tr>
                <tr>
                    <td style="width: 20%; text-align:right;" valign="top">
                    </td>
                    <td style="width: 80%">
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%; text-align:right;" valign="top">
                    </td>
                    <td style="width: 80%">
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%; text-align:right;" valign="top">
                    </td>
                    <td style="width: 80%">
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%; text-align:right;" valign="top">
                    </td>
                    <td style="width: 80%">
                    </td>
                </tr>
            </table>
        </EditItemTemplate>
        <EditRowStyle BackColor="#EFEFEF" />
    </asp:FormView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" ConflictDetection="CompareAllValues"
        DataFile="~/App_Data/SiteData.mdb" DeleteCommand="DELETE FROM [Settings] WHERE [Id] = ? AND [Description] = ? AND [Keywords] = ? AND [Author] = ? AND [SiteTitle] = ? AND [Banner] = ?"
        InsertCommand="INSERT INTO [Settings] ([Id], [Description], [Keywords], [Author], [SiteTitle], [Banner]) VALUES (?, ?, ?, ?, ?, ?)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Settings]"
        UpdateCommand="UPDATE [Settings] SET [Description] = ?, [Keywords] = ?, [Author] = ?, [SiteTitle] = ?, [Banner] = ? WHERE [Id] = ?">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_Keywords" Type="String" />
            <asp:Parameter Name="original_Author" Type="String" />
            <asp:Parameter Name="original_SiteTitle" Type="String" />
            <asp:Parameter Name="original_Banner" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Keywords" Type="String" />
            <asp:Parameter Name="Author" Type="String" />
            <asp:Parameter Name="SiteTitle" Type="String" />
            <asp:Parameter Name="Banner" Type="String" />
            <asp:Parameter Name="original_Id" Type="Int32" />           
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Keywords" Type="String" />
            <asp:Parameter Name="Author" Type="String" />
            <asp:Parameter Name="SiteTitle" Type="String" />
            <asp:Parameter Name="Banner" Type="String" />
        </InsertParameters>
    </asp:AccessDataSource>
</asp:Content>

