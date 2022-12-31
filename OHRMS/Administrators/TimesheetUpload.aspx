<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="TimesheetUpload.aspx.cs" Inherits="OHRMS.Administrators.TimesheetUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>Upload Timesheet Template</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col table table-responsive">
                                <asp:UpdatePanel runat="server" ID="UpdatePanel" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:GridView ID="gvTimeSheet" runat="server" AutoGenerateColumns="False" CssClass="table table-hover border">
                                            <Columns>
                                                <asp:BoundField DataField="employeeNumber" HeaderText="Employee No" />
                                                <asp:BoundField DataField="employeeName" HeaderText="Employee Name" />
                                                <asp:BoundField DataField="recordDateRange" HeaderText="Recorded Date Range" />
                                                <asp:BoundField DataField="originalFileName" HeaderText="Origin Excel" />
                                                <asp:BoundField DataField="uploadedDate" HeaderText="Uploaded Date" />
                                                <asp:BoundField DataField="batchIdDisplay" HeaderText="Batch No." />
                                                <asp:TemplateField ShowHeader="false">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkTimesheet" runat="server" CommandArgument='<%#Eval("batchId")%>' OnCommand="lnkTimesheet_Command" Text="View" CssClass="btn btn-blue"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <h6 class="text-warning">No Upload TimeSheet.</h6>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="card-title">Select a file to upload Employee TimeSheet</div>

                            <div class="file-path-wrapper">
                                <asp:FileUpload ID="fuTimeSheet" runat="server" CssClass="file-path validate"></asp:FileUpload></div>
                        </div>
                    </div>
                    <div class="card-footer justify-content-center text-center">
                        <asp:Button ID="btnSubmitTimeSheet" Text="Upload Employee TimeSheet" OnClick="btnSubmitTimeSheet_Click" runat="server" CssClass="btn btn-blue btn-lg"></asp:Button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
