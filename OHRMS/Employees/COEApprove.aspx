<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Employee.Master" AutoEventWireup="true" CodeBehind="COEApprove.aspx.cs" Inherits="OHRMS.Employees.COEApprove" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>Employee COE Request</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col form-group md-form">
                                <label class="active">Employee No</label>
                                <asp:Label ID="lblEmployeeNo" runat="server" CssClass="form-control mt-2" Text="{Employee No}"></asp:Label>
                            </div>
                            <div class="col form-group md-form">
                                <label class="active">Employee Name</label>
                                <asp:Label ID="lblEmployeeName" runat="server" CssClass="form-control mt-2" Text="{Employee Name}"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col form-group md-form">
                                <label class="active">Reason for Request COE</label>
                                <asp:Label ID="lblReason" runat="server" CssClass="form-control mt-2" Text="{Reason for leaving}"></asp:Label>
                            </div>
                            <div class="col form-group md-form">
                                <label class="active">Date Needed</label>
                                <asp:Label ID="lblffectivity" runat="server" CssClass="form-control mt-2" Text="{Effectivity Date}"></asp:Label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label for="coeRequestStatus">Status: &nbsp;</label>
                                <asp:Label ID="coeRequestStatus" runat="server" CssClass="" Text="Status"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer justify-content-center text-center">
                        <asp:Button ID="btnPrintCOEEndContract" runat="server" CssClass="btn btn-blue text-center" Text="Print COE" OnClick="btnPrintCOEEndContract_Click" />
                        <asp:Button ID="btnReject" runat="server" CssClass="btn btn-red text-center" Text="Reject" OnClick="btnReject_Click" />
                        <asp:Button ID="btnApprove" runat="server" CssClass="btn btn-blue text-center" Text="Approve" OnClick="btnApprove_Click" />
                        <asp:HiddenField ID="hidId" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
