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
/// Summary description for Newspaper
/// </summary>
public class Newspaper
{
    private int _id;
    public int Id
    {
        get { return _id; }
        set { _id = value; }
    }

    private DateTime _addedDate;
    public DateTime AddedDate
    {
        get { return _addedDate; }
        set { _addedDate = value; }
    }

    private string _description;

    public string Description
    {
        get { return _description; }
        set { _description = value; }
    }

	public Newspaper()
	{
		
	}
    public Newspaper(int id, DateTime addedDate, string description)
    {
        _id = id;
        _addedDate = addedDate;
        _description = description;
    }
}
