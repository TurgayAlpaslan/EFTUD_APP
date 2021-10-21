using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for Link
/// </summary>
public class Link
{
	public Link(string linkName, string link)
	{
        _linkName = linkName;
        _link = link;
		
	}
    private string _linkName;
    private string _link;

    public string LinkName
    {
        get { return _linkName; }
        set { _linkName = value; }
    }
    public string LinkString
    {
        get { return _link; }
        set { _link = value; }
    }
}
