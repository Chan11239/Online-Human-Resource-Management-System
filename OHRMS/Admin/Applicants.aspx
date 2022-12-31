<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Default.Master" AutoEventWireup="true" CodeBehind="Applicants.aspx.cs" Inherits="OHRMS.Admin.Applicants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">

        <div class="card-header">
            <div class="row">
                <div class="col-6">
                    <h3 class="text-primary">Applications</h3>
                </div>
            </div>
        </div>

        <div class="separator">&nbsp;</div>
        <div class="separator">&nbsp;</div>
        <h4 class="text-primary bg-light">New Applicants</h4>
        <asp:GridView ID="gvNewApplicants" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-responsive border-0">
            <Columns>
                <asp:BoundField DataField="fullName" HeaderText="Name" />
                <asp:BoundField DataField="appliedPosition" HeaderText="Position" />
                <asp:TemplateField HeaderText="CV / Resume">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkResume" runat="server" CommandArgument='<%#Eval("attachedResume")%>' OnCommand="lnkResume_Command" Text="View"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="For Procesing">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkProcess" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Approved"></asp:LinkButton>
                        <asp:LinkButton ID="lnkRejected" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Rejected"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <h5 class="text-warning">No New Applicant</h5>
            </EmptyDataTemplate>
        </asp:GridView>
        <div class="separator">&nbsp;</div>

        <h4 class="text-primary bg-light">In Progess</h4>
        <asp:GridView ID="gvInProgessApplicants" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvApplicants_RowDataBound" CssClass="table table-hover table-responsive border-0">
            <Columns>
                <asp:BoundField DataField="fullName" HeaderText="Name" />
                <asp:BoundField DataField="appliedPosition" HeaderText="Position" />
                <asp:TemplateField HeaderText="CV / Resume">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkResume" runat="server" CommandArgument='<%#Eval("attachedResume")%>' OnCommand="lnkResume_Command" Text="View"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Intial Interview">
                    <ItemTemplate>
                        <asp:Label ID="lblIntialInterview" runat="server" Text='<%# Eval("intialInterview") %>'></asp:Label>
                        <asp:LinkButton ID="lnkIIPassed" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Passed"></asp:LinkButton>
                        <asp:LinkButton ID="lnkIIFailed" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Failed"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Teaching Demo">
                    <ItemTemplate>
                        <asp:Label ID="lblTeachingDemo" runat="server" Text='<%# Eval("teachingDemo") %>'></asp:Label>
                        <asp:LinkButton ID="lnkTDPassed" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Passed"></asp:LinkButton>
                        <asp:LinkButton ID="lnkTDFailed" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Failed"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Examination">
                    <ItemTemplate>
                        <asp:Label ID="lblExamination" runat="server" Text='<%# Eval("examination") %>'></asp:Label>
                        <asp:LinkButton ID="lnkEPassed" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Passed"></asp:LinkButton>
                        <asp:LinkButton ID="lnkEFailed" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Failed"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Final Interview">
                    <ItemTemplate>
                        <asp:Label ID="lblFinalInterview" runat="server" Text='<%# Eval("finalInterview") %>'></asp:Label>
                        <asp:LinkButton ID="lnkFIPassed" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Passed"></asp:LinkButton>
                        <asp:LinkButton ID="lnkFIFailed" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Failed"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <h5 class="text-warning">No Applicant For Processing</h5>
            </EmptyDataTemplate>
        </asp:GridView>
        <div class="separator">&nbsp;</div>

        <h4 class="text-primary bg-light">Hired Applicants</h4>
        <asp:GridView ID="gvHiredApplicants" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-responsive border-0">
            <Columns>
                <asp:BoundField DataField="fullName" HeaderText="Name" />
                <asp:BoundField DataField="appliedPosition" HeaderText="Position" />
                <asp:BoundField DataField="hiredDate" HeaderText="Date Hired" />
                <asp:TemplateField HeaderText="CV / Resume">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkResume" runat="server" CommandArgument='<%#Eval("attachedResume")%>' OnCommand="lnkResume_Command" Text="View"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <h5 class="text-warning">No Newly Hired Applicant</h5>
            </EmptyDataTemplate>
        </asp:GridView>
        <div class="separator"></div>

        <h4 class="text-primary bg-light">Rejected Applicants</h4>
        <asp:GridView ID="gvRejectedApplicants" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-responsive border-0">
            <Columns>
                <asp:BoundField DataField="fullName" HeaderText="Name" />
                <asp:BoundField DataField="appliedPosition" HeaderText="Position" />
                <asp:TemplateField HeaderText="CV / Resume">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkResume" runat="server" CommandArgument='<%#Eval("attachedResume")%>' OnCommand="lnkResume_Command" Text="View"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="intialInterview" HeaderText="Intial Interview" />
                <asp:BoundField DataField="teachingDemo" HeaderText="Teaching Demo" />
                <asp:BoundField DataField="examination" HeaderText="Examination" />
                <asp:BoundField DataField="finalInterview" HeaderText="Final Interview" />
            </Columns>
            <EmptyDataTemplate>
                <h5 class="text-warning">No Rejected Applicant</h5>
            </EmptyDataTemplate>
        </asp:GridView>
    </div>
</asp:Content>
