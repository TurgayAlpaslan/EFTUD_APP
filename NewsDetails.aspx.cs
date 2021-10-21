using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

public partial class NewsDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["NewsID"] != null && Request.QueryString["NewsID"] != "")
        {
            int newsID = Convert.ToInt32(Request.QueryString["NewsID"]);
            List<News> news = NewsManager.GetNews(newsID);
            Label lblAddedDate = (Label)Master.FindControl("lblAddedDate");
            Label lblCaption = (Label)Master.FindControl("lblCaption");       
            lblAddedDate.Text = news[0].AddedDate.ToShortDateString();
            lblCaption.Text = news[0].Caption;
            
        }
    }
}
