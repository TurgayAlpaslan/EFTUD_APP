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
/// Summary description for PageManager
/// </summary>
public class PageManager
{
    public static ServerPage GetPage(int PageID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "SELECT [ID], [Name], [Content], [Description] FROM [Pages] Where [ID] = @ID";
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@ID", PageID);
                connection.Open();
                ServerPage page = null;
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        page =  new ServerPage(Convert.ToInt32(reader["ID"]), reader["Name"].ToString(), reader["Content"].ToString(), reader["Description"].ToString());
                       
                    }
                }
                return page;
            }
        }
    }
    public static void RemovePage(int PageID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string deleteString = "DELETE FROM [Pages] WHERE [ID] = @ID";
                command.Connection = connection;
                command.CommandText = deleteString;
                command.Parameters.AddWithValue("@ID", PageID);
                connection.Open();                             
                command.ExecuteNonQuery();
            }
        }
    }
}
