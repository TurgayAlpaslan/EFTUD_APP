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

/// <summary>
/// Summary description for Test
/// </summary>
public class Test
{
	 public static List<ImageInfo> GetEducatorsPhotoSize()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString;
                selectString = "Select * From [Users]";
                command.Connection = connection;
                command.CommandText = selectString;
                connection.Open();
                List<ImageInfo> list = new List<ImageInfo>();
                using (OleDbDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        ImageInfo temp = new ImageInfo(Convert.ToInt32(reader[0]), ((byte[])reader["ImageFile"]).Length);
                        list.Add(temp);
                    }
                }
                return list;
            }
        }
    }    
}
public class ImageInfo
{
    private int _id;
    private int _size;

    public int Id { get { return _id; } }
    public int Size { get { return _size; } }

    public ImageInfo(int id, int size)
    {
        _id = id;
        _size = size;
    }

}

