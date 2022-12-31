<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonalInformationSheet.aspx.cs" Inherits="OHRMS.Reports.PersonalInformationSheet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <%--<meta content="initial-scale=1, shrink-to-fit=no, width=device-width" name="viewport" />--%>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>OHRMS - STI College Baliuag</title>
    <link rel="icon" type="image/x-icon" href="UI/img/favicon.ico" />

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
    <script src="/../UI/js/jquery.js"></script>
    <script src="/../UI/js/popper.js"></script>
    <script src="/../UI/js/bootstrap.min.js"></script>
    <script src="/../UI/js/mdb.min.js"></script>
    <link href="/../UI/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/../UI/css/mdb.css" rel="stylesheet" />
    <link href="/../UI/css/app-style.css" rel="stylesheet" />
</head>

<body>
    <form id="form1" runat="server">

    <div class="container my-3 clearfix">
        <div class="card">
            <div class="card-body">
                <h4>HRF_05</h4>
                <p>Dev040620</p>
            </div>
            <div class="card-header">
                <h4 class="text-center font-weight-bold">Personal Information Sheet</h4>
            </div>
            <div class="card-body">

                <div class="row">
                    <div class="col">
                        <div class="card-title bg-light">
                            <h5 class="text-center">Employment Information</h5>
                            <p class="small text-muted text-center">(This portion is for Human Department USE ONLY)</p>
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col table-responsive">
                        <table class="table table-hover border">
                            <tr>
                                <td>Employee Number</td>
                                <td colspan="3">
                                    <asp:Label ID="lblEmpNum_Profile" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Department</td>
                                <td>
                                    <asp:Label ID="lblDepartment" runat="server" Text=""></asp:Label></td>
                                <td>Position</td>
                                <td>
                                    <asp:Label ID="lblPosition" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Classification</td>
                                <td>
                                    <asp:Label ID="lblClassification" runat="server" Text=""></asp:Label></td>
                                <td>Rank</td>
                                <td>
                                    <asp:Label ID="lblRank" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Salary Rate</td>
                                <td>
                                    <asp:Label ID="lblSalary" runat="server" Text=""></asp:Label></td>
                                <td>Date of Original Appointment</td>
                                <td>
                                    <asp:Label ID="lblDOA" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Employment Type</td>
                                <td>
                                    <asp:Label ID="lblEmpType" runat="server" Text=""></asp:Label></td>
                                <td>Status & Tenure of Employment</td>
                                <td>
                                    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="4" class="font-weight-bold">If assigned to other department</td>
                                <%--<td colspan="3">
                                    <asp:Label ID="Label2" runat="server" Text="{Department}"></asp:Label></td>--%>
                            </tr>
                            <tr>
                                <td>Date of Appointment</td>
                                <td>
                                    <asp:Label ID="newlblDOA" runat="server" Text="{Date of Appointment}"></asp:Label></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Department</td>
                                <td><asp:Label ID="newlblDepartment" runat="server" Text="{Date of Appointment}"></asp:Label></td>
                                <td>Position</td>
                                <td><asp:Label ID="newlblPosition" runat="server" Text="{Date of Appointment}"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Date of Separation</td>
                                <td><asp:Label ID="lbldateSeparation" runat="server" Text="{Date of Appointment}"></asp:Label></td>
                                <td>Nature of Separation</td>
                                <td><asp:Label ID="lblNatureSeparation" runat="server" Text="{Date of Appointment}"></asp:Label></td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="card-title bg-light">
                            <h5 class="text-center py-3">Personal Information</h5>
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col table-responsive">
                        <table class="table table-hover border">
                            <tr>
                                <td colspan="1">Name(Surname, Given Name, Middle Name)</td>
                                <td colspan="3">
                                    <asp:Label ID="lblName_Profile" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="1">Complete Address</td>
                                <td colspan="3">
                                    <asp:Label ID="txtAddress" runat="server" Text="{Complete Address}"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Contact Number</td>
                                <td>
                                    <asp:Label ID="lblContact_Profile" runat="server" Text="{Contact Number}"></asp:Label></td>
                                <td>Email Address</td>
                                <td>
                                    <asp:Label ID="lblEmail_Profile" runat="server" Text="{Email Address}"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Birthplace</td>
                                <td>
                                    <asp:Label ID="txtBirthplace" runat="server" Text="{Birthplace}"></asp:Label></td>
                                <td>Birthdate</td>
                                <td>
                                    <asp:Label ID="lblbdate" runat="server" Text="{Birthday}"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Citizenship</td>
                                <td>
                                    <asp:Label ID="txtCitizenship" runat="server" Text="{Birthplace}"></asp:Label></td>
                                <td>Civil Status</td>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text="{Birthday}"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Religion</td>
                                <td>
                                    <asp:Label ID="txtReligion" runat="server" Text="{Birthplace}"></asp:Label></td>
                                <td>Gender</td>
                                <td>
                                    <asp:Label ID="txtGender" runat="server" Text="{Birthday}"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Height</td>
                                <td>
                                    <asp:Label ID="txtHeight" runat="server" Text="{Birthplace}"></asp:Label></td>
                                <td>Weight</td>
                                <td>
                                    <asp:Label ID="txtWeight" runat="server" Text="{Birthday}"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Tax Identification Number</td>
                                <td>
                                    <asp:Label ID="txtTin" runat="server" Text="{Birthplace}"></asp:Label></td>
                                <td>Philhealth No.</td>
                                <td>
                                    <asp:Label ID="txtPhilhealth" runat="server" Text="{Birthday}"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>SSS No.</td>
                                <td>
                                    <asp:Label ID="txtSSS" runat="server" Text="{Birthplace}"></asp:Label></td>
                                <td>HDMF No.</td>
                                <td>
                                    <asp:Label ID="txtHDMF" runat="server" Text="{Birthday}"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="1">Name of Person to be notified in case of emergency</td>
                                <td colspan="3">
                                    <asp:Label ID="lblContact_Person" runat="server" Text="{Birthplace}"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Relationship</td>
                                <td>
                                    <asp:Label ID="lblContact_Relationship" runat="server" Text="{Birthplace}"></asp:Label></td>
                                <td>Contact Number</td>
                                <td>
                                    <asp:Label ID="lblContact_Number" runat="server" Text="{Birthday}"></asp:Label></td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="card-title bg-light">
                            <h5 class="text-center py-3">Family Background</h5>
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col table-responsive">
                        <table class="table table-hover border">
                            <thead>
                                <tr>
                                    <td>Relationship</td>
                                    <td>Name</td>
                                    <td>Age</td>
                                    <td>Occupation</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Father</td>
                                    <td>
                                        <asp:Label ID="lblFatherName" runat="server" Text="{Father Name}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lblFatherAge" runat="server" Text="{Father Age}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lblFatherOccupation" runat="server" Text="{Father Occupation}"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Mother</td>
                                    <td>
                                        <asp:Label ID="lblMotherName" runat="server" Text="{Mother Name}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lblMotherAge" runat="server" Text="{Mother Age}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lblMotherOccupation" runat="server" Text="{Mother Occupation}"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Spouse, if married</td>
                                    <td>
                                        <asp:Label ID="lblSpouseName" runat="server" Text="{Spouse Name}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lblSpouseAge" runat="server" Text="{Spouse Age}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lblSpouseOccupation" runat="server" Text="{Spouse Occupation}"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="bg-light text-center">Children (Arranged from Eldest to Youngest)</td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <asp:GridView ID="gvChildren" runat="server" AutoGenerateColumns="false" CssClass="table border">
                                            <Columns>
                                                <asp:BoundField DataField="childrenName" HeaderText="Name" />
                                                <asp:BoundField DataField="childrenAge" HeaderText="Age" />
                                                <asp:BoundField DataField="childrenOccupation" HeaderText="Occupation" />
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <h6 class="text-warning">No record found.</h6>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="card-title bg-light">
                            <h5 class="text-center py-3">Educational Background</h5>
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <td>Degree</td>
                                <td>Name & Address of Institution</td>
                                <td>Course</td>
                                <td>Inclusive Dates</td>
                                <td>Awards Received</td>
                            </tr>
                                </thead>
                            <tbody>
                                <tr>
                                    <td>Primary</td>
                                    <td><asp:Label ID="lblElemName" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                    <td><asp:Label ID="lblElemCourse" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                    <td><asp:Label ID="lblElemDate" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                    <td><asp:Label ID="lblElemAward" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Secondary</td>
                                    <td><asp:Label ID="lblHSName" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                    <td><asp:Label ID="lblHSCourse" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                    <td><asp:Label ID="lblHSDate" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                    <td><asp:Label ID="lblHSAward" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Vocational Course</td>
                                    <td><asp:Label ID="lblVocName" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                    <td><asp:Label ID="lblVocCourse" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                    <td><asp:Label ID="lblVocDate" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                    <td><asp:Label ID="lblVocAward" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Bachelor</td>
                                    <td><asp:Label ID="lblBachlName" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                    <td><asp:Label ID="lblBachCourse" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                    <td><asp:Label ID="lblBachDate" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                    <td><asp:Label ID="lblBachAward" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Master</td>
                                    <td><asp:Label ID="lblMasterName" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                    <td><asp:Label ID="lblMasterCourse" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                    <td><asp:Label ID="lblMasterDate" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                    <td><asp:Label ID="lblMasterAward" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Doctorate</td>
                                    <td><asp:Label ID="lblDoctorateName" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                    <td><asp:Label ID="lblDoctorateCourse" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                    <td><asp:Label ID="lblDoctorateDate" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                    <td><asp:Label ID="lblDoctorateAward" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="card-title bg-light">
                            <h5 class="text-center py-3">Eligibility</h5>
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <td>No.</td>
                                    <td>Type of Professional License</td>
                                    <td>License No.</td>
                                    <td>Date Valid</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>RowID</td>
                                    <td>
                                        <asp:Label ID="lblTypeofProfessionalLicense" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lblLicenseNo" runat="server" Text="{License No.}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lblLicenseDateValid" runat="server" Text="{Date Valid}"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>RowID</td>
                                    <td>
                                        <asp:Label ID="Label175" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label176" runat="server" Text="{License No.}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label177" runat="server" Text="{Date Valid}"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>RowID</td>
                                    <td>
                                        <asp:Label ID="Label178" runat="server" Text="{Type of Professional License}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label179" runat="server" Text="{License No.}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label180" runat="server" Text="{Date Valid}"></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="card-title bg-light">
                            <h5 class="text-center">Certification & Training</h5>
                            <p class="text-center text-muted small">(Start with most recent)</p>
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <td>No.</td>
                                    <td>Name/Type of Certification/Training</td>
                                    <td>Institution</td>
                                    <td>Inclusive Dates</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>RowId</td>
                                    <td>
                                        <asp:Label ID="Label12" runat="server" Text="{Name/Type of Certification/Training}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lblCertInstitution" runat="server" Text="{Institution}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lblCertInclusiveDate" runat="server" Text="{Inclusive Dates}"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>RowId</td>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Text="{Name/Type of Certification/Training}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label7" runat="server" Text="{Institution}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label8" runat="server" Text="{Inclusive Dates}"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>RowId</td>
                                    <td>
                                        <asp:Label ID="Label9" runat="server" Text="{Name/Type of Certification/Training}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label10" runat="server" Text="{Institution}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label11" runat="server" Text="{Inclusive Dates}"></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="card-title bg-light">
                            <h5 class="text-center">Seminar</h5>
                            <p class="text-center text-muted small">(Start with most recent)</p>
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <td>No.</td>
                                    <td>Name/Type of Certification/Training</td>
                                    <td>Institution</td>
                                    <td>Inclusive Dates</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>RowId</td>
                                    <td>
                                        <asp:Label ID="Label13" runat="server" Text="{Name/Type of Certification/Training}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label14" runat="server" Text="{Institution}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label15" runat="server" Text="{Inclusive Dates}"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>RowId</td>
                                    <td>
                                        <asp:Label ID="Label16" runat="server" Text="{Name/Type of Certification/Training}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label17" runat="server" Text="{Institution}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label18" runat="server" Text="{Inclusive Dates}"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>RowId</td>
                                    <td>
                                        <asp:Label ID="Label19" runat="server" Text="{Name/Type of Certification/Training}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label20" runat="server" Text="{Institution}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label21" runat="server" Text="{Inclusive Dates}"></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="card-title bg-light">
                            <h5 class="text-center">Work Experience</h5>
                            <p class="text-center text-muted small">(Start with most recent)</p>
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <td>No.</td>
                                    <td>Company/Employer</td>
                                    <td>Position</td>
                                    <td>Inclusive Dates</td>
                                    <td>Nature of Separation</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>RowId</td>
                                    <td>
                                        <asp:Label ID="Label22" runat="server" Text="{Name/Type of Certification/Training}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label23" runat="server" Text="{Institution}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label24" runat="server" Text="{Inclusive Dates}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label31" runat="server" Text="{Inclusive Dates}"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>RowId</td>
                                    <td>
                                        <asp:Label ID="Label25" runat="server" Text="{Name/Type of Certification/Training}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label26" runat="server" Text="{Institution}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label27" runat="server" Text="{Inclusive Dates}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label32" runat="server" Text="{Inclusive Dates}"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>RowId</td>
                                    <td>
                                        <asp:Label ID="Label28" runat="server" Text="{Name/Type of Certification/Training}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label29" runat="server" Text="{Institution}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label30" runat="server" Text="{Inclusive Dates}"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label33" runat="server" Text="{Inclusive Dates}"></asp:Label></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>


                <div class="row mb-3">
                    <div class="col justify-content-center text-center">
                        <p>
                            I hereby certify that all information given above are true and correct.
                        </p>
                    </div>
                </div>

                <div class="row mb-3 justify-content-center text-center">
                    <div class="col">
                        <p>
                            _______________________________________________
                        </p>
                        <p>
                            Employee's Signature over Printed Name
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
        </form>

</body>
</html>
