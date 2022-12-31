<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="ResignationProcessingForm.aspx.cs" Inherits="OHRMS.Administrators.ResignationProcessingForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>Employee Resignation Details</h4>
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
                                <label class="active">Reason for leaving</label>
                                <asp:Label ID="lblReason" runat="server" CssClass="form-control mt-2" Text="{Reason for leaving}"></asp:Label>
                            </div>
                            <div class="col form-group md-form">
                                <label class="active">Effectivity Date</label>
                                <asp:Label ID="lblffectivity" runat="server" CssClass="form-control mt-2" Text="{Effectivity Date}"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col form-group md-form">
                                <div class="file-path-wrapper">
                                    <asp:FileUpload ID="fuClearance" runat="server" class="file-path validate form-control md-form"></asp:FileUpload>
                                    <asp:LinkButton ID="lbtnClearance" runat="server" Text="{Clearance FileName}" OnClick="lbtnClearance_Click"></asp:LinkButton>
                                </div>
                            </div>

                            <div class="col">
                                <div class="form-group md-form">
                                    <label class="active">Status</label>
                                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="mdb-select mt-2">
                                        <asp:ListItem Value="-" Text="---Select---"></asp:ListItem>
                                        <asp:ListItem Value="PENDING" Text="PENDING"></asp:ListItem>
                                        <asp:ListItem Value="IN-PROGRESS" Text="IN-PROGRESS"></asp:ListItem>
                                        <asp:ListItem Value="APPROVED" Text="APPROVED"></asp:ListItem>
                                        <asp:ListItem Value="REJECTED" Text="REJECTED"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    <div class="card-footer justify-content-center text-center">
                        <asp:Button ID="btnUpdateProcessing" Text="Update Processing" OnClick="btnUpdateProcessing_Click" runat="server" CssClass="btn btn-blue "></asp:Button>
                        <asp:Button ID="btnPrintCOEEndContract" runat="server" CssClass="btn btn-blue text-center" Text="Print COE (end-contract)" OnClick="btnPrintCOEEndContract_Click" />
                        <asp:HiddenField ID="hidId" runat="server" />
                    </div>
            </div>
        </div>
        </div>
    </div>
</asp:Content>
