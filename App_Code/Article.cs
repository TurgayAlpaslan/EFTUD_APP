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
/// Summary description for Articles
/// </summary>
public class Article
{
    private int _articleID;

    public int ArticleID
    {
        get { return _articleID; }
        set { _articleID = value; }
    }
    private int _userID;

    public int UserID
    {
        get { return _userID; }
        set { _userID = value; }
    }
    private DateTime _addedDate;

    public DateTime AddedDate
    {
        get { return _addedDate; }
        set { _addedDate = value; }
    }
    private string _title;

    public string Title
    {
        get { return _title; }
        set { _title = value; }
    }
    private string _content;

    public string Content
    {
        get { return _content; }
        set { _content = value; }
    }
    
	public Article()
	{		
	}
    public Article(int articleID, int userID, DateTime addedDate, string title)
    {
        _articleID = articleID;
        _userID = userID;
        _addedDate = addedDate;
        _title = title;        
    }
    public Article(int articleID, int userID, DateTime addedDate, string title, string content)
    {
        _articleID = articleID;
        _userID = userID;
        _addedDate = addedDate;
        _title = title;
        _content = content;        
    }
}
