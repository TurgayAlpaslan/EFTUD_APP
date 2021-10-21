using System;
using System.Data;
using System.Web;
using System.Data.OleDb;
using System.Collections.Generic;
using System.IO;

/// <summary>
/// Summary description for AdministrationManager
/// </summary>
public class AdministrationManager
{
    public static List<Educator> GetAdministrators()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                command.CommandText = "SELECT [AdministratorID], [OrderNr], [Name], [Surname], [Description]	FROM [Administration] ORDER BY [OrderNr]";
                command.Connection = connection;                
                connection.Open();
                List<Educator> list = new List<Educator>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Educator temp = new Educator(Convert.ToInt32(reader["AdministratorID"]), Convert.ToInt32(reader["OrderNr"]), Convert.ToString(reader["Name"]), Convert.ToString(reader["Surname"]), Convert.ToString(reader["Description"]));
                        list.Add(temp);
                    }
                }
                return list;
            }
        }
    }   

    public static void AddAdministrator(string Name, string Surname, byte[] ImageFile, string Description)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string insertString = "INSERT INTO [Administration] ([OrderNr], [Name], [Surname], [ImageFile], [Description]) VALUES (@OrderNr, @Name, @Surname, @ImageFile, @Description)";
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

    public static void RemoveAdministrator(int ID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string deleteString = "DELETE FROM [Administration] WHERE [AdministratorID] = @AdministratorID";
                command.Connection = connection;
                command.CommandText = deleteString;
                command.Parameters.AddWithValue("@AdminstratorID", ID);
                connection.Open();
                command.ExecuteNonQuery();               
            }
        }
    }

    public static void EditAdministrator(string Name, string Surname, byte[] ImageFile, string Description, int ID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string editString;
                if (ImageFile.Length == 0)
                {
                    editString = "UPDATE [Administration] SET [Name] = @Name, [Surname] = @Surname, [Description] = @Description  WHERE [AdministratorID] = @AdministratorID";
                    command.Parameters.AddWithValue("@Name", Name);
                    command.Parameters.AddWithValue("@Surname", Surname);
                    command.Parameters.AddWithValue("@Description", Description);
                    command.Parameters.AddWithValue("@AdministratorID", ID);
                }
                else
                {
                    editString = "UPDATE [Administration] SET [Name] = @Name, [Surname] = @Surname, [ImageFile] = @ImageFile, [Description] = @Description  WHERE [AdministratorID] = @AdministratorID";
                    command.Parameters.AddWithValue("@Name", Name);
                    command.Parameters.AddWithValue("@Surname", Surname);
                    command.Parameters.AddWithValue("@ImageFile", ImageProcess.ResizeImageFile(ImageFile, 120));
                    command.Parameters.AddWithValue("@Description", Description);
                    command.Parameters.AddWithValue("@AdministratorID", ID);
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
                string editString = "UPDATE [Administration] SET [OrderNr] = @NewOrderNr WHERE [OrderNr] = @OrderNr";
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
                command.CommandText = "SELECT [OrderNr]	FROM [Administration] WHERE [AdministratorID] = @AdministratorID";
                command.Connection = connection;
                command.Parameters.AddWithValue("@AdministratorID", ID);
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
                command.CommandText = "SELECT MAX([OrderNr])	FROM [Administration]";
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
    public static Stream GetPhoto(int administratorID, int targetSize)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString;
                selectString = "Select [ImageFile] From [Administration] Where [AdministratorID] = @AdministratorID";
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@AdministratorID", administratorID);
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
