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
public partial class BiographyDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["BiographyID"] != null && Request.QueryString["BiographyID"] != "")
        {
            int ID = Convert.ToInt32(Request.QueryString["BiographyID"]);
            Biography biography = BiographyManager.GetBiography(ID);
            Label lblAddedDate = (Label)Master.FindControl("lblAddedDate");
            Label lblCaption = (Label)Master.FindControl("lblCaption");
            lblAddedDate.Text = biography.BirthdayAndDeath;
            lblCaption.Text = biography.ToString();

        }
    }
}
