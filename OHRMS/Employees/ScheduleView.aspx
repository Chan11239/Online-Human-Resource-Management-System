<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Employee.Master" AutoEventWireup="true" CodeBehind="ScheduleView.aspx.cs" Inherits="OHRMS.Employees.ScheduleView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 p-3 clearfix">
        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col">
                        <h4>Your Schedule</h4>
                    </div>
                    <div class="col text-right">
                        <input type="button" onclick="printDiv('printableArea')" value="Print Schedule" class="btn btn-blue" />
                    </div>
                </div>
            </div>

            <div class="card-header mt-2">
                <h5 class="red-text">Sunday</h5>
            </div>

            <div class="card-body">
                <div class="table table-responsive">
                    <asp:GridView ID="gvScheduleSunday" runat="server" AutoGenerateColumns="False" ShowHeader="false" CssClass="table table-hover border">
                        <Columns>
                            <asp:BoundField DataField="subjectName" ShowHeader="false" />
                            <asp:BoundField DataField="periodFrom" ItemStyle-CssClass="grid-item-right" ShowHeader="false" />
                            <asp:BoundField DataField="periodTo" ItemStyle-CssClass="grid-item-right" ShowHeader="false" />
                            <asp:BoundField DataField="section" ItemStyle-CssClass="grid-item-right" ShowHeader="false" />
                        </Columns>
                        <EmptyDataTemplate>
                            <h6 class="text-warning">No schedule</h6>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

            <div class="card-header mt-2">
                <h5 class="red-text">Monday</h5>
            </div>

            <div class="card-body">
                <div class="table table-responsive">
                    <asp:GridView ID="gvScheduleMonday" runat="server" AutoGenerateColumns="False" ShowHeader="false" CssClass="table table-hover border">
                        <Columns>
                            <asp:BoundField DataField="subjectName" ShowHeader="false" />
                            <asp:BoundField DataField="periodFrom" ItemStyle-CssClass="grid-item-right" ShowHeader="false" />
                            <asp:BoundField DataField="periodTo" ItemStyle-CssClass="grid-item-right" ShowHeader="false" />
                            <asp:BoundField DataField="section" ItemStyle-CssClass="grid-item-right" ShowHeader="false" />
                        </Columns>
                        <EmptyDataTemplate>
                            <h6 class="text-warning">No schedule</h6>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

            <div class="card-header mt-2">
                <h5 class="red-text">Tuesday</h5>
            </div>

            <div class="card-body">
                <div class="table table-responsive">
                    <asp:GridView ID="gvScheduleTuesday" runat="server" AutoGenerateColumns="False" ShowHeader="false" CssClass="table table-hover border">
                        <Columns>
                            <asp:BoundField DataField="subjectName" ShowHeader="false" />
                            <asp:BoundField DataField="periodFrom" ItemStyle-CssClass="grid-item-right" ShowHeader="false" />
                            <asp:BoundField DataField="periodTo" ItemStyle-CssClass="grid-item-right" ShowHeader="false" />
                            <asp:BoundField DataField="section" ItemStyle-CssClass="grid-item-right" ShowHeader="false" />
                        </Columns>
                        <EmptyDataTemplate>
                            <h6 class="text-warning">No schedule</h6>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

            <div class="card-header mt-2">
                <h5 class="red-text">Wednesday</h5>
            </div>

            <div class="card-body">
                <div class="table table-responsive">
                    <asp:GridView ID="gvScheduleWednesday" runat="server" AutoGenerateColumns="False" ShowHeader="false" CssClass="table table-hover border">
                        <Columns>
                            <asp:BoundField DataField="subjectName" ShowHeader="false" />
                            <asp:BoundField DataField="periodFrom" ItemStyle-CssClass="grid-item-right" ShowHeader="false" />
                            <asp:BoundField DataField="periodTo" ItemStyle-CssClass="grid-item-right" ShowHeader="false" />
                            <asp:BoundField DataField="section" ItemStyle-CssClass="grid-item-right" ShowHeader="false" />
                        </Columns>
                        <EmptyDataTemplate>
                            <h6 class="text-warning">No schedule</h6>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

            <div class="card-header mt-2">
                <h5 class="red-text">Thursday</h5>
            </div>

            <div class="card-body">
                <div class="table table-responsive">
                    <asp:GridView ID="gvScheduleThursday" runat="server" AutoGenerateColumns="False" ShowHeader="false" CssClass="table table-hover border">
                        <Columns>
                            <asp:BoundField DataField="subjectName" ShowHeader="false" />
                            <asp:BoundField DataField="periodFrom" ItemStyle-CssClass="grid-item-right" ShowHeader="false" />
                            <asp:BoundField DataField="periodTo" ItemStyle-CssClass="grid-item-right" ShowHeader="false" />
                            <asp:BoundField DataField="section" ItemStyle-CssClass="grid-item-right" ShowHeader="false" />
                        </Columns>
                        <EmptyDataTemplate>
                            <h6 class="text-warning">No schedule</h6>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

            <div class="card-header mt-2">
                <h5 class="red-text">Friday</h5>
            </div>

            <div class="card-body">
                <div class="table table-responsive">
                    <asp:GridView ID="gvScheduleFriday" runat="server" AutoGenerateColumns="False" ShowHeader="false" CssClass="table table-hover border">
                        <Columns>
                            <asp:BoundField DataField="subjectName" ShowHeader="false" />
                            <asp:BoundField DataField="periodFrom" ItemStyle-CssClass="grid-item-right" ShowHeader="false" />
                            <asp:BoundField DataField="periodTo" ItemStyle-CssClass="grid-item-right" ShowHeader="false" />
                            <asp:BoundField DataField="section" ItemStyle-CssClass="grid-item-right" ShowHeader="false" />
                        </Columns>
                        <EmptyDataTemplate>
                            <h6 class="text-warning">No schedule</h6>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

            <div class="card-header mt-2">
                <h5 class="red-text">Saturday</h5>
            </div>

            <div class="card-body">
                <div class="table table-responsive">
                    <asp:GridView ID="gvScheduleSaturday" runat="server" AutoGenerateColumns="False" ShowHeader="false" CssClass="table table-hover table-responsive border">
                        <Columns>
                            <asp:BoundField DataField="subjectName" ShowHeader="false" />
                            <asp:BoundField DataField="periodFrom" ItemStyle-CssClass="grid-item-right" ShowHeader="false" />
                            <asp:BoundField DataField="periodTo" ItemStyle-CssClass="grid-item-right" ShowHeader="false" />
                            <asp:BoundField DataField="section" ItemStyle-CssClass="grid-item-right" ShowHeader="false" />
                        </Columns>
                        <EmptyDataTemplate>
                            <h6 class="text-warning">No schedule</h6>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
