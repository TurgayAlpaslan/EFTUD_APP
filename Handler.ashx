<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.IO;
using System.Web;

public class Handler : IHttpHandler {

	public bool IsReusable {
		get {
			return true;
		}
	}
	
	public void ProcessRequest (HttpContext context) {
		// Set up the response settings
		context.Response.ContentType = "image/jpeg";
		context.Response.Cache.SetCacheability(HttpCacheability.Public);
		context.Response.BufferOutput = false;       
		Int32 id = -1;
        Int32 targetSize = 0;
		Stream stream = null;
        if (context.Request.QueryString["TargetSize"] != null && context.Request.QueryString["TargetSize"] != "")
        {
            targetSize = Convert.ToInt32(context.Request.QueryString["targetSize"]);
        }
		if (context.Request.QueryString["PhotoID"] != null && context.Request.QueryString["PhotoID"] != "") {
			id = Convert.ToInt32(context.Request.QueryString["PhotoID"]);            
			stream = PhotoManager.GetPhoto(id, targetSize);
		}
        else if (context.Request.QueryString["UserID"] != null && context.Request.QueryString["UserID"] != "")
        {
            id = Convert.ToInt32(context.Request.QueryString["UserID"]);
            stream = UserManager.GetProfilePhoto(id, targetSize);
            if (stream == null) stream = UserManager.GetProfilePhoto(targetSize);
                
        }
        else if (context.Request.QueryString["NewsID"] != null && context.Request.QueryString["NewsID"] != "")
        {
            id = Convert.ToInt32(context.Request.QueryString["NewsID"]);
            stream = NewsManager.GetNewsPhoto(id, targetSize);
        }
        else if (context.Request.QueryString["EducatorID"] != null && context.Request.QueryString["EducatorID"] != "")
        {
            id = Convert.ToInt32(context.Request.QueryString["EducatorID"]);
            stream = EducatorManager.GetPhoto(id, targetSize);
            if (stream == null) stream = UserManager.GetProfilePhoto(targetSize);
        }
        else if (context.Request.QueryString["AdministratorID"] != null && context.Request.QueryString["AdministratorID"] != "")
        {
            id = Convert.ToInt32(context.Request.QueryString["AdministratorID"]);
            stream = AdministrationManager.GetPhoto(id, targetSize);
            if (stream == null) stream = UserManager.GetProfilePhoto(targetSize);
        }
        else if (context.Request.QueryString["MemberID"] != null && context.Request.QueryString["MemberID"] != "")
        {
            id = Convert.ToInt32(context.Request.QueryString["MemberID"]);
            stream = MemberManager.GetPhoto(id, targetSize);
            if (stream == null) stream = UserManager.GetProfilePhoto(targetSize);
        }
        else if (context.Request.QueryString["BiographyID"] != null && context.Request.QueryString["BiographyID"] != "")
        {
            id = Convert.ToInt32(context.Request.QueryString["BiographyID"]);
            stream = BiographyManager.GetPhoto(id, targetSize);
            if (stream == null) stream = UserManager.GetProfilePhoto(targetSize);
        }
        else if (context.Request.QueryString["NewspaperID"] != null && context.Request.QueryString["NewsPaperID"] != "")
        {
            int photoType = 0;
            if (context.Request.QueryString["PhotoType"] != null && context.Request.QueryString["PhotoType"] != "")
            {
                photoType = Convert.ToInt32(context.Request.QueryString["PhotoType"]);
            } 
            id = Convert.ToInt32(context.Request.QueryString["NewspaperID"]);            
            stream = NewspaperManager.GetNewspaperPhoto(id, photoType);
            if (stream == null) stream = UserManager.GetProfilePhoto(targetSize);
        }
        else if (context.Request.QueryString["VideoID"] != null && context.Request.QueryString["VideoID"] != "")
        {
            id = Convert.ToInt32(context.Request.QueryString["VideoID"]);
            stream = VideoManager.GetVideoPhoto(id, targetSize);
            if (stream == null) stream = UserManager.GetProfilePhoto(targetSize);
        }  
        else
        {
            id = Convert.ToInt32(context.Request.QueryString["AlbumID"]);
            stream = PhotoManager.GetFirstPhoto(id, targetSize);
        }
		// Get the photo from the database, if nothing is returned, get the default "placeholder" photo
        if (stream == null) stream = PhotoManager.GetPhoto(targetSize);
		// Write image stream to the response stream
		const int buffersize = 1024 * 16;
		byte[] buffer = new byte[buffersize];
		int count = stream.Read(buffer, 0, buffersize);
		while (count > 0) {
			context.Response.OutputStream.Write(buffer, 0, count);
			count = stream.Read(buffer, 0, buffersize);
		}
	}

}