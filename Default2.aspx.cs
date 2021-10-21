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
using System.Data.OleDb;
using System.Web.Configuration;
public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindMenu();
        }
    }
    protected void BindMenu()
    {
        string connectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/App_Data/SiteData.mdb");
        OleDbConnection con = new OleDbConnection(connectionString);
        OleDbDataAdapter dadCategories = new OleDbDataAdapter("SELECT CatId,CatName, link FROM TopMenuCategories order by OrderNr", con);
        OleDbDataAdapter dadSubCat = new OleDbDataAdapter("SELECT SubCatId,CatId,SubCatName, Link FROM TopMenuSubCategories order by OrderNr", con);
        DataSet dsCat = new DataSet();
        using (con)
        {
            con.Open();
            dadCategories.Fill(dsCat, "Category");
            dadSubCat.Fill(dsCat, "SubCategory");
        }
        dsCat.Relations.Add("Children", dsCat.Tables["Category"].Columns["CatId"], dsCat.Tables["SubCategory"].Columns["CatId"]);
        int count = 0;
        foreach (DataRow categoryRow in dsCat.Tables["Category"].Rows)
        {
            MenuItem mNode = new MenuItem(categoryRow["CatName"].ToString(), "", "", categoryRow["Link"].ToString(), "_parent");
            Menu1.Items.Add(mNode);
            DataRow[] subCategoryRows = categoryRow.GetChildRows("Children");
            foreach (DataRow row in subCategoryRows)
            {
                string subCatName = row["SubCatName"].ToString();
                MenuItem subCatItems = new MenuItem(subCatName, "", "", row["Link"].ToString(), "_parent");
                Menu1.Items[count].ChildItems.Add(subCatItems);
            }
            count++;
        }
    }
}
