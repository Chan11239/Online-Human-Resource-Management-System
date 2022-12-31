<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Applicant.Master" AutoEventWireup="true" CodeBehind="NotificationMessage.aspx.cs" Inherits="OHRMS.Applicants.NotificationMessage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">
     <div class="container bg-white shadow mt-5 col-10 mb-3 p-5">
        <div class="row">
            <div class="card-header">
                <div class="row">
                    <div class="col-12">
                        <h3 class="display-5 text-primary">View Message</h3>
                    </div>
                    <%--                    <div class="col-6 text-end mt-3">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Post Job" OnClick="btnSubmit_Click" />
                    </div>--%>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <table class="table table-hover table-responsive border">
                        <tr>
                            <td>From</td>
                            <td>
                                <asp:Label ID="lblName" runat="server" CssClass="form-label"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Date Sent</td>
                            <td>
                                <asp:Label ID="lblDateSent" runat="server" CssClass="form-label"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Message</td>
                            <td>
                                <p>
                                    <asp:Label ID="lblMessage" runat="server" CssClass="form-label"></asp:Label></p>
                            </td>
                        </tr>
                        <tr>
                            <td>Date</td>
                            <td>
                                <p>
                                    <asp:Label ID="lblDate" runat="server" CssClass="form-label"></asp:Label></p>
                            </td>
                        </tr>
                        <tr>
                            <td>Time</td>
                            <td>
                                <p>
                                    <asp:Label ID="lblTime" runat="server" CssClass="form-label"></asp:Label></p>
                            </td>
                        </tr>
                        <tr>
                            <td>Place</td>
                            <td>
                                <p>
                                    <asp:Label ID="lblPlace" runat="server" CssClass="form-label"></asp:Label></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" CssClass="btn btn-lg btn-primary" />
                            </td>
                            <td>
                                <asp:Button ID="btnResched" runat="server" Text="Request for Reschedule" OnClick="btnResched_Click" CssClass="btn btn-lg btn-primary" />
                            </td>
                        </tr>
                    </table>
                    <div class="separator">&nbsp;</div>
                    <div class="row text-center">
                        <div>
                            <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="btn btn-lg btn-primary" />
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="separator">&nbsp;</div>
</asp:Content>
