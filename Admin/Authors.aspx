<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Authors.aspx.cs" Inherits="Admin_Authors" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
		<div>
			<h3>Yazarlar</h3>					
			
			<asp:gridview id="GridView1" runat="server"
				datasourceid="ObjectDataSource1" datakeynames="UserID" cellpadding="4"
				autogeneratecolumns="False" width="100%" showheader="False" ForeColor="#333333" GridLines="None">
				<EmptyDataTemplate>
				Gösterilecek yazar yok
				</EmptyDataTemplate>
				<columns>
					<asp:TemplateField>
						<ItemStyle Width="140px" />
						<ItemTemplate>
							<table border="0" cellpadding="0" cellspacing="0" class="photo-frame">
								<tr>								   
									<td class="topx--"></td>
									<td class="top-x-"></td>
									<td class="top--x"></td>									
								</tr>
								<tr>
									<td class="midx--"></td>
									<td><a href="Articles.aspx?UserID=<%# Eval("UserID") %>">
										<img src="../Handler.ashx?TargetSize=120&UserID=<%# Eval("UserID") %>" style="border:4px solid white" alt="Profil Resmi <%# Eval("UserID") %>" /></a></td>
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
                    <asp:TemplateField>
                        <ItemTemplate>                       
                        <%# Eval("Name") + " " + Eval("Surname")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemStyle Width="100px" />
                        <ItemTemplate>
                            <a href="AddUpdateArticle.aspx?UserID=<%# Eval("UserID")%>">Yazý Ekle</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>                        
                        <ItemTemplate>
                            <a href="Articles.aspx?UserID=<%# Eval("UserID") %>">Yazýlarý Görüntüle</a>
                        </ItemTemplate>
                    </asp:TemplateField>
				</columns>
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
			</asp:gridview>
            &nbsp;
		</div>

	
	
	<asp:ObjectDataSource ID="ObjectDataSource1" Runat="server" TypeName="AuthorManager" 
		SelectMethod="GetAllAuthors" >
	</asp:ObjectDataSource>
    &nbsp; &nbsp;&nbsp; &nbsp;


        
        </div>
</asp:Content>

