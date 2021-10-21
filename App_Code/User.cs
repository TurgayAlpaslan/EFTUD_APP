using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{
	public User()
	{		
	}
    public User(int userID, string name, string surname, string userName, string password, string email, string description, DateTime createDate, DateTime lastLoginDate, int failedPasswordAttemptCount)
    {
        _userID = userID;
        _name = name;
        _surname = surname;
        _userName = userName;
        _password = password;
        _email = email;
        _description = description;
        _createDate = createDate;
        _lastLoginDate = lastLoginDate;
        _failedPasswordAttemptCount = failedPasswordAttemptCount;
    }
    private int _userID;
    private string _name;
    private string _surname;
    private string _userName;
    private string _password;
    private string _email;
    private string _description;
    private DateTime _createDate;
    private DateTime _lastLoginDate;
    private int _failedPasswordAttemptCount;
    private List<Role> _roles;

    public int UserID
    {
        get { return _userID; }
    }
    public string Name
    {
        get { return _name; }
    }
    public string Surname
    {
        get { return _surname; }
    }
    public string UserName
    {
        get { return _userName; }
    }
    public string Password
    {
        get { return _password; }
    }
    public string Email
    {
        get { return _email; }
    }
    public string Description
    {
        get { return _description; }
    }
    public DateTime CreateDate
    {
        get { return _createDate; }
    }
    public DateTime LastLoginDate
    {
        get { return _lastLoginDate; }
    }
    public int FailedPasswordAttemptCount
    {
        get { return _failedPasswordAttemptCount; }
    }
}
