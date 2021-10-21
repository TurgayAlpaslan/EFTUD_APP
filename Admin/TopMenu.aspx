<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="TopMenu.aspx.cs" Inherits="Admin_TopMenu" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="width:100%;">
    <div style="float:left; width:50%;">
    <h4>Ana Kategoriler</h4>
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="CatID" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" DataSourceID="objMainCategories" ForeColor="#333333" GridLines="None"
            Width="100%" OnRowDeleted="GridView1_RowDeleted" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:CommandField ButtonType="Image" SelectImageUrl="~/Admin/images/aspnet/select.gif"
                    SelectText="Se&#231;" ShowSelectButton="True" />
                <asp:CommandField ButtonType="Image" CancelImageUrl="~/Admin/images/aspnet/cancel.gif"
                    CancelText="Ýptal" DeleteImageUrl="~/Admin/images/aspnet/delete.gif" DeleteText="Sil"
                    EditImageUrl="~/Admin/images/aspnet/edit.gif" EditText="D&#252;zenle" ShowEditButton="True"
                    UpdateImageUrl="~/Admin/images/aspnet/save.gif" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="if (confirm('Bu kategoriyi alt kategorileri ile birlikte silmek istiyor musunuz?') == false) return false;"
                            ImageUrl="~/Admin/images/aspnet/delete.gif" Text="Sil" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
            <ItemStyle Width="20px" />
                <ItemTemplate>
                    <asp:ImageButton ID="Move_Up" ImageUrl="~/Admin/images/aspnet/up.gif" runat="server" CommandArgument='<%# Bind("OrderNr") %>' OnCommand="CategoryMoveUp_Command"  />                  
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>            
                 <ItemTemplate>
                    <asp:ImageButton ID="Move_Down" ImageUrl="~/Admin/images/aspnet/down.gif" runat="server" CommandArgument='<%# Bind("OrderNr") %>' OnCommand="CategoryMoveDown_Command"  />
                </ItemTemplate>
            </asp:TemplateField>
                <asp:TemplateField HeaderText="Adý" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CatName") %>' MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                            ErrorMessage="*"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CatName") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Link" SortExpression="Link">
                    <EditItemTemplate>
                        &nbsp;
                        <asp:TextBox ID="TextBox2" runat="server" MaxLength="255" Text='<%# Bind("Link") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Link") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="A&#231;ýklama" SortExpression="Description">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" MaxLength="255" Text='<%# Bind("Description") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
            </Columns>
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <EditRowStyle BackColor="#EFEFEF" />
            <SelectedRowStyle BackColor="#FFFFEE" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EmptyDataTemplate>
                Gösterilecek veri yok.
            </EmptyDataTemplate>
        </asp:GridView>
        <br /><hr /><br />        
        <h4>Ekle</h4>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="objMainCategories" DefaultMode="Insert" Width="100%" CellPadding="4" ForeColor="#333333">
            <InsertItemTemplate>
                <br />
                &nbsp;
                <br />
                <table>
                    <tr>
                        <td style="width: 15%">
                            Adý:</td>
                        <td style="width: 80%">
                            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("CatName") %>' MaxLength="50" Width="100%"></asp:TextBox></td>
                        <td style="width: 5%">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="NameTextBox"
                                ErrorMessage="*" ValidationGroup="insertMainGroup"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                            Link Oluþtur:</td>
                        <td style="width: 80%">
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="100%" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="objLinks" DataTextField="LinkName" DataValueField="LinkString" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList><asp:ObjectDataSource ID="objLinks" runat="server" SelectMethod="GetLinks"
                                TypeName="LinkManager"></asp:ObjectDataSource>
                            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/SiteData.mdb"
                                SelectCommand="SELECT ID, Name FROM Pages"></asp:AccessDataSource>
                        </td>
                        <td style="width: 5%">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                            Link:</td>
                        <td style="width: 80%">
                            <asp:TextBox ID="LinkTextBox" runat="server" Text='<%# Bind("Link") %>' MaxLength="255" Width="100%"></asp:TextBox></td>
                        <td style="width: 5%">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                            Açýklama</td>
                        <td style="width: 80%">
                            <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' MaxLength="255" TextMode="MultiLine" Width="100%"></asp:TextBox></td>
                        <td style="width: 5%">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                        </td>
                        <td style="width: 80%">
                        </td>
                        <td style="width: 5%">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                        </td>
                        <td style="width: 80%" align="right">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                Text="Ekle" ValidationGroup="insertMainGroup"></asp:LinkButton></td>
                        <td style="width: 5%">
                        </td>
                    </tr>
                </table>
            </InsertItemTemplate>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#EFEFEF" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        </asp:FormView>
        <asp:ObjectDataSource ID="objMainCategories" runat="server" DeleteMethod="RemoveCategory"
            InsertMethod="AddCategory" SelectMethod="GetCategories" TypeName="TopMenuManager"
            UpdateMethod="EditCategory">
            <DeleteParameters>
                <asp:Parameter Name="CatID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="CatName" Type="String" />                
                <asp:Parameter Name="Link" Type="String" ConvertEmptyStringToNull="false" />
                <asp:Parameter Name="Description" Type="String" ConvertEmptyStringToNull="false" />
                <asp:Parameter Name="CatID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="CatName" Type="String" />                
                <asp:Parameter Name="Link" Type="String" ConvertEmptyStringToNull="false"/>
                <asp:Parameter Name="Description" Type="String" ConvertEmptyStringToNull="false" />
            </InsertParameters>
        </asp:ObjectDataSource>
 
    </div>
    <div style="width:49%; float:right;">
    <h4>Alt Kategoriler<asp:Label ID="lblCategory" runat="server" Text=""></asp:Label></h4>
        <asp:GridView ID="GridView2" DataKeyNames="SubCatID" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" DataSourceID="objSubCategories" ForeColor="#333333" GridLines="None"
            Width="100%">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" CancelText="Ýptal" DeleteText="Sil" EditText="D&#252;zenle" InsertText="Ekle" NewText="Yeni" SelectText="Se&#231;" UpdateText="G&#252;ncelle" ButtonType="Image" CancelImageUrl="~/Admin/images/aspnet/cancel.gif" DeleteImageUrl="~/Admin/images/aspnet/delete.gif" EditImageUrl="~/Admin/images/aspnet/edit.gif" UpdateImageUrl="~/Admin/images/aspnet/save.gif" />
                 <asp:TemplateField>
            <ItemStyle Width="20px" />
                <ItemTemplate>
                    <asp:ImageButton ID="Move_Up" ImageUrl="~/Admin/images/aspnet/up.gif" runat="server" CommandArgument='<%# Bind("OrderNr") %>' OnCommand="SubCategoryMoveUp_Command"  />                  
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>            
                 <ItemTemplate>
                    <asp:ImageButton ID="Move_Down" ImageUrl="~/Admin/images/aspnet/down.gif" runat="server" CommandArgument='<%# Bind("OrderNr") %>' OnCommand="SubCategoryMoveDown_Command"  />
                </ItemTemplate>
            </asp:TemplateField>
                <asp:TemplateField HeaderText="Adý" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" MaxLength="50" Text='<%# Bind("SubCatName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox1"
                            ErrorMessage="*"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("SubCatName") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Link" SortExpression="Link">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" MaxLength="255" Text='<%# Bind("Link") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox2"
                            ErrorMessage="*"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Link") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="A&#231;ýklama" SortExpression="Description">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" MaxLength="255" Text='<%# Bind("Description") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:TemplateField>
            </Columns>
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <EmptyDataTemplate>
                Alt Kategorisi yok.
            </EmptyDataTemplate>
            <EditRowStyle BackColor="#EFEFEF" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        <br /><hr /><br />
        <h4>Ekle</h4>
        <asp:FormView ID="FormView2" runat="server" DataSourceID="objSubCategories" DefaultMode="Insert"
            Width="100%" OnItemInserting="FormView2_ItemInserting" CellPadding="4" ForeColor="#333333">
            <InsertItemTemplate>
                <table width="100%">
                    <tr>
                        <td style="width: 15%">
                            Adý:</td>
                        <td style="width: 80%">
                            <asp:TextBox ID="NameTextBox" runat="server" MaxLength="50" Text='<%# Bind("SubCatName") %>'
                                Width="100%"></asp:TextBox></td>
                        <td style="width: 5%">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="NameTextBox"
                                ErrorMessage="*" ValidationGroup="subInsertGroup"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                            Link Oluþtur:</td>
                        <td style="width: 80%">
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="objLinks"
                                DataTextField="LinkName" DataValueField="LinkString" Width="100%" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                <asp:ListItem Value="#">Yok</asp:ListItem>
                                <asp:ListItem Value="Default.aspx">Anasayfa</asp:ListItem>
                            </asp:DropDownList><asp:ObjectDataSource ID="objLinks" runat="server" SelectMethod="GetLinks"
                                TypeName="LinkManager"></asp:ObjectDataSource>
                            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/SiteData.mdb"
                                SelectCommand="SELECT [ID], [Name] FROM [Pages]"></asp:AccessDataSource>
                        </td>
                        <td style="width: 5%">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                            Link:</td>
                        <td style="width: 80%">
                            <asp:TextBox ID="LinkTextBox" runat="server" MaxLength="255" Text='<%# Bind("Link") %>'
                                Width="100%"></asp:TextBox></td>
                        <td style="width: 5%">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="LinkTextBox"
                                ErrorMessage="*" ValidationGroup="subInsertGroup"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                            Açýklama:</td>
                        <td style="width: 80%">
                            <asp:TextBox ID="DescriptionTextBox" runat="server" MaxLength="255" Text='<%# Bind("Description") %>'
                                TextMode="MultiLine" Width="100%"></asp:TextBox></td>
                        <td style="width: 5%">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%">
                        </td>
                        <td align="right" style="width: 80%">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                Text="Ekle" ValidationGroup="subInsertGroup"></asp:LinkButton></td>
                        <td style="width: 5%">
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                &nbsp;
            </InsertItemTemplate>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#EFEFEF" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        </asp:FormView>
       <asp:ObjectDataSource ID="objSubCategories" runat="server" DeleteMethod="RemoveSubCategory"
            InsertMethod="AddSubCategory" SelectMethod="GetSubCategories" TypeName="TopMenuManager"
            UpdateMethod="EditSubCategory">
            <DeleteParameters>
                <asp:Parameter Name="SubCatID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="SubCatName" Type="String" />
                <asp:Parameter Name="Link" Type="String" />
                <asp:Parameter Name="Description" Type="String" ConvertEmptyStringToNull="False" />
                <asp:Parameter Name="SubCatID" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="CatID" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="GridView1" ConvertEmptyStringToNull="False" DefaultValue="0" Name="CatID" PropertyName="SelectedValue" Type="Int32" />                
                <asp:Parameter Name="SubCatName" Type="String" />
                <asp:Parameter Name="Link" Type="String" />
                <asp:Parameter Name="Description" Type="String" ConvertEmptyStringToNull="False" />
            </InsertParameters>
        </asp:ObjectDataSource>
    
    </div>

</div>
</asp:Content>



