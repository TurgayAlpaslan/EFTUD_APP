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
using System.IO;
using System.Collections.Generic;
using System.Data.SqlTypes;
/// <summary>
/// Summary description for BiographyManager
/// </summary>
public class BiographyManager
{
	private BiographyManager()
	{
	}
    public static List<Biography> GetBiographies()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "SELECT [ID], [Title], [Name], [Surname] FROM [Biographies] ORDER BY [Name], [Surname] ASC";
                command.Connection = connection;
                command.CommandText = selectString;
                connection.Open();
                List<Biography> list = new List<Biography>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {

                        Biography temp = new Biography(Convert.ToInt32(reader["ID"]), reader["Title"].ToString(), reader["Name"].ToString(), reader["Surname"].ToString());
                        list.Add(temp);
                    }
                }
                return list;
            }
        }
    }
    public static List<Biography> GetBiographies(string Letter)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "SELECT [ID], [Title], [Name], [Surname], [Birthday], [Death] FROM [Biographies] WHERE [NAME] LIKE @letter ORDER BY [Name], [Surname] ASC";
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@letter", Letter + "%");
                connection.Open();
                List<Biography> list = new List<Biography>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {

                        Biography temp = new Biography(Convert.ToInt32(reader["ID"]), reader["Title"].ToString(), reader["Name"].ToString(), reader["Surname"].ToString(), Convert.ToDateTime(reader["Birthday"]), reader["Death"].ToString());
                        list.Add(temp);
                    }
                }
                return list;
            }
        }
    }
    public static Biography GetBiography(int ID)
    {
        Biography biography = null;
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "SELECT [ID], [Title], [Name], [Surname], [Birthday], [Death], [Content] FROM [Biographies] WHERE [ID] = @ID";
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@ID", ID);
                connection.Open();                
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        biography = new Biography(Convert.ToInt32(reader["ID"]), reader["Title"].ToString(), reader["Name"].ToString(), reader["Surname"].ToString(), Convert.ToDateTime(reader["Birthday"]), reader["Death"].ToString(), reader["Content"].ToString());                       
                    }
                }
                return biography;
            }
        }
    }
    public static Biography GetBiography()
    {
        return GetBiography(GetRandomBiographyID());
    }
    public static int GetRandomBiographyID()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "SELECT [ID] FROM [Biographies]";
                command.Connection = connection;
                command.CommandText = selectString;
                connection.Open();
                List<Biography> list = new List<Biography>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Biography temp = new Biography((int)reader["ID"], "", "", "");
                        list.Add(temp);
                    }
                }
                try
                {
                    Random r = new Random();
                    return list[r.Next(list.Count)].Id;
                }
                catch
                {
                    return -1;
                }
            }
        }
    }
    public static List<Biography> GetRandomBiographies()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "SELECT [ID], [Title], [Name], [Surname] FROM [Biographies]";
                command.Connection = connection;
                command.CommandText = selectString;
                connection.Open();
                List<Biography> list = new List<Biography>();
                List<Biography> returnList = new List<Biography>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Biography temp = new Biography((int)reader["ID"], reader["Title"].ToString(), reader["Name"].ToString(), reader["Surname"].ToString());
                        list.Add(temp);
                    }
                }
                try
                {
                    while (returnList.Count < 6 && list.Count > 0)
                    {
                        Random r = new Random();
                        int randomNumber = r.Next(list.Count);
                        Biography biography = list[randomNumber];
                        list.RemoveAt(randomNumber);
                        returnList.Add(biography);                        
                    }
                }
                catch
                {                    
                }
                return returnList;
            }
        }
    }
    public static void AddBiography(string Title, string Name, string Surname, string Birthday, string Death, string Content, byte[] ImageFile)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                if (Death != null && Death != "")
                {
                    string insertString = "INSERT INTO [Biographies] ([Title], [Name], [Surname], [Birthday], [Death], [Content], [ImageFile]) VALUES (@title, @name, @surname, @birthday, @death, @content, @imageFile)";
                    command.Connection = connection;
                    command.CommandText = insertString;
                    command.Parameters.AddWithValue("@title", Title);
                    command.Parameters.AddWithValue("Name", Name);
                    command.Parameters.AddWithValue("Surname", Surname);
                    command.Parameters.AddWithValue("@Birthday", Convert.ToDateTime(Birthday));
                    command.Parameters.AddWithValue("@Death", Convert.ToDateTime(Death));
                    command.Parameters.AddWithValue("@content", Content);
                }
                else
                {
                    string insertString = "INSERT INTO [Biographies] ([Title], [Name], [Surname], [Birthday], [Content], [ImageFile]) VALUES (@title, @name, @surname, @birthday, @content, @imageFile)";
                    command.Connection = connection;
                    command.CommandText = insertString;
                    command.Parameters.AddWithValue("@title", Title);
                    command.Parameters.AddWithValue("Name", Name);
                    command.Parameters.AddWithValue("Surname", Surname);
                    command.Parameters.AddWithValue("@Birthday", Convert.ToDateTime(Birthday));                   
                    command.Parameters.AddWithValue("@content", Content);
                }

                if (ImageFile.Length != 0)
                {
                    command.Parameters.AddWithValue("@imageFile", ImageProcess.ResizeImageFile(ImageFile, 160));
                }
                else
                {
                    command.Parameters.AddWithValue("@imageFile", DBNull.Value);
                }                          
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
    public static void UpdateBiography(string Title, string Name, string Surname, string Birthday, string Death, string Content, byte[] ImageFile, int ID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                if (Death != null && Death != "")
                {
                    string insertString = "UPDATE [Biographies] SET [Title] = @tile, [Name] = @name, [Surname] = @surname, [Birthday] = @birthday, [Death] = @death, [Content] = @content, [ImageFile] = @imageFile WHERE [ID] = @id";
                    command.Connection = connection;
                    command.CommandText = insertString;
                    command.Parameters.AddWithValue("@title", Title);
                    command.Parameters.AddWithValue("Name", Name);
                    command.Parameters.AddWithValue("Surname", Surname);
                    command.Parameters.AddWithValue("@Birthday", Convert.ToDateTime(Birthday));
                    command.Parameters.AddWithValue("@Death", Convert.ToDateTime(Death));
                    command.Parameters.AddWithValue("@content", Content);
                }
                else
                {
                    string insertString = "UPDATE [Biographies] SET [Title] = @tile, [Name] = @name, [Surname] = @surname, [Birthday] = @birthday, [Content] = @content, [ImageFile] = @imageFile WHERE [ID] = @id";
                    command.Connection = connection;
                    command.CommandText = insertString;
                    command.Parameters.AddWithValue("@title", Title);
                    command.Parameters.AddWithValue("Name", Name);
                    command.Parameters.AddWithValue("Surname", Surname);
                    command.Parameters.AddWithValue("@Birthday", Convert.ToDateTime(Birthday));
                    command.Parameters.AddWithValue("@content", Content);
                }
                if (ImageFile.Length != 0)
                {
                    command.Parameters.AddWithValue("@imageFile", ImageProcess.ResizeImageFile(ImageFile, 160));
                }
                else
                {
                    command.Parameters.AddWithValue("@imageFile", DBNull.Value);
                }
                command.Parameters.AddWithValue("@id", ID);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
    public static void RemoveBiography(int ID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string deleteString = "DELETE FROM [Biographies] WHERE [ID] = @ID";
                command.Connection = connection;
                command.CommandText = deleteString;
                command.Parameters.AddWithValue("@ID", ID);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
    public static Stream GetPhoto(int ID, int targetSize)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString;
                selectString = "Select [ImageFile] From [Biographies] Where [ID] = @ID";
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@ID", ID);
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
