<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Artist.aspx.cs" Inherits="Artist" %>


<%--
<!--------------------------------->
<!--	 Modifcation Log		 -->
<!-- Name		Date		Info -->
<!---------------------------------> 
<!-- Van - 4/12/2019 - Initial Deplotment -->
<!-- Van - 4/13/2019 - Added Construction Image -->
<!-- Van - 4/13/2019 - Added Submit Button -->
<!-- Van - 4/13/2019 - Added validation to all textboxes -->
<!-- Van - 4/13/2019 - Added Clear Button -->
<!-- Van - 4/13/2019 - Added Jquery for validation -->
<!-- Van - 4/14/2019 - Added design elements -->
<!-- Van - 4/15/2019 - changed names of design elements and added slight styling-->
<!-- Van - 4/16/2019 - Attmepted to set up gridview -->
<!-- Van - 4/16/2019 - Added required validators and changed their IDs -->
<!-- Van - 4/17/2019 - Added divs and added col spacing for gridview -->
<!-- Van - 4/19/2019 - Fixed grid view using code example -->
<!-- Van - 4/22/2019 - fixed issue with insert ID -->
<!-- Van - 4/23/2019 - Fixed select statements -->
<!-- Van - 4/24/2019 - Corrected Styling issues -->
<!-- Van - 4/26/2019 - Fixed issue with Select command on Disk_Genre-->
<!-- Van - 4/26/2019 - Fixed issue with Code Behind IDs -->
<!-- Van - 4/26/2019 - Fixed minor styling issues and added commenting-->
--%>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
	<title>Artist Page</title>
	<style type="text/css">
		.form-control {}
		.btn {}
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" Runat="Server">

	<%--Form for the GridView and Inputs--%>
	 <form id="form1" runat="server" class="form-horizontal">
            <div class="col-xs-12 table-responsive">
                <h1>Artists Category Maintenance</h1>
                <asp:GridView ID="Artist_grdArtist" runat="server"
                    AutoGenerateColumns="False" DataKeyNames="artist_id"
                    DataSourceID="SqlDataSource1"
                    CssClass="table table-bordered table-condensed"
                    OnPreRender="grdArtist_PreRender" 
                    OnRowDeleted="grdArtist_RowDeleted" 
                    OnRowUpdated="grdArtist_RowUpdated" OnSelectedIndexChanged="Artist_grdArtist_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="artist_id" HeaderText="ID" 
                            ReadOnly="True">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:BoundField>
                       
						<%--	FIRST NAME	--%>
						<asp:TemplateField HeaderText="First Name">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridArtist_FName" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("Artist_FName") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridArtist_FName" runat="server" 
                                    ControlToValidate="txtGridArtist_FName" ValidationGroup="Edit" 
                                    ErrorMessage="First Name is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridArtist_FName" runat="server" 
                                    Text='<%# Bind("Artist_FName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-4" />
                        </asp:TemplateField>

						<%--	LAST NAME	--%>
                        <asp:TemplateField HeaderText="Last Name">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridArtist_LName" runat="server" 
                                        MaxLength="50" CssClass="form-control"   
                                        Text='<%# Bind("Artist_LName") %>'></asp:TextBox>
                                </div>
							<%-- Old Required Field Validator for Last Name. NOT Needed --
                              <asp:RequiredFieldValidator ID="rfvGridArtist_LName" runat="server" 
                                    ControlToValidate="txtGridArtist_LName" ValidationGroup="Edit" 
                                    Text="*" ErrorMessage="Last Name is a required field" 
                                    CssClass="text-danger"></asp:RequiredFieldValidator>--%>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridArtist_LName" runat="server" 
                                    Text='<%# Bind("Artist_LName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-5" />
                        </asp:TemplateField>

						<%--	ARTIST TYPE		--%>
						 <asp:TemplateField HeaderText="Artist Type">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridArtist_Type" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("Artist_Type") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridArtist_Type" runat="server" 
                                    ControlToValidate="txtGridArtist_Type" ValidationGroup="Edit" 
                                    ErrorMessage="Artist Type is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label name="lblGridArtist_Type" ID="lblGridArtist_Type" runat="server" 
                                    Text='<%# Bind("Artist_Type")%>'></asp:Label>								
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

				<%--	SELCET COMMANDS		--%>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:DiskConnection %>"
                    ConflictDetection="CompareAllValues" 
                    OldValuesParameterFormatString="original_{0}"
                    SelectCommand="SELECT [artist_id], [Artist_Type], [Artist_FName], [Artist_LName] 
                        FROM [Artist]"
                    DeleteCommand="DELETE FROM [Artist] 
                        WHERE [artist_id] = @original_artist_id 
                          AND [Artist_Type] = @original_Artist_Type 
                          AND [Artist_FName] = @original_Artist_FName 
                          AND [Artist_LName] = @original_Artist_LName" 
                    InsertCommand="INSERT INTO [Artist] 
                        ([Artist_Type], [Artist_FName], [Artist_LName]) 
                        VALUES ( @Artist_Type, @Artist_FName, @Artist_LName)" 
                    UpdateCommand="UPDATE [Artist] 
                          SET [Artist_Type] = @Artist_Type, 
							  [Artist_FName] = @Artist_FName, 
                              [Artist_LName] = @Artist_LName 
                        WHERE [artist_id] = @original_artist_id 
                          AND [Artist_Type] = @original_Artist_Type 
                          AND [Artist_FName] = @original_Artist_FName 
                          AND [Artist_LName] = @original_Artist_LName">

					<%--	DELETE, UPDATE AND INSERT PARAMETERS	 --%>
                    <DeleteParameters>
                        <asp:Parameter Name="original_artist_id" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Artist_Type" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Artist_FName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Artist_LName" Type="String"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>                        
                        <asp:Parameter Name="Artist_Type" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Artist_FName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Artist_LName" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Artist_Type" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Artist_FName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Artist_LName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_artist_id" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Artist_Type" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Artist_FName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Artist_LName" Type="String"></asp:Parameter>
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
                    <label for="Artist_DropDownList" class="col-sm-2">Artist Type:</label>
                    <div class="col-sm-3">
                    <label for="Artist_DropDownList" class="col-sm-2">
						<asp:DropDownList ID="Artist_DropDownList" runat="server" Height="26px" Width="62px">
							<asp:ListItem Value="Solo">Solo</asp:ListItem>
							<asp:ListItem Value="Group">Group</asp:ListItem>
						</asp:DropDownList>
						</label>
                    </div>
                    <div class="col-sm-offset-3 col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvArtist_DropDownList" runat="server" 
                            ControlToValidate="Artist_DropDownList" CssClass="text-danger" Display="Dynamic" 
                            ErrorMessage="Please select an Artist Type">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtArtist_FName" class="col-sm-2">First Name:</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtArtist_FName" runat="server" MaxLength="35" 
                            CssClass="form-control" Width="140px" ></asp:TextBox>
                    </div>
                    <div class="col-sm-offset-2 col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvArtist_FName" runat="server" 
                        ControlToValidate="txtArtist_FName" CssClass="text-danger" Display="Dynamic" 
                        ErrorMessage="Please enter a First Name">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>              
                <div class="form-group">
                    <label for="txtArtist_LName" class="col-sm-2">Last Name:</label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtArtist_LName" runat="server" MaxLength="70" 
                            CssClass="form-control" Width="181px"></asp:TextBox>
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvArtist_LName" runat="server" 
                        ControlToValidate="txtArtist_LName" CssClass="text-danger" Display="Dynamic" 
                        ErrorMessage="Please enter a Last Name.">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
			</br>
                <asp:Button ID="btnAdd" runat="server" Text="Add New Category" 
                    CssClass="btn" OnClick="btnAdd_Click" Height="30px" Width="170px" />
            </div> 
		 </form>
		<br/>
	<br/>

</asp:Content>
