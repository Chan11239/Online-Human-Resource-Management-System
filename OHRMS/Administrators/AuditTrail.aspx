<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="AuditTrail.aspx.cs" Inherits="OHRMS.AuditTrail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>User Activity Log</h4>
                    </div>
                    <div class="card-body">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col"></div>
                                    <div class="col justify-content-end text-right">
                                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search" aria-label="Seach" aria-describedby="btnSearch"></asp:TextBox>
                                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-blue" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="table table-responsive">
                                        <asp:GridView ID="gvAuditTrail" runat="server" HorizontalAlign="Center" AutoGenerateColumns="false" CellPadding="6" CssClass="table table-hover border">
                                            <Columns>
                                                <asp:BoundField DataField="employeeNo" HeaderText="Employee ID" />
                                                <asp:BoundField DataField="fullName" HeaderText="Employee Name" />
                                                <asp:BoundField DataField="activity" HeaderText="Activity Log" />
                                                <asp:BoundField DataField="dateOfActivity" HeaderText="Time Stamp" />
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <h6 class="text-warning">No record(s) found.</h6>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
