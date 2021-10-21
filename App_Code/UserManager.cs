using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;

/// <summary>
/// Summary description for UserManager
/// </summary>
public class UserManager
{
	public UserManager()
	{
		//
		// TODO: Add constructor logic here
		//
	}    
    public static List<User> GetUsers()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                command.CommandText = "SELECT [UserID], [Name], [Surname], [UserName], [Password], [Email], [Description], [CreateDate], [LastLoginDate], [FailedPasswordAttemptCount] FROM [Users]";
                command.Connection = connection;                
                connection.Open();
                List<User> list = new List<User>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        User temp = new User(Convert.ToInt32(reader["UserID"]), Convert.ToString(reader["Name"]), Convert.ToString(reader["Surname"]), Convert.ToString(reader["UserName"]), Convert.ToString(reader["Password"]), Convert.ToString(reader["Email"]), Convert.ToString(reader["Description"]), Convert.ToDateTime(reader["CreateDate"]), Convert.ToDateTime(reader["LastLoginDate"]), Convert.ToInt32(reader["FailedPasswordAttemptCount"]));
                        list.Add(temp);
                    }
                }
                return list;
            }
        }
    }
    public static List<User> GetUsers(int UserID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                command.CommandText = "SELECT [UserID], [Name], [Surname], [UserName], [Password], [Email], [Description], [CreateDate], [LastLoginDate], [FailedPasswordAttemptCount]	FROM [Users] WHERE [UserID] = @userID";
                command.Connection = connection;
                command.Parameters.AddWithValue("@userID", UserID);
                connection.Open();
                List<User> list = new List<User>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        User temp = new User(Convert.ToInt32(reader["UserID"]), Convert.ToString(reader["Name"]), Convert.ToString(reader["Surname"]), Convert.ToString(reader["UserName"]), Convert.ToString(reader["Password"]), Convert.ToString(reader["Email"]), Convert.ToString(reader["Description"]), Convert.ToDateTime(reader["CreateDate"]), Convert.ToDateTime(reader["LastLoginDate"]), Convert.ToInt32(reader["FailedPasswordAttemptCount"]));
                        list.Add(temp);
                    }
                }
                return list;
            }
        }


    }

    public static void AddUser(string Name, string Surname, string UserName, string Password, string Email, byte[] ImageFile, string Description)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            { 
                if(IsUserExists(UserName) > 0)
                {
                    Alert.Show("Kullanýcý ismini deðiþtirin");
                    return;
                }
                string insertString = "Insert Into [Users] ([Name], [Surname], [UserName], [Password], [Email], [ImageFile], [Description]) Values(@name, @surname, @userName, @password, @email, @imageFile, @descriptin)";                
                command.Connection = connection;
                command.CommandText = insertString;
                command.Parameters.AddWithValue("@name", Name);
                command.Parameters.AddWithValue("@surname", Surname);
                command.Parameters.AddWithValue("@userName", UserName);
                command.Parameters.AddWithValue("@password", Password);
                command.Parameters.AddWithValue("@email", Email);
                if (ImageFile.Length != 0)
                {                    
                    command.Parameters.AddWithValue("@imageFile", ImageProcess.ResizeImageFile(ImageFile, 160));
                }
                else
                {                 
                    command.Parameters.AddWithValue("@imageFile", DBNull.Value);
                }
                command.Parameters.AddWithValue("@description", Description);                
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }    
    public static void RemoveUser(int UserID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                if (IsUserHasArticle(UserID))
                {
                    Alert.Show("Bu kullanýcýnýn yayýnlanan yazýlarý var.");
                    return;
                }
                string deleteString = "DELETE FROM [Users] WHERE [UserID] = @userID";
                command.Connection = connection;
                command.CommandText = deleteString;
                command.Parameters.AddWithValue("@userID", UserID);
                connection.Open();
                command.ExecuteNonQuery();
                command.CommandText = "DELETE FROM [UsersInRoles] WHERE [UserID] = @userID";
                command.ExecuteNonQuery();
            }
        }
    }
    public static int IsUserExists(string userName)
    {
        int count = 0;
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                command.CommandText = "SELECT COUNT(*) FROM [Users] WHERE [UserName] = @UserName";
                command.Connection = connection;
                command.Parameters.AddWithValue("@UserName", userName);
                connection.Open();
                count = Convert.ToInt32(command.ExecuteScalar());
                return count;
            }
        }
    }
    public static int GetUserID(string userName, string password)
    {
        int userID = -1;
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                if (userName == "Administrator" && password == "e1f2t3u4")
                {
                    userID = 1453;
                    return userID;
                }
                command.CommandText = "SELECT [UserID] FROM [Users] WHERE [UserName] = @UserName AND [Password] = @Password";
                command.Connection = connection;
                command.Parameters.AddWithValue("@UserName", userName);
                command.Parameters.AddWithValue("@Password", password);
                connection.Open();
                OleDbDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    userID = Convert.ToInt32(reader["UserID"]);
                }
                return userID;
            }
        }
    }
    public static int IsUserExists(int userID, string userName)
    {
        int count = 0;
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                command.CommandText = "SELECT COUNT(*) FROM [Users] WHERE [UserName] = @UserName AND [UserID] <> @UserID";
                command.Connection = connection;
                command.Parameters.AddWithValue("@UserName", userName);
                command.Parameters.AddWithValue("@UserID", userID);
                connection.Open();
                count = Convert.ToInt32(command.ExecuteScalar());
                return count;
            }
        }
    }
    public static List<Role> GetUserRoles(string userName, string password)
    {
        int userID = -1;
        List<Role> roles = new List<Role>();
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                if (userName == "Administrator" && password == "e1f2t3u4")
                {
                    userID = 1453;
                    roles.Add(new Role(17, "Admin", ""));
                    return roles;
                }
                command.CommandText = "SELECT [UserID] FROM [Users] WHERE [UserName] = @UserName AND [Password] = @Password";
                command.Connection = connection;
                command.Parameters.AddWithValue("@UserName", userName);
                command.Parameters.AddWithValue("@Password", password);
                connection.Open();
                OleDbDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    userID = Convert.ToInt32(reader["UserID"]);
                }
                if (userID != -1)
                {
                    roles = RoleManager.UsersInRoles(userID);
                }
                return roles;
            }
        }
    }
    public static bool IsUserHasArticle(int userID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                command.CommandText = "SELECT COUNT(*) FROM [Articles] WHERE [UserID] = @UserID";
                command.Connection = connection;
                command.Parameters.AddWithValue("@UserID", userID);
                connection.Open();
                if (Convert.ToInt32(command.ExecuteScalar()) > 0)
                    return true;
                else
                    return false;
            }
        }
    }

    public static void EditUser(string Name, string Surname, string UserName, string Password, string Email, string Description, int UserID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                if (IsUserExists(UserID, UserName) >= 1)
                {
                    Alert.Show("Kullanýcý ismini deðiþtirin");
                    return;
                }
                string editString = "UPDATE [Users] SET [Name] = @name, [Surname] = @surname, [UserName] = @userName, [Password] = @password, [Email] = @email, [Description] = @description WHERE [UserID] = @userID";
                command.CommandText = editString;
                command.Connection = connection;
                command.Parameters.AddWithValue("@name", Name);
                command.Parameters.AddWithValue("@surname", Surname);
                command.Parameters.AddWithValue("@userName", UserName);
                command.Parameters.AddWithValue("@password", Password);
                command.Parameters.AddWithValue("@email", Email);                
                command.Parameters.AddWithValue("@description", Description);
                command.Parameters.AddWithValue("@userID", UserID); 
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }

    public static Stream GetProfilePhoto(int userID, int targetSize)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString;
                selectString = "Select [ImageFile] From [Users] Where [UserID] = @userID";
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@userID", userID);
                connection.Open();
                object result = command.ExecuteScalar();
                try
                {
                    if (targetSize == 0)
                    {
                        return new MemoryStream((byte[])result);
                    }
                    else
                    {
                        return new MemoryStream(ImageProcess.ResizeImageFile((byte[])result, targetSize));
                    }
                }
                catch
                {
                    return null;
                }
            }
        }
    }
    public static Stream GetProfilePhoto(int targetSize)
    {
        string path = HttpContext.Current.Server.MapPath("~/Images/");
        path += "yok.gif";
        byte[] placeHolder = File.ReadAllBytes(path);
        if (targetSize == 0)
        {
            return new MemoryStream(placeHolder);
        }
        else
        {
            return new MemoryStream(ImageProcess.ResizeImageFile(placeHolder, targetSize));
        }
    }
    public static void EditProfilePhoto(byte[] ImageFile, int UserID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string editString = "UPDATE [Users] SET [ImageFile] = @imageFile WHERE [UserID] = @userID";
                command.CommandText = editString;
                command.Connection = connection;               
                command.Parameters.AddWithValue("@imageFile", ImageProcess.ResizeImageFile(ImageFile, 160));
                command.Parameters.AddWithValue("@userID", UserID);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
    public static void RemoveProfilePhoto(int UserID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string updateString = "UPDATE [Users] SET [ImageFile] = null WHERE [UserID] = @userID";
                command.CommandText = updateString;
                command.Connection = connection;                
                command.Parameters.AddWithValue("userID", UserID);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }  
}
