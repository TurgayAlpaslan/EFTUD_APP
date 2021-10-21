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

/// <summary>
/// Summary description for TopMenuManager
/// </summary>
public class TopMenuManager
{
	public TopMenuManager()
	{
		//
		// TODO: Add constructor logic here
		//
    }

    #region Static Functions

    public static List<Category> GetCategories()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                command.CommandText = "SELECT *	FROM [TopMenuCategories] ORDER BY [OrderNr] ASC";
                command.Connection = connection;
                connection.Open();
                List<Category> list = new List<Category>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Category temp = new Category(Convert.ToInt32(reader["CatID"]), Convert.ToInt32(reader["OrderNr"]), reader["CatName"].ToString(), reader["Link"].ToString(), reader["Description"].ToString());
                        list.Add(temp);
                    }
                }
                return list;
            }
        }
    }
    
    public static List<SubCategory> GetSubCategories(int CatID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                command.CommandText = "SELECT *	FROM [TopMenuSubCategories] WHERE [CatID] = @CatID ORDER BY [OrderNr] ASC";
                command.Connection = connection;
                command.Parameters.AddWithValue("@CatID", CatID);
                connection.Open();
                List<SubCategory> list = new List<SubCategory>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        SubCategory temp = new SubCategory(Convert.ToInt32(reader["SubCatID"]), Convert.ToInt32(reader["CatID"]), Convert.ToInt32(reader["OrderNr"]), reader["SubCatName"].ToString(), reader["Link"].ToString(), reader["Description"].ToString());
                        list.Add(temp);
                    }
                }
                return list;
            }
        }
    }

    public static void AddCategory(string CatName, string Link, string Description)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string insertString = "INSERT INTO [TopMenuCategories] ([OrderNr], [CatName], [Link], [Description]) VALUES (@OrderNr, @CatName, @Link, @Description)";
                command.Connection = connection;
                command.CommandText = insertString;
                command.Parameters.AddWithValue("@OrderNr", GetCategoryMaxOrder() + 1);
                command.Parameters.AddWithValue("@CatName", CatName);                
                command.Parameters.AddWithValue("@Link", Link);
                command.Parameters.AddWithValue("@Description", Description);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
    public static int GetCategoryMaxOrder()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                int value = 0;
                command.CommandText = "SELECT MAX([OrderNr]) FROM [TopMenuCategories]";
                command.Connection = connection;
                connection.Open();
                if (command.ExecuteScalar() != DBNull.Value)
                    value = Convert.ToInt32(command.ExecuteScalar());
                return value;

            }
        }
    }
    public static void EditCategory(string CatName, string Link, string Description, int OrderNr, int CatID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string updateString = "UPDATE [TopMenuCategories] SET [CatName] = @Name, [Link] = @Link, [Description] = @Description WHERE [CatID] = @CatID";
                command.Connection = connection;
                command.CommandText = updateString;
                command.Parameters.AddWithValue("@CatName", CatName);                
                command.Parameters.AddWithValue("@Link", Link);
                command.Parameters.AddWithValue("@Description", Description);
                command.Parameters.AddWithValue("@CatID", CatID);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }

    public static void RemoveCategory(int CatID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                RemoveAllSubCategories(CatID);
                command.CommandText = "DELETE FROM [TopMenuCategories] WHERE [CatID] = @CatID";
                command.Connection = connection;
                command.Parameters.AddWithValue("@CatID", CatID);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }

    public static void RemoveAllSubCategories(int CatID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                command.CommandText = "DELETE FROM [TopMenuSubCategories] WHERE [CatID] = @CatID";
                command.Connection = connection;
                command.Parameters.AddWithValue("@CatID", CatID);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }

    public static void AddSubCategory(int CatID, string SubCatName, string Link, string Description)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                command.CommandText = "INSERT INTO [TopMenuSubCategories]([CatID], [OrderNr], [SubCatName], [Link], [Description]) VALUES(@CatID, @OrderNr, @SubCatName, @Link, @Description)";
                command.Connection = connection;
                command.Parameters.AddWithValue("@CatID", CatID);
                command.Parameters.AddWithValue("@OrderNr", GetSubCategoryMaxOrder(CatID) + 1);
                command.Parameters.AddWithValue("@SubCatName", SubCatName);
                command.Parameters.AddWithValue("@Link", Link);
                command.Parameters.AddWithValue("@Descripion", Description);
                connection.Open();
                command.ExecuteNonQuery();

            }
        }
    }
    public static int GetSubCategoryMaxOrder(int CatID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                int value = 0;
                command.CommandText = "SELECT MAX([OrderNr]) FROM [TopMenuSubCategories] WHERE [CatID] = @CatID";
                command.Connection = connection;
                command.Parameters.AddWithValue("@CatID", CatID);
                connection.Open();
                if (command.ExecuteScalar() != DBNull.Value)
                    value = Convert.ToInt32(command.ExecuteScalar());
                return value;

            }
        }
    }

    public static void EditSubCategory(string SubCatName, string Link, string Description, int OrderNr, int SubCatID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string updateString = "UPDATE [TopMenuSubCategories] SET [SubCatName] = @SubCatName, [Link] = @Link, [Description] = @Description WHERE [SubCatID] = @SubCatID";
                command.Connection = connection;
                command.CommandText = updateString;
                command.Parameters.AddWithValue("@SubCatName", SubCatName);
                command.Parameters.AddWithValue("@Link", Link);
                command.Parameters.AddWithValue("@Description", Description);
                command.Parameters.AddWithValue("@SubCatID", SubCatID);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }

    public static void RemoveSubCategory(int SubCatID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                command.CommandText = "DELETE FROM [TopMenuSubCategories] WHERE [SubCatID] = @SubCatID";
                command.Connection = connection;
                command.Parameters.AddWithValue("@SubCatID", SubCatID);
                connection.Open();
                command.ExecuteNonQuery();               
            }
        }
    }


    public static void CategoryMoveUp(int order)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                int currentOrder = order;
                int previousOrder = 0;
                string selectString = "SELECT MAX([OrderNr]) FROM [TopMenuCategories] WHERE [OrderNr] < @OrderNr";
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@OrderNr", currentOrder);
                connection.Open();
                if (command.ExecuteScalar() != DBNull.Value)
                {
                    previousOrder = Convert.ToInt32(command.ExecuteScalar());
                    EditCategoryOrder(currentOrder, -1);
                    EditCategoryOrder(previousOrder, currentOrder);
                    EditCategoryOrder(-1, previousOrder);
                }
                else
                {
                    return;
                }

            }
        }
    }

    public static void CategoryMoveDown(int order)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                int currentOrder = order;
                int nextOrder = 0;
                string selectString = "SELECT MIN([OrderNr]) FROM [TopMenuCategories] WHERE [OrderNr] > @Order";
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@Order", currentOrder);
                connection.Open();
                if (command.ExecuteScalar() != DBNull.Value)
                {
                    nextOrder = Convert.ToInt32(command.ExecuteScalar());
                    EditCategoryOrder(currentOrder, -1);
                    EditCategoryOrder(nextOrder, currentOrder);
                    EditCategoryOrder(-1, nextOrder);
                }
                else
                {
                    return;
                }

            }
        }
    }
    public static void SubCategoryMoveUp(int order, int CategoryID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                int currentOrder = order;
                int previousOrder = 0;
                string selectString = "SELECT MAX([OrderNr]) FROM [TopMenuSubCategories] WHERE [OrderNr] < @Order AND [CatID] = @CategoryID";
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@Order", currentOrder);
                command.Parameters.AddWithValue("@CategoryID", CategoryID);
                connection.Open();
                if (command.ExecuteScalar() != DBNull.Value)
                {
                    previousOrder = Convert.ToInt32(command.ExecuteScalar());
                    EditSubCategoryOrder(currentOrder, -1, CategoryID);
                    EditSubCategoryOrder(previousOrder, currentOrder, CategoryID);
                    EditSubCategoryOrder(-1, previousOrder, CategoryID);
                }
                else
                {
                    return;
                }

            }
        }
    }
    public static void SubCategoryMoveDown(int order, int CategoryID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                int currentOrder = order;
                int nextOrder = 0;
                string selectString = "SELECT MIN([OrderNr]) FROM [TopMenuSubCategories] WHERE [OrderNr] > @Order AND [CatID] = @CategoryID";
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@Order", currentOrder);
                command.Parameters.AddWithValue("@ProductCategoryID", CategoryID);
                connection.Open();
                if (command.ExecuteScalar() != DBNull.Value)
                {
                    nextOrder = Convert.ToInt32(command.ExecuteScalar());
                    EditSubCategoryOrder(currentOrder, -1, CategoryID);
                    EditSubCategoryOrder(nextOrder, currentOrder, CategoryID);
                    EditSubCategoryOrder(-1, nextOrder, CategoryID);
                }
                else
                {
                    return;
                }

            }
        }
    }
    private static void EditCategoryOrder(int order, int newOrder)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string editString = "UPDATE [TopMenuCategories] SET [OrderNr] = @NewOrder WHERE [OrderNr] = @Order";
                command.Connection = connection;
                command.CommandText = editString;
                command.Parameters.AddWithValue("@NewOrder", newOrder);
                command.Parameters.AddWithValue("@Order", order);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
    private static void EditSubCategoryOrder(int order, int newOrder, int categoryID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string editString = "UPDATE [TopMenuSubCategories] SET [OrderNr] = @NewOrder WHERE [OrderNr] = @Order AND [CatID] = @CategoryID";
                command.Connection = connection;
                command.CommandText = editString;
                command.Parameters.AddWithValue("@NewOrder", newOrder);
                command.Parameters.AddWithValue("@Order", order);
                command.Parameters.AddWithValue("@CategoryID", categoryID);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
    #endregion
}
