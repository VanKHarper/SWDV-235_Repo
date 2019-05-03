using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Checkout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }   

    protected void btnAdd_Click(object sender, EventArgs e)
    {



        // OLD INSERT. NOT WORKING
        //if (IsValid)
        //{
        //    var parameters = SqlDataSource1.InsertParameters;           
        //    parameters["disk_borrower_id"].DefaultValue = Borrower_DropDownList.SelectedValue;
        //    parameters["disk_id"].DefaultValue = Disk_Has_DropDownList.SelectedValue;           
        //    parameters["date_barrowed"].DefaultValue = Barrowed_Date_Calendar.SelectedDate.ToString();            

        //    try
        //    {
        //        SqlDataSource1.Insert();
        //        Borrower_DropDownList.SelectedValue = null;
        //        Borrower_DropDownList.SelectedValue = null;          
        //    }
        //    catch (Exception ex)
        //    {
        //        lblError.Text = DatabaseErrorMessage(ex.Message);
        //    }
        //}
    }




    private string DatabaseErrorMessage(string errorMsg)
    {
        return $"<b>A database error has occurred:</b> {errorMsg}";
    }
    private string ConcurrencyErrorMessage()
    {
        return "Another user may have updated that category. Please try again?";
    }

    protected void Artist_grdArtist_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}