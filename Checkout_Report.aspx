<%@ Page Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Checkout_Report.aspx.cs" Inherits="Checkout_Report" %>


<%--
<!--------------------------------->
<!--	 Modifcation Log		 -->
<!-- Name		Date		Info -->
<!---------------------------------> 
<!-- Van - 5/26/2019 - Initial Deployment -->
<!-- Van - 5/26/2019 - Set up initial Gridview and SQL Query -->
<!-- Van - 5/27/2019 - Fixed Gridview and changed IDs -->
<!-- Van - 5/28/2019 - Tried adding First and Last Name to girdview -->
<!-- Van - 5/30/2019 - Created view for table, adding First and Last Name -->
<!-- Van - 5/1/2019 - Added Disk_Status to the View and Gridview -->
<!-- Van - 5/1/2019 - CHanged SQL Query to show "Out-of-Stock", "On-Hold", and "Status-Unknown" -->
<!-- Van - 5/2/2019 - Decreased the left margin -->
<!-- Van - 5/3/2019 - Changed view to display BorrowerNames in one Column -->
<!-- Van - 5/3/2019 - Changedview  to display all Disk_Status not = "In-Stock" -->
<!-- Van - 5/3/2019 - Added and Updated styling in CSS -->
<!-- Van - 5/4/2019 - Fixed Column Names -->
<!-- Van - 5/4/2019 - Removed Time Stamps form DateTime Strings -->
<!-- Van - 5/4/2019 - Added ReadOnly To BoundFields -->
--%>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <title>Checout Report</title>
	<style type="text/css">
		.form-control {}
		.btn {}
	</style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" Runat="Server">

	<%--Form for the GridView and Inputs--%>
	 <form id="form1" runat="server" class="form-horizontal" style="text-align:center;">
		 <h2>Checkout Report</h2>
            <div class="col-xs-12 table-responsive" style="text-align:center; margin-left:10%;">
                
                <asp:GridView ID="grdCheckout_Report" runat="server"
                    AutoGenerateColumns="False"
                    DataSourceID="SqlDataSource1"
                    CssClass="table table-bordered table-condensed"
                    OnPreRender="grdCheckout_Report_PreRender" 
                    OnRowDeleted="grdCheckout_Report_RowDeleted" 
                    >
                   
                    	<%--	BOUND FIELDS		--%>
                    <Columns>
                        <asp:BoundField DataField="BorrowerNames" Readonly="true" HeaderText="Borrower Name" HeaderStyle-Width="20%" SortExpression="BorrowerNames">
                        </asp:BoundField>						
						<asp:BoundField DataField="disk_name" Readonly="true" HeaderText="Disk Name" SortExpression="disk_name" />						
						<asp:BoundField DataField="borrowed_date" Readonly="true" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Date Borrowed" HeaderStyle-Width="15%" SortExpression="borrowed_date">
                        </asp:BoundField>				
                    	<asp:BoundField DataField="expected_date" Readonly="true" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Expected By" SortExpression="expected_date" />
                        <asp:BoundField DataField="returned_date" Readonly="true" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Date Returned" SortExpression="returned_date" />
                        <asp:BoundField DataField="disk_status" Readonly="true" HeaderText="disk_status" SortExpression="Disk Status" />

                    </Columns>
                    <HeaderStyle CssClass="bg-halloween" />
                    <AlternatingRowStyle CssClass="altRow" />
                    <EditRowStyle CssClass="warning" />
                </asp:GridView>		
               
				
					<%--	SELCET COMMANDS	
								DELETE AND UPDATE COMMANDS	NOT ENABLED		--%>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:DiskConnection %>"                     
                    OldValuesParameterFormatString="original_{0}"
                    SelectCommand="SELECT [BorrowerNames], [disk_name], [borrowed_date], [expected_date], [returned_date], [disk_status] FROM [CheckOutReport_View] ORDER BY [borrowed_date] DESC, [disk_name], [disk_status] DESC">

                </asp:SqlDataSource>                  
				
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
				
                <asp:ValidationSummary ID="ValidationSummary2" runat="server"
                    HeaderText="Please correct the following errors:" 
                    ValidationGroup="Edit" CssClass="text-danger" />  
            </div>

			
				<%--	VALIDATION	--%>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                    HeaderText="Please correct the following errors:" 
                    ValidationGroup="Edit" CssClass="text-danger" />    
				
				<%--	ERROR MESSAGE	--%>
				<p><asp:Label ID="lblError" runat="server" EnableViewState="false" 
                        CssClass="text-danger"></asp:Label></p>

          
		 </form>	
	<br/>

</asp:Content>