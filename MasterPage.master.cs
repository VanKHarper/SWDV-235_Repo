using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/**
<!--	 Modifcation Log	 -->
<!-- Name		Date		Info -->
<!---------------------------------> 
<!-- Van - 4/12/2019 - Initial Deplotment -->
<!-- Van - 4/13/2019 - Added Copy RIght Updater -->
*/

public partial class MasterPage : System.Web.UI.MasterPage
{
    // Sets Up the copyright year in the Footer
    private string currentYear = DateTime.Today.Year.ToString();  


    protected void Page_Load(object sender, EventArgs e)
    {
        // Updates CopyRight year
        lblYear.Text = currentYear;
    }
}
