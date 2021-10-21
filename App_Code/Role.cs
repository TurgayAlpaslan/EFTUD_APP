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
/// Summary description for Role
/// </summary>
public class Role
{
	public Role()
	{
		//
		// TODO: Add constructor logic here
		//        
	}

    public Role(int roleID, string roleName, string description)
    {
        _roleID = roleID;
        _roleName = roleName;
        _description = description;
    }

    private int _roleID;
    private string _roleName;
    private string _description;
    
    public int RoleID
    {
        get { return _roleID; }
        set { _roleID = value; }
    }
    public string RoleName
    {
        get { return _roleName; }
        set { _roleName = value; }
    }
    public string Description
    {
        get { return _description; }
        set { _description = value; }
    }
}
