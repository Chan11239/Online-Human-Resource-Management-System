<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Employee.Master" AutoEventWireup="true" CodeBehind="LeaveForm.aspx.cs" Inherits="OHRMS.Employees.LeaveForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>Leave Request Form<span class="red-text lead muted align-top">New</span></h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-6 col-md-12 col-sm-12 form-group">
                                <asp:DropDownList ID="ddlLeaveType" AppendDataBoundItems="true" runat="server" CssClass="mdb-select md-form" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">
                                    <asp:ListItem Text="--Select--" Value="-" />
                                </asp:DropDownList>
                                <label for="ddlLeaveType" class="form-label active">Type of Leave</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-12 col-sm-12 md-form form-group">
                                <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                <label for="txtStartDate" class="form-label active mb-4">Start Date</label>
                            </div>
                            <div class="col-lg-6 col-md-12 col-sm-12 md-form form-group">
                                <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                <label for="txtEndDate" class="form-label active mb-4">End Date</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col md-form form-group">
                                <asp:TextBox ID="txtReason" TextMode="MultiLine" runat="server" CssClass="md-textarea form-control"></asp:TextBox>
                                <label for="txtReason" class="form-label active mb-4">Reason</label>
                            </div>
                        </div>

                    </div>
                    <div class="card-footer justify-content-center text-center">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-blue btn-lg" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
