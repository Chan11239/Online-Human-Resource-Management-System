<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Employee.Master" AutoEventWireup="true" CodeBehind="ScheduleForm.aspx.cs" Inherits="OHRMS.Employees.ScheduleForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>Schedules</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col table table-responsive">
                                <asp:UpdatePanel runat="server" ID="UpdatePanel">
                                    <ContentTemplate>
                                        <asp:GridView ID="gvSummaryScheduleUpload" runat="server" AutoGenerateColumns="False" CssClass="table table-hover border">
                                            <Columns>
                                                <asp:BoundField DataField="schoolYear" HeaderText="Yr." />
                                                <asp:BoundField DataField="semisterBatch" HeaderText="Batch" />
                                                <asp:BoundField DataField="semisterStartDate" HeaderText="Start Date" />
                                                <asp:BoundField DataField="originalFileName" HeaderText="Original File" />
                                                <asp:BoundField DataField="uploadFileNameMin" HeaderText="System File" />
                                                <asp:TemplateField ShowHeader="false">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkSchedule" runat="server" CommandArgument='<%#Eval("uploadFileName")%>' OnCommand="lnkSchedule_Command" Text="View"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <h6 class="text-warning">No schedule uploaded</h6>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="md-form input-group mb-3">
                                    <asp:TextBox ID="txtSchoolYear" runat="server" TextMode="Number" CssClass="form-control md-form" type="number"></asp:TextBox>
                                    <label class="mb-0 ml-2" for="txtSchoolYear">School Year</label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="md-form input-group mb-3">
                                    <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" CssClass="form-control md-form" type="date"></asp:TextBox>
                                    <label class="mb-0 ml-2" for="txtStartDate">Start Date</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="md-form form-group">
                                    <label for="ddlSemester" class="active">Semester</label>
                                    <asp:DropDownList ID="ddlSemester" runat="server" CssClass="mdb-select">
                                        <asp:ListItem Value="-" Text=" --- select ---"></asp:ListItem>
                                        <asp:ListItem Value="FIRST" Text="FIRST"></asp:ListItem>
                                        <asp:ListItem Value="SECOND" Text="SECOND"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col">
                                <div class="md-form">
                                    <div class="file-field">
                                        <div class="btn btn-blue btn-sm float-left">
                                            <span>Choose file</span>
                                            <input type="file">
                                        </div>
                                        <div class="file-path-wrapper">
                                            <asp:FileUpload ID="fuSchedule" runat="server" accept=".xls, .xlsx" class="file-path validate"></asp:FileUpload><span class="small text-start text-danger">Click "Choose File" to upload your schedule template.</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer justify-content-center text-center">
                            <asp:Button ID="btnSubmitSchedule" Text="Upload Schedule" OnClick="btnSubmitSchedule_Click" runat="server" CssClass="btn btn-blue btn-lg"></asp:Button>
                        </div>
                </div>
            </div>
        </div>
    </div>















<%--
    <div class="container bg-white shadow mt-5 col-12 mb-5 p-5">
        <div class="row">
            <div class="card-header">
                <div class="row">
                    <div class="col-12">
                        <h3 class="display-5 text-primary">Schedules<span class="text-danger lead muted align-top">New</span></h3>
                    </div>--%>
                    <%--                    <div class="col-6 text-end mt-3">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Post Job" OnClick="btnSubmit_Click" />
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-6 shadow p-3">
                        
                    </div>

                    <div class="col-6 shadow p-5">
                        <div class="mb-3 row">
                            <h5 class="text-primary">Select a file to upload Employee Schedule</h5>
                        </div>

                        <div class="mb-3 row">
                            <label for="txtSchoolYear" class="col-4 col-form-label">School Year</label>
                            <div class="col-8">
                                
                            </div>
                        </div>

                        <div class="mb-3 row">
                            
                        </div>

                        <div class="mb-3 row">
                            <label for="txtStartDate" class="col-4 col-form-label">Start Date</label>
                            <div class="col-8">
                                
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <div class="input-group row">
                                <span class="small text-start text-danger">Click "Choose File" to upload your schedule template.</span>
                                
                            </div>
                        </div>

                        <div class="mb-3 row">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>

        <script>
            jQuery('#btnSearch').click(function () {
                console.log('tests');
            });

        </script>
</asp:Content>

