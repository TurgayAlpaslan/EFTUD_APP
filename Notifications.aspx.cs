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

public partial class Notifications : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["NotificationID"] != null && Request.QueryString["NotificationID"] != "")
        {
            int notificationID = Convert.ToInt32(Request.QueryString["NotificationID"]);
            List<News> news = NotificationManager.GetNotification(notificationID);
            Label lblAddedDate = (Label)Master.FindControl("lblAddedDate");
            Label lblCaption = (Label)Master.FindControl("lblCaption");
            lblAddedDate.Text = news[0].AddedDate.ToShortDateString();
            lblCaption.Text = news[0].Caption;

        }
    }
}
