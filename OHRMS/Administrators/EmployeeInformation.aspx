<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="EmployeeInformation.aspx.cs" Inherits="OHRMS.Administrators.EmployeeInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="container my-3 clearfix">
                <div class="row">
                    <div class="col">
                        <div class="card mt-2">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col">
                                        <h4>Employee Information</h4>
                                    </div>
                                    <div class="col justify-content-end text-right">
                                        <asp:LinkButton ID="LinkPreview" Text="Preview" runat="server" CommandArgument='<%#Eval("employeeNo") %>' CssClass="btn btn-blue" OnClick="lnkPrintPreview_Click"></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="col-3">
                                        <asp:Image ID="img_Profile" runat="server" CssClass="img-thumbnail" Width="300" />
                                    </div>
                                    <div class="col-6">
                                        <h5>
                                            <asp:Label ID="lblName_Profile" runat="server" Text="Name"></asp:Label></h5>
                                        <div class="table table-responsive">
                                            <table>
                                                <tr>
                                                    <td><i class="fas fa-id-card"></i></td>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <asp:Label ID="lblEmpNum_Profile" runat="server" Text="Employee_Number" CssClass="label-info text-primary"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td><i class="fas fa-phone"></i></td>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <asp:Label ID="lblContact_Profile" runat="server" Text="Contact" CssClass="label-info text-primary"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td><i class="fas fa-envelope"></i></td>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <asp:Label ID="lblEmail_Profile" runat="server" Text="Email" CssClass="label-info text-primary"></asp:Label></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col">
                                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home"
                                                    aria-selected="true">Work</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="personal"
                                                    aria-selected="false">Personal</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
                                                    aria-selected="false">Files</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="seminars-tab" data-toggle="tab" href="#seminars" role="tab" aria-controls="seminars"
                                                    aria-selected="false">Seminars</a>
                                            </li>
                                        </ul>


                                        <div class="tab-content" id="myTabContent">

                                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                                <div class="table table-responsive">
                                                    <table class="table table-hover table-responsive mt-3">
                                                        <tr>
                                                            <td><strong>Position</strong></td>
                                                            <td>
                                                                <asp:DropDownList ID="ddlPosition" runat="server" TabIndex="3" CssClass="mdb-select">
                                                                    <asp:ListItem Value="-" Text="- Select -"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:Label ID="lblPosition" runat="server" CssClass="label-data"></asp:Label>
                                                            </td>
                                                            <td><strong>Department</strong></td>
                                                            <td>
                                                                <asp:Label ID="lblDepartment" runat="server" CssClass="label-data"></asp:Label></td>
                                                            <td><strong>Classification</strong></td>
                                                            <td>
                                                                <asp:Label ID="lblCllasification" runat="server" CssClass="label-data"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td><strong>Rank</strong></td>
                                                            <td>
                                                                <asp:Label ID="lblRanks" runat="server" CssClass="label-data"></asp:Label></td>
                                                            <td><strong>Salary Rate</strong></td>
                                                            <td>
                                                                <asp:Label ID="lblSalary" runat="server" CssClass="label-data"></asp:Label></td>
                                                            <td><strong>Points</strong></td>
                                                            <td>
                                                                <asp:TextBox ID="txtPoints" runat="server" CssClass="form-control"></asp:TextBox>
                                                                <asp:Button ID="btnPoints" runat="server" Text="Point" OnClick="btnPoints_Click" CssClass="btn btn-primary btn-sm" />
                                                                <asp:Button ID="btnSavePoints" runat="server" Text="Save" OnClick="btnSavePoints_Click" CssClass="btn btn-primary btn-sm" />
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td colspan="2"><strong>Status & Tenure of Employement</strong></td>
                                                            <td colspan="2">
                                                                <asp:Label ID="lblStatus" runat="server" CssClass="label-data"></asp:Label></td>
                                                            <td><strong>Date of Appointment</strong></td>
                                                            <td>
                                                                <asp:Label ID="lblDOA" runat="server" CssClass="label-data"></asp:Label></td>
                                                            <td><strong>Type</strong></td>
                                                            <td>
                                                                <asp:Label ID="lblType" runat="server" CssClass="label-data"></asp:Label></td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>

                                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                                <div class="table table-responsive">
                                                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-primary" />
                                                    <table class="table table-hover table-responsive mt-3">
                                                        <tr>
                                                            <td><strong>Address</strong></td>
                                                            <td>
                                                                <asp:TextBox ID="txtAddress" runat="server" CssClass="textbox-data"></asp:TextBox></td>
                                                            <td><strong>Birthday</strong></td>
                                                            <td>
                                                                <asp:Label ID="lblbday" runat="server" CssClass="label-data"></asp:Label></td>

                                                        </tr>
                                                        <tr>
                                                            <td><strong>Birthplace</strong></td>
                                                            <td>
                                                                <asp:TextBox ID="txtBirthplace" runat="server" CssClass="textbox-data"></asp:TextBox></td>
                                                            <td><strong>Citizenship</strong></td>
                                                            <td>
                                                                <asp:TextBox ID="txtCitizenship" runat="server" CssClass="textbox-data"></asp:TextBox></td>

                                                        </tr>
                                                        <tr>
                                                            <td><strong>Gender</strong></td>
                                                            <td>
                                                                <asp:TextBox ID="txtGender" runat="server" CssClass="textbox-data"></asp:TextBox></td>
                                                            <td><strong>Height</strong></td>
                                                            <td>
                                                                <asp:TextBox ID="txtHeight" runat="server" CssClass="textbox-data"></asp:TextBox></td>

                                                        </tr>
                                                        <tr>
                                                            <td><strong>Weight</strong></td>
                                                            <td>
                                                                <asp:TextBox ID="txtWeight" runat="server" CssClass="textbox-data"></asp:TextBox></td>
                                                            <td><strong>Religion</strong></td>
                                                            <td>
                                                                <asp:TextBox ID="txtReligion" runat="server" CssClass="textbox-data"></asp:TextBox></td>

                                                        </tr>
                                                        <tr>
                                                            <td><strong>SSS Number</strong></td>
                                                            <td>
                                                                <asp:TextBox ID="txtSSS" runat="server" CssClass="textbox-data"></asp:TextBox></td>
                                                            <td><strong>Tax Identification Number</strong></td>
                                                            <td>
                                                                <asp:TextBox ID="txtTin" runat="server" CssClass="textbox-data"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td><strong>PhilHealth Number</strong></td>
                                                            <td>
                                                                <asp:TextBox ID="txtPhilhealth" runat="server" CssClass="textbox-data"></asp:TextBox></td>
                                                            <td><strong>HDMF Number</strong></td>
                                                            <td>
                                                                <asp:TextBox ID="txtHDMF" runat="server" CssClass="textbox-data"></asp:TextBox></td>
                                                        </tr>
                                                    </table>
                                                </div>

                                                <div class="row mt-3">
                                                    <div class="card-header">
                                                        <h5 class="text-primary">Family Background</h5>
                                                    </div>
                                                    <div class="card-body">
                                                        <table class="table table-hover table-responsive">
                                                            <tr>
                                                                <th>&nbsp;</th>
                                                                <th>Name</th>
                                                                <th>Age</th>
                                                                <th>Occupation</th>
                                                            </tr>
                                                            <tbody>
                                                                <tr>
                                                                    <td><strong>Father</strong></td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtFatherName" runat="server" CssClass="textbox-data"></asp:TextBox></td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtFatherAge" runat="server" CssClass="textbox-data"></asp:TextBox></td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtFatherOccupation" runat="server" CssClass="textbox-data"></asp:TextBox></td>

                                                                </tr>
                                                                <tr>
                                                                    <td><strong>Mother</strong></td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtMotherName" runat="server" CssClass="textbox-data"></asp:TextBox></td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtMotherAge" runat="server" CssClass="textbox-data"></asp:TextBox></td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtMotherOccupation" runat="server" CssClass="textbox-data"></asp:TextBox></td>
                                                                </tr>
                                                                <tr>
                                                                    <td><strong>Spouse (if Any)</strong></td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtSpouseName" runat="server" CssClass="textbox-data"></asp:TextBox></td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtSpouseAge" runat="server" CssClass="textbox-data"></asp:TextBox></td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtSpouseOccupation" runat="server" CssClass="textbox-data"></asp:TextBox></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>

                                                </div>

                                                <div class="row mt-3">
                                                    <div class="card-header">
                                                        <h5 class="text-primary">Children</h5>
                                                    </div>
                                                    <div class="col table table-responsive">
                                                        <asp:GridView ID="gvChildren" runat="server" AutoGenerateColumns="false" CssClass="table table-hover border">
                                                            <Columns>
                                                                <asp:BoundField DataField="childrenName" HeaderText="Name" />
                                                                <asp:BoundField DataField="childrenAge" HeaderText="Age" />
                                                                <asp:BoundField DataField="childrenOccupation" HeaderText="Occupation" />
                                                            </Columns>
                                                            <EmptyDataTemplate>
                                                                <h6 class="text-warning">No record found.</h6>
                                                            </EmptyDataTemplate>
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                                <div class="row">
                                                    <div class="col table table-responsive">
                                                        <table class="table table-hover border">
                                                            <tr>
                                                                <td>Latest Resume</td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkResume" runat="server" CssClass="btn btn-blue" OnClick="lnkResume_Click">View</asp:LinkButton></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Certificate</td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkCert" runat="server" CssClass="btn btn-blue" OnClick="lnkCert_Click">View</asp:LinkButton></td>
                                                            </tr>
                                                            <tr>
                                                                <td>TOR</td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkTor" runat="server" CssClass="btn btn-blue" OnClick="lnkTor_Click">View</asp:LinkButton></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Diploma</td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkDiploma" runat="server" CssClass="btn btn-blue" OnClick="lnkDiploma_Click">View</asp:LinkButton></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Certificate from Previous Employer</td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkCOE" runat="server" CssClass="btn btn-blue" OnClick="lnkCOE_Click">View</asp:LinkButton></td>
                                                            </tr>
                                                            <tr>
                                                                <td>SSS Form/Id</td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkSSS" runat="server" CssClass="btn btn-blue" OnClick="lnkSSS_Click">View</asp:LinkButton></td>
                                                            </tr>
                                                            <tr>
                                                                <td>PhilHealth Form/Id</td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkPhilhealth" runat="server" CssClass="btn btn-blue" OnClick="lnkPhilhealth_Click">View</asp:LinkButton></td>
                                                            </tr>
                                                            <tr>
                                                                <td>TIN / 1902</td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnktin" runat="server" CssClass="btn btn-blue" OnClick="lnktin_Click">View</asp:LinkButton></td>
                                                            </tr>
                                                            <tr>
                                                                <td>TIN / 1902</td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkPagibig" runat="server" CssClass="btn btn-blue" OnClick="lnkPagibig_Click">View</asp:LinkButton></td>
                                                            </tr>
                                                            <tr>
                                                                <td>X-Ray Medical Result</td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkMedical" runat="server" CssClass="btn btn-blue" OnClick="lnkMedical_Click">View</asp:LinkButton></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Medical Health Card</td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkHealthCard" runat="server" CssClass="btn btn-blue" OnClick="lnkHealthCard_Click">View</asp:LinkButton></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="tab-pane fade" id="seminars" role="tabpanel" aria-labelledby="seminars-tab">
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="card-header">
                                                            <h5 class="text-primary">Seminars/Certificates</h5>
                                                        </div>
                                                        <div class="table table-responsive">
                                                            <asp:GridView ID="gvSeminar" runat="server" AutoGenerateColumns="false" CssClass="table table-hover border">
                                                                <Columns>
                                                                    <asp:BoundField DataField="typeSeminar" HeaderText="Seminar Type" />
                                                                    <asp:BoundField DataField="institution" HeaderText="Institution" />
                                                                    <asp:BoundField DataField="inclusiveDates" HeaderText="Inclusive Dates" />
                                                                </Columns>
                                                                <EmptyDataTemplate>
                                                                    <h6 class="text-warning">No record found</h6>
                                                                </EmptyDataTemplate>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col">
                                                        <div class="card-header">
                                                            <h5 class="text-primary">Certificates/Traning</h5>
                                                        </div>
                                                        <div class="table table-responsive">
                                                            <asp:GridView ID="gvCertificate" runat="server" AutoGenerateColumns="false" CssClass="table table-hover border">
                                                                <Columns>
                                                                    <asp:BoundField DataField="typeCertification" HeaderText="Typeof Certification" />
                                                                    <asp:BoundField DataField="institution" HeaderText="Institution" />
                                                                    <asp:BoundField DataField="inclusiveDates" HeaderText="Inclusive Dates" />
                                                                </Columns>
                                                                <EmptyDataTemplate>
                                                                    <h6 class="text-warning">No record found</h6>
                                                                </EmptyDataTemplate>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col">
                                                        <div class="card-header">
                                                            <h5 class="text-primary">Work Experience</h5>
                                                        </div>
                                                        <div class="table table-responsive">
                                                            <asp:GridView ID="gvWorkExperience" runat="server" AutoGenerateColumns="false" CssClass="table table-hover border">
                                                                <Columns>
                                                                    <asp:BoundField DataField="company" HeaderText="Company" />
                                                                    <asp:BoundField DataField="position" HeaderText="Position" />
                                                                    <asp:BoundField DataField="inclusiveDates" HeaderText="Inclusive Dates" />
                                                                    <asp:BoundField DataField="natureOfSeparaion" HeaderText="Nature of Separation" />
                                                                </Columns>
                                                                <EmptyDataTemplate>
                                                                    <h6 class="text-warning">No record found</h6>
                                                                </EmptyDataTemplate>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <asp:HiddenField ID="hidEmployeeNo" runat="server" />
            </div>
  

        </ContentTemplate>
    </asp:UpdatePanel>

    <script>
        function shwwindow(myurl) {
            window.open(myurl, '_blank');
        }
    </script>




    <%--

    <br />
    <div style="background-color: #F8F8FF;">
        <a href="EmployeeInfo.aspx" style="font-size: 25px; position: relative; left: 25px; color: black">
            <i class='bx bx-arrow-back'>asdasdasd</i>
        </a>
        <div class="flex-container">
            <div>
                
            </div>
            <div>
                
                <br />
                <i class='bx bx-phone' style="font-size: 12px;"></i>
                
                &nbsp;<i class='bx bxs-envelope' style="font-size: 12px;"></i>
                
                <br />
                <br />
                <label>Employee Number</label>
                <br />
                
            </div>
        </div>
        
                <div class="container">
                    <nav>
                        <a style="padding-right: 15px">
                            <asp:Button ID="btnshwEmp_Info" runat="server" Text="Employee Information" CssClass="button-switch" OnClick="btnshwEmp_Info_Click" /></a>

                        <a style="padding-right: 15px">
                            <asp:Button ID="btnshwdetials" runat="server" Text="Personal Information" CssClass="button-switch" OnClick="btnshwdetials_Click" /></a>

                        <a style="padding-right: 15px">
                            <asp:Button ID="btnshwfiles" runat="server" Text="Files" CssClass="button-switch" OnClick="btnshwfiles_Click" /></a>
                        <a style="padding-right: 15px">
                            <asp:Button ID="btnShowCredentials" runat="server" Text="Seminar/Certificates"  CssClass="button-switch" OnClick="btnShowCredentials_Click" /></a>

                    </nav>
                    <div id="Emp_Info" runat="server" class="content-employee-info">
                        
                    </div>
                    <div id="personal_info" runat="server" class="content-employee-info" visible="false">
                        <a style="padding-right: 15px">
                            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary btn-editsave" Height="30px" Width="75px" OnClick="btnSave_Click" /></a>

                        <a style="padding-right: 15px">
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-primary btn-editsave" Height="30px" Width="75px" OnClick="btnEdit_Click" /></a>
                        <table style="width: 100%">
                            
                            
                        </table>
                    </div>
                    <div id="employeeCredential" runat="server" class="content-employee-info" visible="false">
                        <label>Seminars</label>
                        
                        <br />
                        <label></label>
                        
                        <br />
                        <label></label>
                        
                    </div>
                    <div id="files" runat="server" class="content-employee-info" visible="false">
                        
                    </div>
                </div>
            
    </div>
    --%>
</asp:Content>
