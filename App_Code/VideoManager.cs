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
using System.Web.Configuration;
using System.IO;

/// <summary>
/// Summary description for VideoManager
/// </summary>
public class VideoManager
{
	public VideoManager()
	{		
	}
    /// <summary>
    /// Get all videos
    /// </summary>
    /// <returns></returns>
    public static List<Video> GetAllVideoes()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {

            using (OleDbCommand command = new OleDbCommand("Select * From Videos Order By AddedDate Desc", connection))
            {
                connection.Open();
                List<Video> videoList = new List<Video>();
                OleDbDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Video temp = new Video(Convert.ToInt32(reader["VideoID"]), reader["Title"].ToString(), reader["VideoPath"].ToString(), reader["Thumbnail"].ToString(), Convert.ToDateTime(reader["AddedDate"]));
                    videoList.Add(temp);
                }
                return videoList;
            }
        }
    }

    public static List<Video> GetTopNineVideoes()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {

            using (OleDbCommand command = new OleDbCommand("Select Top 9 * From Videos Order By AddedDate Desc", connection))
            {
                connection.Open();
                List<Video> videoList = new List<Video>();
                OleDbDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Video temp = new Video(Convert.ToInt32(reader["VideoID"]), reader["Title"].ToString(), reader["VideoPath"].ToString(), reader["Thumbnail"].ToString(), Convert.ToDateTime(reader["AddedDate"]));
                    videoList.Add(temp);
                }
                return videoList;
            }
        }
    }



    /// <summary>
    /// Get last video(s)
    /// </summary>
    /// <param name="videoCount">video count</param>
    /// <returns></returns>
    public static List<Video> GetLastVideo(int videoCount)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {

            using (OleDbCommand command = new OleDbCommand("Select Top 1 * From Videos Order By AddedDate Desc", connection))
            {                
                connection.Open();      
                int count = 0;
                List<Video> videoList = new List<Video>();
                OleDbDataReader reader = command.ExecuteReader();
                while (reader.Read() && count < videoCount)
                {
                    Video temp = new Video(Convert.ToInt32(reader["VideoID"]), reader["Title"].ToString(), reader["VideoPath"].ToString(), reader["Thumbnail"].ToString(), Convert.ToDateTime(reader["AddedDate"]));
                    videoList.Add(temp);
                    count++;
                }
                return videoList;
            }
        }
    }

    public static void RemoveVideo(int VideoID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {               
                string deleteString = "DELETE FROM [Videos] WHERE [VideoID] = @videoID";
                command.Connection = connection;
                command.CommandText = deleteString;
                command.Parameters.AddWithValue("@videoID", VideoID);
                connection.Open();
                command.ExecuteNonQuery();                
            }
        }
    }

    public static Video GetVideo(int VideoID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {

            using (OleDbCommand command = new OleDbCommand("Select * From Videos Where VideoID = @VideoID", connection))
            {
                connection.Open();
                command.Parameters.AddWithValue("@VideoID", VideoID);
                OleDbDataReader reader = command.ExecuteReader();
                Video video = new Video();
                while (reader.Read())
                {
                    video = new Video(Convert.ToInt32(reader["VideoID"]), reader["Title"].ToString(), reader["VideoPath"].ToString(), reader["Thumbnail"].ToString(), Convert.ToDateTime(reader["AddedDate"]));                    
                }
                return video;
            }
        }
    }

    public static void AddVideo(string Title, string VideoPath, byte[] Thumbnail, DateTime AddedDate)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string insertString = "INSERT INTO [Videos] ([Title], [VideoPath], [Thumbnail], [AddedDate]) VALUES (@title, @videoPath, @thumbnail, @addedDate)";
                command.Connection = connection;
                command.CommandText = insertString;
                command.Parameters.AddWithValue("@title", Title);
                command.Parameters.AddWithValue("@videoPath", VideoPath);
                command.Parameters.AddWithValue("@thumbnail", ImageProcess.ResizeImageFile(Thumbnail, 88));
                command.Parameters.AddWithValue("@addedDate", AddedDate);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
    public static void EditVideo(string Title, string VideoPath, byte[] Thumbnail, DateTime AddedDate, int VideoID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string updateString;
                if (Thumbnail.Length != 0)
                {
                    updateString = "Update [Videos] Set [Title] = @title, [VideoPath] = @videoPath, [Thumbnail] = @thumbnail, [AddedDate] = @addedDate Where [VideoID] = @VideoID";                   
                    command.Parameters.AddWithValue("@title", Title);
                    command.Parameters.AddWithValue("@videoPath", VideoPath);
                    command.Parameters.AddWithValue("@thumbnail", ImageProcess.ResizeImageFile(Thumbnail, 88));
                    command.Parameters.AddWithValue("@addedDate", AddedDate);
                    command.Parameters.AddWithValue("@VideoID", VideoID);
                }
                else
                {
                    updateString = "Update [Videos] Set [Title] = @title, [VideoPath] = @videoPath, [AddedDate] = @addedDate Where [VideoID] = @VideoID";
                    command.Connection = connection;
                    command.CommandText = updateString;
                    command.Parameters.AddWithValue("@title", Title);
                    command.Parameters.AddWithValue("@videoPath", VideoPath);                    
                    command.Parameters.AddWithValue("@addedDate", AddedDate);
                    command.Parameters.AddWithValue("@VideoID", VideoID);
                }
                command.Connection = connection;
                command.CommandText = updateString;
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
    public static Stream GetVideoPhoto(int videoID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "SELECT [Thumbnail] FROM [Videos] WHERE [VideoID] = @videoID";
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@videoID", videoID);
                connection.Open();
                object result = command.ExecuteScalar();
                try
                {
                    return new MemoryStream((byte[])result);
                }
                catch
                {
                    return null;
                }
            }
        }
    }
    public static Stream GetVideoPhoto(int videoID, int targetSize)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "SELECT [Thumbnail] FROM [Videos] WHERE [VideoID] = @videoID";
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@videoID", videoID);
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
}
