<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Default.Master" AutoEventWireup="true" CodeBehind="Information.aspx.cs" Inherits="OHRMS.Admin.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">
        <div>
            <a href="EmployeeInfo.aspx" style="font-size: 25px; position: relative; left: 25px; color: black">
                <i class='bx bx-arrow-back'></i>
            </a>
            <div class="container">
                <div>
                    <asp:Image ID="img_Profile" runat="server" CssClass="img-thumbnail rounded float-start me-3 mb-3" Width="300" />
                </div>
                <div>
                    <asp:Label ID="lblName_Profile" runat="server" Text="Name" CssClass="text-primary h4"></asp:Label>
                    <div class="separator">&nbsp;</div>
                    <i class="fas fa-id-badge"></i>
                    <asp:Label ID="lblEmpNum_Profile" runat="server" Text="Emoployee_Number" CssClass="label-info"></asp:Label>
                    <div class="separator">&nbsp;</div>
                    <i class="fas fa-phone"></i>
                    <asp:Label ID="lblContact_Profile" runat="server" Text="Contact" CssClass="label-info"></asp:Label>
                    <div class="separator">&nbsp;</div>
                    <i class="far fa-envelope"></i>
                    <asp:Label ID="lblEmail_Profile" runat="server" Text="Email" CssClass="label-info"></asp:Label>
                    <div class="separator">&nbsp;</div>
                </div>
            </div>


            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="container">
                        <%--<nav>--%>
                        <%--                            <asp:Button ID="btnshwEmp_Info" runat="server" Text="Employee Information" CssClass="btn btn-primary" OnClick="btnshwEmp_Info_Click" />
                            &nbsp
                        <asp:Button ID="btnshwdetials" runat="server" Text="Personal Information" CssClass="btn btn-primary" OnClick="btnshwdetials_Click" />
                            &nbsp
                        <asp:Button ID="btnshwfiles" runat="server" Text="Files" CssClass="btn btn-primary" OnClick="btnshwfiles_Click" />
                            &nbsp;
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                            &nbsp
                        <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-primary"  OnClick="btnEdit_Click" />
                        </nav>
                        <div id="Emp_Info" runat="server" class="content-employee-info">--%>


                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="empinfo-tab" data-bs-toggle="tab" data-bs-target="#empinfo" type="button" role="tab" aria-controls="empinfo" aria-selected="true">Employee Information</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="personalinfo-tab" data-bs-toggle="tab" data-bs-target="#personalinfo" type="button" role="tab" aria-controls="personalinfo" aria-selected="false">Personal Information</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="empfiles-tab" data-bs-toggle="tab" data-bs-target="#empfiles" type="button" role="tab" aria-controls="empfiles" aria-selected="false">Files</button>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="empinfo" role="tabpanel" aria-labelledby="empinfo-tab">
                                <table class="table table-hover table-responsive">
                                    <tr>
                                        <td>Position</td>
                                        <td>
                                            <asp:Label ID="lblPosition" runat="server" CssClass="form-control" Text="Position"></asp:Label></td>
                                        <td>Department</td>
                                        <td>
                                            <asp:Label ID="lblDepartment" runat="server" CssClass="form-control" Text="Department"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Classification</td>
                                        <td>
                                            <asp:Label ID="lblCllasification" runat="server" CssClass="form-control" Text="Classification"></asp:Label></td>
                                        <td>Rank</td>
                                        <td>
                                            <asp:Label ID="lblRanks" runat="server" CssClass="form-control" Text="Rank"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Salary Rate</td>
                                        <td>
                                            <asp:Label ID="lblSalary" runat="server" CssClass="form-control" Text="Salary"></asp:Label></td>
                                        <td>Date of Appointment</td>
                                        <td>
                                            <asp:Label ID="lblDOA" runat="server" CssClass="form-control" Text="DOA"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td>Status & Tenure of Employment</td>
                                        <td>
                                            <asp:Label ID="lblStatus" runat="server" CssClass="form-control" Text="Status"></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="personalinfo" role="tabpanel" aria-labelledby="personalinfo-tab">
                                <table class="table table-hover table-responsive">
                                    <tr>
                                        <td colspan="3">Address</td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                        <td colspan="3">Birthday</td>
                                        <td colspan="3">
                                            <asp:Label ID="lblbday" runat="server" CssClass="form-control"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">Birthplace</td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtBirthplace" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                        <td colspan="3">Citizenship</td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtCitizenship" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">SSS Number</td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtSSS" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                        <td colspan="3">PhilHealth Number</td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtPhilhealth" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">TIN Number</td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtTin" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                        <td colspan="3">HDMF Number</td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtHDMF" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">Gender</td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtGender" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                        <td colspan="3">Height</td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtHeight" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">Weight</td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtWeight" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                        <td colspan="3">Religion</td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtReligion" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td colspan="12">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="12">
                                            <h5>Family Background</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">Father's Name</td>
                                        <td colspan="2">
                                            <asp:TextBox ID="txtFatherName" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                        <td colspan="2">Age</td>
                                        <td colspan="2">
                                            <asp:TextBox ID="txtFatherAge" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                        <td colspan="2">Occupation</td>
                                        <td colspan="2">
                                            <asp:TextBox ID="txtFatherOccupation" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">Mother's Name</td>
                                        <td colspan="2">
                                            <asp:TextBox ID="txtMotherName" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                        <td colspan="2">Age</td>
                                        <td colspan="2">
                                            <asp:TextBox ID="txtMotherAge" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                        <td colspan="2">Occupation</td>
                                        <td colspan="2">
                                            <asp:TextBox ID="txtMotherOccupation" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">Spouse's Name</td>
                                        <td colspan="2">
                                            <asp:TextBox ID="txtSpouseName" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                        <td colspan="2">Age</td>
                                        <td colspan="2">
                                            <asp:TextBox ID="txtSpouseAge" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                        <td colspan="2">Occupation</td>
                                        <td colspan="2">
                                            <asp:TextBox ID="txtSpouseOccupation" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td colspan="12">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="12">
                                            <h5>Children</h5>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">Name</td>
                                        <%--<td><asp:PlaceHolder ID="ph" runat="server"></asp:PlaceHolder></td>--%>
                                        <td colspan="2">
                                            <asp:TextBox ID="txtChildName" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                        <td colspan="2">Age</td>
                                        <td colspan="2">
                                            <asp:TextBox ID="txtChildAge" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                        <td colspan="2">Occupation</td>
                                        <td colspan="2">
                                            <asp:TextBox ID="txtChildOccupation" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="tab-pane fade" id="empfiles" role="tabpanel" aria-labelledby="empfiles-tab">
                                <table class="table table-hover table-responsive">
                                    <tr>
                                        <td>Latest Resume</td>
                                        <td>
                                            <asp:LinkButton ID="lnkResume" runat="server" CssClass="link-data" OnClick="lnkResume_Click"></asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td>Credentials</td>
                                        <td>
                                            <asp:LinkButton ID="lnkTor" runat="server" CssClass="link-data" OnClick="lnkTor_Click"></asp:LinkButton>
                                            <asp:LinkButton ID="lnkDiploma" runat="server" CssClass="link-data" OnClick="lnkDiploma_Click"></asp:LinkButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Certificates</td>
                                        <td>
                                            <asp:LinkButton ID="lnkCert" runat="server" CssClass="link-data" OnClick="lnkCert_Click"></asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td>Certificate from previous Employer</td>
                                        <td>
                                            <asp:LinkButton ID="lnkCOE" runat="server" CssClass="link-data" OnClick="lnkCOE_Click"></asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td>SSS Form/ID</td>
                                        <td>
                                            <asp:LinkButton ID="lnkSSS" runat="server" CssClass="link-data" OnClick="lnkSSS_Click"></asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td>PhilHealth ID</td>
                                        <td>
                                            <asp:LinkButton ID="lnkPhilhealth" runat="server" CssClass="link-data" OnClick="lnkPhilhealth_Click"></asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td>TIN ID</td>
                                        <td>
                                            <asp:LinkButton ID="lnktin" runat="server" CssClass="link-data" OnClick="lnktin_Click"></asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td>Latest X-Ray Result</td>
                                        <td>
                                            <asp:LinkButton ID="lnkMedical" runat="server" CssClass="link-data" OnClick="lnkMedical_Click"></asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td>HDMF/PAGIBIG Form/Id</td>
                                        <td>
                                            <asp:LinkButton ID="lnkPagibig" runat="server" CssClass="link-data" OnClick="lnkPagibig_Click"></asp:LinkButton></td>
                                    </tr>
                                    <tr>
                                        <td>Healthcard</td>
                                        <td>
                                            <asp:LinkButton ID="lnkHealthCard" runat="server" CssClass="link-data" OnClick="lnkHealthCard_Click"></asp:LinkButton></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <%-- <div id="files" runat="server" class="content-employee-info" visible="false">
                        </div>--%>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
        <script>
        function shwwindow(myurl) {
            window.open(myurl, '_blank');
        }
    </script>
</asp:Content>
