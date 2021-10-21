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
/// Summary description for Video
/// </summary>
public class Video
{
	public Video()
	{		
	}   

    public Video(int videoID, string title,  string videoPath, string thumbnail, DateTime addedDate)
    {
        _videoID = videoID;
        _title = title;       
        _videoPath = videoPath;
        _thumbnail = thumbnail;
        _addedDate = addedDate;        
    }
   
    private string _videoPath;

    public string VideoPath
    {
        get { return _videoPath; }
        set { _videoPath = value; }
    }

    private int _videoID;

    public int VideoID
    {
        get { return _videoID; }
        set { _videoID = value; }
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
    

    private string _thumbnail;

    public string Thumbnail
    {
        get { return _thumbnail; }
        set { _thumbnail = value; }
    }

    
}
