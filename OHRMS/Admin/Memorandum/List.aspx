<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="OHRMS.Admin.Memorandum.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <div class="row">
                            <div class="col">
                                <h4>Memorandum</h4>
                            </div>
                            <div class="col text-right justify-content-end">
                                <asp:Button ID="btnAdd" runat="server" Text="New Memorandum" OnClick="btnAdd_Click" CssClass="btn btn-blue" />
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 md-form">
                                <div id="printarea" class="table table-responsive">
                                    <asp:GridView ID="gvMemorandum" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvMemorandum_SelectedIndexChanged1" CssClass="table table-hover border">
                                        <Columns>
                                            <asp:BoundField DataField="memoNumber" HeaderText="Memo No" />
                                            <asp:BoundField DataField="deliverTo" HeaderText="To" />
                                            <asp:BoundField DataField="issuedFrom" HeaderText="From" />
                                            <asp:TemplateField HeaderText="Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAsOfDate" runat="server" Text='<%# Eval("asOfDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="subject" HeaderText="Subject" />
                                            <asp:BoundField DataField="message" HeaderText="Message" />
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                                    <asp:LinkButton ID="lbtnView" runat="server" CausesValidation="False" CommandName="Select" Text="View" CssClass="btn btn-blue"></asp:LinkButton>
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
    </div>
</asp:Content>
