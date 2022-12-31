<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="COEList.aspx.cs" Inherits="OHRMS.Administrators.COEList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>Submitted COE Request Forms</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col"></div>
                            <div class="col justify-content-end text-right">
                                <asp:TextBox ID="txtSearch" runat="server" PlaceHolder="Search for resignation..." CssClass="form-control"></asp:TextBox>
                                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" CssClass="btn btn-blue" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="table table-responsive">
                                <asp:GridView ID="gvRequestCOE" runat="server" AutoGenerateColumns="false" CssClass="table table-hover border">
                                    <Columns>
                                        <asp:BoundField DataField="employeeNo" HeaderText="Employee No." />
                                        <asp:BoundField DataField="employeeName" HeaderText="Employee Name" />
                                        <asp:BoundField DataField="purpose" HeaderText="Reason for" />
                                        <asp:BoundField DataField="prescribeAquireDate" HeaderText="Date Needed" />
                                        <asp:BoundField DataField="status" HeaderText="Status" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkView_Command" Text="View" CssClass="btn btn-blue"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
</asp:Content>
