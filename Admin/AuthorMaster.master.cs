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

public partial class Admin_AuthorMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack && Session["UserType"].ToString() != "" && Session["UserType"].ToString() != null)
        {
            string userType = Session["UserType"].ToString();
            if (userType != "Admin" && userType != "Yazar")
            {
                Response.Redirect("Login.aspx");
            }
        }

    }
    protected void btnCloseSession_Click(object sender, EventArgs e)
    {
        Session["UserType"] = "Guest";
        Session["UserID"] = "-1";
        Response.Redirect("Login.aspx");
    }
}
