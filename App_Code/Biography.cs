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
/// Summary description for Biography
/// </summary>
public class Biography
{
    private int _id;
    public int Id
    {
        get { return _id; }
    }

    private string _title;
    public string Title
    {
        get { return _title; }
    }

    private string _name;
    public string Name
    {
        get { return _name; }
    }

    private string _surname;
    public string Surname
    {
        get { return _surname; }
    }

    private DateTime _birthday;
    public DateTime Birthday
    {
        get { return _birthday; }
    }

    private string _death;
    public string Death
    {
        get { return _death; }
    }

    private string _content;
    public string Content
    {
        get { return _content; }
    }
    public string LContent
    {
        get
        {
            if (_content.Length <= 1800)
            {
                return _content;
            }
            else
            {
                return HttpContext.Current.Server.HtmlDecode(_content).Substring(0, 1800) + "...";                
            }
        }
    }
    public string BirthdayAndDeath
    {
        get
        {
            string s = Convert.ToDateTime(_birthday).Year.ToString() + " - ";
            if (_death != null && _death != "")
            {
                s += Convert.ToDateTime(_death).Year.ToString();
            }
            else
            {
                s += "...";
            }
            return s;
        }
    }
	public Biography(int Id, string Title, string Name, string Surname, DateTime Birthday, string Death, string Content)
	{
        _id = Id;
        _title = Title;
        _name = Name;
        _surname = Surname;
        _birthday = Birthday;
        _death = Death;
        _content = Content;
	}
    public Biography(int Id, string Title, string Name, string Surname, DateTime Birthday, string Death)
    {
        _id = Id;
        _title = Title;
        _name = Name;
        _surname = Surname;
        _birthday = Birthday;
        _death = Death;       
    }
    public Biography(int Id, string Title, string Name, string Surname)
    {
        _id = Id;
        _title = Title;
        _name = Name;
        _surname = Surname;
    }
    public override string ToString()
    {
        return _title + " " + _name + " " + _surname;
    }
}
