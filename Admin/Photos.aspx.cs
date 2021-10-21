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
using System.IO;

public partial class Admin_Photos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["AlbumID"] == null || Request.QueryString["AlbumID"] == "") FormView1.Visible = false;       
    }
    
    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        if (((Byte[])e.Values["ImageFile"]).Length == 0) e.Cancel = true;  
    }   
}
