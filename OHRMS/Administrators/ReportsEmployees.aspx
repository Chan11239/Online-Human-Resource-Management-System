<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="ReportsEmployees.aspx.cs" Inherits="OHRMS.Administrators.ReportsEmployees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>Employee Records</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col"></div>
                            <div class="col justify-content-end text-right">
                                <asp:TextBox ID="txtSearch" runat="server" PlaceHolder="Search for Employee..." CssClass="form-control"></asp:TextBox>
                                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" CssClass="btn btn-blue" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="table table-responsive">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="gvEmployeeRecords" runat="server" HorizontalAlign="Center" AutoGenerateColumns="false" CellPadding="6" CssClass="table table-hover">
                                            <Columns>
                                                <asp:BoundField DataField="employeeNo" HeaderText="Employee ID" />
                                                <asp:BoundField DataField="fullName" HeaderText="Employee Name" />
                                                <asp:BoundField DataField="department" HeaderText="Department" />
                                                <asp:BoundField DataField="position" HeaderText="Position" />
                                                <asp:BoundField DataField="classification" HeaderText="Classification" />
                                                <asp:BoundField DataField="rankEmployee" HeaderText="Rank" />
                                                <asp:BoundField DataField="salaryRate" HeaderText="Salary Rate" />
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <h6 class="text-warning">No record found</h6>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="card-footer justify-content-center text-center">
                            <asp:Button ID="btnPrint" runat="server" OnClientClick="window.print();" Text="Print" CssClass="btn btn-blue btn-lg" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
