<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Photos.aspx.cs" Inherits="Admin_Photos" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

		
			<h4>Fotoðraf Ekle</h4>
			<p>Fotoðraf eklemek için bir resim dosyasý ve baþlýk seçerek <b>ekle</b> butonunu týklayýn.</p><br />
			<asp:FormView ID="FormView1" Runat="server" 
				DataSourceID="ObjectDataSource1" DefaultMode="Insert" CellPadding="4" OnItemInserting="FormView1_ItemInserting" ForeColor="#333333">
				<InsertItemTemplate>
					<p>
						<b>Fotoðraf:</b><br />
						<asp:FileUpload ID="PhotoFile" Runat="server" FileBytes='<%# Bind("ImageFile") %>' />(604
                        x 453)<br />
						<b>Baþlýk:</b><br />
						<asp:TextBox ID="PhotoCaption" Runat="server" Width="364px" Text='<%# Bind("Caption") %>' ValidationGroup="insert" MaxLength="255" />
					</p>
					<p style="text-align:right;">						
						<asp:Button ID="AddNewPhotoButton" runat="server" CommandName="Insert" Text="Ekle" ValidationGroup="insert" />
					</p>
				</InsertItemTemplate>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#EEEEEE" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
			</asp:FormView>
			<hr />
			<h4>Bu albümdeki fotoðraflar</h4>
    <br />
			<asp:gridview id="GridView1" runat="server" datasourceid="ObjectDataSource1" 
				datakeynames="PhotoID" cellpadding="4" EnableViewState="False"
				autogeneratecolumns="False" width="100%" showheader="False" AllowPaging="True" ForeColor="#333333" GridLines="None" >
				<EmptyDataTemplate>
					Gösterilecek fotoðraf yok.
				</EmptyDataTemplate>
				<columns>
					<asp:TemplateField>
						<ItemStyle Width="140px" BorderStyle="None" BorderWidth="0px" />
						<ItemTemplate>
							<table align="center" border="0" cellpadding="0" cellspacing="0" class="photo-frame">
								<tr>
									<td class="topx--"></td>
									<td class="top-x-"></td>
									<td class="top--x"></td>
								</tr>
								<tr>
									<td class="midx--"></td>
									<td><a href='Details.aspx?AlbumID=<%# Eval("AlbumID") %>&PhotoID=<%# Eval("PhotoID") %>'>
										<img src='../Handler.ashx?TargetSize=120&PhotoID=<%# Eval("PhotoID") %>' style="border:2px solid white;" alt='Fotoðraf No: <%# Eval("PhotoID") %>' /></a></td>
									<td class="mid--x"></td>
								</tr>
								<tr>
									<td class="botx--"></td>
									<td class="bot-x-"></td>
									<td class="bot--x"></td>
								</tr>
							</table>
						</ItemTemplate>
					</asp:TemplateField>
                    <asp:TemplateField HeaderText="Caption">
                        <ItemStyle BorderStyle="None" BorderWidth="0px" />
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Caption") %>' ValidationGroup="edit" MaxLength="255"></asp:TextBox>&nbsp;
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Caption") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" CancelText="Ýptal" DeleteText="Sil" EditText="D&#252;zenle"
                        InsertText="Ekle" NewText="Yeni" SelectText="Se&#231;" ShowDeleteButton="True"
                        ShowEditButton="True" UpdateText="G&#252;ncelle">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:CommandField>
				</columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <EditRowStyle BackColor="#EEEEEE" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
			</asp:gridview>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="RemovePhoto"
                InsertMethod="AddPhoto" SelectMethod="GetPhotos" TypeName="PhotoManager" UpdateMethod="EditPhoto">
                <SelectParameters>
                    <asp:QueryStringParameter Name="AlbumID" QueryStringField="AlbumID" Type="Int32" ConvertEmptyStringToNull="false" />
                </SelectParameters>
                <InsertParameters>
                    <asp:QueryStringParameter Name="AlbumID" QueryStringField="AlbumID" Type="Int32" />
                    <asp:Parameter Name="Caption" Type="String" ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="ImageFile" Type="Object" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Caption" Type="String" ConvertEmptyStringToNull="false"/>
                    <asp:Parameter Name="PhotoID" Type="Int32" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="PhotoID" Type="Int32" />
                </DeleteParameters>
            </asp:ObjectDataSource>
		
</asp:Content>

