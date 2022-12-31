<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Employee.Master" AutoEventWireup="true" CodeBehind="EmployeeProfile.aspx.cs" Inherits="OHRMS.WebForm2" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="server">


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container bg-white shadow mt-5 col-10 mb-3 p-5">
                <div class="row">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-12">
                                <h3 class="display-5 text-primary">Your Profile</h3>
                            </div>
                            <%--                    <div class="col-6 text-end mt-3">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Post Job" OnClick="btnSubmit_Click" />
                    </div>--%>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-4">
                                <asp:Image ID="img_Profile" runat="server" CssClass="profile-pic img-thumbnail" Width="300" />
                            </div>
                            <div class="col-8">
                                <h1 class="display-6">
                                    <asp:Label ID="lblName_Profile" runat="server" Text="Name"></asp:Label></h1>
                                <span>
                                    <asp:Label ID="lblid" runat="server" Text="Employee Number"></asp:Label></span>
                                <div>
                                    <i class="fas fa-users"></i>
                                    <asp:Label ID="lblEmpNum_Profile" runat="server" Text="" CssClass="label-info form-label"></asp:Label>
                                </div>
                                <div>
                                    <i class="fas fa-users"></i>
                                    <asp:Label ID="lblDepartment" runat="server" Text="Department" CssClass="label-info form-label" ></asp:Label>
                                </div>
                                <div>
                                    <i class="fas fa-phone"></i>
                                    <asp:Label ID="lblContact_Profile" runat="server" Text="Contact" CssClass="label-info"></asp:Label>
                                </div>
                                <div>
                                    <i class="fas fa-envelope"></i>
                                    <asp:Label ID="lblEmail_Profile" runat="server" Text="Email" CssClass="label-info"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <table class="table table-hover table-responsive border">
                                <%--<tr>
                                    <td><label class="form-label">Employee Number</label></td>
                                    <td></td>
                                    <td><label class="form-label">Department</label></td>
                                    <td><asp:Label ID="lblDepartment" runat="server" Text="Department" CssClass="label-info form-label" ></asp:Label></td>
                                </tr>--%>
                            </table>
                            <div class="row mt-3">
                                <div class="card-header">
                                    <div class="row">
                                        <div class="col-12">
                                            <h5 class="text-primary">Basic Information</h5>
                                        </div>
                                    </div>
                                </div>
                                <table class="table table-hover table-responsive border">
                                    <tr>
                                        <td>
                                            <label class="form-label">Position</label></td>
                                        <td>
                                            <asp:Label ID="lblPosition_Profile" runat="server" CssClass="label-data form-label" Text=""></asp:Label></td>
                                        <td>
                                            <label class="form-label">Rank</label></td>
                                        <td>
                                            <asp:Label ID="lblRank_Profile" runat="server" CssClass="label-data form-label" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="form-label">Classification</label></td>
                                        <td>
                                            <asp:Label ID="lblClassification_Profile" runat="server" CssClass="label-data form-label" Text=""></asp:Label></td>
                                        <td>
                                            <label class="form-label">Address</label></td>
                                        <td>
                                            <asp:Label ID="lblAddress_Profile" runat="server" CssClass="label-data form-label" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="form-label">Birthday</label></td>
                                        <td>
                                            <asp:Label ID="lblBirthday_Profile" runat="server" CssClass="label-data form-label" Text=""></asp:Label></td>
                                        <td>
                                            <label class="form-label">Civil Status</label></td>
                                        <td>
                                            <asp:Label ID="lblStatus_Profile" runat="server" CssClass="label-data form-label" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="form-label">Salary Rate</label></td>
                                        <td>
                                            <asp:Label ID="lblSalary" runat="server" CssClass="label-data form-label" Text=""></asp:Label></td>
                                        <td>
                                            <label class="form-label">Gender</label></td>
                                        <td>
                                            <asp:Label ID="lblGender" runat="server" CssClass="label-data form-label" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="form-label">Religion</label></td>
                                        <td>
                                            <asp:Label ID="lblReligion" runat="server" CssClass="label-data form-label" Text=""></asp:Label></td>
                                        <td>
                                            <label class="form-label">SSS</label></td>
                                        <td>
                                            <asp:Label ID="lblSSS_Profile" runat="server" CssClass="label-data form-label" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="form-label">PhilHealth</label></td>
                                        <td>
                                            <asp:Label ID="lblPhilhealth_Profile" runat="server" CssClass="label-data form-label" Text=""></asp:Label></td>
                                        <td>
                                            <label class="form-label">TIN</label></td>
                                        <td>
                                            <asp:Label ID="lblTin_Profile" runat="server" CssClass="label-data form-label" Text=""></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <table class="table table-hover table-responsive border">
                                <%--<tr>
                                    <td><label class="form-label">Employee Number</label></td>
                                    <td></td>
                                    <td><label class="form-label">Department</label></td>
                                    <td><asp:Label ID="lblDepartment" runat="server" Text="Department" CssClass="label-info form-label" ></asp:Label></td>
                                </tr>--%>
                            </table>
                            <div class="row mt-3">
                                <div class="card-header">
                                    <div class="row">
                                        <div class="col-12">
                                            <h5 class="text-primary">Family Background</h5>
                                        </div>
                                    </div>
                                </div>
                                <table class="table table-hover table-responsive border">
                                    <tr>
                                        <td>
                                            <label class="form-label">Father's Name</label></td>
                                        <td>
                                            <asp:Label ID="lblFatherName" runat="server" CssClass="label-data" Text=""></asp:Label></td>
                                        <td>
                                            <label class="form-label">Age</label></td>
                                        <td>
                                            <asp:Label ID="lblFatherAge" runat="server" CssClass="label-data" Text=""></asp:Label></td>
                                        <td>
                                            <label class="form-label">Occupation</label></td>
                                        <td>
                                            <asp:Label ID="lblFatherOccupation" runat="server" CssClass="label-data" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="form-label">Mother's Name</label></td>
                                        <td>
                                            <asp:Label ID="lblMotherName" runat="server" CssClass="label-data" Text=""></asp:Label></td>
                                        <td>
                                            <label class="form-label">Age</label></td>
                                        <td>
                                            <asp:Label ID="lblMotherAge" runat="server" CssClass="label-data" Text=""></asp:Label></td>
                                        <td>
                                            <label class="form-label">Occupation</label></td>
                                        <td>
                                            <asp:Label ID="lblMotherOccupation" runat="server" CssClass="label-data" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="form-label">Spouse's Name</label></td>
                                        <td>
                                            <asp:Label ID="lblSpouseName" runat="server" CssClass="label-data" Text=""></asp:Label></td>
                                        <td>
                                            <label class="form-label">Age</label></td>
                                        <td>
                                            <asp:Label ID="lblSpouseAge" runat="server" CssClass="label-data" Text=""></asp:Label></td>
                                        <td>
                                            <label class="form-label">Occupation</label></td>
                                        <td>
                                            <asp:Label ID="lblSpouseOccupation" runat="server" CssClass="label-data" Text=""></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="separator">&nbsp;</div>
    <script>
        function shwwindow(myurl) {
            window.open(myurl, '_blank');
        }
    </script>
</asp:Content>
