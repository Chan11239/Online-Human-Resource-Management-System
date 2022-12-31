<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Default.Master" AutoEventWireup="true" CodeBehind="ListOfEmployees.aspx.cs" Inherits="OHRMS.Admin.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <div class="container">

        <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade show active" id="pills-emplist" role="tabpanel" aria-labelledby="pills-emplist">
                <table class="table table-hover table-responsive border-0">
                    <tr>
                        <td>
                            <asp:GridView ID="gvListEmployee" runat="server" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:TemplateField HeaderText="Employee ID">
                                        <ItemTemplate>
                                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Emp_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Emp_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Department">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDepartment" runat="server" Text='<%# Eval("Emp_Department") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Position">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPosition" runat="server" Text='<%# Eval("Emp_Position") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date Appointed">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDateAppointment" runat="server" Text='<%# Eval("Emp_DateAppointment","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Classification">
                                        <ItemTemplate>
                                            <asp:Label ID="lblClassification" runat="server" Text='<%# Eval("Emp_Classification") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Rank">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRank" runat="server" Text='<%# Eval("Emp_Rank") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Address">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Emp_Address") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Gender">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Emp_Gender") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Tin ID">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTin" runat="server" Text='<%# Eval("Emp_Tin") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                <div class="text-end">
                    <a class="btn btn-primary" href="#optionColumn" data-bs-toggle="modal" data-bs-target="#optionColumn">Select Option</a>
                    <asp:Button ID="btnPrintList" runat="server" Text="Print" CssClass="btn btn-primary" OnClick="btnPrint_Click" />
                </div>
            </div>

        </div>







        <%--        <div class="row">
            <div class="col-6 left">
                <nav>
                    <asp:Button ID="btnListEmployee" runat="server" Text="List of Employee" OnClick="btnListEmployee_Click" />
                    <asp:Button ID="btnCOE" runat="server" Text="Employee Credential" OnClick="btnCOE_Click" />
                    <asp:Button ID="btnTimesheet" runat="server" Text="Timesheet" />
                </nav>
            </div>
        </div>--%>
        <br />
        <%--        <asp:Panel ID="pnlEmployeeList" runat="server">
            <div style="padding: 20px 20px 20px 20px" id="employeeList" runat="server">
                <h3 class="lighten-4">List of Employee</h3>
                <a class="waves-effect waves-light btn modal-trigger blue right" href="#optionColumn">Select Option</a>
                
            </div>
            
        </asp:Panel>--%>
        <%--        <div id="employeeCredential" class="container-fluid z-depth-3 mt-5" runat="server" visible="false">
            
            <br />
            
            <br />
            <div style="border: 1px solid #ccc">
                
                
            </div>
        </div>--%>

        <!-- Modal -->
        <div class="modal fade" id="optionColumn" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Select Columns</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h5>Employee Details</h5>
                        <table class="table table-hover table-responsive">
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chckDepartment" runat="server" Text="Department" CssClass="form-check-input" /></td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:CheckBox ID="chckPosition" runat="server" Text="Position" CssClass="form-check-input" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chckDateHired" runat="server" Text="Date Appointement" CssClass="form-check-input" /></td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:CheckBox ID="chckClassification" runat="server" Text="Classification" CssClass="form-check-input" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chckRank" runat="server" Text="Rank" CssClass="form-check-input" /></td>
                            </tr>
                        </table>

                        <h5>Employee Personal Information</h5>
                        <table class="table table-hover table-responsive">
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chckAddress" runat="server" Text="Address" CssClass="form-check-input" /></td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:CheckBox ID="chckGender" runat="server" Text="Gender" CssClass="form-check-input" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chckTin" runat="server" Text="Tin Number" CssClass="form-check-input" /></td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:CheckBox ID="chckSSS" runat="server" Text="SSS Number" CssClass="form-check-input" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chckPhilhealth" runat="server" Text="PhilHealth Number" CssClass="form-check-input" /></td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:CheckBox ID="chckHDMF" runat="server" Text="HDMF Number" CssClass="form-check-input" /></td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
