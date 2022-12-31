<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="OHRMS.Admin.Memorandum.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <div class="row">
                            <div class="col">
                                <h4>Memorandum</h4>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row mb-3">
                            <div class="col">
                                <label for="lblMemoNo" class="active">Memo No</label>
                                <asp:Label ID="lblMemoNo" runat="server" CssClass="form-control"></asp:Label>
                            </div>
                            <div class="col">
                                <label for="lblTo" class="active">To</label>
                                <asp:Label ID="lblTo" runat="server" CssClass="form-control"></asp:Label>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label for="lblCc" class="active">CC</label>
                                <asp:Label ID="lblCc" runat="server" CssClass="form-control"></asp:Label>
                            </div>
                            <div class="col">
                                <label for="lblType" class="active">From</label>
                                <asp:Label ID="lblFrom" runat="server" CssClass="form-control"></asp:Label>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label for="lblAsOfDate" class="active">Date</label>
                                <asp:Label ID="lblAsOfDate" runat="server" CssClass="form-control"></asp:Label>
                            </div>
                            <div class="col">
                                <label for="lblSubject" class="active">Subject</label>
                                <asp:Label ID="lblSubject" runat="server" CssClass="form-control"></asp:Label>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label for="lblMessage" class="active">Message</label>
                                <asp:Label ID="lblMessage" runat="server" CssClass="form-control"></asp:Label>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label for="lnkAttachment" class="active">Attachment</label>
                                <asp:LinkButton ID="lnkAttachment" runat="server" CssClass="form-control"></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer justify-content-center text-center">
                        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="btn btn-blue" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
