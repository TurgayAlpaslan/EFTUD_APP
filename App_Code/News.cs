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
/// Summary description for News
/// </summary>
public class News
{
    private int _newsID;

    public int NewsID
    {
        get { return _newsID; }
        set { _newsID = value; }
    }
    private string _caption;

    public string Caption
    {
        get { return _caption; }
        set { _caption = value; }
    }
    private string _content;

    public string Content
    {
        get { return _content; }
        set { _content = value; }
    }
    private DateTime _addedDate;

    public DateTime AddedDate
    {
        get { return _addedDate; }
        set { _addedDate = value; }
    }
  
    public News(int newsID, string caption)
    {
        _newsID = newsID;
        _caption = caption;
    }
    public News(int newsID, string caption, DateTime addedDate)
    {
        _newsID = newsID;
        _caption = caption.Replace("'", "&#39;");     
        _addedDate = addedDate;        
    }
    public News(int newsID, string caption, string content, DateTime addedDate)
    {
        _newsID = newsID;
        _caption = caption.Replace("'", "&#39;");
        _content = content;
        _addedDate = addedDate;        
    }
	public News()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}
