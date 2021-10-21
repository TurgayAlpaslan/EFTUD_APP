using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Web.Configuration;
/// <summary>
/// Summary description for ArticleManager
/// </summary>
public class ArticleManager
{
	public ArticleManager()
	{	
	}

    public static List<Article> GetAllArticles()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {

            using (OleDbCommand command = new OleDbCommand("Select [ArticleID], [UserID], [AddedDate], [Title] From Articles Order By AddedDate Desc", connection))
            {                
                connection.Open();
                List<Article> articleList = new List<Article>();
                OleDbDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Article temp = new Article(Convert.ToInt32(reader["ArticleID"]), Convert.ToInt32((int)reader["UserID"]), Convert.ToDateTime(reader["AddedDate"]), reader["Title"].ToString());
                    articleList.Add(temp);
                }
                return articleList;
            }
        }
    }
    /// <summary>
    /// Get all articles by given author identity
    /// </summary>
    /// <param name="authorID">author identity</param>
    /// <returns></returns>
    public static List<Article> GetAllArticles(int UserID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {

            using (OleDbCommand command = new OleDbCommand("Select [ArticleID], [UserID], [AddedDate], [Title] From Articles Where UserID = @userID Order By AddedDate Desc", connection))
            {
                command.Parameters.AddWithValue("@userID", UserID);
                connection.Open();
                List<Article> articleList = new List<Article>();
                OleDbDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Article temp = new Article(Convert.ToInt32(reader["ArticleID"]), Convert.ToInt32((int)reader["UserID"]), Convert.ToDateTime(reader["AddedDate"]), reader["Title"].ToString());
                    articleList.Add(temp);
                }
                return articleList;
            }
        }
    }

    /// <summary>
    /// Get last article by given author identity
    /// </summary>
    /// <param name="authorID">author identity</param>
    /// <returns></returns>
    public static Article GetLastArticle(int UserID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {

            using (OleDbCommand command = new OleDbCommand("Select Top 1 [ArticleID], [UserID], [AddedDate], [Title] From Articles Where UserID = @userID Order By AddedDate Desc", connection))
            {
                command.Parameters.AddWithValue("@userID", UserID);
                connection.Open();
                Article article = new Article();
                OleDbDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    article = new Article(Convert.ToInt32(reader["ArticleID"]), Convert.ToInt32((int)reader["UserID"]), Convert.ToDateTime(reader["AddedDate"]), reader["Title"].ToString());
                }
                return article;
            }
        }
    }

    public static List<Article> GetArticle(int ArticleID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {

            using (OleDbCommand command = new OleDbCommand("Select * From Articles Where ArticleID = @articleID", connection))
            {
                command.Parameters.AddWithValue("@articleID", ArticleID);
                connection.Open();
                List<Article> articleList = new List<Article>();
                OleDbDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {                    
                    Article temp = new Article(Convert.ToInt32(reader["ArticleID"]), Convert.ToInt32((int)reader["UserID"]), Convert.ToDateTime(reader["AddedDate"]), reader["Title"].ToString(), Convert.ToString(reader["Content"]));
                    articleList.Add(temp);
                }
                return articleList;
            }
        }
    }
    public static void AddArticle(int UserID, DateTime AddedDate, string Title, string Content)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                if (UserID == 0)
                    return;
                string insertString = "INSERT INTO [Articles]([UserID], [AddedDate], [Title], [Content]) VALUES(@userID, @addedDate, @title, @content)";
                command.CommandText = insertString;
                command.Connection = connection;
                command.Parameters.AddWithValue("@userID", UserID);
                command.Parameters.AddWithValue("@addedDate", AddedDate);
                command.Parameters.AddWithValue("@title", Title);
                command.Parameters.AddWithValue("@content", Content);                
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
    public static void EditArticle(DateTime AddedDate, string Title, string Content, int ArticleID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string editString = "UPDATE [Articles] SET [AddedDate] = @addedDate, [Title] = @title, [Content] = @content WHERE [ArticleID] = @articleID";
                command.CommandText = editString;
                command.Connection = connection;
                command.Parameters.AddWithValue("@addedDate", AddedDate);
                command.Parameters.AddWithValue("@title", Title);
                command.Parameters.AddWithValue("@content", Content);                
                command.Parameters.AddWithValue("@articleID", ArticleID);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
    public static void RemoveArticle(int ArticleID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string deleteString = "DELETE FROM [Articles]	WHERE [ArticleID]	= @articleID";
                command.Connection = connection;
                command.CommandText = deleteString;
                command.Parameters.AddWithValue("@articleID", ArticleID);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
   

}
