<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="ArchivedJobPostings.aspx.cs" Inherits="OHRMS.Administrators.ArchivedJobPostings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>Archived Job Postings</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col"></div>
                            <div class="col justify-content-end text-right">
                                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search" aria-label="Seach" aria-describedby="btnSearch"></asp:TextBox>
                                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-blue" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="table table-responsive">
                                <asp:GridView ID="gvPostedJobs" runat="server" AutoGenerateColumns="false" CssClass="table table-hover border" OnSelectedIndexChanged="gvPostedJobs_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField DataField="title" HeaderText="Title" />
                                        <asp:BoundField DataField="classification" HeaderText="Classification" />
                                        <asp:BoundField DataField="jobType" HeaderText="Type" />
                                        <asp:BoundField DataField="educationalQualification" HeaderText="Education Qualification" />
                                        <asp:BoundField DataField="yearExperience" HeaderText="Years of Experience" />
                                        <asp:TemplateField HeaderText="Date Ended">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDate" runat="server" Text='<%# Eval("postDuration","{0:dd/MMM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="true" HeaderText="Actions" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                                <asp:LinkButton ID="lbtnView" runat="server" CausesValidation="False" CommandName="Select" Text="View" CssClass="btn btn-blue btn-sm"></asp:LinkButton>
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

</asp:Content>
