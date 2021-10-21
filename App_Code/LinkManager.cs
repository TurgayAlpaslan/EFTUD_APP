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
                links.Add(new Link("Tanýmlý Ana Sayfa", "Default.aspx"));
                links.Add(new Link("Tanýmlý Haber Arþivi", "NewsArchive.aspx"));
                links.Add(new Link("Tanýmlý Yönetim Kurulu", "Associationmanagement.aspx"));
                links.Add(new Link("Tanýmlý Üyeler", "AssociationMembers.aspx"));
                links.Add(new Link("Tanýmlý Eðitmenler", "Educators.aspx"));
                links.Add(new Link("Tanýmlý Duyurular", "Notifications.aspx"));
                links.Add(new Link("Tanýmlý Biyografiler", "BiographyList.aspx"));
                links.Add(new Link("Tanýmlý Yazarlar", "Authors.aspx"));
                links.Add(new Link("Tanýmlý Fotoðraf Galerisi", "GetAlbum.aspx"));
                links.Add(new Link("Tanýmlý Video Galerisi", "GetVideo.aspx"));
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
