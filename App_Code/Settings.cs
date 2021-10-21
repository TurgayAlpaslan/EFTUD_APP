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
/// Summary description for Settings
/// </summary>
public class Settings
{
    private string _title;
    public string Title
    {
        get { return _title; }
        set { _title = value; }    
    }

    private string _keywords;
    public string Keywords
    {
        get { return _keywords; }
        set { _keywords = value; }
    }

    private string _author;
    public string Author
    {
        get { return _author; }
        set { _author = value; }
    }
    private string _description;
    public string Description
    {
        get { return _description; }
        set { _description = value; }
    }
    public Settings(string title, string keywords, string author, string description)
    {
        _title = title;
        _keywords = keywords;
        _author = author;
        _description = description;
    }
}
