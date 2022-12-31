<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="EmployeeLeaveCreditForm.aspx.cs" Inherits="OHRMS.Administrators.EmployeeLeaveCreditForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>Employee Leave Credits</h4>
                    </div>
                    <div class="card-body">
                        <div class="card-title mb-3">
                            <h5 class="blue-text">Employment Information</h5>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="row">
                                    <div class="col">
                                        <label for="txtEmployeeNo">Employee No</label>
                                    </div>
                                    <div class="col">
                                        <asp:TextBox ID="txtEmployeeNo" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <asp:LinkButton ID="iconSearch" runat="server" Text="Search" CssClass="" OnClick="btnSearch_Click"><i class="fas fa-search"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col">
                                <label class="">Firstname</label>
                            </div>
                            <div class="col">
                                <asp:Label ID="txtFirstName" runat="server" CssClass="font-weight-bold"></asp:Label>
                            </div>
                            <div class="col">
                                <label class="">Middlename</label>
                            </div>
                            <div class="col">
                                <asp:Label ID="txtMiddleName" runat="server" CssClass="font-weight-bold"></asp:Label>
                            </div>
                            <div class="col">
                                <label class="">Lastname</label>
                            </div>
                            <div class="col">
                                <asp:Label ID="txtLastName" runat="server" Text="-" CssClass="font-weight-bold"></asp:Label>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col">
                                <label class="">Position</label>
                            </div>
                            <div class="col">
                                <asp:Label ID="txtPosition" runat="server" CssClass="font-weight-bold"></asp:Label>
                            </div>
                            <div class="col">
                                <label class="">Department</label>
                            </div>
                            <div class="col">
                                <asp:Label ID="txtDepartment" runat="server" CssClass="font-weight-bold"></asp:Label>
                            </div>
                        </div>
                        <hr />

                        <div class="card-header mt-3">
                            <h5>Leave Allotment Information</h5>
                        </div>

                        <div id="divUpdateEmployee" runat="server" class="row">
                            <div class="col table table-responsive">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="gvEmployeeLeaveCredit" runat="server" HorizontalAlign="Center" AutoGenerateColumns="false" CellPadding="6" OnRowCommand="gvEmployeeLeaveCredit_RowCommand" CssClass="table table-hover border">
                                            <Columns>
                                                <asp:BoundField DataField="leaveTypeCode" HeaderText="Type" />
                                                <asp:BoundField DataField="leaveTypeName" HeaderText="Leave Name" />
                                                <asp:BoundField DataField="maximumAllottedDays" HeaderText="Maximum Days" />
                                                <asp:TemplateField HeaderText="Aquired Credits">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEmployeeLeaveCreditId" runat="server" Text='<%#Eval("EmployeeLeaveCreditId") %>' Visible="false"></asp:Label>
                                                        <asp:TextBox ID="txtAquiredCredits" runat="server" Text='<%#Eval("aquiredCredits") %>' CssClass="textbox-EmpMaintenance form-control"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="usedCredits" HeaderText="Used Credits" />
                                                <asp:BoundField DataField="remainingCredits" HeaderText="Remaining Credits" />
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <h6 class="text-warning">No record found</h6>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer justify-content-center text-center">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-blue btn-lg" OnClick="btnSubmit_Click" />
                        <asp:HiddenField ID="hidEmployeeNo" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
