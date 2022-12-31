<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="EmployeeHiringForm.aspx.cs" Inherits="OHRMS.Administrators.EmployeeHiringForm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">
    <cc1:ModalPopupExtender ID="mpePoint" runat="server" PopupControlID="pnlPoint" TargetControlID="btnPopupStart" CancelControlID="btnClose" BackgroundCssClass="Background">
    </cc1:ModalPopupExtender>

    <div class="container my-3">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>Employee <span class="text-danger lead muted align-top">New</span></h4>
                    </div>
                    <div class="col">
                        <asp:Button ID="btnPopupStart" runat="server" Text="Fill Form in Popup" Style="display: none" />
                    </div>
                    <div class="card-body">
                        <div class="card-title bg-light p-2">
                            <h5 class="blue-text">Employment Information</h5>
                        </div>

                        <div class="row mb-3">
                            <div class="col-lg-3">
                                <label>Employee No</label>
                            </div>
                            <div class="col">
                                <asp:Label ID="lblEmployeeNo" runat="server" TabIndex="1" CssClass="form-label"></asp:Label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6 form-group md-form">
                                <label class="active">Classification</label>
                                <asp:DropDownList ID="ddlClassification" runat="server" TabIndex="2" AutoPostBack="true" OnSelectedIndexChanged="ddlClassification_SelectedIndexChanged" CssClass="mdb-select">
                                    <asp:ListItem Value="-" Text="- Select Classification -"></asp:ListItem>
                                    <asp:ListItem Value="Teaching" Text="Teaching"></asp:ListItem>
                                    <asp:ListItem Value="Non-Teaching" Text="Non-Teaching"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-lg-6 form-group md-form">
                                <label class="active">Position</label>
                                <asp:DropDownList ID="ddlPosition" runat="server" TabIndex="3" CssClass="mdb-select">
                                    <asp:ListItem Value="-" Text="- Select -"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6 form-group md-form">
                                <label class="active">Department</label>
                                <asp:DropDownList ID="ddlDepartment" runat="server" TabIndex="3" CssClass="mdb-select" AutoPostBack="true" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
                                    <asp:ListItem Value="-" Text="- Select -"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-lg-6 form-group md-form">
                                <label class="active">Rank</label>
                                <asp:TextBox ID="txtRank" runat="server" TabIndex="4" CssClass="form-control md-form"></asp:TextBox>
                                <asp:Button ID="btnPoints" runat="server" Text="Point" CssClass="btn btn-blue btn-sm" OnClick="btnPoints_Click" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6 form-group md-form">
                                <label class="active">Salary Rate</label>
                                <asp:TextBox ID="txtSalary" runat="server" TabIndex="4" Text="0.00" TextMode="Number" CssClass="form-control md-form"></asp:TextBox>
                            </div>
                            <div class="col-lg-6 form-group md-form">
                                <label class="active">Type</label>
                                <asp:DropDownList ID="ddlType" runat="server" TabIndex="8" CssClass="mdb-select">
                                    <asp:ListItem Value="-" Text="-Select Type-"></asp:ListItem>
                                    <asp:ListItem Value="Full Time" Text="Full Time"></asp:ListItem>
                                    <asp:ListItem Value="Part Time" Text="Part Time"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-lg-6 form-group md-form">
                                <label class="active">Status & Tenure of Employment</label>
                                <asp:DropDownList ID="ddlStatus" runat="server" TabIndex="5" CssClass="mdb-select">
                                    <asp:ListItem Value="Value1" Text="-Select Status-"></asp:ListItem>
                                    <asp:ListItem Value="Probationary" Text="Probationary"></asp:ListItem>
                                    <asp:ListItem Value="Regular" Text="Regular"></asp:ListItem>
                                    <asp:ListItem Value="Resigned" Text="Resigned"></asp:ListItem>
                                    <asp:ListItem Value="Terminated" Text="Terminated"></asp:ListItem>
                                    <asp:ListItem Value="Retired" Text="Retired"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-lg-6 form-group md-form">
                                <label class="active">Date of Original Appointment</label>
                                <asp:TextBox ID="txtDateAppoint" runat="server" TabIndex="9" TextMode="date" CssClass="form-control datepicker"></asp:TextBox>
                            </div>
                        </div>

                        <div class="card-title">
                            <h5 class="blue-text bg-light p-2">User Information</h5>
                        </div>

                        <div class="row mb-3">
                            <div class="col-lg-6 form-group md-form">
                                <label class="active">Firstname</label>
                                <asp:TextBox ID="txtFirstName" runat="server" TabIndex="10" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-lg-6 form-group md-form">
                                <label class="active">Middlename</label>
                                <asp:TextBox ID="txtMiddleName" runat="server" TabIndex="11" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-lg-6 form-group md-form">
                                <label class="active">Lastname</label>
                                <asp:TextBox ID="txtLastName" runat="server" TabIndex="12" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-lg-6 form-group md-form">
                                <label class="active">Password</label>
                                <asp:Label ID="lblPassword" runat="server" CssClass=""></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="col justify-content-center text-center">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" TabIndex="13" CssClass="btn btn-blue btn-lg" OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--Popup For Points--%>
    <asp:Panel ID="pnlPoint" runat="server" Style="display: none">
        <div class="card">
            <div class="card-header">
                <h4>Input Point</h4>
            </div>

            <div class="card-body">
                <div class="col">
                    <div class="md-form">
                        <asp:TextBox ID="txtPoint" runat="server" CssClass="form-control" Text="0"></asp:TextBox>
                        <label for="txtPoint" class="active">Point</label>
                    </div>
                </div>
            </div>
            <div class="card-footer justify-content-center text-center">
                <asp:Button ID="btnClose" runat="server" CssClass="btn btn-red" Text="Cancel" />
                <asp:Button ID="btnSubmitAppointment" runat="server" CssClass="btn btn-blue" Text="Submit" OnClick="btnSubmitAppointment_Click" />
            </div>
        </div>
    </asp:Panel>

    <asp:HiddenField ID="hidEmployeeNo" runat="server" />
    <asp:HiddenField ID="hidApplicantId" runat="server" />
    <asp:HiddenField ID="hidId" runat="server" />
</asp:Content>
