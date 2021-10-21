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
/// <summary>
/// Summary description for BSettingManager
/// </summary>
public class BSettingManager
{
    public static Settings GetSettings()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {

            using (OleDbCommand command = new OleDbCommand("Select * From [Settings]", connection))
            {
                connection.Open();
                Settings settings = null;
                OleDbDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    settings = new Settings(reader["SiteTitle"].ToString(), reader["Keywords"].ToString(), reader["Author"].ToString(), reader["Description"].ToString());
                }
                return settings;
            }
        }
    }
}
