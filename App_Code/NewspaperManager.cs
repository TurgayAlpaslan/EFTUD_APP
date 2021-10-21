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
/// <summary>
/// Summary description for NewspaperManager
/// </summary>
public class NewspaperManager
{
    public static List<Newspaper> GetNewspapers()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "SELECT [ID], [AddedDate], [Description] FROM [Newspapers] ORDER BY [AddedDate] DESC";
                command.Connection = connection;
                command.CommandText = selectString;
                connection.Open();
                List<Newspaper> list = new List<Newspaper>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Newspaper newspaper = new Newspaper(Convert.ToInt32(reader["ID"]), Convert.ToDateTime(reader["AddedDate"]), reader["Description"].ToString()); 
                        list.Add(newspaper);
                    }
                }
                return list;
            }
        }
    }

    public static Newspaper GetNewspaper(int ID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                Newspaper newspaper = null;
                string selectString = "SELECT [ID], [AddedDate], [Description] FROM [Newspapers] Where [ID] = @ID";
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@ID", ID);
                connection.Open();                
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        newspaper = new Newspaper(Convert.ToInt32(reader["ID"]), Convert.ToDateTime(reader["AddedDate"]), reader["Description"].ToString());                         
                    }
                }
                return newspaper;
            }
        }
    }

    public static void AddNewspaper(byte[] ImageFile, DateTime AddedDate, string Description)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string insertString = "INSERT INTO [Newspapers] ([ThumbImageFile], [ImageFile], [AddedDate], [Description]) VALUES (@thumbImageFile, @imageFile, @addedDate, @description)";
                command.Connection = connection;
                command.CommandText = insertString;
                command.Parameters.AddWithValue("@thumbImageFile", ImageProcess.ResizeImageFile(ImageFile, 292));
                command.Parameters.AddWithValue("@imageFile", ImageFile);
                command.Parameters.AddWithValue("@addedDate", AddedDate);
                command.Parameters.AddWithValue("@Description", Description);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
    public static void RemoveNewspaper(int ID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string deleteString = "DELETE FROM [Newspapers] WHERE [ID] = @ID";
                command.Connection = connection;
                command.CommandText = deleteString;
                command.Parameters.AddWithValue("@ID", ID);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
    public static void EditNewspaper(byte[] ImageFile, DateTime AddedDate, string Description, int ID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                if (ImageFile.Length != 0)
                {
                    string editString = "UPDATE [Newspapers] SET [ThumbImageFile] = @thumbImageFile, [ImageFile] = @imageFile, [AddedDate] = @addedDate, [Description] = @description WHERE [ID] = @ID";
                    command.CommandText = editString;
                    command.Connection = connection;
                    command.Parameters.AddWithValue("@thumbImageFile", ImageProcess.ResizeImageFile(ImageFile, 292));
                    command.Parameters.AddWithValue("@imageFile", ImageFile);
                    command.Parameters.AddWithValue("@addedDate", AddedDate);
                    command.Parameters.AddWithValue("@Description", Description);
                    command.Parameters.AddWithValue("@ID", ID);
                }
                else
                {
                    string editString = "UPDATE [Newspapers] SET [AddedDate] = @addedDate, [Description] = @description WHERE [ID] = @ID";
                    command.CommandText = editString;
                    command.Connection = connection;                    
                    command.Parameters.AddWithValue("@addedDate", AddedDate);
                    command.Parameters.AddWithValue("@Description", Description);
                    command.Parameters.AddWithValue("@ID", ID);
                }
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
    public static Stream GetNewspaperPhoto(int ID, int PhotoType)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "";
                switch (PhotoType)
                {
                    case 0:
                        selectString = "SELECT [ThumbImageFile] FROM [Newspapers] WHERE [ID] = @ID";
                        break;
                    case 1:
                        selectString= "SELECT [ImageFile] FROM [Newspapers] WHERE [ID] = @ID";
                        break;
                    default:
                        selectString = "SELECT [ThumbImageFile] FROM [Newspapers] WHERE [ID] = @ID";
                        break;
                }                
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@ID", ID);
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
}
