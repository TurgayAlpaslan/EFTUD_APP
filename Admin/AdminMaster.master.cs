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

public partial class Admin_AdminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack && Session["UserType"].ToString() != "Admin")
        {
            Response.Redirect("Login.aspx");
        }
        Settings settings = BSettingManager.GetSettings();
        HtmlMeta meta = new HtmlMeta();
        meta.Name = "Keywords";
        meta.Content = settings.Keywords;
        Page.Header.Controls.Add(meta);
        meta = new HtmlMeta();
        meta.Name = "Description";
        meta.Content = settings.Description;
        Page.Header.Controls.Add(meta);
        meta = new HtmlMeta();
        meta.Name = "Author";
        meta.Content = settings.Author;
        Page.Header.Controls.Add(meta);
        Page.Title = settings.Title;       
    }
    protected void btnCloseSession_Click(object sender, EventArgs e)
    {
        Session["UserType"] = "Guest";
        Session["UserID"] = "-1";
        Response.Redirect("Login.aspx");
    }
}
