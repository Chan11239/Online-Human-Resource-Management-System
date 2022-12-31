﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="PositionList.aspx.cs" Inherits="OHRMS.Administrators.PositionList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <div class="row">
                            <div class="col">
                                <h4>Positions</h4>
                            </div>
                            <div class="col text-right justify-content-end">
                                <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="New Position" CssClass="btn btn-blue" />
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col md-form">
                                <div id="printarea" class="table table-responsive">
                                    <asp:GridView ID="gvPosition" runat="server" AutoGenerateColumns="False" CssClass="table table-hover border">
                                        <Columns>
                                            <asp:BoundField DataField="positionName" HeaderText="Position" />
                                            <asp:BoundField DataField="departmentName" HeaderText="Department" />
                                            <asp:TemplateField ShowHeader="true" HeaderText="Actions" HeaderStyle-CssClass="text-center font-weight-bold">
                                                <ItemTemplate>
                                                    <div class="justify-content-end text-center">
                                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkDelete_Command" Text="Delete" CssClass="btn btn-red btn-sm"></asp:LinkButton>
                                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkEdit_Command" Text="Edit" CssClass="btn btn-blue btn-sm"></asp:LinkButton>
                                                        </div>
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
                    <div class="card-footer justify-content-center text-center">
                        <asp:Button ID="btnPrint" runat="server" OnClientClick="window.print();" Text="Print" CssClass="btn btn-blue btn-lg" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
