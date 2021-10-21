using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;
using System.Collections.Generic;
public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["UserType"].ToString() == "Admin")
            {
                Response.Redirect("default.aspx");
            }
            if (Session["UserType"].ToString() == "Yazar")
            {
                Response.Redirect("myProfile.aspx");
            }
        }
    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        List<Role> roles = new List<Role>();
        int userID = UserManager.GetUserID(txtUserName.Text, txtPassword.Text);
        if (userID != -1)
        {
            roles = UserManager.GetUserRoles(txtUserName.Text, txtPassword.Text);
            foreach (Role role in roles)
            {                
                Session.Add("UserType", role.RoleName);
                if (role.RoleName == "Admin")
                {
                    break;
                }
            }
            Session.Add("UserID", userID);
            Response.Redirect("Default.aspx");
        }
        else
        {
            Alert.Show("Kullanıcı adı ve/veya şifre hatalı");
        }
    }    
}
