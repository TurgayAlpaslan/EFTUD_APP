<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ControlVideo.ascx.cs" Inherits="ControlVideo" %>
<%@ Import Namespace="System.Collections.Generic" %>
<script type='text/javascript' src='swfobject.js'></script>
<div id='mediaspace'>This text will be replaced</div>
<% 
    int videoID = 0;
    if (Request.QueryString["VideoID"] != null && Request.QueryString["VideoID"] != "")
   {
       videoID = Convert.ToInt32(Request.QueryString["VideoID"]);
   }
   Video video = VideoManager.GetVideo(videoID);
    Response.Write("<script type='text/javascript'>");
       Response.Write("var so = new SWFObject('player.swf','ply','470','320','9','#000000');");
       Response.Write("so.addParam('allowfullscreen','true');");
       Response.Write("so.addParam('allowscriptaccess','always');");
       Response.Write("so.addParam('wmode','opaque');");
       //Response.Write("so.addVariable('file','1.flv');");
       Response.Write("so.addVariable('file','" + video.VideoPath + "');");
       Response.Write("so.write('mediaspace'); </script>");
       %>