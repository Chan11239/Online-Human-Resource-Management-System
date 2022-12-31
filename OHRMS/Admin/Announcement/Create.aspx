<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="OHRMS.Admin.Announcement.Create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>Announcement <span class="red-text small align-top">New</span></h4>
                    </div>
                    <div class="card-body  md-form">
                        <div class="row mb-3">
                            <div class="col">
                                <label for="txtTitle" class="">Title</label>
                                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col">
                                <label for="txtType" class="active">Type</label>
                                <asp:TextBox ID="txtType" runat="server" Text="General Announcement" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label for="txtDescription" class="">Description</label>
                                <asp:TextBox ID="txtDescription" runat="server" CssClass="md-textarea form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label for="txtStartDate" class="active">Start Date</label>
                                <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col">
                                <label for="txtStarttxtEndDateDate" class="active">End Date</label>
                                <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer justify-content-center text-center">
                        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="btn btn-red" />
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-blue" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
