<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="ApplicantList.aspx.cs" Inherits="OHRMS.Administrators.ApplicantList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">
    <cc1:ModalPopupExtender ID="mpeAppointmentSchedule" runat="server" PopupControlID="pnlAppointmentSchedule" TargetControlID="btnPopupStart" CancelControlID="btnClose" BackgroundCssClass="Background">
    </cc1:ModalPopupExtender>

    <div class="container my-3 clearfix">
        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col">
                        <h5>Applicant Status</h5>
                    </div>
                    <div class="col">
                        <asp:Button ID="btnPopupStart" runat="server" Text="Fill Form in Popup" Style="display: none" />
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="card-title">New Applicants</div>
                <div class="col table table-responsive">
                    <asp:GridView ID="gvNewApplicants" runat="server" AutoGenerateColumns="False" CssClass="table table-hover border">
                        <Columns>
                            <asp:BoundField DataField="fullName" HeaderText="Name" ItemStyle-CssClass="col-md-2 col-sm-2" />
                            <asp:BoundField DataField="appliedPosition" HeaderText="Position" ItemStyle-CssClass="col-md-2 col-sm-2" />
                            <asp:TemplateField HeaderText="CV / Resume" ItemStyle-CssClass="col-md-1 col-sm-1">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkResume" runat="server" CommandArgument='<%#Eval("attachedResume")%>' OnCommand="lnkResume_Command" Text="View" CssClass="blue-text"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="For Procesing">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkProcess" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Approved" CssClass="btn btn-blue btn-sm"></asp:LinkButton>
                                    <asp:LinkButton ID="lnkRejected" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Rejected" CssClass="btn btn-red btn-sm"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <h6 class="text-warning">No New Applicant.</h6>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

            <div class="card-body">
                <div class="card-title">Teaching - In Progess</div>
                <div class="col table table-responsive">
                    <asp:GridView ID="gvInProgessApplicants" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvApplicants_RowDataBound" CssClass="table table-hover border">
                        <Columns>
                            <asp:BoundField DataField="fullName" HeaderText="Name" ItemStyle-CssClass="col-md-2 col-sm-2" />
                            <asp:BoundField DataField="appliedPosition" HeaderText="Position" ItemStyle-CssClass="col-md-2 col-sm-2" />
                            <asp:TemplateField HeaderText="CV / Resume" ItemStyle-CssClass="col-md-1 col-sm-1">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkResume" runat="server" CommandArgument='<%#Eval("attachedResume")%>' OnCommand="lnkResume_Command" Text="View" CssClass="blue-text"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Intial Interview">
                                <ItemTemplate>
                                    <asp:Label ID="lblIntialInterview" runat="server" Text='<%# Eval("intialInterview") %>'></asp:Label>
                                    <asp:LinkButton ID="lnkIIPassed" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Passed" CssClass="btn btn-blue btn-sm"></asp:LinkButton>
                                    <asp:LinkButton ID="lnkIIFailed" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Failed" CssClass="btn btn-red btn-sm"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Teaching Demo">
                                <ItemTemplate>
                                    <asp:Label ID="lblTeachingDemo" runat="server" Text='<%# Eval("teachingDemo") %>'></asp:Label>
                                    <asp:LinkButton ID="lnkTDPassed" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Passed" CssClass="btn btn-blue btn-sm"></asp:LinkButton>
                                    <asp:LinkButton ID="lnkTDFailed" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Failed" CssClass="btn btn-red btn-sm"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Examination">
                                <ItemTemplate>
                                    <asp:Label ID="lblExamination" runat="server" Text='<%# Eval("examination") %>'></asp:Label>
                                    <asp:LinkButton ID="lnkEPassed" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Passed" CssClass="btn btn-blue btn-sm"></asp:LinkButton>
                                    <asp:LinkButton ID="lnkEFailed" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Failed" CssClass="btn btn-red btn-sm"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Final Interview">
                                <ItemTemplate>
                                    <asp:Label ID="lblFinalInterview" runat="server" Text='<%# Eval("finalInterview") %>'></asp:Label>
                                    <asp:LinkButton ID="lnkFIPassed" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Passed" CssClass="btn btn-blue btn-sm"></asp:LinkButton>
                                    <asp:LinkButton ID="lnkFIFailed" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Failed" CssClass="btn btn-red btn-sm"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <h6 class="text-warning">No Applicant For Processing.</h6>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

            <div class="card-body">
                <div class="card-title">Non-Teaching - In Progess</div>
                <div class="col table table-responsive">
                    <asp:GridView ID="gvNonTeachingInProgress" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvApplicantNonTeaching_RowDataBound" CssClass="table table-hover border">
                        <Columns>
                            <asp:BoundField DataField="fullName" HeaderText="Name" ItemStyle-CssClass="col-md-2 col-sm-2" />
                            <asp:BoundField DataField="appliedPosition" HeaderText="Position" ItemStyle-CssClass="col-md-2 col-sm-2" />
                            <asp:TemplateField HeaderText="CV / Resume" ItemStyle-CssClass="col-md-1 col-sm-1">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkResume" runat="server" CommandArgument='<%#Eval("attachedResume")%>' OnCommand="lnkResume_Command" Text="View" CssClass="blue-text"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Intial Interview">
                                <ItemTemplate>
                                    <asp:Label ID="lblIntialInterview" runat="server" Text='<%# Eval("intialInterview") %>'></asp:Label>
                                    <asp:LinkButton ID="lnkIIPassed" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Passed" CssClass="btn btn-blue btn-sm"></asp:LinkButton>
                                    <asp:LinkButton ID="lnkIIFailed" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Failed" CssClass="btn btn-red btn-sm"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Examination">
                                <ItemTemplate>
                                    <asp:Label ID="lblExamination" runat="server" Text='<%# Eval("examination") %>'></asp:Label>
                                    <asp:LinkButton ID="lnkEPassed" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Passed" CssClass="btn btn-blue btn-sm"></asp:LinkButton>
                                    <asp:LinkButton ID="lnkEFailed" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Failed" CssClass="btn btn-red btn-sm"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Final Interview">
                                <ItemTemplate>
                                    <asp:Label ID="lblFinalInterview" runat="server" Text='<%# Eval("finalInterview") %>'></asp:Label>
                                    <asp:LinkButton ID="lnkFIPassed" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Passed" CssClass="btn btn-blue btn-sm"></asp:LinkButton>
                                    <asp:LinkButton ID="lnkFIFailed" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkProcesing_Command" Text="Failed" CssClass="btn btn-red btn-sm"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <h6 class="text-warning">No Applicant For Processing.</h6>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

            <div class="card-body">
                <div class="card-title">New Hires</div>
                <div class="col table table-responsive">
                    <asp:GridView ID="gvHiredApplicants" runat="server" AutoGenerateColumns="False" CssClass="table table-hover border">
                        <Columns>
                            <asp:BoundField DataField="fullName" HeaderText="Name" ItemStyle-CssClass="col-md-2 col-sm-2" />
                            <asp:BoundField DataField="appliedPosition" HeaderText="Position" ItemStyle-CssClass="col-md-2 col-sm-2" />
                            <asp:TemplateField HeaderText="CV / Resume" ItemStyle-CssClass="col-md-1 col-sm-1">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkResume" runat="server" CommandArgument='<%#Eval("attachedResume")%>' OnCommand="lnkResume_Command" Text="View" CssClass="blue-text"></asp:LinkButton></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status" ItemStyle-CssClass="col-md-1 col-sm-1">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkHired" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkHired_Command" Text="Hired" CssClass="blue-text"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="hiredDate" HeaderText="Hired Date" />
                        </Columns>
                        <EmptyDataTemplate>
                            <h6 class="text-warning">No Newly Hired Applicant.</h6>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
            <div class="card-body">
                <div class="card-title">Rejected Applicants</div>
                <div class="col table table-responsive">
                    <asp:GridView ID="gvRejectedApplicants" runat="server" AutoGenerateColumns="False" CssClass="table table-hover border">
                        <Columns>
                            <asp:BoundField DataField="fullName" HeaderText="Name" ItemStyle-CssClass="col-md-2 col-sm-2" />
                            <asp:BoundField DataField="appliedPosition" HeaderText="Position" ItemStyle-CssClass="col-md-2 col-sm-2" />
                            <asp:TemplateField HeaderText="CV / Resume" ItemStyle-CssClass="col-md-1 col-sm-1">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkResume" runat="server" CommandArgument='<%#Eval("attachedResume")%>' OnCommand="lnkResume_Command" Text="View" CssClass="blue-text"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="rejectedDate" HeaderText="Rejected Date" />
                        </Columns>
                        <EmptyDataTemplate>
                            <h6 class="text-warning">No Rejected Applicant.</h6>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    <%--Popup For Appointment Schedule--%>
    <asp:Panel ID="pnlAppointmentSchedule" runat="server" Style="display: none">
        <div class="card">
            <div class="card-header">
                <h4>Appointment Schedule</h4>
            </div>

            <div class="card-body">
                <div class="col">
                    <div class="md-form">
                        <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" type="date"></asp:TextBox>
                        <label for="txtDate" class="active">Date</label>
                    </div>

                    <div class="md-form">
                        <asp:TextBox ID="txtTime" runat="server" CssClass="form-control" type="time"></asp:TextBox>
                        <label for="txtTime" class="active">Time</label>
                    </div>
                    <div class="md-form">
                        <asp:TextBox ID="txtPlace" runat="server" TextMode="MultiLine" CssClass="form-control md-textarea"></asp:TextBox>
                        <label for="txtPlace" class="active">Place</label>
                    </div>
                </div>
            </div>
            <div class="card-footer justify-content-center text-center">
                <asp:Button ID="btnSubmitAppointment" runat="server" CssClass="btn btn-blue" Text="Submit" OnClick="btnSubmitAppointment_Click" />
                <asp:Button ID="btnClose" runat="server" CssClass="btn btn-primary" Text="Cancel" />
            </div>
        </div>
    </asp:Panel>


        <asp:HiddenField ID="hidApplicantId" runat="server" />
        <asp:HiddenField ID="hidStatus" runat="server" />
        <asp:HiddenField ID="hidFieldName" runat="server" />
        <asp:HiddenField ID="hidFieldValue" runat="server" />
        <asp:HiddenField ID="hidFieldPrefix" runat="server" />
    <%--</asp:Panel>--%>

</asp:Content>
