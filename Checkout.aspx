<%@ Page Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>


<%--
<!--------------------------------->
<!--	 Modifcation Log		 -->
<!-- Name		Date		Info -->
<!---------------------------------> 
<!-- Van - 5/26/2019 - Initial Deployment -->
<!-- Van - 5/26/2019 - Set up labels and text input boxes -->
<!-- Van - 5/27/2019 - Change the inputs to dropdown lists and added calendar  -->
<!-- Van - 5/27/2019 - Changed IDs for the input options and added required field validators -->
<!-- Van - 5/27/2019 - Attempted Insert on button Click in aspx.cs file -->
<!-- Van - 5/28/2019 - Fixed issue with SQL query and required field validotor -->
<!-- Van - 5/29/2019 - Removed calendar validator -->
<!-- Van - 5/30/2019 - Fixed error label and required field text -->
<!-- Van - 5/30/2019 - Added Script to Content PlaceHolder1 in order to execute stored procedure -->
<!-- Van - 5/1/2019 - Fixed issue with inserting into Disk_Has_Borrower -->
<!-- Van - 5/2/2019 - Attempted fixing updating Disk_Status -->
<!-- Van - 5/2/2019 - Could not fix updating Disk_Status -->
--%>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
	
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">		
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // Code that uses the data entered by the user
            // Define data objects
            SqlConnection conn;
            SqlCommand comm;
            SqlCommand comm2;

            // Read the connection string from Web.config
            string connectionString =
            ConfigurationManager.ConnectionStrings[
            "DiskConnection"].ConnectionString;
            // Initialize connection
            conn = new SqlConnection(connectionString);

            // Executes Stored Procedure to Insert Values
            comm = new SqlCommand("EXEC INS_Disk_Has_Borrower @Disk_Borrower_ID, @Disk_ID, @Borrowed_Date", conn);
            comm.Parameters.Add("@Disk_Borrower_ID", System.Data.SqlDbType.Int);
            comm.Parameters["@Disk_Borrower_ID"].Value = Borrower_DropDownList.SelectedIndex;
            comm.Parameters.Add("@Disk_ID", System.Data.SqlDbType.Int);
            comm.Parameters["@Disk_ID"].Value = Borrower_DropDownList.SelectedIndex;
            comm.Parameters.Add("@Borrowed_Date", System.Data.SqlDbType.DateTime);
            comm.Parameters["@Borrowed_Date"].Value = Barrowed_Date_Calendar.SelectedDate;

            // NOT WORKING
            // Executes Stored Procedure to Update Disk Status
            comm2 = new SqlCommand("EXEC INS_DiskStatusChanger @Disk_Status, @disk_id", conn);
            comm2.Parameters.Add("@Disk_Status", System.Data.SqlDbType.VarChar);
            comm2.Parameters["@Disk_Status"].Value = CheckoutType_DropDownList.SelectedValue;
            comm2.Parameters.Add("@disk_id", System.Data.SqlDbType.Int);
            comm2.Parameters["@disk_id"].Value = Disk_Has_DropDownList.SelectedValue;

            // Enclose database code in Try-Catch-Finally
            try
            {
                // Open the connection
                conn.Open();
                // Execute the command
                comm.ExecuteNonQuery();
                //comm2.ExecuteNonQuery();
                // Reload page if the query executed successfully
                Response.Redirect("Checkout_Report.aspx");
            }
            catch (SqlException ex)
            {
                // Display error message
                lblError.Text =
                   "Error submitting the data! " + ex.Message.ToString();
            }
            finally
            {
                // Close the connection
                conn.Close();
            }

        }
    }
	</script>

	<title>Disk Checkout</title>
	<style type="text/css">
		.form-control {}
		.btn {}
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" Runat="Server">

	<%--Form for the Inputs--%>
	 <form id="form1" runat="server" class="form-horizontal">           
		 
		  <h1>Checkout a Disk!</h1>              

            <div class="col-xs-9" style="margin-left:20%;">
                <p>To create a new category, enter the information 
                    and click Add New Category</p>
                

                <div class="form-group">
                    <label for="_DropDownList" class="col-sm-2">Choose A Borrower:</label>
                    <div class="col-sm-3">
                    	<asp:DropDownList ID="Borrower_DropDownList" runat="server" DataSourceID="SqlDataSource3" DataTextField="BorrowerNames" DataValueField="BorrowerNames" Height="33px" Width="191px">							
						</asp:DropDownList>
						<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DiskConnection %>" SelectCommand="SELECT [BorrowerNames] FROM [BorrowerNames_View] ORDER BY [BorrowerNames], [borrower_id]"></asp:SqlDataSource>
                    </div>
                    <div class="col-sm-offset-3 col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvBorrower_DropDownList" runat="server" 
                            ControlToValidate="Borrower_DropDownList" CssClass="text-danger" Display="Dynamic" 
                            ErrorMessage="Please select an Borrower.">                           
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <br />

                <div class="form-group">
                    <label for="Disk_Has_DropDownList" class="col-sm-2">Avaliable Disks:</label>
                    <div class="col-sm-4">
                        <asp:DropDownList ID="Disk_Has_DropDownList" runat="server" DataSourceID="SqlDataSource4" DataTextField="disk_name" DataValueField="disk_name" Height="34px" Width="192px">
						</asp:DropDownList>
						<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DiskConnection %>" SelectCommand="SELECT [disk_name], [disk_id] FROM [compact_disk] WHERE ([Disk_Status] = @Disk_Status) ORDER BY [disk_name], [Disk_Genre], [release_date]">
							<SelectParameters>
								<asp:Parameter DefaultValue="In-Stock" Name="Disk_Status" Type="String" />
							</SelectParameters>
						</asp:SqlDataSource>
                    </div>
                    <div class="col-sm-offset-2 col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvDisk_Has_DropDownList" runat="server" 
                        ControlToValidate="Disk_Has_DropDownList" CssClass="text-danger" Display="Dynamic" 
                        ErrorMessage="Please Select a Disk."></asp:RequiredFieldValidator>
                    </div>
                </div>   
                <br />

                   <div class="form-group">
                    <label for="Disk_Has_DropDownList" class="col-sm-2">Kind of Checkout:</label>
                    <div class="col-sm-4">
                        <asp:DropDownList ID="CheckoutType_DropDownList" runat="server" DataTextField="Disk_Status" DataValueField="Disk_Status" Height="34px" Width="192px">
                            <asp:ListItem Value="Out-of-Stock">Check Out</asp:ListItem>
                            <asp:ListItem Value="On-Hold">Put On Hold</asp:ListItem>
						</asp:DropDownList>
                    </div>
                    <div class="col-sm-offset-2 col-sm-4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="Disk_Has_DropDownList" CssClass="text-danger" Display="Dynamic" 
                        ErrorMessage="Please Select a Checkout Type."></asp:RequiredFieldValidator>
                    </div>
                </div>  

                <br />
                <div class="form-group">
                    <label for="Barrowed_Date_Calendar" class="col-sm-2" >Date Borrowed:</label>
                    <div class="col-sm-6">
                        <asp:Calendar ID="Barrowed_Date_Calendar" runat="server" Height="71px" Width="141px"></asp:Calendar>
                    </div>
                    <%--<div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvDate_Borrowed" runat="server" 
                        ControlToValidate="Barrowed_Date_Calendar" CssClass="text-danger" Display="Dynamic" 
                        ErrorMessage="Please enter Today's Date.">
                        </asp:RequiredFieldValidator>
                    </div>--%>
                </div>
									<%--	ERROR LABEL     --%>
				 <p><asp:Label ID="lblError" runat="server" EnableViewState="false" 
                        CssClass="text-danger"></asp:Label></p>

                <asp:Button ID="btnAdd" runat="server" Text="Checkout" 
                    CssClass="btn" OnClick="btnAdd_Click" Height="30px" Width="170px" />						   				 				        

					
				  <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:DiskConnection %>"
                    ConflictDetection="CompareAllValues"                     
                    OldValuesParameterFormatString="original_{0}"
                    SelectCommand="SELECT [disk_borrower_id], [disk_id], [borrowed_date], [returned_date] FROM [disk_has_borrower]"			
                
                    InsertCommand="INSERT INTO [disk_has_borrower] 
                        ([borrowed_date], [returned_date], [disk_id], [disk_borrower_id]) 
                        VALUES ( @borrowed_date, @returned_date, @disk_id, , @disk_borrower_id)"  >              

					<%--	 INSERT PARAMETERS	 --%>                  
                    <InsertParameters>                        
                        <asp:Parameter Name="borrowed_date" Type="String"></asp:Parameter>
                        <asp:Parameter Name="returned_date" Type="String"></asp:Parameter>
                        <asp:Parameter Name="disk_id" Type="String"></asp:Parameter>
                        <asp:Parameter Name="disk_borrower__id" Type="String"></asp:Parameter>
                    </InsertParameters>
                    
                </asp:SqlDataSource> 

					
				<%--	Submit Button	--%>

					
            </div> 
	
		  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DiskConnection %>" SelectCommand="SELECT [borrowed_date] FROM [disk_has_borrower]"></asp:SqlDataSource>
		 
	 </form>

		<br/>
	<br/>

</asp:Content>