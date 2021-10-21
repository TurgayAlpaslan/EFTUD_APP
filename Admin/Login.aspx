<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
   
        <table style="margin:0 auto; font-family:Tahoma Verdana; font-size:9pt;">
            <tr>
                <td style="width: 100px; height: 26px; text-align: right;">
                    Kullanıcı Adı:</td>
                <td style="width: 126px; height: 26px;">
                    <asp:TextBox ID="txtUserName" runat="server" Width="120px"></asp:TextBox></td>
                <td style="width: 100px; height: 26px;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 100px; text-align: right;">
                    Şifre:</td>
                <td style="width: 126px">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="120px"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                        ErrorMessage="*"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 126px; text-align: right;">
                    <asp:Button ID="btnOk" runat="server" Text="Giriş" OnClick="btnOk_Click" /></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblError" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 126px">
                </td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 126px">
                </td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 126px">
                </td>
                <td style="width: 100px">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
