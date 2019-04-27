using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Compact_Disk : System.Web.UI.Page
{
    protected void grdDisk_PreRender(object sender, EventArgs e)
    {
        grd_Disk.HeaderRow.TableSection = TableRowSection.TableHeader;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            var parameters = SqlDataSource1.InsertParameters;
            parameters["Disk_Status"].DefaultValue = Disk_Status_DropDownList.SelectedValue;
            parameters["Disk_Genre"].DefaultValue = Disk_Genre_DropDownList.SelectedValue;
            parameters["Disk_Type"].DefaultValue = Disk_Type_DropDownList.SelectedValue;
            parameters["Disk_Name"].DefaultValue = txtDisk_Name.Text;
            parameters["release_date"].DefaultValue = Disk_Calendar.SelectedDate.ToString();

            try
            {
                SqlDataSource1.Insert();
                Disk_Status_DropDownList.SelectedValue = null;
                Disk_Genre_DropDownList.SelectedValue = null;
                Disk_Type_DropDownList.SelectedValue = null;
                txtDisk_Name.Text = "";              
            }
            catch (Exception ex)
            {
                lblError.Text = DatabaseErrorMessage(ex.Message);
            }
        }
    }

    protected void grdDisk_RowUpdated(object sender, GridViewUpdatedEventArgs e)
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

    protected void grdDisk_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
}