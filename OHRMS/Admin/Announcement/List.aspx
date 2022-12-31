<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="OHRMS.Admin.Announcement.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <div class="row">
                            <div class="col">
                                <h4>Announcement</h4>
                            </div>
                            <div class="col text-right justify-content-end">
                                <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="New Announcement" CssClass="btn btn-blue" />
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 md-form">
                                <div id="printarea" class="table table-responsive">
                                    <asp:GridView ID="gvAnnouncement" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvAnnouncement_SelectedIndexChanged1" CssClass="table table-hover border">
                                        <Columns>
                                            <asp:BoundField DataField="title" HeaderText="Title" />
                                            <asp:BoundField DataField="message" HeaderText="Description" />
                                            <asp:TemplateField HeaderText="Start Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStartDate" runat="server" Text='<%# Eval("startDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="End Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEndDate" runat="server" Text='<%# Eval("endDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                                    <asp:LinkButton ID="lbtnView" runat="server" CausesValidation="False" CommandName="Select" Text="View" CssClass="btn btn-blue"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EmptyDataTemplate><h6 class="text-warning">No record(s) found.</h6></EmptyDataTemplate>
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
