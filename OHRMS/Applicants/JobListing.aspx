<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Applicant.Master" AutoEventWireup="true" CodeBehind="JobListing.aspx.cs" Inherits="OHRMS.Applicants.JobListing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>Available Jobs</h4>
                    </div>
                    <div class="card-body">
                        <div class="row mb-3">
                            <div class="col md-form table table-responsive text-truncate">
                                <asp:GridView ID="gvPostedJobs" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvPostedJobs_SelectedIndexChanged" CssClass="table table-hover border">
                                    <Columns>
                                        <asp:BoundField DataField="title" HeaderText="Position" ItemStyle-CssClass="text-center" />
                                        <asp:BoundField DataField="classification" HeaderText="Classification" ItemStyle-CssClass="text-center" />
                                        <asp:BoundField DataField="department" HeaderText="Department" ItemStyle-CssClass="text-justify" />
                                        <asp:BoundField DataField="jobType" HeaderText="Job Type" ItemStyle-CssClass="text-center" />
                                        <asp:BoundField DataField="educationalQualification" HeaderText="Qualification" ItemStyle-CssClass="text-justify" />
                                        <asp:BoundField DataField="yearExperience" HeaderText="Years of Experience" ItemStyle-CssClass="text-center" />
                                        <asp:TemplateField ShowHeader="true" HeaderText="Action" HeaderStyle-CssClass="text-center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                                <div class="col justify-content-center text-center">
                                                <asp:LinkButton ID="lbtnView" runat="server" CausesValidation="False" CommandName="Select" Text="Apply" CssClass="btn btn-blue btn-sm"></asp:LinkButton>
                                                    </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <h6 class="text-warning">No job(s) available.</h6>
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
