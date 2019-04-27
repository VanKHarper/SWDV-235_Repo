<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Compact_Disk.aspx.cs" Inherits="Compact_Disk" %>

<%--<!--	 Modifcation Log	 -->
<!-- Name		Date		Info -->
<!---------------------------------> 
<!-- Van - 4/12/2019 - Initial Deplotment -->
<!-- Van - 4/13/2019 - Added Construction Image -->--%>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
	<title>Disk Page
	</title>
	<style type="text/css">
		.form-control {}
		.btn {}
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" Runat="Server">

	<form id="form1" runat="server" class="form-horizontal">

            <div class="col-xs-12 table-responsive">
                <h1>Disks Category Maintenance</h1> 
                <asp:GridView ID="grd_Disk" name="grd_Disk" runat="server"
                    AutoGenerateColumns="False" DataKeyNames="Disk_id"
                    DataSourceID="SqlDataSource1"
                    CssClass="table table-bordered table-condensed"
                    OnPreRender="grdDisk_PreRender" 
                    OnRowDeleted="grdDisk_RowDeleted" 
                    OnRowUpdated="grdDisk_RowUpdated">
                    <Columns>
                        <asp:BoundField DataField="Disk_id" HeaderText="ID" 
                            ReadOnly="True">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:BoundField>
                       
								<%-- DISK NAME--%>
						<asp:TemplateField HeaderText="Disk Name">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridDisk_Name" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("Disk_Name") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridDisk_Name" runat="server" 
                                    ControlToValidate="txtGridDisk_Name" ValidationGroup="Edit" 
                                    ErrorMessage="Disk Name is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridDisk_Name" runat="server" 
                                    Text='<%# Bind("Disk_Name") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-4" />
                        </asp:TemplateField>                       

							<%-- DISK TYPE--%>
						 <asp:TemplateField HeaderText="Disk Type">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridDisk_Type" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("Disk_Type") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridDisk_Type" runat="server" 
                                    ControlToValidate="txtGridDisk_Type" ValidationGroup="Edit" 
                                    ErrorMessage="Short Name is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridDisk_Type" runat="server" 
                                    Text='<%# Bind("Disk_Type") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-4" />
                        </asp:TemplateField>
						
						<%-- DISK GENRE--%>
						 <asp:TemplateField HeaderText="Disk Genre">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridDisk_Genre" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("Disk_Genre") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridDisk_Genre" runat="server" 
                                    ControlToValidate="txtGridDisk_Genre" ValidationGroup="Edit" 
                                    ErrorMessage="Short Name is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridDisk_Genre" runat="server" 
                                    Text='<%# Bind("Disk_Genre") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-4" />
                        </asp:TemplateField>								
					
						
							<%-- DISK STATUS --%>
						<asp:TemplateField HeaderText="Disk Status">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridDisk_Status" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("Disk_Status") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridDisk_Status" runat="server" 
                                    ControlToValidate="txtGridDisk_Status" ValidationGroup="Edit" 
                                    ErrorMessage="Short Name is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridDisk_Status" runat="server" 
                                    Text='<%# Bind("Disk_Status") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle CssClass="col-xs-4" />
                        </asp:TemplateField>
						
								<%-- RELEASE DATE --%>
						<asp:TemplateField HeaderText="Release Date">
                            <EditItemTemplate>
                                <div class="col-xs-11 col-edit">
                                    <asp:TextBox ID="txtGridrelease_date" runat="server" 
                                        MaxLength="15" CssClass="form-control"  
                                        Text='<%# Bind("release_date") %>'></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvGridrelease_date" runat="server" 
                                    ControlToValidate="txtGridrelease_date" ValidationGroup="Edit" 
                                    ErrorMessage="Short Name is a required field" Text="*"
                                    CssClass="text-danger"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGridrelease_date" runat="server"
									 DataFormatString="{0:dd/MM/yyyy}" 
									 HtmlEncode="false"  
                                    Text='<%# Eval("release_date", "{0:MM/dd/yyyy}") %>'></asp:Label>
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
                    SelectCommand="SELECT [Disk_id], [Disk_Type], [Disk_Name], [Disk_Genre], [Disk_Status], Convert(date, [release_date]) as release_date
                        FROM [Compact_Disk]"
                    DeleteCommand="DELETE FROM [Compact_Disk] 
                        WHERE [Disk_id] = @original_Disk_id 
                          AND [Disk_Type] = @original_Disk_Type 
						  AND [Disk_Status] = @original_Disk_Status 
                          AND [Disk_Genre] = @original_Disk_Genre
                          AND [Disk_Name] = @original_Disk_Name "                         
                      
                    InsertCommand="INSERT INTO [Compact_Disk] 
                        ([Disk_Type], [Disk_Name], [Disk_Genre], [Disk_Status], [release_date]) 
                        VALUES ( @Disk_Type, @Disk_Name, @Disk_Genre, @Disk_Status, @release_date)" 
                    UpdateCommand="UPDATE [Compact_Disk] 
                          SET [Disk_Type] = @Disk_Type, 
							[Disk_Status] = @Disk_Status, 
							[Disk_Genre] = @Disk_Genre, 
							[Disk_Name] = @Disk_Name, 
							[release_date] = @release_date 
                              
                        WHERE [Disk_id] = @original_Disk_id 
                          AND [Disk_Type] = @original_Disk_Type 
                          AND [Disk_Genre] = @original_Disk_Genre 
                          AND [Disk_Name] = @original_Disk_Name 
                          AND [release_date] = @original_release_date 
                          AND [Disk_Status] = @original_Disk_Status">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Disk_id" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Disk_Type" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Disk_Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Disk_Status" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Disk_Genre" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_release_date" Type="String"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>                        
                        <asp:Parameter Name="Disk_Type" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Disk_Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Disk_Status" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Disk_Genre" Type="String"></asp:Parameter>
                        <asp:Parameter Name="release_date" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Disk_Type" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Disk_Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Disk_Status" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Disk_Genre" Type="String"></asp:Parameter>
                        <asp:Parameter Name="release_date" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Disk_id" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Disk_Type" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Disk_Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Disk_Status" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Disk_Genre" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_release_date" Type="String"></asp:Parameter>
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
				</div>

                <div class="form-group">
                    <label for="Disk_Status_DropDownList" class="col-sm-2">Disk Status:</label>			
                    <div class="col-sm-3">
                    <label for="Disk_Type_DropDownList" class="col-sm-2">
						<asp:DropDownList ID="Disk_Status_DropDownList" runat="server" Height="35px">
							<asp:ListItem Value="In-Stock">In-Stock</asp:ListItem>
							<asp:ListItem Value="Out-of-Stock">Out-of-Stock</asp:ListItem>
							<asp:ListItem>On-Hold</asp:ListItem>
							<asp:ListItem>Status-Unknown</asp:ListItem>
						</asp:DropDownList>
						</label>
                    </div>   
					<div class="col-sm-offset-3 col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvStatus" runat="server" 
                            ControlToValidate="Disk_Status_DropDownList" CssClass="text-danger" Display="Dynamic" 
                            ErrorMessage="Disk Status is a required field">
                        </asp:RequiredFieldValidator>
                    </div>
				</div> 

					<div class="form-group">
						<label for="Disk_Genre_DropDownList" class="col-sm-2">Disk Genre:</label>
						<div class="col-sm-3">
						<label for="Disk_Genre_DropDownList" class="col-sm-2">
							<asp:DropDownList ID="Disk_Genre_DropDownList" runat="server" Height="34px" Width="88px">
								<asp:ListItem Value="Rap">Rap</asp:ListItem>
								<asp:ListItem Value="Rock">Rock</asp:ListItem>
								<asp:ListItem Value="Alt-Rock">Alt-Rock</asp:ListItem>
								<asp:ListItem Value="Pop">Pop</asp:ListItem>
								<asp:ListItem Value="Country">Country</asp:ListItem>
							</asp:DropDownList>
						</label>
                    </div>
                    <div class="col-sm-offset-3 col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvGenre" runat="server" 
                            ControlToValidate="Disk_Genre_DropDownList" CssClass="text-danger" Display="Dynamic" 
                            ErrorMessage="Disk Genre is a required field">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>

						<div class="form-group">
						<label for="Disk_Type_DropDownList" class="col-sm-2">Disk Type:</label>
						<div class="col-sm-3">
						<label for="Disk_Type_DropDownList" class="col-sm-2">
							<asp:DropDownList ID="Disk_Type_DropDownList" runat="server" Height="34px" Width="90px">
								<asp:ListItem>CD</asp:ListItem>
								<asp:ListItem>Vinyl</asp:ListItem>
								<asp:ListItem>Casset-Tape</asp:ListItem>
							</asp:DropDownList>
						</label>
                    </div>
                    <div class="col-sm-offset-3 col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvType" runat="server" 
                            ControlToValidate="Disk_Type_DropDownList" CssClass="text-danger" Display="Dynamic" 
                            ErrorMessage="Disk Type is a required field">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>


                <div class="form-group">
                    <label for="txtDisk_Name" class="col-sm-2">Disk Name:</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtDisk_Name" runat="server" MaxLength="70" 
                            CssClass="form-control" Width="200px"></asp:TextBox>
                    </div>
                    <div class="col-sm-offset-2 col-sm-4">
                        <asp:RequiredFieldValidator ID="rfvDisk_Name" runat="server" 
                        ControlToValidate="txtDisk_Name" CssClass="text-danger" Display="Dynamic" 
                        ErrorMessage="Disk  Name is a required field"></asp:RequiredFieldValidator>
                    </div>
                </div>              		
				
				 <div class="form-group">
                    <label for="Disk_Calendar" class="col-sm-2">Date Released:</label>
                    <div class="col-sm-6">
                        <asp:Calendar ID="Disk_Calendar" runat="server" Height="170px" Width="308px"></asp:Calendar>
                    </div>                   
				</div>
				<asp:CustomValidator ID="cvDisk_Calendar" runat="server" ErrorMessage="You must select a date" ClientValidationFunction="CheckDate" />
			</br>
                <asp:Button ID="btnAdd" runat="server" Text="Add New Category" 
                    CssClass="btn" OnClick="btnAdd_Click" Height="30px" Width="150px" />
            
        </form>
	<br/>
	<br/>

</asp:Content>

