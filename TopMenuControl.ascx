<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TopMenuControl.ascx.cs" Inherits="TopMenuControl" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data" %>
<div id="main_menu">
    <ul id="nav2">
        <%
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
                string link = "#";
                if (categoryRow["Link"].ToString() != "")
                    link = categoryRow["Link"].ToString();             

                Response.Write("<li><a href='" + link + "'>" + categoryRow["CatName"].ToString() + "</a>");
                DataRow[] subCategoryRows = categoryRow.GetChildRows("Children");
                if (subCategoryRows.Length == 0)
                {
                    Response.Write("</li>");
                }
                else
                {
                    Response.Write("<ul class='children'>");
                    foreach (DataRow row in subCategoryRows)
                    {
                        string subCatName = row["SubCatName"].ToString();                       
                        Response.Write("<li><a href='" + row["Link"].ToString() + "'>" + subCatName + "</a></li>");
                    }
                    Response.Write("</ul></li>");
                }
                count++;
            }
        %>
    </ul>
</div>
