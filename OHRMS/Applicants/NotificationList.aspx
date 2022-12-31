<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Applicant.Master" AutoEventWireup="true" CodeBehind="NotificationList.aspx.cs" Inherits="OHRMS.Applicants.NotificationList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="container bg-white shadow mt-3 col-12 mb-5 p-3">
        <div class="row">
            <div class="card-header">
                <div class="row">
                    <div class="col-12">
                        <h3 class="display-5 text-primary">Notification</h3>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <asp:GridView ID="gvNotification" runat="server" AutoGenerateColumns="false" CssClass="table table-hover table-responsive border" OnRowCommand="gvNotification_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="fullName" HeaderText="From" />
                            <asp:BoundField DataField="message" HeaderText="Message" />
                            <asp:TemplateField HeaderText="Sent">
                                <ItemTemplate>
                                    <asp:Label ID="lblDate" runat="server" Text='<%# Eval("dateTime","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkView" runat="server" Text="View" CommandArgument='<%# Eval("id") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <h6 class="text-warning">No Notification Yet</h6>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
