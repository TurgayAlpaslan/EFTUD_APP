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
using System.Text;

/// <summary>
/// Summary description for DynamicHtmlContent
/// </summary>
public class DynamicHtmlContent
{
	public DynamicHtmlContent()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    //public string GetAllAuthorsWithLastArticles()
    //{
    //    StringBuilder stringBuilder = new StringBuilder();            
    //    List<Author> authorList = AuthorManager.GetAllAuthors();
    //    foreach (Author author in authorList)
    //    {            
    //        Article temp = author.GetLastArticle();
    //        stringBuilder.AppendLine("<li>");
    //        stringBuilder.AppendLine("  <a href='" + temp.ArticleID.ToString() + "' class= 'lnk'>");
    //        stringBuilder.AppendLine("      <img src='" + author.ProfilePhoto + "' alt ='" + author.Name + " " + author.Surname + "' />");
    //        stringBuilder.AppendLine("      <b>" + author.Name + " " + author.Surname + "</b><span>" + temp.Title + "</span>");
    //        stringBuilder.AppendLine("  </a>");
    //        stringBuilder.AppendLine("</li>");            
    //    }
    //    return stringBuilder.ToString();
    //}
    public string GetAllVideos()
    {
        StringBuilder stringBuilder = new StringBuilder();
        List<Video> videoList = VideoManager.GetAllVideoes();
        foreach (Video video in videoList)
        {
            stringBuilder.AppendLine("<li>");
            stringBuilder.AppendLine("<a href='" + video.VideoID.ToString() + "'>");
            stringBuilder.AppendLine("<img id='" + video.VideoID.ToString() + "' src='" + video.Thumbnail + "' alt='" + video.Title + "' style='border-width: 0px;' />");
            stringBuilder.AppendLine(video.Title + "</a>");
            stringBuilder.AppendLine("</li>");
        }
        return stringBuilder.ToString();
    }

    public string GetLastVideos(int count)
    {
        StringBuilder stringBuilder = new StringBuilder();
        List<Video> videoList = VideoManager.GetLastVideo(count);
        foreach (Video video in videoList)
        {
            stringBuilder.AppendLine("<li>");
            stringBuilder.AppendLine("<a href='" + video.VideoID.ToString() + "'>");
            stringBuilder.AppendLine("<img id='" + video.VideoID.ToString() + "' src='" + video.Thumbnail + "' alt='" + video.Title + "' style='border-width: 0px;' />");
            stringBuilder.AppendLine(video.Title + "</a>");
            stringBuilder.AppendLine("</li>");
        }
        return stringBuilder.ToString();
    }
}
