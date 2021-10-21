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
using System.IO;
using System.Data.OleDb;
/// <summary>
/// Summary description for NotificationManager
/// </summary>
public class NotificationManager
{
    public static List<News> GetNotifications()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "SELECT [NotificationID], [Caption], [AddedDate] FROM [Notifications] ORDER BY [AddedDate] DESC";
                command.Connection = connection;
                command.CommandText = selectString;
                connection.Open();
                List<News> list = new List<News>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        News temp = new News(Convert.ToInt32(reader["NotificationID"]), reader["Caption"].ToString(), Convert.ToDateTime(reader["AddedDate"]));
                        list.Add(temp);
                    }
                }
                return list;
            }
        }
    }
    public static List<News> GetNotification(int NotificationID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "SELECT [NotificationID], [Caption], [Content], [AddedDate] FROM [Notifications] Where [NotificationID] = @NotificationID";
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@NotificationID", NotificationID);
                connection.Open();
                List<News> list = new List<News>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        News temp = new News(Convert.ToInt32(reader["NotificationID"]), reader["Caption"].ToString(), reader["Content"].ToString(), Convert.ToDateTime(reader["AddedDate"]));
                        list.Add(temp);
                    }
                }
                return list;
            }
        }
    }

    public static void AddNotification(string Caption, string Content, DateTime AddedDate)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string insertString = "INSERT INTO [Notifications] ([Caption], [Content], [AddedDate]) VALUES (@caption, @content, @addedDate)";
                command.Connection = connection;
                command.CommandText = insertString;
                command.Parameters.AddWithValue("@caption", Caption);
                command.Parameters.AddWithValue("@content", Content);                
                command.Parameters.AddWithValue("@addedDate", AddedDate);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
    public static void RemoveNotification(int NewsID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string deleteString = "DELETE FROM [Notifications] WHERE [NotificationID] = @NotificationID";
                command.Connection = connection;
                command.CommandText = deleteString;
                command.Parameters.AddWithValue("@NotificationID", NewsID);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
    public static void EditNotification(string Caption, string Content, string AddedDate, int NotificationID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string editString = "UPDATE [Notifications] SET [Caption] = @Caption, [Content] = @Content, [AddedDate] = @AddedDate WHERE [NotificationID] = @NotificationID";
                command.Parameters.AddWithValue("@Caption", Caption);
                command.Parameters.AddWithValue("@Content", Content);
                command.Parameters.AddWithValue("@AddedDate", Convert.ToDateTime(AddedDate));
                command.Parameters.AddWithValue("@NotificationID", NotificationID);
                command.CommandText = editString;
                command.Connection = connection;
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }   
}
