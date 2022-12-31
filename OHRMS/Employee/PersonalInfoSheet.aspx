<%@ Register Src="~/Cert.ascx" TagName="UserControl" TagPrefix="uc1" %>
<%@ Register Src="~/Seminar.ascx" TagName="UserControl" TagPrefix="uc2" %>
<%@ Register Src="~/Work.ascx" TagName="UserControl" TagPrefix="uc3" %>
<%@ Register Src="~/Children.ascx" TagName="UserControl" TagPrefix="uc4" %>


<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Employee.Master" AutoEventWireup="true" CodeBehind="PersonalInfoSheet.aspx.cs" Inherits="OHRMS.WebForm4" EnableEventValidation="False" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">


    <%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>

    <div class="container my-3 clearfix">
        <div class="card">
            <div class="card-body">
                <div class="card-title">HRF_05</div>
                <div class="card-subtitle">Dev040620</div>
            </div>

            <div class="card-header">
                <div class="row">
                    <div class="col-lg-6 col-md-12 col-sm-12">
                        <h4>Personal Information Sheet</h4>
                        <p class="small text-muted white-text">Fill up the blue field in ALL CAPS. Write "N/A" for not applicable.</p>
                    </div>
                    <%--<div class="col-lg-6 col-md-12 col-sm-12 justify-content-end text-right">
                        <asp:Button ID="btnUpdate_PIS" runat="server" Text="Update" CssClass="btn btn-blue btn-lg" OnClick="btnUpdate_PIS_Click" />
                    </div>--%>
                </div>
            </div>

            <div class="card-header mt-3">
                <h5>Personal Details</h5>
            </div>

            <div class="card-body">
                <asp:Panel ID="pnlEmp_Details" runat="server">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <div class="row">
                                    <div class="md-form col">
                                        <asp:TextBox ID="txtName_PIS" runat="server" CssClass="form-control" aria-label="Fullname"></asp:TextBox>
                                        <label for="txtName_PIS" class="active">Fullname</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="md-form col">
                                        <asp:TextBox ID="txtAddress_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                        <label for="txtAddress_PIS" class="active">Complete Address</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col text-center">
                                <div class="row">
                                    <div class="col">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="row text-center justify-content-center">
                                            <div class="md-form">
                                                <div class="file-field">
                                                    <div class="mb-4">
                                                        <asp:Image ID="img_twoXtwo" runat="server" CssClass="img-thumbnail" Width="200px" />
                                                    </div>
                                                    <div class="d-flex justify-content-center">
                                                        <div class="btn btn-blue btn-rounded float-left">
                                                            <span>Update photo</span>
                                                            <asp:FileUpload ID="uploadImage" runat="server" CssClass="file-path validate custom-file-input" type="file" />
                                                        </div>
                                                        <div class="col">
                                                            <asp:Button ID="btnUploadPhoto" runat="server" Text="Upload" CssClass="btn btn-blue btn-rounded" OnClick="btnUploadPhoto_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="md-form col-lg-3 col-md-12 col-sm-12">
                                <asp:TextBox ID="txtContactNo_PIS" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                                <label for="txtContactNo_PIS" class="active">Contact Number</label>
                            </div>
                            <div class="md-form col-lg-5 col-md-12 col-sm-12">
                                <asp:TextBox ID="txtEmail_PIS" PlaceHolder="@gmail.com" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                <label for="txtEmail_PIS" class="active">Email Address</label>
                            </div>
                            <div class="md-form col-lg-4 col-md-12 col-sm-12">
                                <asp:TextBox ID="txtBirthplace_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                <label for="txtBirthplace_PIS" class="active">Birthplace</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="md-form col-lg-3 col-md-12 col-sm-12">
                                <asp:TextBox ID="txtBirthday_PIS" runat="server" TextMode="Date" CssClass="form-control" AutoPostBack="True"></asp:TextBox>
                                <label for="txtBirthday_PIS" class="active">Birthdate</label>
                            </div>
                            <div class="md-form col-lg-3 col-md-12 col-sm-12">
                                <asp:TextBox ID="txtCitizenship_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                <label for="txtCitizenship_PIS" class="active">Citizenship</label>
                            </div>
                            <div class="md-form col-lg-3 col-md-12 col-sm-12">
                                <label for="txtCitizenship_PIS" class="active">Civil Status</label>
                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="mdb-select">
                                    <asp:ListItem Value="Value1" Text="-Select Civil Status-"></asp:ListItem>
                                    <asp:ListItem Value="Single" Text="Single"></asp:ListItem>
                                    <asp:ListItem Value="Married" Text="Married"></asp:ListItem>
                                    <asp:ListItem Value="Divorce" Text="Divorce"></asp:ListItem>
                                    <asp:ListItem Value="Separated" Text="Separated"></asp:ListItem>
                                    <asp:ListItem Value="Widowed" Text="Widowed"></asp:ListItem>
                                </asp:DropDownList>

                            </div>
                            <div class="md-form col-lg-3 col-md-12 col-sm-12">
                                <asp:TextBox ID="txtReligion_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                <label for="txtReligion_PIS" class="active">Religion</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="md-form col-lg-3 col-md-12 col-sm-12">
                                <label for="ddl_Gender" class="active">Gender</label>
                                <asp:DropDownList ID="ddl_Gender" runat="server" CssClass="mdb-select">
                                    <asp:ListItem Value="Value1" Text="-Gender-"></asp:ListItem>
                                    <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
                                    <asp:ListItem Value="Female" Text="Female"></asp:ListItem>
                                </asp:DropDownList>

                            </div>
                            <div class="md-form col-lg-3 col-md-12 col-sm-12">
                                <asp:TextBox ID="txtHeight_PIS" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                                <label for="txtHeight_PIS" class="active">Height</label>
                            </div>
                            <div class="md-form col-lg-3 col-md-12 col-sm-12">
                                <asp:TextBox ID="txtWeight_PIS" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                                <label for="txtWeight_PIS" class="active">Weight</label>
                            </div>
                            <div class="md-form col-lg-3 col-md-12 col-sm-12">
                                <asp:TextBox ID="txtTin_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                <label for="txtTin_PIS" class="active">Tax Identification Number</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="md-form col-lg-3 col-md-12 col-sm-12">
                                <asp:TextBox ID="txtPhilhealth_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                <label for="txtPhilhealth_PIS" class="active">PhilHealth Number</label>
                            </div>
                            <div class="md-form col-lg-3 col-md-12 col-sm-12">
                                <asp:TextBox ID="txtSSS_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                <label for="txtSSS_PIS" class="active">SSS Number</label>
                            </div>
                            <div class="md-form col-lg-3 col-md-12 col-sm-12">
                                <asp:TextBox ID="txtHDMF_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                <label for="txtHDMF_PIS" class="active">HDMF Number</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="md-form col-lg-5 col-md-12 col-sm-12">
                                <asp:TextBox ID="txtNameEmergency_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                <label for="txtNameEmergency_PIS" class="active">Contact Person incase of Emergency</label>
                            </div>
                            <div class="md-form col-lg-3 col-md-12 col-sm-12">
                                <asp:TextBox ID="txtRelationship_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                <label for="txtPhilhealth_PIS" class="active">Relationship</label>
                            </div>
                            <div class="md-form col-lg-3 col-md-12 col-sm-12">
                                <asp:TextBox ID="txtContactEmergency_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                <label for="txtContactEmergency_PIS" class="active">Contact Number</label>
                            </div>
                        </div>
                        <div class="row justify-content-center text-center border">
                            <div class="md-form col-lg-3 col-md-12 col-sm-12">
                                <asp:Button ID="btnUpdatePersonalDetail" runat="server" Text="Update Personal Info" CssClass="btn btn-blue" OnClick="btnUpdatePersonalDetail_Click" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>

            <div class="card-header">
                <h5>Employment Details<span class="red-text small">(This portion is for Human Resource Department <strong>USE ONLY</strong>)</span></h5>
            </div>

            <div class="card-body">
                <asp:Panel ID="pnlEmp_INfo" runat="server">
                    <div class="col table table-responsive">
                        <table class="table table-hover border">
                            <tr>
                                <td>
                                    <label runat="server">Employee ID</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmpID_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <label runat="server">Department</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDepartment_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <label runat="server">Position</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPosition_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label runat="server">Classification</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtClassification_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <label runat="server">Rank</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtRank_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label runat="server">Salary Rate</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSalary_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <label runat="server">Date of Original Appointment</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDateAppoint_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label runat="server">Status & Tenure of Employement</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtStatus_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="4" class="p-3">
                                    <h5 class="text-primary">
                                        <label runat="server">If Assigned to other department</label></h5>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Date of Appointment</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtNewDateAppoint_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <label runat="server">Position</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtNewPosition_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label runat="server">Date of Separation</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDateSeparation_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <label runat="server">Nature of Separation</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSeparation" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
            </div>

            <div class="card-header">
                <div class="row">
                    <div class="col">
                        <h5>Family Background</h5>
                    </div>
                    <%--                    <div class="col">
                        <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn btn-blue btn-sm" OnClick="btnSaveChild_Click" />
                    </div>--%>
                </div>
            </div>

            <div class="card-body">
                <asp:Panel ID="pnlFamBackground" runat="server">
                    <div class="col table-responsive">
                        <table class="table border">
                            <tr>
                                <th>
                                    <label class="font-weight-bold">Relationship</label>
                                </th>
                                <th>
                                    <label class="font-weight-bold">Name</label>
                                </th>
                                <th>
                                    <label class="font-weight-bold">Age</label>
                                </th>
                                <th>
                                    <label class="font-weight-bold">Occupation</label>
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <label class="font-weight-bold">Father</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFatherName_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFatherAge_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFatherOccu_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="font-weight-bold">Mother</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtMotherName_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtMotherAge_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtMotherOccu_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="font-weight-bold">Spouse, if married</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSpouseName_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSpouseAge_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSpouseOccu_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" class="text-center">
                                    <asp:Button ID="btnUpdateFamBG" runat="server" Text="Update" CssClass="btn btn-blue btn-sm" OnClick="btnUpdateFamBG_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" class="text-danger small text-center">Children (Arrange from eldest to youngest)
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" class="text-center">
                                    <asp:PlaceHolder ID="phchild" runat="server" />
                                    <div class="col table-responsive">
                                        <asp:GridView ID="gvChildren" runat="server" AutoGenerateColumns="false" CssClass="table table-hover border">
                                            <Columns>
                                                <asp:BoundField DataField="childrenName" HeaderText="Name" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" />
                                                <asp:BoundField DataField="childrenAge" HeaderText="Age" />
                                                <asp:BoundField DataField="childrenOccupation" HeaderText="Occupation" />
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <h6 class="text-warning">No record(s) found.</h6>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </div>
                                    <div class="row justify-content-center text-center">
                                        <asp:Button ID="btnAddChild" runat="server" Text="Add" CssClass="btn btn-blue btn-sm" OnClick="btnAddChild_Click" />
                                        <asp:Button ID="btnSaveChild" runat="server" Text="Save" CssClass="btn btn-blue btn-sm" OnClick="btnSaveChild_Click" />
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
            </div>

            <div class="card-header">
                <div class="row">
                    <div class="col">
                        <h5>Educational Background</h5>
                    </div>
                </div>
            </div>

            <div class="card-body">
                <asp:Panel ID="pnlEduc" runat="server">
                    <div class="col table table-responsive">
                        <table class="table table-hover border">
                            <tr>
                                <td>
                                    <label class="font-weight-bold">Degree</label>
                                </td>
                                <td>
                                    <label class="font-weight-bold">Name & Address of School</label>
                                </td>
                                <td>
                                    <label class="font-weight-bold">Course</label>
                                </td>
                                <td>
                                    <label class="font-weight-bold">Inclusive Dates</label>
                                </td>
                                <td>
                                    <label class="font-weight-bold">Awards Received</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Primary</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtNameElem_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCourseElem_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDatesElem_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAwardsElem_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Secondary</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSecondaryName_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSecondaryCourse_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSecondaryDates_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSecondaryAwards_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Vocational Course</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtVocationalName_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtVocationalCourse_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtVocationalDates_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtVocationalAwards_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Bachelor's Degree</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBachelorName_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBachelorCourse_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBachelorDates_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtBachelorAwards_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Master's Degree</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtMasterName_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtMasterCourse_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtMasterDates_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtMasterAwards_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Doctor's Degree</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDoctorName_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDoctorCoursePIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDoctorDates_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDoctorAwards_PIS" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5" class="text-center">
                                    <asp:Button ID="btnUpdateEduc" runat="server" Text="Update" CssClass="btn btn-blue btn-sm" OnClick="btnUpdateEduc_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
            </div>

            <div class="card-header">
                <h5>Eligibility</h5>
            </div>

            <div class="card-body">
                <asp:Panel ID="pnlEligibility" runat="server">
                    <div class="col table-responsive">
                        <asp:GridView ID="gvEligibilities" runat="server" AutoGenerateColumns="false" CssClass="table table-hover border">
                            <Columns>
                                <asp:BoundField DataField="typeLicense" HeaderText="License Type" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" />
                                <asp:BoundField DataField="licenseNo" HeaderText="License No." />
                                <asp:BoundField DataField="dateValid" HeaderText="Validity" />
                            </Columns>
                            <EmptyDataTemplate>
                                <h6 class="text-warning">No record(s) found.</h6>
                            </EmptyDataTemplate>
                        </asp:GridView>


                        <table class="table table-hover border">
                            <tr>
                                <td class="justify-content-center text-center">
                                    <asp:PlaceHolder ID="phEligibility" runat="server" />
                                    <asp:Button ID="btnAddEligibility" runat="server" Text="Add" CssClass="btn btn-blue btn-sm" OnClick="btnAddEligibility_Click" />
                                    <asp:Button ID="btnSaveEligibility" runat="server" Text="Save" CssClass="btn btn-blue btn-sm" OnClick="btnSaveEligibility_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
            </div>

            <div class="card-header">
                <h5>Certifications and Trainings<span class="red-text small"> (Start with most Recent)</span></h5>
            </div>

            <div class="card-body">
                <asp:Panel ID="pnlCert" runat="server">
                    <div class="col table-responsive">
                        <asp:GridView ID="gvCertTrainings" runat="server" AutoGenerateColumns="false" CssClass="table table-hover border">
                            <Columns>
                                <asp:BoundField DataField="typeCertification" HeaderText="Certification/Training" />
                                <asp:BoundField DataField="institution" HeaderText="Institution/Organization" />
                                <asp:BoundField DataField="inclusiveDates" HeaderText="Inclusive Dates" />
                            </Columns>
                            <EmptyDataTemplate>
                                <h6 class="text-warning">No record(s) found.</h6>
                            </EmptyDataTemplate>
                        </asp:GridView>

                        <table class="table table-hover border">
                            <tr>
                                <td class="justify-content-center text-center">
                                    <asp:PlaceHolder ID="ph1" runat="server" />
                                    <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-blue btn-sm" OnClick="btnAdd_Click" />
                                    <asp:Button ID="btnSaveCertTraining" runat="server" Text="Save" CssClass="btn btn-blue btn-sm" OnClick="btnSaveCertTraining_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
            </div>

            <div class="card-header">
                <h5>Seminars<span class="red-text small"> (Start with most Recent)</span></h5>
            </div>

            <div class="card-body">
                <asp:Panel ID="pnlSeminar" runat="server">
                    <div class="col table-responsive">
                        <asp:GridView ID="gvSeminar" runat="server" AutoGenerateColumns="false" CssClass="table table-hover border">
                            <Columns>
                                <asp:BoundField DataField="typeSeminar" HeaderText="Name/Title Of Seminar" />
                                <asp:BoundField DataField="institution" HeaderText="Institution/Organization" />
                                <asp:BoundField DataField="inclusiveDates" HeaderText="Inclusive Dates" />
                            </Columns>
                            <EmptyDataTemplate>
                                <h6 class="text-warning">No record(s) found.</h6>
                            </EmptyDataTemplate>
                        </asp:GridView>

                        <table class="table table-hover border">
                            <tr>
                                <td class="justify-content-center text-center">
                                    <asp:PlaceHolder ID="phSeminar" runat="server" />
                                    <asp:Button ID="btnAddSeminar" runat="server" Text="Add" CssClass="btn btn-blue btn-sm" OnClick="btnAddSeminar_Click" />
                                    <asp:Button ID="btnSaveSeminar" runat="server" Text="Save" CssClass="btn btn-blue btn-sm" OnClick="btnSaveSeminar_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
            </div>

            <div class="card-header">
                <h5>Work Experience<span class="red-text small"> (Start with most Recent)</span></h5>
            </div>

            <div class="card-body">
                <asp:Panel ID="pnlWork" runat="server">
                    <div class="col table-responsive">
                        <asp:GridView ID="gvWorkExperience" runat="server" AutoGenerateColumns="false" CssClass="table table-hover border">
                            <Columns>
                                <asp:BoundField DataField="company" HeaderText="Company Name" />
                                <asp:BoundField DataField="position" HeaderText="Position Assigned" />
                                <asp:BoundField DataField="inclusiveDates" HeaderText="Inclusive Dates" />
                                <asp:BoundField DataField="natureOfSeparation" HeaderText="Nature of Separation" />
                            </Columns>
                            <EmptyDataTemplate>
                                <h6 class="text-warning">No record(s) found.</h6>
                            </EmptyDataTemplate>
                        </asp:GridView>

                        <table class="table table-hover border">
                            <tr>
                                <td class="justify-content-center text-center">
                                    <asp:PlaceHolder ID="phWork" runat="server" />
                                    <asp:Button ID="btnAddWork" runat="server" Text="Add" CssClass="btn btn-blue btn-sm" OnClick="btnAddWork_Click" />
                                    <asp:Button ID="btnSaveWork" runat="server" Text="Save" CssClass="btn btn-blue btn-sm" OnClick="btnSaveWork_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
            </div>

        </div>
        <%--Card End--%>
    </div>
    <%--Container End--%>
    <%--        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnUpdate_PIS" />
        </Triggers>
    </asp:UpdatePanel>--%>


    <div>
        <asp:Literal ID="ltlCount" runat="server" Text="0" Visible="false" />
        <asp:Literal ID="ltlRemoved" runat="server" Visible="false" />
        <asp:Literal ID="ltlCountSem" runat="server" Text="0" Visible="false" />
        <asp:Literal ID="ltlRemovedSem" runat="server" Visible="false" />
        <asp:Literal ID="ltlCountWork" runat="server" Text="0" Visible="false" />
        <asp:Literal ID="ltlRemovedWork" runat="server" Visible="false" />
        <asp:Literal ID="ltlCountChild" runat="server" Text="0" Visible="false" />
        <asp:Literal ID="ltlRemovedChild" runat="server" Visible="false" />
        <asp:Literal ID="ltlCountEligibility" runat="server" Text="0" Visible="false" />
        <asp:Literal ID="ltlRemoveEligibility" runat="server" Visible="false" />
    </div>
</asp:Content>
