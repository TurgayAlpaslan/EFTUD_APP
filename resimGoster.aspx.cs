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

public partial class resimGoster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {   string size = Request.QueryString["TargetSize"];
        string id = Request.QueryString["PhotoID"];
        string albumID = PhotoManager.GetAlbumID(Convert.ToInt32(id));
        Image1.ImageUrl = "Handler.ashx?TargetSize=" + size + "&PhotoID=" + id;
        HyperLink1.NavigateUrl = "GetAlbum.aspx?AlbumID=" + albumID;
    }
}
