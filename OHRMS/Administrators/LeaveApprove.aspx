<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="LeaveApprove.aspx.cs" Inherits="OHRMS.LeaveApprove" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container-fluid my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>List of Leave</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col"></div>
                            <div class="col justify-content-end text-right">
                                <asp:TextBox ID="txtSearch" runat="server" PlaceHolder="Search for leaves..." CssClass="form-control"></asp:TextBox>
                                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" CssClass="btn btn-blue" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="table table-responsive">
                                <asp:UpdatePanel ID="upnlLeaveType" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="gvEmployeeLeaveApplication" runat="server" OnRowDataBound="gvEmployeeLeaveApplication_RowDataBound" AutoGenerateColumns="false" CssClass="table table-hover border">
                                            <Columns>
                                                <asp:BoundField DataField="leaveTypeName" HeaderText="Type" />
                                                <asp:BoundField DataField="employeeNo" HeaderText="Employee No." />
                                                <asp:BoundField DataField="employeeName" HeaderText="Employee Name" />
                                                <asp:BoundField DataField="reasons" HeaderText="Reasons" />
                                                <asp:TemplateField HeaderText="Start Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStartDate" runat="server" Text='<%# Eval("startDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="End Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEndDate" runat="server" Text='<%# Eval("endDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Status">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ShowHeader="true" HeaderText="Actions" HeaderStyle-CssClass="text-center">
                                                    <ItemTemplate>
                                                        <div class="row">
                                                            <div class="col justify-content-center text-center">
                                                                <asp:LinkButton ID="lnkApprove" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkApprove_Command" Text="Approve" CssClass="btn btn-blue btn-sm"></asp:LinkButton>
                                                                <asp:LinkButton ID="lnkReject" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkReject_Command" Text="Reject" CssClass="btn btn-red btn-sm"></asp:LinkButton>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <h6 class="text-warning">No record(s) found.</h6>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
