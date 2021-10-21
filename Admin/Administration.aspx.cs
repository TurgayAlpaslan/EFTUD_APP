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

public partial class Admin_Administration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Up_Command(object sender, CommandEventArgs e)
    {       
        AdministrationManager.MoveUp(Convert.ToInt32(e.CommandArgument));
        GridView1.DataBind();
    }
    protected void Down_Command(object sender, CommandEventArgs e)
    {        
        AdministrationManager.MoveDown(Convert.ToInt32(e.CommandArgument));
        GridView1.DataBind();
    }
}
