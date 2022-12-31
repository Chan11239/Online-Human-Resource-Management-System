<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Employee.Master" AutoEventWireup="true" CodeBehind="MemorandumList.aspx.cs" Inherits="OHRMS.Employees.MemorandumList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>Memorandum History</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col table table-responsive">
                                <asp:GridView ID="gvMemorandum" runat="server" AutoGenerateColumns="False" CssClass="table table-hover border">
                                    <Columns>
                                        <asp:BoundField DataField="memoNumber" HeaderText="Memo No." />
                                        <asp:BoundField DataField="subject" HeaderText="Title" />
                                        <asp:BoundField DataField="message" HeaderText="Message" />
                                        <asp:BoundField DataField="issuedFrom" HeaderText="Issuer" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <h6 class="text-warning">No Memorandum found.</h6>
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
