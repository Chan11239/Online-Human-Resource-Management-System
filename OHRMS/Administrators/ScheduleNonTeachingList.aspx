<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="ScheduleNonTeachingList.aspx.cs" Inherits="OHRMS.Administrators.ScheduleNonTeachingList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <div class="row">
                            <div class="col">
                                <h4>Non-Teaching Schedule</h4>
                            </div>
                            <div class="col text-right justify-content-end">
                                <asp:Button ID="btnAdd" runat="server" Text="Create New Schedule" OnClick="btnAdd_Click" CssClass="btn btn-blue" />
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 md-form">
                                <div id="printarea" class="table table-responsive">
                                    <asp:GridView ID="gvSchedule" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvSchedule_SelectedIndexChanged" CssClass="table table-hover border">
                                        <Columns>
                                            <asp:BoundField DataField="employeeNumber" HeaderText="Employee No" />
                                            <asp:BoundField DataField="fullName" HeaderText="Employee Name" />
                                            <asp:BoundField DataField="dayOfWeekName" HeaderText="Day" />
                                            <asp:BoundField DataField="periodFrom" HeaderText="From" />
                                            <asp:BoundField DataField="periodTo" HeaderText="To" />
                                            <%--<asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                                    <asp:LinkButton ID="lbtnView" runat="server" CausesValidation="False" CommandName="Select" Text="Edit" CssClass="btn btn-blue"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                        </Columns>
                                        <EmptyDataTemplate>
                                            <h6 class="text-warning">No record(s) found.</h6>
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
