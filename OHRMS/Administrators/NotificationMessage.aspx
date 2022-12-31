<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="NotificationMessage.aspx.cs" Inherits="OHRMS.Administrators.NotificationMessage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">
    <cc1:ModalPopupExtender ID="mpeReschedule" runat="server" PopupControlID="pnlReschedule" TargetControlID="btnPopupStart" CancelControlID="btnClose" BackgroundCssClass="Background">
    </cc1:ModalPopupExtender>
    <div class="container my-3 clearfix ">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>View Message</h4>
                        <div class="col">
                            <asp:Button ID="btnPopupStart" runat="server" Text="Fill Form in Popup" Style="display: none" />
                        </div>
                    </div>
                    <div class="card-body md-form">
                        <div class="row mb-3">
                            <div class="col-lg-3">
                                <label>From</label>
                            </div>
                            <div class="col">
                                <asp:Label ID="lblName" runat="server" CssClass="form-text"></asp:Label>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-lg-3">
                                <label>Date</label>
                            </div>
                            <div class="col">
                                <asp:Label ID="lblDate" runat="server" CssClass="form-text"></asp:Label>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-lg-3">
                                <label>Message</label>
                            </div>
                            <div class="col">
                                <asp:Label ID="lblMessage" runat="server" CssClass="form-text"></asp:Label>
                            </div>
                        </div>
                        <div class="row mb-3" runat="server" id="resched" visible="false">
                            <div class="col-lg-3">
                                <label>Reschedule</label>
                            </div>
                            <div class="col">
                                <asp:Button ID="btnResched" runat="server" Text="Reschedule" OnClick="btnResched_Click" CssClass="btn btn-primary" />
                            </div>
                        </div>
                    </div>
                    <div class="card-footer justify-content-center text-center">
                        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="btn btn-lg btn-blue" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--Popup For Appointment Schedule--%>
    <asp:Panel ID="pnlReschedule" runat="server" Style="display: none">
        <div class="card">
            <div class="card-header">
                <h4>Appointment Reschedule</h4>
            </div>

            <div class="card-body">
                <div class="col">
                    <div class="md-form">
                        <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" type="date"></asp:TextBox>
                        <label for="txtDate" class="active">Date</label>
                    </div>

                    <div class="md-form">
                        <asp:TextBox ID="txtTime" runat="server" CssClass="form-control" type="time"></asp:TextBox>
                        <label for="txtTime" class="active">Time</label>
                    </div>
                    <div class="md-form">
                        <asp:TextBox ID="txtPlace" runat="server" TextMode="MultiLine" CssClass="form-control md-textarea"></asp:TextBox>
                        <label for="txtPlace" class="active">Place</label>
                    </div>
                </div>
            </div>
            <div class="card-footer justify-content-center text-center">
                <asp:Button ID="btnSubmitAppointment" runat="server" CssClass="btn btn-blue" OnClick="btnSubmitAppointment_Click" Text="Submit" />
                <asp:Button ID="btnClose" runat="server" CssClass="btn btn-primary" Text="Cancel" />
            </div>
        </div>
    </asp:Panel>

    <asp:HiddenField ID="hidFullName" runat="server" />

</asp:Content>
