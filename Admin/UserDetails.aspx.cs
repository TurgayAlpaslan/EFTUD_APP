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
using System.Collections.Generic;

public partial class Admin_UserDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["UserID"] != null)
        {            
            int id = Convert.ToInt32(Request.QueryString["UserID"]);
            ProfilePhoto.ImageUrl = "../handler.ashx?TargetSize=160&UserID=" + id.ToString();
            List<Role> roles = RoleManager.GetRoles();
            foreach (Role role in roles)
            {
                CheckBox checkBox = new CheckBox();
                checkBox.ID = role.RoleID.ToString();
                checkBox.Text = role.RoleName;
                checkBox.Checked = RoleManager.UserInRole(id, role.RoleID);
                checkBox.AutoPostBack = true;
                checkBox.CheckedChanged += new EventHandler(checkbox_checkChanged);
                Panel2.Controls.Add(checkBox);
            }
        }
        else
        {
            Panel1.Visible = false;
        }
        
    }
    protected void checkbox_checkChanged(object sender, EventArgs e)
    {
        if (Request.QueryString["UserID"] != null)
        {
            int id = Convert.ToInt32(Request.QueryString["UserID"]);
            CheckBox checkBox = (CheckBox)sender;
            RoleManager.UpdateUsersInRoles(id, checkBox);
        }
        

    }

    protected void DeleteButton_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["UserID"] != null)
        {
            int id = Convert.ToInt32(Request.QueryString["UserID"]);
            UserManager.RemoveProfilePhoto(id);
        }
    }

   
    protected void SaveProfilePhotoButton_Click(object sender, EventArgs e)
    {

        if (FileUpload1.HasFile && Request.QueryString["UserID"] != null)
        {
            int id = Convert.ToInt32(Request.QueryString["UserID"]);
            UserManager.EditProfilePhoto(FileUpload1.FileBytes, id);
        }
    }
}
