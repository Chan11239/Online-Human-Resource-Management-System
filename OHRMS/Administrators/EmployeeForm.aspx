<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="EmployeeForm.aspx.cs" Inherits="OHRMS.Administrators.EmployeeForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="container bg-white shadow mt-3 col-12 mb-5 p-3">
        <div class="row">
            <div class="card-header">
                <div class="row">
                    <div class="col-12">
                        <h3 class="display-5 text-primary">Employee Maintenance</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-10">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="textbox-EmpMaintenance form-control"></asp:TextBox>
                </div>
                <div class="col-2">
                    <asp:LinkButton ID="iconSearch" runat="server" Text="Search" CssClass="" OnClick="btnSearch_Click"> <i class="fas fa-search"></i></asp:LinkButton>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="row">
                        <div class="card-body">
                            <div class="row">
                                <div class="card-header">
                                    <div class="row">
                                        <div class="col-12">
                                            <h6 class="text-primary">Employment Information</h6>
                                        </div>
                                    </div>
                                </div>
                                <%-- <asp:UpdatePanel ID="upnlEmployeeInfo" runat="server">
                                    <ContentTemplate>--%>

                                <table>
                                    <tr>
                                        <td>Employee No</td>
                                        <td>
                                            <div>
                                                <div class="row">
                                                    <div class="col-10">
                                                        <asp:TextBox ID="txtEmployeeNo" runat="server" CssClass="textbox-EmpMaintenance form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="col-2">
                                                        <asp:LinkButton ID="iconGenerate" runat="server" Text="Search" CssClass="" OnClick="iconGenerate_Click"> <i class="fas fa-plus"></i></asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>Last Name</td>
                                        <td>
                                            <asp:TextBox ID="txtLastName" runat="server" CssClass="textbox-EmpMaintenance form-control"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Department</td>
                                        <td>
                                            <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="pis-ddl btn btn-outline-primary form-control">
                                                <asp:ListItem Value="Value1" Text="-Select Department-"></asp:ListItem>
                                                <asp:ListItem Value="Information Technology" Text="Information Technology"></asp:ListItem>
                                                <asp:ListItem Value="Business Management" Text="Business Management"></asp:ListItem>
                                                <asp:ListItem Value="Tourism Management" Text="Tourism Management"></asp:ListItem>
                                            </asp:DropDownList>
                                        <td>First Name</td>
                                        <td>
                                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="textbox-EmpMaintenance form-control"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Classification</td>
                                        <td>
                                            <asp:DropDownList ID="ddlClassification" runat="server" CssClass="pis-ddl btn btn-outline-primary form-control">
                                                <asp:ListItem Value="Value1" Text="-Select Classification-"></asp:ListItem>
                                                <asp:ListItem Value="Administrative" Text="Administrative"></asp:ListItem>
                                                <asp:ListItem Value="Full Time" Text="Full Time"></asp:ListItem>
                                                <asp:ListItem Value="Part Time" Text="Part Time"></asp:ListItem>
                                            </asp:DropDownList>
                                        <td>Middle Name</td>
                                        <td>
                                            <asp:TextBox ID="txtMiddleName" runat="server" CssClass="textbox-EmpMaintenance form-control"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Rank</td>
                                        <td>
                                            <asp:DropDownList ID="ddlRank" runat="server" CssClass="pis-ddl btn btn-outline-primary form-control">
                                                <asp:ListItem Value="Value1" Text="-Select Rank-"></asp:ListItem>
                                                <asp:ListItem Value="Lecturer" Text="Lecturer"></asp:ListItem>
                                                <asp:ListItem Value="Associate" Text="Associate"></asp:ListItem>
                                                <asp:ListItem Value="Senior" Text="Senior"></asp:ListItem>
                                                <asp:ListItem Value="Assistant Professor" Text="Assistant Professor"></asp:ListItem>
                                                <asp:ListItem Value="Professor" Text="Professor"></asp:ListItem>
                                            </asp:DropDownList>
                                        <td>Position</td>
                                        <td>
                                            <asp:TextBox ID="txtPosition" runat="server" CssClass="textbox-EmpMaintenance form-control"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Salary Rate</td>
                                        <td>
                                            <asp:TextBox ID="txtSalary" runat="server" TextMode="Number" CssClass="textbox-EmpMaintenance form-control"></asp:TextBox></td>
                                        <td>Date of Original Appointment</td>
                                        <td>
                                            <asp:TextBox ID="txtDateAppoint" runat="server" TextMode="date" CssClass="textbox-empmaintenance form-control"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Status & Tenure of Employement</td>
                                        <td>
                                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="pis-ddl btn btn-outline-primary form-control">
                                                <asp:ListItem Value="Value1" Text="-Select Status-"></asp:ListItem>
                                                <asp:ListItem Value="Regular" Text="Regular"></asp:ListItem>
                                                <asp:ListItem Value="Probationary" Text="Probationary"></asp:ListItem>
                                                <asp:ListItem Value="Resigned" Text="Resigned"></asp:ListItem>
                                                <asp:ListItem Value="Terminated" Text="Terminated"></asp:ListItem>
                                                <asp:ListItem Value="Retired" Text="Retired"></asp:ListItem>
                                            </asp:DropDownList>
                                        <td>
                                            <asp:Label ID="lblPasswordDisplay" runat="server" Text="Password" CssClass="form-label" /></td>
                                        <td>
                                            <asp:Label ID="lblPassword" runat="server" CssClass="pass form-label"></asp:Label></td>
                                    </tr>
                                </table>
                                <%-- </ContentTemplate>
                                </asp:UpdatePanel>--%>
                            </div>

                            <div id="divUpdateEmployee" runat="server" class="row">
                                <div class="card-header">
                                    <div class="row">
                                        <div class="col-12">
                                            <h6 class="text-primary">If Assigned to other department</h6>
                                        </div>
                                    </div>
                                </div>
                                <table class="table table-hover table-responsive">
                                    <tr>
                                        <td>Date of Appointment</td>
                                        <td>
                                            <asp:TextBox ID="txtNewDateAppoint" TextMode="Date" runat="server" CssClass="textbox-EmpMaintenance form-control"></asp:TextBox></td>
                                        <td>Department</td>
                                        <td>
                                            <asp:TextBox ID="txtNewDepartment" runat="server" CssClass="textbox-EmpMaintenance form-control"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Position</td>
                                        <td>
                                            <asp:TextBox ID="txtNewPosition" runat="server" CssClass="textbox-EmpMaintenance form-control"></asp:TextBox></td>
                                        <td>Date of Separation</td>
                                        <td>
                                            <asp:TextBox ID="txtDateSeparation" TextMode="Date" runat="server" CssClass="textbox-EmpMaintenance form-control"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Nature of Separation</td>
                                        <td>
                                            <asp:TextBox ID="txtNatureSeparation" runat="server" CssClass="textbox-EmpMaintenance form-control"></asp:TextBox></td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </div>

                            <div class="row text-center mt-5">
                                <div>
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-lg" OnClick="btnSubmit_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:HiddenField ID="hidEmployeeNo" runat="server" />
                </div>
            </div>
        </div>
    </div>
    <div class="separator"></div>
    <div class="separator"></div>
</asp:Content>
