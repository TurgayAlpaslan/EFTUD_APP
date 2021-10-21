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
using System.IO;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing;
/// <summary>
/// Summary description for NewsManager
/// </summary>
public class NewsManager
{
    public static List<News> GetNews()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "SELECT [NewsID], [Caption], [AddedDate] FROM [News] ORDER BY [AddedDate] DESC";
                command.Connection = connection;
                command.CommandText = selectString;
                connection.Open();
                List<News> list = new List<News>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        News temp = new News(Convert.ToInt32(reader["NewsID"]), reader["Caption"].ToString(), Convert.ToDateTime(reader["AddedDate"]));
                        list.Add(temp);
                    }
                }
                return list;
            }
        }
    }

    public static List<News> GetTopNineNews()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "SELECT TOP 9 [NewsID], [Caption], [AddedDate] FROM [News] ORDER BY [AddedDate] DESC";
                command.Connection = connection;
                command.CommandText = selectString;
                connection.Open();
                List<News> list = new List<News>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        News temp = new News(Convert.ToInt32(reader["NewsID"]), reader["Caption"].ToString(), Convert.ToDateTime(reader["AddedDate"]));
                        list.Add(temp);
                    }
                }
                return list;
            }
        }
    }

    //public static FeaturedBox GetTopNews()
    //{
    //    using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
    //    {
    //        using (OleDbCommand command = new OleDbCommand())
    //        {
    //            string selectString = "SELECT TOP 3 [NewsID], [Caption], [AddedDate] FROM [News] ORDER BY [AddedDate] DESC";
    //            command.Connection = connection;
    //            command.CommandText = selectString;
    //            connection.Open();
    //            FeaturedBox featuredBox = new FeaturedBox();
    //            using (OleDbDataReader reader = command.ExecuteReader())
    //            {
    //                int count = 0;
    //                while (reader.Read())
    //                {
    //                    FeaturedBoxItem item = new FeaturedBoxItem(Convert.ToInt32(reader["NewsID"]), reader["Caption"].ToString());
    //                    featuredBox[count] = item;
    //                    count++;
    //                }
    //            }
    //            return featuredBox;
    //        }
    //    }
    //}



    public static List<News> GetNews(int NewsID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "SELECT [NewsID], [Caption], [Content], [AddedDate] FROM [News] Where [NewsID] = @newsID";
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@newsID", NewsID);
                connection.Open();
                List<News> list = new List<News>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        News temp = new News(Convert.ToInt32(reader["NewsID"]), reader["Caption"].ToString(), reader["Content"].ToString(), Convert.ToDateTime(reader["AddedDate"]));
                        list.Add(temp);
                    }
                }
                return list;
            }
        }
    }

    public static void AddNews(string Caption, string Content, byte[] ImageFile, DateTime AddedDate)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string insertString = "INSERT INTO [News] ([Caption], [Content], [ImageFile], [AddedDate]) VALUES (@caption, @content, @imageFile, @addedDate)";
                command.Connection = connection;
                command.CommandText = insertString;
                command.Parameters.AddWithValue("@caption", Caption);
                command.Parameters.AddWithValue("@content", Content);
                command.Parameters.AddWithValue("@imageFile", ImageProcess.ResizeImageFile(ImageFile, 292));                
                command.Parameters.AddWithValue("@addedDate", AddedDate);                          
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
    public static void RemoveNews(int NewsID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string deleteString = "DELETE FROM [News] WHERE [NewsID] = @newsID";
                command.Connection = connection;
                command.CommandText = deleteString;
                command.Parameters.AddWithValue("@newsID", NewsID);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
    public static void EditNews(string Caption, string Content, byte[] ImageFile, string AddedDate, int NewsID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string editString;
                if (ImageFile.Length == 0)
                {
                    editString = "UPDATE [News] SET [Caption] = @Caption, [Content] = @Content, [AddedDate] = @AddedDate WHERE [NewsID] = @NewsID";
                    command.Parameters.AddWithValue("@Caption", Caption);
                    command.Parameters.AddWithValue("@Content", Content);                    
                    command.Parameters.AddWithValue("@AddedDate", Convert.ToDateTime(AddedDate));                    
                    command.Parameters.AddWithValue("@NewsID", NewsID);
                }
                else
                {
                    editString = "UPDATE [News] SET [Caption] = @Caption, [Content] = @Content, [ImageFile] = @imageFile, [AddedDate] = @AddedDate WHERE [NewsID] = @NewsID";
                    command.Parameters.AddWithValue("@Caption", Caption);
                    command.Parameters.AddWithValue("@Content", Content);
                    command.Parameters.AddWithValue("@imageFile", ImageProcess.ResizeImageFile(ImageFile, 292));
                    command.Parameters.AddWithValue("@AddedDate", Convert.ToDateTime(AddedDate));                    
                    command.Parameters.AddWithValue("@NewsID", NewsID);
                }
                command.CommandText = editString;
                command.Connection = connection;
                
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
    public static Stream GetNewsPhoto(int newsID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "SELECT [ImageFile] FROM [News] WHERE [NewsID] = @newsID";             
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@newsID", newsID);
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
   
    public static Stream GetNewsPhoto(int newsID, int targetSize)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "SELECT [ImageFile] FROM [News] WHERE [NewsID] = @newsID";
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@newsID", newsID);
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
