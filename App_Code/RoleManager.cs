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
using System.Data.OleDb;
/// <summary>
/// Summary description for RoleManager
/// </summary>
public class RoleManager
{
	public RoleManager()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static List<Role> GetRoles()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                command.CommandText = "SELECT *	FROM [Roles]";
                command.Connection = connection;
                connection.Open();
                List<Role> list = new List<Role>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Role temp = new Role(Convert.ToInt32(reader["RoleID"]), Convert.ToString(reader["RoleName"]), Convert.ToString(reader["Description"]));
                        list.Add(temp);
                    }
                }
                return list;
            }
        }
    }

    public static List<Role> UsersInRoles(int UserID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                command.CommandText = "SELECT Roles.RoleID, Roles.RoleName, Roles.Description FROM (UsersInRoles INNER JOIN Roles ON UsersInRoles.RoleID = Roles.RoleID) WHERE (UsersInRoles.UserID = @userID)";
                command.Connection = connection;
                command.Parameters.AddWithValue("@userID", UserID);
                connection.Open();
                List<Role> list = new List<Role>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Role temp = new Role(Convert.ToInt32(reader[0]), Convert.ToString(reader[1]), Convert.ToString(reader[2]));
                        list.Add(temp);
                    }
                }
                return list;
            }
        }
    }
    public static bool UserInRole(int UserID, int RoleID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                bool flag = false;
                command.CommandText = "SELECT * FROM [UsersInRoles] WHERE [UserID] = @userID AND [RoleID] = @roleID";
                command.Connection = connection;
                command.Parameters.AddWithValue("@userID", UserID);
                command.Parameters.AddWithValue("@RoleID", RoleID);
                connection.Open();                
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        flag = true;
                    }
                }
                return flag;
            }
        }
    }

    public static void AddUserRole(int[] RoleID, int UserID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string insertString = "Insert Into [UsersInRoles] ([UserID], [RoleID]) Values(@userID, @roleID)";
                command.Connection = connection;
                command.CommandText = insertString;
                command.Parameters.AddWithValue("@userID", UserID);
                connection.Open();
                foreach (int roleID in RoleID)
                {
                    command.Parameters.AddWithValue("@roleID", roleID);
                    command.ExecuteNonQuery();
                    command.Parameters.RemoveAt("@roleID");
                }                                            
            }
        }
    }
    public static void UpdateUsersInRoles(int UserID, CheckBox checkBox)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string queryString;
                if (checkBox.Checked)
                {
                    queryString = "Insert Into [UsersInRoles] ([UserID], [RoleID]) Values(@userID, @roleID)";
                }
                else
                {
                    if (UserManager.IsUserHasArticle(UserID) && checkBox.Text == "Yazar")
                    {
                        Alert.Show("Bu kullanýcýnýn yayýnlanan yazýlarý var.");
                        checkBox.Checked = true;
                        return;
                    }
                    queryString = "Delete From [UsersInRoles] Where [UserID] = @userID And [RoleID] = @roleID";
                }
                command.Connection = connection;
                command.CommandText = queryString;
                command.Parameters.AddWithValue("@userID", UserID);
                command.Parameters.AddWithValue("@roleID", Convert.ToInt32(checkBox.ID));
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
}
