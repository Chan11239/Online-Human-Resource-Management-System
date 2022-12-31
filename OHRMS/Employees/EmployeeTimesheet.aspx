<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Employee.Master" AutoEventWireup="true" CodeBehind="EmployeeTimesheet.aspx.cs" Inherits="OHRMS.Employees.EmployeeTimesheet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>Employee - Timesheet</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <h5 class="card-title">Search Period</h5>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="md-form input-group mb-3">
                                    <asp:TextBox ID="txtFrom" runat="server" TextMode="Date" required="true" CssClass="form-control"></asp:TextBox>
                                    <label class="mb-0 ml-2" for="txtFrom">Start Date</label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="md-form input-group mb-3">
                                    <asp:TextBox ID="txtTo" runat="server" TextMode="Date" required="true" CssClass="form-control"></asp:TextBox>
                                    <label class="mb-0 ml-2" for="txtTo">End Date</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col justify-content-center text-center">
                                <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-blue" Text="Search" OnClick="btnSearch_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="card-header clearfix">
                        <div class="row">
                            <div class="col">
                                <h5 class="">Your Timesheet</h5>
                            </div>
                            <div class="col justify-content-end text-right">
                                <asp:Button ID="btnPrint" runat="server" CssClass="btn btn-blue" Text="Print TimeSheet" OnClick="btnPrint_Click" />
                                <asp:HiddenField ID="hidBatchId" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div id="printableArea" class="col table-responsive">
                                <asp:GridView ID="gvTimeSheet" runat="server" AutoGenerateColumns="false" CssClass="table table-hover border">
                                    <Columns>
                                        <asp:BoundField DataField="employeeNo" HeaderText="Employee No" />
                                        <asp:BoundField DataField="timeLog" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Daily" />
                                        <asp:BoundField DataField="dayOfWeek" HeaderText="Day Of Week" />
                                        <asp:BoundField DataField="subject" HeaderText="Subject" />
                                        <asp:BoundField DataField="subjectTimeIn" HeaderText="Schedule Time-In" />
                                        <asp:BoundField DataField="subjectTimeOut" HeaderText="Schedule Time-Out" />
                                        <asp:BoundField DataField="employeeTimeIn" HeaderText="Employee Time-In" />
                                        <asp:BoundField DataField="employeeTimeOut" HeaderText="Employee Time-Out" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <h6 class="text-warning">No record found.</h6>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-footer justify-content-center text-center">
            </div>
        </div>
    </div>

</asp:Content>
