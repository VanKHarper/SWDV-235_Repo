using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Borrower : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void grdBorrower_PreRender(object sender, EventArgs e)
    {
        Borrower_grdBorrower.HeaderRow.TableSection = TableRowSection.TableHeader;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            var parameters = SqlDataSource1.InsertParameters;
            parameters["phone_num"].DefaultValue = txt_phone_num.Text;
            parameters["FirstName"].DefaultValue = txtFirstName.Text;
            parameters["LastName"].DefaultValue = txtLastName.Text;

            try
            {
                SqlDataSource1.Insert();
                txt_phone_num.Text = "";
                txtFirstName.Text = "";
                txtLastName.Text = "";
            }
            catch (Exception ex)
            {
                lblError.Text = DatabaseErrorMessage(ex.Message);
            }
        }
    }

    protected void grdBorrower_RowUpdated(object sender, GridViewUpdatedEventArgs e)
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

    protected void grdBorrower_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
        return "Another user may have updated that category. Please try again?";
    }

    protected void Borrower_grdBorrower_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}