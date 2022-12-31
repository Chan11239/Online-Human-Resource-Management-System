<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="RankList.aspx.cs" Inherits="OHRMS.Administrators.RankList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <div class="row">
                            <div class="col">
                                <h4>Rank</h4>
                            </div>
                            <div class="col text-right justify-content-end">
                                <asp:Button ID="btnAdd" runat="server" Text="New Rank" OnClick="btnAdd_Click" CssClass="btn btn-blue" />
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col md-form">
                                <div id="printarea" class="table table-responsive">
                                    <asp:GridView ID="gvRank" runat="server" AutoGenerateColumns="False" CssClass="table table-hover border">
                                        <Columns>
                                            <asp:BoundField DataField="classificationName" HeaderText="Classification" />
                                            <asp:BoundField DataField="startPoints" HeaderText="Start Points" />
                                            <asp:BoundField DataField="endPoint" HeaderText="End Points" />
                                             <asp:BoundField DataField="type" HeaderText="Type" />
                                            <asp:BoundField DataField="rankName" HeaderText="Rank" />
                                            <asp:BoundField DataField="salaryRate" HeaderText="Rate per Hour" ItemStyle-CssClass="text-right" HeaderStyle-CssClass="text-center"/>
                                            <asp:TemplateField ShowHeader="true" HeaderText="Actions" HeaderStyle-CssClass="font-weight-bold text-center" ItemStyle-CssClass="flex-center">
                                                <ItemTemplate>
                                                    <div class="justify-content-end text-right">
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
