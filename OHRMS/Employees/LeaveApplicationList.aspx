<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Employee.Master" AutoEventWireup="true" CodeBehind="LeaveApplicationList.aspx.cs" Inherits="OHRMS.Employees.LeaveApplicationList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>Leave Applications</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col table table-responsive">
                                <asp:GridView ID="gvLeaveApplication" runat="server" AutoGenerateColumns="False" CssClass="table table-hover border">
                                    <Columns>
                                        <asp:BoundField DataField="deliverTo" HeaderText="Recipient" />
                                        <asp:BoundField DataField="reasons" HeaderText="Reason" />
                                        <asp:BoundField DataField="startDate" HeaderText="From" />
                                        <asp:BoundField DataField="endDate" HeaderText="To" />
                                        <asp:BoundField DataField="status" HeaderText="Status" />
                                        <asp:BoundField DataField="approver" HeaderText="Approved By" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <h6 class="text-warning">No record found.</h6>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <%--<div class="card-footer justify-content-center text-center">
                        <button type="button" class="btn btn-blue">Back to List</button>
                    </div>--%>
                </div>
            </div>
        </div>
        
    </div>

</asp:Content>
