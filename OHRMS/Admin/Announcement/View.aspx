<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="OHRMS.Admin.Announcement.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <div class="row">
                            <div class="col">
                                <h4>Announcement</h4>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row mb-3">
                            <div class="col">
                                <label for="lblTitle" class="active">Title</label>
                                <asp:Label ID="lblTitle" runat="server" CssClass="form-control"></asp:Label>
                            </div>
                            <div class="col">
                                <label for="lblType" class="active">Type</label>
                                <asp:Label ID="lblType" runat="server" CssClass="form-control"></asp:Label>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label for="lblDescription" class="active">Description</label>
                                <asp:Label ID="lblDescription" runat="server" CssClass="form-control"></asp:Label>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label for="lblStartDate" class="active">Start Date</label>
                                <asp:Label ID="lblStartDate" runat="server" CssClass="form-control"></asp:Label>
                            </div>
                            <div class="col">
                                <label for="lblEndDate" class="active">End Date</label>
                                <asp:Label ID="lblEndDate" runat="server" CssClass="form-control"></asp:Label>
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
