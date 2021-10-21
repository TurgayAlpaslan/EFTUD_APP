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
using System.Web.Configuration;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;

/// <summary>
/// Summary description for AuthorManager
/// </summary>
public class AuthorManager
{
	public AuthorManager()
	{		
	}
    public static List<Author> GetAllAuthors()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {

            using (OleDbCommand command = new OleDbCommand("SELECT Users.UserID, Users.Name, Users.Surname, Users.Email, Users.Description FROM ((Users INNER JOIN UsersInRoles ON Users.UserID = UsersInRoles.UserID) INNER JOIN Roles ON UsersInRoles.RoleID = Roles.RoleID) WHERE (Roles.RoleName = 'Yazar')", connection))
            {                
                connection.Open();
                List<Author> authorList = new List<Author>();
                OleDbDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Author temp = new Author(Convert.ToInt32(reader["UserID"]), reader["Name"].ToString(), reader["Surname"].ToString(), reader["Email"].ToString(), reader["Description"].ToString());  
                    authorList.Add(temp);
                }
                return authorList;
            }
        }
    }

    public static Author GetAuthorWithArticle(int UserID, int ArticleID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {

            using (OleDbCommand command = new OleDbCommand("SELECT Users.UserID, Users.Name, Users.Surname, Users.Email, Users.Description, Articles.ArticleID, Articles.AddedDate, Articles.Title, Articles.Content FROM (Users INNER JOIN Articles ON Users.UserID = Articles.UserID) WHERE Users.UserID = @UserID AND Articles.ArticleID = @ArticleID", connection))
            {
                connection.Open();
                command.Parameters.AddWithValue("@UserID", UserID);
                command.Parameters.AddWithValue("@ArticleID", ArticleID);
                Author author = null;
                OleDbDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    author = new Author(Convert.ToInt32(reader["UserID"]), reader["Name"].ToString(), reader["Surname"].ToString(), reader["Email"].ToString(), reader["Description"].ToString());
                    Article currentArticle = new Article(Convert.ToInt32(reader["ArticleID"]), Convert.ToInt32(reader["UserID"]), Convert.ToDateTime(reader["AddedDate"]), reader["Title"].ToString(), reader["Content"].ToString());
                    author.CurrentArticle = currentArticle;
                    author.SetArticles();
                }

                return author;
            }
        }
    }
   
    public static List<Article> GetOtherArticles(int UserID, int ArticleID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {

            using (OleDbCommand command = new OleDbCommand("SELECT TOP 5 ArticleID, UserID, AddedDate, Title FROM Articles WHERE UserID = @UserID AND ArticleID <> @ArticleID Order By AddedDate Desc", connection))
            {
                connection.Open();
                command.Parameters.AddWithValue("@UserID", UserID);
                command.Parameters.AddWithValue("@ArticleID", ArticleID);
                List<Article> articleList = new List<Article>();
                OleDbDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Article temp = new Article(Convert.ToInt32(reader["ArticleID"]), Convert.ToInt32(reader["UserID"]), Convert.ToDateTime(reader["AddedDate"]), reader["Title"].ToString());
                    articleList.Add(temp);
                }

                return articleList;
            }
        }
    }

    public static Author GetAuthor(int UserID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {

            using (OleDbCommand command = new OleDbCommand("SELECT Users.UserID, Users.Name, Users.Surname, Users.Email, Users.Description FROM ((Users INNER JOIN UsersInRoles ON Users.UserID = UsersInRoles.UserID) INNER JOIN Roles ON UsersInRoles.RoleID = Roles.RoleID) WHERE Users.UserID = @UserID AND (Roles.RoleName = 'Yazar')", connection))
            {
                connection.Open();
                command.Parameters.AddWithValue("@UserID", UserID);
                Author author = null;
                OleDbDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    author = new Author(Convert.ToInt32(reader["UserID"]), reader["Name"].ToString(), reader["Surname"].ToString(), reader["Email"].ToString(), reader["Description"].ToString());                    
                }
                return author;
            }
        }
    }
   
    //public static void AddAuthor(int UserID, byte[] ImageFile, string MailAddress, string Description)
    //{
    //    using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
    //    {
    //        using (OleDbCommand command = new OleDbCommand())
    //        {
    //            string insertString = "Insert Into [Authors] ([UserID], [ImageFile], [MailAddress], [Description]) Values (@userID, @imageFile, @emailAddress, @description)";
    //            //string insertString = "INSERT INTO [Photos] ([AlbumID],	[BytesOriginal], [Caption],	[BytesFull], [BytesPoster], [BytesThumb]) VALUES (@AlbumID,	@BytesOriginal,	@Caption, @BytesFull, @BytesPoster, @BytesThumb)";
    //            command.Connection = connection;
    //            command.CommandText = insertString;
    //            command.Parameters.AddWithValue("@userID", UserID);
    //            command.Parameters.AddWithValue("@profilePhoto", ResizeImageFile(ProfilePhoto, new Size(60, 45)));
    //            command.Parameters.AddWithValue("@emailAddress", MailAddress);
    //            command.Parameters.AddWithValue("@description", Description);                
    //            connection.Open();
    //            command.ExecuteNonQuery();
    //        }
    //    }
    //}
    //public static void RemoveAuthor(int authorID)
    //{
    //    using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
    //    {
    //        using (OleDbCommand command = new OleDbCommand())
    //        {
    //            string deleteString = "DELETE FROM [Authors] WHERE [AuthorID] = @authorID";
    //            command.Connection = connection;
    //            command.CommandText = deleteString;
    //            command.Parameters.AddWithValue("@authorID", authorID);
    //            connection.Open();
    //            command.ExecuteNonQuery();
    //        }
    //    }
    //}
    //public static void EditAuthor(byte[] ProfilePhoto, string MailAddress, string Description, int AuthorID)
    //{
    //    using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
    //    {
    //        using (OleDbCommand command = new OleDbCommand())
    //        {
    //            string updateString;
    //            if (ProfilePhoto.GetLength(0) != 0)
    //            {
    //                updateString = "UPDATE [Authors] SET [ProfilePhoto] = @profilePhoto, [MailAddress] = @emailAddress, [Description] = @description WHERE [AuthorID] = @authorID";
    //                command.Parameters.AddWithValue("@profilePhoto", ResizeImageFile(ProfilePhoto, new Size(60, 45)));
    //            }
    //            else
    //            {
    //                updateString = "UPDATE [Authors] SET [MailAddress] = @emailAddress, [Description] = @description WHERE [AuthorID] = @authorID";
    //            }
    //            command.Connection = connection;
    //            command.CommandText = updateString;
                
    //            command.Parameters.AddWithValue("@emailAddress", MailAddress != null ? MailAddress : "");
    //            command.Parameters.AddWithValue("@description", Description != null ? Description : "");
    //            command.Parameters.AddWithValue("@authorID", AuthorID);
    //            connection.Open();
    //            command.ExecuteNonQuery();
    //        }
    //    }
    //}

    public List<Author> GetAllAuthorsWithLastArticle()
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {

            using (OleDbCommand command = new OleDbCommand("SELECT Users.UserID, Users.Name, Users.Surname, Users.Email, Users.Description FROM ((Users INNER JOIN UsersInRoles ON Users.UserID = UsersInRoles.UserID) INNER JOIN Roles ON UsersInRoles.RoleID = Roles.RoleID) WHERE (Roles.RoleName = 'Yazar')", connection))
            {
                connection.Open();
                List<Author> authorList = new List<Author>();
                OleDbDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Author temp = new Author(Convert.ToInt32(reader["UserID"]), reader["Name"].ToString(), reader["Surname"].ToString(), reader["Email"].ToString(), reader["Description"].ToString());
                    temp.SetLastArticle();
                    authorList.Add(temp);
                }
                return authorList;
            }
        }
    }

    public static Stream GetProfilePhoto(int authorID)
    {
        using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/SiteData.mdb")))
        {
            using (OleDbCommand command = new OleDbCommand())
            {
                string selectString = "Select [ProfilePhoto] From Authors Where [AuthorID] = @authorID";
                //switch (size)
                //{
                //    case PhotoSize.Small:
                //        selectString = "SELECT TOP 1 [BytesThumb] FROM [Photos] LEFT JOIN [Albums] ON [Albums].[AlbumID] = [Photos].[AlbumID] WHERE [PhotoID] = @PhotoID";
                //        break;
                //    case PhotoSize.Medium:
                //        selectString = "SELECT TOP 1 [BytesPoster] FROM [Photos] LEFT JOIN [Albums] ON [Albums].[AlbumID] = [Photos].[AlbumID] WHERE [PhotoID] = @PhotoID";
                //        break;
                //    case PhotoSize.Large:
                //        selectString = "SELECT TOP 1 [BytesFull] FROM [Photos] LEFT JOIN [Albums] ON [Albums].[AlbumID] = [Photos].[AlbumID] WHERE [PhotoID] = @PhotoID";
                //        break;
                //    case PhotoSize.Original:
                //        selectString = "SELECT TOP 1 [BytesOriginal] FROM [Photos] LEFT JOIN [Albums] ON [Albums].[AlbumID] = [Photos].[AlbumID] WHERE [PhotoID] = @PhotoID";
                //        break;
                //    default:
                //        selectString = "SELECT TOP 1 [BytesPoster] FROM [Photos] LEFT JOIN [Albums] ON [Albums].[AlbumID] = [Photos].[AlbumID] WHERE [PhotoID] = @PhotoID";
                //        break;
                //}
                command.Connection = connection;
                command.CommandText = selectString;
                command.Parameters.AddWithValue("@authorID", authorID);
                connection.Open();
                object result = command.ExecuteScalar();
                try
                {
                    return new MemoryStream((byte[])result);
                }
                catch
                {
                    return null;
                }
            }
        }
    }
    private static byte[] ResizeImageFile(byte[] imageFile, Size imageSize)
    {
        using (System.Drawing.Image oldImage = System.Drawing.Image.FromStream(new MemoryStream(imageFile)))
        {            
            using (Bitmap newImage = new Bitmap(imageSize.Width, imageSize.Height, PixelFormat.Format24bppRgb))
            {
                using (Graphics canvas = Graphics.FromImage(newImage))
                {
                    canvas.SmoothingMode = SmoothingMode.AntiAlias;
                    canvas.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    canvas.PixelOffsetMode = PixelOffsetMode.HighQuality;
                    canvas.DrawImage(oldImage, new Rectangle(new Point(0, 0), imageSize));
                    MemoryStream m = new MemoryStream();
                    newImage.Save(m, ImageFormat.Jpeg);
                    return m.GetBuffer();
                }
            }
        }
    }  

}
