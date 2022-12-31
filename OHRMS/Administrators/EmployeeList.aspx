<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="EmployeeList.aspx.cs" Inherits="OHRMS.Administrators.EmployeeList" %>

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
                                        <asp:GridView ID="gvEmployeeRecords" runat="server" HorizontalAlign="Center" AutoGenerateColumns="false" CellPadding="6" OnRowCommand="gvEmployeeRecords_RowCommand" CssClass="table table-hover">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Picture">
                                                    <ItemTemplate>
                                                        <asp:Image ID="img_pic" runat="server" Width="100px" Height="100px" ImageUrl='<%#Eval("picture") %>' class="img-thumbnail" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="employeeNo" HeaderText="Employee ID" />
                                                <asp:BoundField DataField="fullName" HeaderText="Employee Name" />
                                                <asp:BoundField DataField="department" HeaderText="Department" />
                                                <asp:BoundField DataField="position" HeaderText="Position" />
                                                <asp:TemplateField HeaderText="View Information">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="linkbtnView" Text="View" runat="server" CommandArgument='<%#Eval("employeeNo") %>' CssClass="btn btn-blue"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
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
                </div>
            </div>
        </div>
    </div>

</asp:Content>
