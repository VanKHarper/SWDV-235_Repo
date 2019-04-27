using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Artist : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void grdArtist_PreRender(object sender, EventArgs e)
    {
        Artist_grdArtist.HeaderRow.TableSection = TableRowSection.TableHeader;       
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            var parameters = SqlDataSource1.InsertParameters;
            parameters["Artist_type"].DefaultValue = Artist_DropDownList.SelectedValue;
            parameters["Artist_FName"].DefaultValue = txtArtist_FName.Text;
            parameters["Artist_LName"].DefaultValue = txtArtist_LName.Text;

            try
            {
                SqlDataSource1.Insert();
                Artist_DropDownList.SelectedIndex = 0;
                txtArtist_FName.Text = "";
                txtArtist_LName.Text = "";
            }
            catch (Exception ex)
            {
                lblError.Text = DatabaseErrorMessage(ex.Message);
            }
        }
    }

    protected void grdArtist_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = DatabaseErrorMessage(e.Exception.Message);
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = ConcurrencyErrorMessage();
        }
    }

    protected void grdArtist_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = DatabaseErrorMessage(e.Exception.Message);
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = ConcurrencyErrorMessage();
        }
    }

    private string DatabaseErrorMessage(string errorMsg)
    {
        return $"<b>A database error has occurred:</b> {errorMsg}";
    }
    private string ConcurrencyErrorMessage()
    {
        return "Another user may have updated that category. Please try again";
    }

    protected void Artist_grdArtist_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
