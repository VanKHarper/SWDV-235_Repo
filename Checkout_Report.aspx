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
                    AutoGenerateColumns="False"
                    DataSourceID="SqlDataSource1"
                    CssClass="table table-bordered table-condensed"
                    OnPreRender="grdCheckout_Report_PreRender" 
                    OnRowDeleted="grdCheckout_Report_RowDeleted" >
                   
                    <Columns>
                        <asp:BoundField DataField="BorrowerNames" HeaderText="BorrowerNames" HeaderStyle-Width="20%" SortExpression="BorrowerNames" ReadOnly="True">
                        </asp:BoundField>
						
						<asp:BoundField DataField="disk_name" HeaderText="disk_name" SortExpression="disk_name" />
						
						<asp:BoundField DataField="borrowed_date" HeaderText="borrowed_date" HeaderStyle-Width="15%" SortExpression="borrowed_date">
                        </asp:BoundField>
						
						<%--	Checkout_Report TYPE		--%>
                    	<asp:BoundField DataField="expected_date" HeaderText="expected_date" SortExpression="expected_date" />
                        <asp:BoundField DataField="returned_date" HeaderText="returned_date" SortExpression="returned_date" />

                        <asp:BoundField DataField="disk_status" HeaderText="disk_status" SortExpression="disk_status" />

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
	<br/>

</asp:Content>