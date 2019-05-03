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
		 <h1>Checkout Report</h1>
            <div class="col-xs-12 table-responsive" style="text-align:center; margin-left:10%;">
                
                <asp:GridView ID="grdCheckout_Report" runat="server"
                    AutoGenerateColumns="False" DataKeyNames="disk_borrower_id,disk_id,borrowed_date"
                    DataSourceID="SqlDataSource1"
                    CssClass="table table-bordered table-condensed"
                    OnPreRender="grdCheckout_Report_PreRender" 
                    OnRowDeleted="grdCheckout_Report_RowDeleted" >
                   
                    <Columns>
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" HeaderStyle-Width="20%" SortExpression="FirstName">
                        </asp:BoundField>
						
						<asp:BoundField DataField="LastName" HeaderText="Last Name" HeaderStyle-Width="15%" SortExpression="LastName">
                        </asp:BoundField>
						
						<%--	Checkout_Report TYPE		--%>
						 <asp:BoundField DataField="disk_borrower_id" HeaderText="Disk Borrower ID" ReadOnly="True" SortExpression="disk_borrower_id" />
						<asp:BoundField DataField="disk_id" HeaderText="Disk ID" ReadOnly="True" SortExpression="disk_id" />
						<asp:BoundField DataField="borrowed_date" HeaderText="Borrowed Date" ReadOnly="True" SortExpression="borrowed_date" />
						<asp:BoundField DataField="returned_date" HeaderText="Returned Date" SortExpression="returned_date" />
                    	<asp:BoundField DataField="disk_status" HeaderText="Disk Status" SortExpression="disk_status" />

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
                    SelectCommand="SELECT * FROM [CheckoutReport_View] WHERE  ([disk_status] = @disk_status) OR ([disk_status] = @disk_status2) OR ([disk_status] = @disk_status3)">
					<SelectParameters>
						<asp:Parameter DefaultValue="Out-of-Stock" Name="disk_status" Type="String" />
						<asp:Parameter DefaultValue="On-Hold" Name="disk_status2" Type="String" />
						<asp:Parameter DefaultValue="Status-Unknown" Name="disk_status3" Type="String" />
					</SelectParameters>

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
	<br/>

</asp:Content>