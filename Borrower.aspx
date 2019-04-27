<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Borrower.aspx.cs" Inherits="Borrower" %>


<%--<!--	 Modifcation Log	 -->
<!-- Name		Date		Info -->
<!---------------------------------> 
<!-- Van - 4/12/2019 - Initial Deplotment -->
<!-- Van - 4/12/2019 - Set up Labels and Textboxes -->
<!-- Van - 4/12/2019 - Added Submit Button -->
<!-- Van - 4/13/2019 - Added validation to all textboxes -->
<!-- Van - 4/13/2019 - Added Clear Button -->
<!-- Van - 4/13/2019 - Added Jquery for validation -->--%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
	<title>Borrower Page</title>
	<style type="text/css">
		.form-control {}
		.btn {}
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" Runat="Server">

	 <form id="form1" runat="server" class="form-horizontal">

            <div class="col-xs-12 table-responsive">
                <h1>Borrowers Category Maintenance</h1>
                <asp:GridView ID="Borrower_grdBorrower" runat="server"
                    AutoGenerateColumns="False" DataKeyNames="Borrower_id"
                    DataSourceID="SqlDataSource1"
                    CssClass="table table-bordered table-condensed"
                    OnPreRender="grdBorrower_PreRender" 
                    OnRowDeleted="grdBorrower_RowDeleted" 
                    OnRowUpdated="grdBorrower_RowUpdated" OnSelectedIndexChanged="Borrower_grdBorrower_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="Borrower_id" HeaderText="ID" 
                            ReadOnly="True">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:BoundField>
                       

						<asp:TemplateField HeaderText="First Name">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridFirstName" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("FirstName") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridFirstName" runat="server" 
                                    ControlToValidate="txtGridFirstName" ValidationGroup="Edit" 
                                    ErrorMessage="First Name is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridFirstName" runat="server" 
                                    Text='<%# Bind("FirstName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-4" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Last Name">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridLastName" runat="server" 
                                        MaxLength="50" CssClass="form-control"   
                                        Text='<%# Bind("LastName") %>'></asp:TextBox>
                                </div>

									<%-- Old Required Field Validator for Last Name. NOT Needed --
                              <asp:RequiredFieldValidator ID="rfvGridLastName" runat="server" 
                                    ControlToValidate="txtGridLastName" ValidationGroup="Edit" 
                                    Text="*" ErrorMessage="Last Name is a required field" 
                                    CssClass="text-danger"></asp:RequiredFieldValidator>--%>

                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridLastName" runat="server" 
                                    Text='<%# Bind("LastName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-5" />
                        </asp:TemplateField>

						 <asp:TemplateField HeaderText="Phone Number">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridphone_num" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("phone_num") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridphone_num" runat="server" 
                                    ControlToValidate="txtGridphone_num" ValidationGroup="Edit" 
                                    ErrorMessage="Phone Number is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label name="lblGridphone_num" ID="lblGridphone_num" runat="server" 
                                    Text='<%# Bind("phone_num")%>'></asp:Label>								
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-4" />
                        </asp:TemplateField>

                        <asp:CommandField CausesValidation="True" 
                            ShowEditButton="True" ValidationGroup="Edit">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:CommandField>
                        <asp:CommandField ShowDeleteButton="True">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:CommandField>
                    </Columns>
                    <HeaderStyle CssClass="bg-halloween" />
                    <AlternatingRowStyle CssClass="altRow" />
                    <EditRowStyle CssClass="warning" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:DiskConnection %>"
                    ConflictDetection="CompareAllValues" 
                    OldValuesParameterFormatString="original_{0}"
                    SelectCommand="SELECT [Borrower_id], [phone_num], [FirstName], [LastName] 
                        FROM [Borrower]"
                    DeleteCommand="DELETE FROM [Borrower] 
                        WHERE [Borrower_id] = @original_Borrower_id 
                          AND [phone_num] = @original_phone_num 
                          AND [FirstName] = @original_FirstName 
                          AND [LastName] = @original_LastName" 
                    InsertCommand="INSERT INTO [Borrower] 
                        ([phone_num], [FirstName], [LastName]) 
                        VALUES ( @phone_num, @FirstName, @LastName)" 
                    UpdateCommand="UPDATE [Borrower] 
                          SET [phone_num] = @phone_num, 
							  [FirstName] = @FirstName, 
                              [LastName] = @LastName 
                        WHERE [Borrower_id] = @original_Borrower_id 
                          AND [phone_num] = @original_phone_num 
                          AND [FirstName] = @original_FirstName 
                          AND [LastName] = @original_LastName">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Borrower_id" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_phone_num" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_FirstName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_LastName" Type="String"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>                        
                        <asp:Parameter Name="phone_num" Type="String"></asp:Parameter>
                        <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="phone_num" Type="String"></asp:Parameter>
                        <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Borrower_id" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_phone_num" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_FirstName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_LastName" Type="String"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>  
                
                <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                    HeaderText="Please correct the following errors:" 
                    ValidationGroup="Edit" CssClass="text-danger" />  
            </div>

            <div class="col-xs-9">
                <p>To create a new category, enter the information 
                    and click Add New Category</p>
                <p><asp:Label ID="lblError" runat="server" EnableViewState="false" 
                        CssClass="text-danger"></asp:Label></p>

               
                <div class="form-group">
                    <label for="txtFirstName" class="col-sm-2">First Name:</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtFirstName" runat="server" MaxLength="35" 
                            CssClass="form-control" Width="142px"></asp:TextBox>
                    </div>
                    <div class="col-sm-offset-2 col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                        ControlToValidate="txtFirstName" CssClass="text-danger" Display="Dynamic" 
                        ErrorMessage="First Name is a required field">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>     
				
                <div class="form-group">
                    <label for="txtLastName" class="col-sm-2">Last Name:</label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtLastName" runat="server" MaxLength="70" 
                            CssClass="form-control" Width="170px"></asp:TextBox>
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                        ControlToValidate="txtLastName" CssClass="text-danger" Display="Dynamic" 
                        ErrorMessage="Last Name is a required field"></asp:RequiredFieldValidator>
                    </div>
                </div>

				 <div class="form-group">
                    <label for="txt_phone_num" class="col-sm-2">Phone Number:</label>
                    <div class="col-sm-3">
                    	<asp:TextBox ID="txt_phone_num"  MaxLength="20" runat="server" Width="166px"></asp:TextBox>
                    </div>
                    <div class="col-sm-offset-3 col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                            ControlToValidate="txt_phone_num" CssClass="text-danger" Display="Dynamic" 
                            ErrorMessage="Phone Number is a required field">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
			</br>
                <asp:Button ID="btnAdd" runat="server" Text="Add New Category" 
                    CssClass="btn" OnClick="btnAdd_Click" Height="33px" Width="174px" />
            </div>  

        </form>
	<br/>
	<br/>

</asp:Content>
