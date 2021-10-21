<%@ Page Language="C#" MasterPageFile="~/Admin/AdminMaster.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="AddUpdateBiography.aspx.cs" Inherits="Admin_AddUpdateBiography" Title="Untitled Page" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript" src="images/date-picker.js"></script>

<asp:FormView ID="FormView1" runat="server" DefaultMode="Edit"
        Width="100%" CellPadding="4" ForeColor="#333333" DataSourceID="ObjectDataSource1">
        <EditItemTemplate>
            <table width="100%">
                 <tr>
                    <td style="width: 120px">
                        Ünvaný:</td>
                    <td>
                        <asp:TextBox ID="Title" runat="server" Text='<%# Bind("Title") %>' Width="512px" MaxLength="200"></asp:TextBox>                        
                    </td>
                </tr>
                <tr>
                    <td style="width: 120px">
                        Adý:</td>
                    <td>
                        <asp:TextBox ID="Name" runat="server" Text='<%# Bind("Name") %>' Width="512px" MaxLength="200"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name"
                            ErrorMessage="Ýsim girmelisiniz" Display="Dynamic"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td style="width: 120px">
                        Soyadý:</td>
                    <td>
                        <asp:TextBox ID="Surname" runat="server" Text='<%# Bind("Surname") %>' Width="512px" MaxLength="200"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Surname"
                            ErrorMessage="Soyisim girmelisiniz" Display="Dynamic"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                 <tr>
                    <td style="width: 120px">
                        Doðum Tarihi:</td>
                    <td>
                        <asp:TextBox ID="Birthday" runat="server" Text='<%# Bind("Birthday", "{0:d}") %>'></asp:TextBox>
                        <a href="#" onclick="javascript:displayDatePicker('<%=FormView1.FindControl("Birthday").ClientID %>');return false;">
                            <img style="border: 0px none;" src="images/cal.jpg" alt="calculator" align="absMiddle" />
                        </a>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="Birthday"
                            runat="server" ErrorMessage="Bir tarih girmelisiniz" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>   
                 <tr>
                    <td style="width: 120px">
                        Ölüm Tarihi:</td>
                    <td>
                        <asp:TextBox ID="Death" runat="server" Text='<%# Bind("Death", "{0:d}") %>'></asp:TextBox>
                        <a href="#" onclick="javascript:displayDatePicker('<%=FormView1.FindControl("Death").ClientID %>');return false;">
                            <img style="border: 0px none;" src="images/cal.jpg" alt="calculator" align="absMiddle" />
                        </a>               
                    </td>
                </tr>             
                <tr>
                    <td style="width: 120px" valign="top">
                        Biyografi:</td>
                    <td>
                        <FCKeditorV2:FCKeditor ID="Content" Value='<%# Bind("Content") %>' runat="server"
                            Height="600px" Width="100%">
                        </FCKeditorV2:FCKeditor>
                    </td>
                </tr>
                <tr>
                    <td style="width: 120px;">
                        Resim:</td>
                    <td>
                        <asp:FileUpload ID="ImageFile" runat="server" FileBytes='<%# Bind("ImageFile") %>' />(160
                        * 120)
                    </td>
                </tr>                  
                <tr>
                    <td align="right" colspan="2">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Kaydet" Font-Bold="True" Font-Size="10pt"></asp:LinkButton></td>
                </tr>
            </table>
        </EditItemTemplate>
        <InsertItemTemplate>
            <table width="100%">
                 <tr>
                    <td style="width: 120px">
                        Ünvaný:</td>
                    <td>
                        <asp:TextBox ID="Title" runat="server" Text='<%# Bind("Title") %>' Width="512px" MaxLength="200"></asp:TextBox>                        
                    </td>
                </tr>
                <tr>
                    <td style="width: 120px">
                        Adý:</td>
                    <td>
                        <asp:TextBox ID="Name" runat="server" Text='<%# Bind("Name") %>' Width="512px" MaxLength="200"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name"
                            ErrorMessage="Ýsim girmelisiniz" Display="Dynamic"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td style="width: 120px">
                        Soyadý:</td>
                    <td>
                        <asp:TextBox ID="Surname" runat="server" Text='<%# Bind("Surname") %>' Width="512px" MaxLength="200"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Surname"
                            ErrorMessage="Soyisim girmelisiniz" Display="Dynamic"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                 <tr>
                    <td style="width: 120px">
                        Doðum Tarihi:</td>
                    <td>
                        <asp:TextBox ID="Birthday" runat="server" Text='<%# Bind("Birthday", "{0:d}") %>'></asp:TextBox>
                        <a href="#" onclick="javascript:displayDatePicker('<%=FormView1.FindControl("Birthday").ClientID %>');return false;">
                            <img style="border: 0px none;" src="images/cal.jpg" alt="calculator" align="absMiddle" />
                        </a>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="Birthday"
                            runat="server" ErrorMessage="Bir tarih girmelisiniz" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>   
                 <tr>
                    <td style="width: 120px">
                        Ölüm Tarihi:</td>
                    <td>
                        <asp:TextBox ID="Death" runat="server" Text='<%# Bind("Death", "{0:d}") %>'></asp:TextBox>
                        <a href="#" onclick="javascript:displayDatePicker('<%=FormView1.FindControl("Death").ClientID %>');return false;">
                            <img style="border: 0px none;" src="images/cal.jpg" alt="calculator" align="absMiddle" />
                        </a>               
                    </td>
                </tr>             
                <tr>
                    <td style="width: 120px" valign="top">
                        Biyografi:</td>
                    <td>
                        <FCKeditorV2:FCKeditor ID="Content" Value='<%# Bind("Content") %>' runat="server"
                            Height="600px" Width="100%">
                        </FCKeditorV2:FCKeditor>
                    </td>
                </tr>
                <tr>
                    <td style="width: 120px;">
                        Resim:</td>
                    <td>
                        <asp:FileUpload ID="ImageFile" runat="server" FileBytes='<%# Bind("ImageFile") %>' />(160
                        * 120)
                    </td>
                </tr>                  
                <tr>
                    <td align="right" colspan="2">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Ekle" Font-Bold="True" Font-Size="10pt"></asp:LinkButton></td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </InsertItemTemplate>        
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#EFEFEF" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    </asp:FormView>
    &nbsp;
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" InsertMethod="AddBiography"
        SelectMethod="GetBiography" TypeName="BiographyManager" UpdateMethod="UpdateBiography">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="BiographyID" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" ConvertEmptyStringToNull="False" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Surname" Type="String" />
            <asp:Parameter Name="Birthday" Type="String" />
            <asp:Parameter Name="Death" Type="String" ConvertEmptyStringToNull="False" />
            <asp:Parameter Name="Content" Type="String" ConvertEmptyStringToNull="False" />
            <asp:Parameter Name="ImageFile" Type="Object" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Title" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Surname" Type="String" />
            <asp:Parameter Name="Birthday" Type="String" />
            <asp:Parameter Name="Death" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="Content" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter Name="ImageFile" Type="Object" />
             <asp:QueryStringParameter Name="ID" QueryStringField="BiographyID" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>

