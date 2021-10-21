using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Data.OleDb;
/// <summary>
/// Summary description for LinkManager
/// </summary>
public class LinkManager
{
    public static List<Link> GetLinks()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {

            using (OleDbCommand command = new OleDbCommand("Select [ID], [Name] From Pages Order By Name", connection))
            {
                connection.Open();
                List<Link> links = new List<Link>();
                links.Add(new Link("Yok", "#"));
                links.Add(new Link("Tan�ml� Ana Sayfa", "Default.aspx"));
                links.Add(new Link("Tan�ml� Haber Ar�ivi", "NewsArchive.aspx"));
                links.Add(new Link("Tan�ml� Y�netim Kurulu", "Associationmanagement.aspx"));
                links.Add(new Link("Tan�ml� �yeler", "AssociationMembers.aspx"));
                links.Add(new Link("Tan�ml� E�itmenler", "Educators.aspx"));
                links.Add(new Link("Tan�ml� Duyurular", "Notifications.aspx"));
                links.Add(new Link("Tan�ml� Biyografiler", "BiographyList.aspx"));
                links.Add(new Link("Tan�ml� Yazarlar", "Authors.aspx"));
                links.Add(new Link("Tan�ml� Foto�raf Galerisi", "GetAlbum.aspx"));
                links.Add(new Link("Tan�ml� Video Galerisi", "GetVideo.aspx"));
                OleDbDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Link temp = new Link(reader["Name"].ToString(), "Pages.aspx?ID=" + reader["ID"].ToString());
                    links.Add(temp);
                }
                return links;
            }
        }
    }
}
