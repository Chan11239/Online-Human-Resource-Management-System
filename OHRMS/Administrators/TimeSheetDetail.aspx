<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="TimeSheetDetail.aspx.cs" Inherits="OHRMS.Administrators.TimeSheetDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>Timesheet</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col table table-responsive">
                                <asp:GridView ID="gvTimeSheet" runat="server" AutoGenerateColumns="false" CssClass="table table-hover border">
                                    <Columns>
                                        <asp:BoundField DataField="departmentName" HeaderText="Department" />
                                        <asp:BoundField DataField="employeeNumber" HeaderText="Employee No." />
                                        <asp:BoundField DataField="employeeName" HeaderText="Employee Name" />
                                        <asp:BoundField DataField="recordDateTime" HeaderText="Recorded Date Time" />
                                        <asp:BoundField DataField="timeRecordType" HeaderText="Time In/Out" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <h6 class="text-warning">No Timesheet uploaded yet.</h6>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
