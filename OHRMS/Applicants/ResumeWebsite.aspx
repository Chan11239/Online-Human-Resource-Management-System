<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Applicant.Master" AutoEventWireup="true" CodeBehind="ResumeWebsite.aspx.cs" Inherits="OHRMS.Applicants.ResumeWebsite" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <cc1:ModalPopupExtender ID="mpeWorkExperience" runat="server" PopupControlID="pnlWorkExperience" TargetControlID="btnPopupStartWork" CancelControlID="btnCloseWork" BackgroundCssClass="Background">
    </cc1:ModalPopupExtender>
    <div class="container my-3">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h5 class="blue-text">Create Resume</h5>
                    </div>
                    <div class="card-body">
                        <div class="card-title bg-light p-2">
                            <h5 class="blue-text">Contact Details</h5>
                        </div>

                        <div class="row mb-3">
                            <div class="col-lg-6">
                                <label>Lastname</label>
                                <%--</div>
                            <div class="col">--%>
                                <asp:TextBox ID="txtLastName" runat="server" TabIndex="10" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-lg-6">
                                <label>Firstname</label>
                                <%--</div>
                            <div class="col">--%>
                                <asp:TextBox ID="txtFirstName" runat="server" TabIndex="11" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-lg-6">
                                <label>Middlename</label>
                                <%--</div>
                            <div class="col">--%>
                                <asp:TextBox ID="txtMiddlename" runat="server" TabIndex="12" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-lg-6">
                                <label>Contact Number</label>
                                <%--</div>
                            <div class="col">--%>
                                <asp:TextBox ID="txtContactNumber" runat="server" TabIndex="12" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-lg-6">
                                <label>Email Address</label>
                                <%--</div>
                            <div class="col">--%>
                                <asp:TextBox ID="txtEmailAddress" runat="server" TabIndex="12" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-lg-6">
                                <label>Address</label>
                                <%--</div>
                            <div class="col">--%>
                                <asp:TextBox ID="txtAddress" runat="server" TabIndex="12" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>


                    <div class="card-body">
                        <div class="card-title bg-light p-2">
                            <h5 class="blue-text">Work Experience</h5>
                        </div>

                        <div class="row mb-3">
                            <div class="col">
                                <asp:GridView ID="gvWorkExperience" runat="server" AutoGenerateColumns="False" CssClass="table table-hover border">
                                    <Columns>
                                        <asp:BoundField DataField="company" HeaderText="Company" />
                                        <asp:BoundField DataField="position" HeaderText="Position" />
                                        <asp:BoundField DataField="inclusiveDates" HeaderText="Inlcusive Dates" />
                                        <asp:BoundField DataField="natureOfSeparation" HeaderText="Nature of Separation" />
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("id")%>' OnCommand="lnkDelete_Command" Text="Delete"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <h6 class="text-warning">No record(s) found.</h6>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-lg-6">
                                <asp:Button ID="btnAddWorkExperience" runat="server" CssClass="btn btn-blue btn-lg" Text="Add Work Experience" OnClick="btnAddWorkExperience_Click" />
                            </div>
                            <div class="col">
                                <asp:Button ID="btnPopupStartWork" runat="server" Text="Fill Form in Popup" Style="display: none" />
                            </div>
                        </div>
                    </div>

                    <div class="card-body">
                        <div class="card-title bg-light p-2">
                            <h5 class="blue-text">Educational Background</h5>
                        </div>

                        <div class="row mb-3">
                            <div class="col">
                                <table class="table table-hover border">
                                    <tr>
                                        <td>
                                            <label class="font-weight-bold">Degree</label>
                                        </td>
                                        <td>
                                            <label class="font-weight-bold">Name & Address of School</label>
                                        </td>
                                        <td>
                                            <label class="font-weight-bold">Course</label>
                                        </td>
                                        <td>
                                            <label class="font-weight-bold">Inclusive Dates</label>
                                        </td>
                                        <td>
                                            <label class="font-weight-bold">Awards Received</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Primary</label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNameElem" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtCourseElem" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtDatesElem" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtAwardsElem" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Secondary</label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSecondaryName" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSecondaryCourse" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSecondaryDates" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSecondaryAwards" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Bachelor's Degree</label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBachelorName" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBachelorCourse" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBachelorDates" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBachelorAwards" runat="server" CssClass="pis-textbox form-control"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" class="text-center">
                                            <asp:Button ID="btnUpdateEduc" runat="server" Text="Save" CssClass="btn btn-blue btn-sm" OnClick="btnUpdateEduc_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="col justify-content-center text-center">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" TabIndex="13" CssClass="btn btn-blue btn-lg" OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <%--Popup For Work Experience--%>
    <asp:Panel ID="pnlWorkExperience" runat="server" Style="display: none">
        <div class="card">
            <div class="card-header">
                <h4>Work Experience</h4>
            </div>

            <div class="card-body">
                <div class="col">
                    <div class="md-form">
                        <asp:TextBox ID="txtPosition" runat="server" CssClass="form-control"></asp:TextBox>
                        <label for="txtPosition" class="active">Position</label>
                    </div>

                    <div class="md-form">
                        <asp:TextBox ID="txtCompany" runat="server" CssClass="form-control"></asp:TextBox>
                        <label for="txtCompany" class="active">Company</label>
                    </div>
                    <div class="md-form">
                        <asp:TextBox ID="txtInclusiveDate" runat="server" CssClass="form-control md-textarea"></asp:TextBox>
                        <label for="txtInclusiveDate" class="active">Inclusive Date</label>
                    </div>
                    <div class="md-form">
                        <asp:TextBox ID="txtSeparation" runat="server" CssClass="form-control md-textarea"></asp:TextBox>
                        <label for="txtSeparation" class="active">Nature of Separation</label>
                    </div>
                </div>
            </div>
            <div class="card-footer justify-content-center text-center">
                <asp:Button ID="btnSubmitWork" runat="server" CssClass="btn btn-blue" OnClick="btnSubmitWork_Click" Text="Submit" />
                <asp:Button ID="btnCloseWork" runat="server" CssClass="btn btn-primary" Text="Cancel" />
            </div>
        </div>
    </asp:Panel>


    
</asp:Content>
