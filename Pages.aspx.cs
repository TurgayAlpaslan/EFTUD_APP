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
public partial class Pages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != null && Request.QueryString["ID"] != "")
        {
            int pageID = Convert.ToInt32(Request.QueryString["ID"]);
            ServerPage page = PageManager.GetPage(pageID);
            Label lblCaption = (Label)Master.FindControl("lblCaption");
            lblCaption.Text = page.Name;

        }
    }
}
