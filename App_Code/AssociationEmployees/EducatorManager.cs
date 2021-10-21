using System;
using System.Data;
using System.Web;
using System.Data.OleDb;
using System.Collections.Generic;
using System.IO;

public class EducatorManager
{
    public static List<Educator> GetEducators()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                command.CommandText = "SELECT [EducatorID], [OrderNr], [Name], [Surname], [Description]	FROM [Educators] ORDER BY [OrderNr]";
                command.Connection = connection;                
                connection.Open();
                List<Educator> list = new List<Educator>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Educator temp = new Educator(Convert.ToInt32(reader["EducatorID"]), Convert.ToInt32(reader["OrderNr"]), Convert.ToString(reader["Name"]), Convert.ToString(reader["Surname"]), Convert.ToString(reader["Description"]));
                        list.Add(temp);
                    }
                }
                return list;
            }
        }
    }

    public static List<Educator> GetEducators(int ID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                command.CommandText = "SELECT [EducatorID], [OrderNr], [Name], [Surname], [Description]	FROM [Educators] WHERE [EducatorID] = @EducatorID";
                command.Connection = connection;
                command.Parameters.AddWithValue("@EducatorID", ID);
                connection.Open();
                List<Educator> list = new List<Educator>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Educator temp = new Educator(Convert.ToInt32(reader["EducatorID"]), Convert.ToInt32(reader["OrderNr"]), Convert.ToString(reader["Name"]), Convert.ToString(reader["Surname"]), Convert.ToString(reader["Description"]));
                        list.Add(temp);
                    }
                }
                return list;
            }
        }
    }

    public static void AddEducator(string Name, string Surname, byte[] ImageFile, string Description)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string insertString = "INSERT INTO [Educators] ([OrderNr], [Name], [Surname], [ImageFile], [Description]) VALUES (@OrderNr, @Name, @Surname, @ImageFile, @Description)";
                command.CommandText = insertString;
                command.Connection = connection;
                command.Parameters.AddWithValue("@OrderNr", NewOrderNr());
                command.Parameters.AddWithValue("@Name", Name);
                command.Parameters.AddWithValue("@Surname", Surname);
                if (ImageFile.Length != 0)
                {
                    command.Parameters.AddWithValue("@ImageFile", ImageProcess.ResizeImageFile(ImageFile, 120));
                }
                else
                {
                    command.Parameters.AddWithValue("@ImageFile", DBNull.Value);
                }
                command.Parameters.AddWithValue("@Description", Description);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }

    public static void RemoveEducator(int ID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string deleteString = "DELETE FROM [Educators] WHERE [EducatorID] = @EducatorID";
                command.Connection = connection;
                command.CommandText = deleteString;
                command.Parameters.AddWithValue("@EducatorID", ID);
                connection.Open();
                command.ExecuteNonQuery();               
            }
        }
    }

    public static void EditEducator(string Name, string Surname, byte[] ImageFile, string Description, int ID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string editString;
                if (ImageFile.Length == 0)
                {
                    editString = "UPDATE [Educators] SET [Name] = @Name, [Surname] = @Surname, [Description] = @Description  WHERE [EducatorID] = @EducatorID";
                    command.Parameters.AddWithValue("@Name", Name);
                    command.Parameters.AddWithValue("@Surname", Surname);
                    command.Parameters.AddWithValue("@Description", Description);
                    command.Parameters.AddWithValue("@EducatorID", ID);
                }
                else
                {
                    editString = "UPDATE [Educators] SET [Name] = @Name, [Surname] = @Surname, [ImageFile] = @ImageFile, [Description] = @Description  WHERE [EducatorID] = @EducatorID";
                    command.Parameters.AddWithValue("@Name", Name);
                    command.Parameters.AddWithValue("@Surname", Surname);
                    command.Parameters.AddWithValue("@ImageFile", ImageProcess.ResizeImageFile(ImageFile, 120));
                    command.Parameters.AddWithValue("@Description", Description);
                    command.Parameters.AddWithValue("@EducatorID", ID);
                }
                command.CommandText = editString;
                command.Connection = connection;
                connection.Open();
                command.ExecuteNonQuery();               
            }
        }
    }
    private static void EditOrderNr(int OrderNr, int newOrderNr)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string editString = "UPDATE [Educators] SET [OrderNr] = @NewOrderNr WHERE [OrderNr] = @OrderNr";
                command.Connection = connection;
                command.CommandText = editString;
                command.Parameters.AddWithValue("@NewOrderNr", newOrderNr);
                command.Parameters.AddWithValue("@OrderNr", OrderNr);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
    public static void MoveDown(int OrderNr)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                if (OrderNr != (NewOrderNr() - 1))
                {
                    int temp = -1;
                    int newOrderNr = OrderNr + 1;
                    EditOrderNr(OrderNr, temp);
                    EditOrderNr(newOrderNr, OrderNr);
                    EditOrderNr(temp, newOrderNr);
                }
            }
        }
    }

    public static void MoveUp(int OrderNr)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                if (OrderNr > 1)
                {
                    int temp = -1;
                    int newOrderNr = OrderNr - 1;
                    EditOrderNr(OrderNr, temp);
                    EditOrderNr(newOrderNr, OrderNr);
                    EditOrderNr(temp, newOrderNr);
                }
            }
        }
    }

    private static int OrderNr(int ID)
    {
        int OrderNr = 0;
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                command.CommandText = "SELECT [OrderNr]	FROM [Educators] WHERE [EducatorID] = @EducatorID";
                command.Connection = connection;
                command.Parameters.AddWithValue("@EducatorID", ID);
                connection.Open();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        OrderNr = Convert.ToInt32(reader["OrderNr"]);
                    }
                }
                return OrderNr;
            }
        }        
    }

    private static int NewOrderNr()
    {
        int OrderNr = 1;
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                command.CommandText = "SELECT MAX([OrderNr]) FROM [Educators]";
                command.Connection = connection;
                connection.Open();
                if (command.ExecuteScalar() != DBNull.Value)
                {
                    OrderNr = Convert.ToInt32(command.ExecuteScalar()) + 1;
                }                               
                return OrderNr;
            }
        }
    }
    public static Stream GetPhoto(int educatorID, int targetSize)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString;
                selectString = "Select [ImageFile] From [Educators] Where [EducatorID] = @EducatorID";
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@EducatorID", educatorID);
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
