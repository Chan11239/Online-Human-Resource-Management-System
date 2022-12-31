<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="LeaveTypeForm.aspx.cs" Inherits="OHRMS.Administrators.LeaveTypeForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>Leave of Types</h4>
                    </div>
                    <asp:UpdatePanel ID="upnlLeaveType" runat="server">
                        <ContentTemplate>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-6 col-md-12 col-sm-12 md-form form-group">
                                        <asp:TextBox ID="txtCode" runat="server" CssClass="form-control md-form"></asp:TextBox>
                                        <label for="txtCode" class="form-label active">Code</label>
                                    </div>
                                    <div class="col-lg-6 col-md-12 col-sm-1 md-form form-group">
                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control md-form"></asp:TextBox>
                                        <label for="txtName" class="form-label active">Name</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 md-form form-group">
                                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-control md-form md-textarea"></asp:TextBox>
                                        <label for="txtDescription" class="form-label active">Description</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-12 col-sm-12 md-form form-group">
                                        <asp:TextBox ID="txtMaximumAlottedDays" runat="server" TextMode="Number" CssClass="form-control md-form"></asp:TextBox>
                                        <label for="txtMaximumAlottedDays" class="form-label active">Maximum Alotted Days</label>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="card-footer justify-content-center text-center">
                    <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="btn btn-red" />
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-blue" />
                    <asp:HiddenField ID="hidId" runat="server" />
                </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
