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

public partial class Admin_TopMenu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList drpList = (DropDownList)(FormView1.FindControl("DropDownList1"));
        TextBox txtLink = (TextBox)(FormView1.FindControl("LinkTextBox"));
        txtLink.Text = drpList.SelectedValue;

    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList drpList = (DropDownList)(FormView2.FindControl("DropDownList2"));
        TextBox txtLink = (TextBox)(FormView2.FindControl("LinkTextBox"));
        txtLink.Text = drpList.SelectedValue;
    }
    protected void FormView2_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        if (GridView1.SelectedValue == null)
            e.Cancel = true;
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
        Label lbl = (Label)(row.FindControl("Label1"));

        lblCategory.Text = "(" + lbl.Text + ")";
    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        Reset();
    }
    protected void Reset()
    {
        GridView1.DataBind();
        GridView2.DataBind();
        GridView1.SelectedIndex = -1;
        lblCategory.Text = "";
    }
    protected void CategoryMoveUp_Command(object sender, CommandEventArgs e)
    {
        TopMenuManager.CategoryMoveUp(Convert.ToInt32(e.CommandArgument));        
        Reset();
    }
    protected void CategoryMoveDown_Command(object sender, CommandEventArgs e)
    {
        TopMenuManager.CategoryMoveDown(Convert.ToInt32(e.CommandArgument));
        Reset();
    }
    protected void SubCategoryMoveUp_Command(object sender, CommandEventArgs e)
    {
        TopMenuManager.SubCategoryMoveUp(Convert.ToInt32(e.CommandArgument), Convert.ToInt32(GridView1.SelectedValue));
        GridView2.DataBind();
    }
    protected void SubCategoryMoveDown_Command(object sender, CommandEventArgs e)
    {
        TopMenuManager.SubCategoryMoveDown(Convert.ToInt32(e.CommandArgument), Convert.ToInt32(GridView1.SelectedValue));
        GridView2.DataBind();
    }
}
