<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Applicant.Master" AutoEventWireup="true" CodeBehind="JobInformations.aspx.cs" Inherits="OHRMS.Applicants.JobInformations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4 class="text-center">Job Details</h4>
                    </div>
                    <div class="card-body">
                        <div class="row mb-3">
                            <div class="col">
                                <div class="card-title">
                                    <label for="lblDescription" class="font-weight-bold">Job Description</label>
                                </div>
                                <div class="card-text">
                                    <asp:Label ID="lblDescription" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <div class="card-title">
                                    <label for="lblJobResponsibilities" class="font-weight-bold">Job Responsibilities</label>
                                </div>
                                <div class="card-text">
                                    <asp:Label ID="lblJobResponsibilities" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <div class="card-title">
                                    <label class="font-weight-bold">Additional Details</label>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <div class="card-title">
                                    <label class="font-weight-bold">Job Title</label>
                                </div>
                                <div class="card-subtitle">
                                    <asp:Label ID="lblTitle" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card-title">
                                    <label class="font-weight-bold">Job Type</label>
                                </div>
                                <div class="card-subtitle">
                                    <asp:Label ID="lblType" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <div class="card-title">
                                    <label class="font-weight-bold">Department</label>
                                </div>
                                <div class="card-subtitle">
                                    <asp:Label ID="lblDepartment" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card-title">
                                    <label class="font-weight-bold">Classification</label>
                                </div>
                                <div class="card-subtitle">
                                    <asp:Label ID="lblClassification" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <div class="card-title">
                                    <label class="font-weight-bold">Requirements</label>
                                </div>
                                <div class="card-subtitle">
                                    <label class="font-weight-bold small">Experience</label>
                                </div>
                                <div class="card-subtitle">
                                    <label class="font-weight-bold small">Degree</label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card-title">
                                    <label class="font-weight-bold">&nbsp;</label>
                                </div>
                                <div class="card-subtitle">
                                    <asp:Label ID="lblYearExperience" runat="server" CssClass="small"></asp:Label>
                                </div>
                                <div class="card-subtitle">
                                    <asp:Label ID="lblQualification" runat="server" CssClass="small"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col file-path-wrapper md-form justify-content-center text-center">
                                <div>
                                    <asp:FileUpload ID="fuResume" runat="server" accept=".doc, .docx, .pdf" CssClass="btn btn-outline-blue file-path validate" /><a id="lblRemainder" runat="server"></a>
                                </div>
                                <div>
                                    <asp:Label ID="lblfuResume" runat="server" for="fuResume" class="form-label">Upload your CV/Resume<span class="red-text small"> (*Please upload .doc, .docx or .pdf file only.)</span></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col justify-content-center text-center">
                                <asp:Button ID="btnSubmit" runat="server" Text="Apply Now" OnClick="btnSubmit_Click" CssClass="btn btn-deep-purple btn-lg btn-rounded waves-effect waves-light" />
                            </div>
                        </div>
                    </div>
                    <div class="card-footer justify-content-center text-center">
                        <a href="<%=Page.ResolveUrl("~/Applicants/JobListing.aspx")%>" class="btn btn-blue btn-rounded">Go back to list </a>
                        <asp:HiddenField ID="hidPostedJobId" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
