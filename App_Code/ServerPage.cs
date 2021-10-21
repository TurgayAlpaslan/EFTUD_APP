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
/// Summary description for Page
/// </summary>
public class ServerPage
{
    private int _pageID;  
    private string _name;
    private string _content;
    private string _description;
    public int PageID
    {
        get { return _pageID; }
    }
    public string Name
    {
        get { return _name; }
    }
    public string Content
    {
        get { return _content; }
    }
    public string Description       
    {
        get { return _description; }
    }
	public ServerPage(int pageID, string name, string content, string description)
	{
        _pageID = pageID;
        _name = name;
        _content = content;
        _description = description;		
	}
}
