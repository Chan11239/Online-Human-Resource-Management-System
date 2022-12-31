<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Employee.Master" AutoEventWireup="true" CodeBehind="ToDoList.aspx.cs" Inherits="OHRMS.Employees.ToDoList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>To Do History</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col table table-responsive">
                                <asp:GridView ID="gvToDo" runat="server" AutoGenerateColumns="False" CssClass="table table-hover border">
                                    <Columns>
                                        <asp:BoundField DataField="title" HeaderText="Title" />
                                        <asp:BoundField DataField="message" HeaderText="Message" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <h6 class="text-warning">No To dos found.</h6>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer justify-content-center text-center">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
