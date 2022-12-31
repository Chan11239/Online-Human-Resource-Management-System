<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="NotificationList.aspx.cs" Inherits="OHRMS.Administrators.NotifiacationList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <div class="row">
                            <div class="col">
                                <h4>Notifications</h4>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col md-form table table-responsive">
                                <asp:GridView ID="gvNotification" runat="server" AutoGenerateColumns="false" CssClass="table table-hover border" OnRowCommand="gvNotification_RowCommand">
                                    <Columns>
                                        <asp:BoundField DataField="fullName" HeaderText="From" />
                                        <asp:BoundField DataField="message" HeaderText="Message" />
                                        <asp:BoundField DataField="dateTime" HeaderText="Sent" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkView" runat="server" Text="View" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-blue"></asp:LinkButton>
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
            </div>
        </div>
    </div>

</asp:Content>
