<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Employee.Master" AutoEventWireup="true" CodeBehind="EmployeeProfile.aspx.cs" Inherits="OHRMS.Employees.EmployeeProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="container my-3 p-3 clearfix">

                <div class="card">
                    <div class="card-header">
                        <h4>Your Profile</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-3 col-md-1 col-sm-1 justify-content-center text-center">
                                <asp:Image ID="img_Profile" runat="server" CssClass="img-thumbnail" Height="250px" />
                            </div>
                            <div class="col">
                                <div>
                                    <asp:Label ID="lblName_Profile" runat="server" Text="Name" CssClass="blue-text h3-responsive"></asp:Label>
                                    <div class="row">
                                        <div class="col">
                                            <%--<asp:Label ID="lblid" runat="server" Text="Employee Number"></asp:Label>--%>
                                            <%--<i class="fas fa-users"></i>
                                            <asp:Label ID="Label1" runat="server" Text="" CssClass="label-info form-label"></asp:Label>--%>
                                            <i class="fas fa-users"></i>
                                            <asp:Label ID="lblEmpNum_Profile" runat="server" Text="" CssClass="label-info form-label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <i class="fas fa-phone"></i>
                                            <asp:Label ID="lblContact_Profile" runat="server" Text="Contact" CssClass="label-info"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <i class="fas fa-envelope"></i>
                                            <asp:Label ID="lblEmail_Profile" runat="server" Text="Email" CssClass="label-info"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="card-header">
                                    Basic Information
                                </div>
                                <div class="card-body table-responsive">
                                    <table class="table table-hover border">
                                        <tr>
                                            <td>
                                                <label class="">Position</label></td>
                                            <td>
                                                <asp:Label ID="lblPosition_Profile" runat="server" CssClass="font-weight-bold" Text=""></asp:Label></td>
                                            <td>
                                                <label class="">Rank</label></td>
                                            <td>
                                                <asp:Label ID="lblRank_Profile" runat="server" CssClass="font-weight-bold" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="md-form">Classification</label></td>
                                            <td>
                                                <asp:Label ID="lblClassification_Profile" runat="server" CssClass="font-weight-bold" Text=""></asp:Label></td>
                                            <td>
                                                <label class="md-form">Address</label></td>
                                            <td>
                                                <asp:Label ID="lblAddress_Profile" runat="server" CssClass="font-weight-bold" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="form-label">Birthday</label></td>
                                            <td>
                                                <asp:Label ID="lblBirthday_Profile" runat="server" CssClass="font-weight-bold" Text=""></asp:Label></td>
                                            <td>
                                                <label class="form-label">Civil Status</label></td>
                                            <td>
                                                <asp:Label ID="lblStatus_Profile" runat="server" CssClass="font-weight-bold" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="form-label">Salary Rate</label></td>
                                            <td>
                                                <asp:Label ID="lblSalary" runat="server" CssClass="font-weight-bold" Text=""></asp:Label></td>
                                            <td>
                                                <label class="form-label">Gender</label></td>
                                            <td>
                                                <asp:Label ID="lblGender" runat="server" CssClass="font-weight-bold" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="form-label">Religion</label></td>
                                            <td>
                                                <asp:Label ID="lblReligion" runat="server" CssClass="font-weight-bold" Text=""></asp:Label></td>
                                            <td>
                                                <label class="form-label">SSS</label></td>
                                            <td>
                                                <asp:Label ID="lblSSS_Profile" runat="server" CssClass="font-weight-bold" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="form-label">PhilHealth</label></td>
                                            <td>
                                                <asp:Label ID="lblPhilhealth_Profile" runat="server" CssClass="font-weight-bold" Text=""></asp:Label></td>
                                            <td>
                                                <label class="form-label">TIN</label></td>
                                            <td>
                                                <asp:Label ID="lblTin_Profile" runat="server" CssClass="font-weight-bold" Text=""></asp:Label></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="card-header">
                                    Family Background
                                </div>
                                <div class="card-body table-responsive">
                                    <table class="table table-hover border">
                                        <tr>
                                            <td>
                                                <label class="form-label">Father's Name</label></td>
                                            <td>
                                                <asp:Label ID="lblFatherName" runat="server" CssClass="font-weight-bold" Text=""></asp:Label></td>
                                            <td>
                                                <label class="form-label">Age</label></td>
                                            <td>
                                                <asp:Label ID="lblFatherAge" runat="server" CssClass="font-weight-bold" Text=""></asp:Label></td>
                                            <td>
                                                <label class="form-label">Occupation</label></td>
                                            <td>
                                                <asp:Label ID="lblFatherOccupation" runat="server" CssClass="font-weight-bold" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="form-label">Mother's Name</label></td>
                                            <td>
                                                <asp:Label ID="lblMotherName" runat="server" CssClass="font-weight-bold" Text=""></asp:Label></td>
                                            <td>
                                                <label class="form-label">Age</label></td>
                                            <td>
                                                <asp:Label ID="lblMotherAge" runat="server" CssClass="font-weight-bold" Text=""></asp:Label></td>
                                            <td>
                                                <label class="form-label">Occupation</label></td>
                                            <td>
                                                <asp:Label ID="lblMotherOccupation" runat="server" CssClass="font-weight-bold" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="form-label">Spouse's Name</label></td>
                                            <td>
                                                <asp:Label ID="lblSpouseName" runat="server" CssClass="font-weight-bold"></asp:Label></td>
                                            <td>
                                                <label class="form-label">Age</label></td>
                                            <td>
                                                <asp:Label ID="lblSpouseAge" runat="server" CssClass="font-weight-bold"></asp:Label></td>
                                            <td>
                                                <label class="form-label">Occupation</label></td>
                                            <td>
                                                <asp:Label ID="lblSpouseOccupation" runat="server" CssClass="font-weight-bold"></asp:Label></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>



    <script>
        function shwwindow(myurl) {
            window.open(myurl, '_blank');
        };

    </script>
</asp:Content>
