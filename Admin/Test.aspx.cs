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
public partial class Admin_Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        float totalSize = 0;
        List<ImageInfo> imageInfo = Test.GetEducatorsPhotoSize();
        for (int i = 0; i < imageInfo.Count; i++)
        {
            totalSize += imageInfo[i].Size;
        }
        Response.Write(totalSize);
    }
}
