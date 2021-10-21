using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Web;
using System.Data.OleDb;

public class PhotoManager
{

    // Photo-Related Methods

    public static Stream GetPhoto(int photoid, int targetSize)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "SELECT [ImageFile] FROM [Photos] WHERE [PhotoID] = @PhotoID";                
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@PhotoID", photoid);
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

    public static Stream GetPhoto(int targetSize)
    {
        string path = HttpContext.Current.Server.MapPath("~/Images/");
        path += "placeholder-600.jpg";
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

    public static Stream GetFirstPhoto(int albumId, int targetSize)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "SELECT TOP 1 [ImageFile] From [Photos] LEFT JOIN [Albums] ON [Albums].[AlbumID] = [Photos].[AlbumID] WHERE [Albums].[AlbumID] = @AlbumID";                
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@AlbumID", albumId);
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

    public static List<Photo> GetPhotos(int AlbumID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                command.CommandText = "SELECT *	FROM [Photos] LEFT JOIN [Albums] ON [Albums].[AlbumID] = [Photos].[AlbumID] WHERE [Photos].[AlbumID] = @AlbumID";
                command.Connection = connection;
                command.Parameters.AddWithValue("@AlbumID", AlbumID);
                connection.Open();
                List<Photo> list = new List<Photo>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Photo temp = new Photo(Convert.ToInt32(reader["PhotoID"]), Convert.ToInt32(reader["Photos.AlbumID"]), Convert.ToString(reader["Photos.Caption"]));
                        list.Add(temp);
                    }
                }
                return list;
            }
        }


    }

    public static List<Photo> GetPhotos()
    {
        return GetPhotos(GetRandomAlbumID());
    }

    public static void AddPhoto(int AlbumID, string Caption, byte[] ImageFile)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string insertString = "INSERT INTO [Photos] ([AlbumID], [Caption], [ImageFile]) VALUES (@AlbumID, @Caption, @ImageFile)";
                command.Connection = connection;
                command.CommandText = insertString;
                command.Parameters.AddWithValue("@AlbumID", AlbumID);                
                command.Parameters.AddWithValue("@Caption", Caption);
                command.Parameters.AddWithValue("@ImageFile", ImageProcess.ResizeImageFile(ImageFile, 604));
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }

    public static void RemovePhoto(int PhotoID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string deleteString = "DELETE FROM [Photos]	WHERE [PhotoID]	= @PhotoID";
                command.Connection = connection;
                command.CommandText = deleteString;
                command.Parameters.AddWithValue("@PhotoID", PhotoID);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }

    public static void EditPhoto(string Caption, int PhotoID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand("EditPhoto", connection))
            {
                string editString = "UPDATE [Photos] SET [Caption] = @Caption WHERE [PhotoID] = @PhotoID";
                command.CommandText = editString;
                command.Connection = connection;
                command.Parameters.AddWithValue("@Caption", Caption == null ? "" : Caption);
                command.Parameters.AddWithValue("@PhotoID", PhotoID);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }

    // Album-Related Methods
    public static string GetAlbumID(int photoID)
    {
        string id = "0";
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "SELECT AlbumID From Photos Where PhotoID = @photoID";
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@photoID", photoID);                
                connection.Open();
                OleDbDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    id = reader["AlbumID"].ToString();
                }

            }
        }
        return id;
    }
    public static List<Album> GetAlbums()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "SELECT [Albums].[AlbumID], [Albums].[Caption], Count([Photos].[PhotoID]) AS NumberOfPhotos FROM [Albums] LEFT JOIN [Photos] ON [Albums].[AlbumID] = [Photos].[AlbumID] GROUP BY [Albums].[AlbumID], [Albums].[Caption]";
                command.Connection = connection;
                command.CommandText = selectString;
                connection.Open();
                List<Album> list = new List<Album>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Album temp = new Album(Convert.ToInt32(reader["AlbumID"]), Convert.ToInt32(reader["NumberOfPhotos"]), reader["Caption"].ToString());
                        list.Add(temp);
                    }
                }
                return list;
            }
        }
    }



    public static void AddAlbum(string Caption)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string insertString = "INSERT INTO [Albums] ([Caption]) VALUES (@Caption)";
                command.CommandText = insertString;
                command.Connection = connection;
                command.Parameters.AddWithValue("@Caption", Caption);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }

    public static void RemoveAlbum(int AlbumID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string deleteString = "DELETE FROM [Photos] WHERE [AlbumID] = @AlbumID";
                command.Connection = connection;
                command.CommandText = deleteString;
                command.Parameters.AddWithValue("@AlbumID", AlbumID);
                connection.Open();
                command.ExecuteNonQuery();
                command.CommandText = "DELETE FROM [Albums] WHERE [AlbumID] = @AlbumID";
                command.ExecuteNonQuery();
            }
        }
    }

    public static void EditAlbum(string Caption, int AlbumID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string updateString = "UPDATE [Albums] SET [Caption] = @Caption WHERE [AlbumID] = @AlbumID";
                command.Connection = connection;
                command.CommandText = updateString;
                command.Parameters.AddWithValue("@Caption", Caption);
                command.Parameters.AddWithValue("@AlbumID", AlbumID);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }

    public static int GetRandomAlbumID()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "SELECT [Albums].[AlbumID] FROM [Albums] LEFT JOIN [Photos] ON [Albums].[AlbumID] = [Photos].[AlbumID] GROUP BY [Albums].[AlbumID], [Albums].[Caption] HAVING Count([Photos].[PhotoID]) > 0";
                command.Connection = connection;
                command.CommandText = selectString;
                connection.Open();
                List<Album> list = new List<Album>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Album temp = new Album((int)reader["AlbumID"], 0, "");
                        list.Add(temp);
                    }
                }
                try
                {
                    Random r = new Random();
                    return list[r.Next(list.Count)].AlbumID;
                }
                catch
                {
                    return -1;
                }
            }
        }
    }

   

}