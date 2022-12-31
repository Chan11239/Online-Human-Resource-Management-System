<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Employee.Master" AutoEventWireup="true" CodeBehind="Checklist.aspx.cs" Inherits="OHRMS.Employee.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="container my-3">
                <div class="row">
                    <div class="col clearfix">
                        <div class="card mt-2">
                            <div class="card-header">
                                <h4>Requirements Checklist</h4>
                                <p class="small white-text">Kindly present orginal copy or submit copy (soft copy) of the following document.</p>
                            </div>
                            <div class="card-body">
                                <div class="row md-form">
                                    <div class="col-lg-4 col-md-12 col-sm-12">
                                        <asp:TextBox ID="txtName_Check" runat="server" CssClass="form-control md-form"></asp:TextBox>
                                        <label for="txtName_Check" class="form-label active">Name</label>
                                    </div>
                                    <div class="col-lg-4 col-md-12 col-sm-12">
                                        <asp:TextBox ID="txtEmpID_Check" runat="server" CssClass="form-control md-form"></asp:TextBox>
                                        <label for="txtEmpID_Check" class="form-label active">Employee Number (If any)</label>
                                    </div>
                                    <div class="col-lg-4 col-md-12 col-sm-12">
                                        <asp:TextBox ID="txtAddress_Check" runat="server" CssClass="form-control md-form"></asp:TextBox>
                                        <label for="txtAddress_Check" class="form-label active">Complete Address</label>
                                    </div>
                                </div>
                                <div class="row md-form">
                                    <div class="col-lg-4 col-md-12 col-sm-12">
                                        <asp:TextBox ID="txtEmail_Checl" runat="server" CssClass="form-control md-form"></asp:TextBox>
                                        <label for="txtEmail_Checl" class="form-label active">Email Address</label>
                                    </div>
                                    <div class="col-lg-4 col-md-12 col-sm-12">
                                        <asp:TextBox ID="txtBirthday_Check" runat="server" CssClass="form-control md-form"></asp:TextBox>
                                        <label for="txtBirthday_Check" class="form-label active">Birthday</label>
                                    </div>
                                    <div class="col-lg-4 col-md-12 col-sm-12">
                                        <asp:TextBox ID="txtContact_Check" runat="server" CssClass="form-control md-form"></asp:TextBox>
                                        <label for="txtContact_Check" class="form-label active">Contact Number</label>
                                    </div>
                                </div>
                                <div class="row md-form">
                                    <div class="col-lg-4 col-md-12 col-sm-12">
                                        <asp:TextBox ID="txtPosition_Check" runat="server" CssClass="form-control md-form"></asp:TextBox>
                                        <label for="txtPosition_Check" class="form-label active">Position</label>
                                    </div>
                                    <div class="col-lg-4 col-md-12 col-sm-12">
                                        <asp:TextBox ID="txtDateHired_Check" runat="server" CssClass="form-control md-form"></asp:TextBox>
                                        <label for="txtDateHired_Check" class="form-label active">Date Hired</label>
                                    </div>
                                    <div class="col-lg-4 col-md-12 col-sm-12">
                                        <asp:TextBox ID="txtCompleted_Check" runat="server" CssClass="form-control md-form"></asp:TextBox>
                                        <label for="txtCompleted_Check" class="form-label active">Date Completed</label>
                                    </div>
                                </div>
                            </div>


                            <div class="card-header">
                                <h5>Submitted Requirements</h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col table table-responsive">
                                        <table>
                                            <tr>
                                                <td colspan="1">
                                                    <label class="font-weight-bold">Document</label>
                                                </td>
                                                <td colspan="2">
                                                    <label class="font-weight-bold">File Name</label>
                                                </td>
                                                <td colspan="1">
                                                    <label class="font-weight-bold">Date Submitted</label>
                                                </td>
                                                <td colspan="1">
                                                    <label class="font-weight-bold">Remarks</label>
                                                </td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="form-label">Latest Resume with 2x2 ID Picture</label>
                                                </td>
                                                <td>
                                                    <asp:FileUpload ID="file_Resume" runat="server" CssClass="file-path validate" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblFilename_CV" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblDate_Resume" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRemarks_CV" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnSubmit_CV" runat="server" Text="Submit" CssClass="btn btn-blue" OnClick="btnSubmit_CV_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="form-label">3 copies of 2x2 Picture</label>
                                                </td>
                                                <td>
                                                    <asp:FileUpload ID="file_Pic" runat="server" AllowMultiple="true" CssClass="file-path validate" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblFilename_Picture" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblDate_Pic" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRemarks_Pic" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnSubmit_Pic" runat="server" Text="Submit" CssClass="btn btn-blue" OnClick="btnSubmit_Pic_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <label class="form-label">Credentials (Including MA if applicable)</label></td>
                                                    <td>
                                                        <asp:Label ID="lblDate_Credentials" runat="server" CssClass="label-remarks"></asp:Label></td>
                                                    <td>
                                                        <asp:Button ID="btnSubmit_Credentials" runat="server" Text="Submit" CssClass="btn btn-blue" OnClick="btnSubmit_Credentials_Click" /></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="text-end">&#10003 TOR</label></td>
                                                    <td>
                                                        <asp:FileUpload ID="file_TOR" runat="server" CssClass="file-path validate" /></td>
                                                    <td>
                                                        <asp:Label ID="lblFilename_TOR" runat="server" CssClass="label-remarks"></asp:Label></td>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <asp:Label ID="lblRemarks_TOR" runat="server" CssClass="label-remarks"></asp:Label></td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="text-end">&#10003 Diploma</label></td>
                                                    <td>
                                                        <asp:FileUpload ID="file_Diploma" runat="server" CssClass="file-path validate" /></td>
                                                    <td>
                                                        <asp:Label ID="lblFilename_Diploma" runat="server" CssClass="label-remarks"></asp:Label></td>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <asp:Label ID="lblRemarks_Diploma" runat="server" CssClass="label-remarks"></asp:Label></td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="form-label">Certificates(PRC, TESDA, etc.)</label>
                                                </td>
                                                <td>
                                                    <asp:FileUpload ID="file_Cert" AllowMultiple="true" runat="server" CssClass="file-path validate" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblFilename_Cert" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblDate_Cert" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRemarks_Cert" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnRemarks_Cert" runat="server" Text="Submit" CssClass="btn btn-blue" OnClick="btnRemarks_Cert_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="form-label">Certificate of Employment from Previous Employer</label>
                                                </td>
                                                <td>
                                                    <asp:FileUpload ID="file_COE" runat="server" CssClass="file-path validate" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblFilename_COE" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblDate_COE" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRemarks_COE" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnSubmit_COE" runat="server" Text="Submit" CssClass="btn btn-blue" OnClick="btnSubmit_COE_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="form-label">Community Tax Certificate</label>
                                                </td>
                                                <td>
                                                    <asp:FileUpload ID="file_CTC" runat="server" CssClass="file-path validate" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblFilename_CTC" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblDate_CTC" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRemarks_CTC" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnSUbmit_CTC" runat="server" Text="Submit" CssClass="btn btn-blue" OnClick="btnSUbmit_CTC_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="form-label">SSS(E1 Form/SSS ID)</label>
                                                </td>
                                                <td>
                                                    <asp:FileUpload ID="file_SSS" runat="server" CssClass="file-path validate" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblFilename_SSS" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblDate_SSS" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRemarks_SSS" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnSubmit_SSS" runat="server" Text="Submit" CssClass="btn btn-blue" OnClick="btnSubmit_SSS_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="form-label">Philhealth Reg. Form/ID</label>
                                                </td>
                                                <td>
                                                    <asp:FileUpload ID="file_Philhealth" runat="server" CssClass="file-path validate" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblFilename_Philhealth" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblDate_Philhealth" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRemarks_Philhealth" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnSubmit_Philhealth" runat="server" Text="Submit" CssClass="btn btn-blue" OnClick="btnSubmit_Philhealth_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="form-label">PAG-IBIG Form/ID</label>
                                                </td>
                                                <td>
                                                    <asp:FileUpload ID="file_Pagibig" runat="server" CssClass="file-path validate" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblFilename_Pagibig" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblDate_Pagibig" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRemarks_Pagibig" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnSubmit_Pagibig" runat="server" Text="Submit" CssClass="btn btn-blue" OnClick="btnSubmit_Pagibig_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="form-label">TIN (1902/ID)</label>
                                                </td>
                                                <td>
                                                    <asp:FileUpload ID="file_Tin" runat="server" CssClass="file-path validate" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblFIlename_Tin" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblDate_Tin" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRemarks_Tin" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnSubmit_Tin" runat="server" Text="Submit" CssClass="btn btn-blue" OnClick="btnSubmit_Tin_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="form-label">X-Ray Medical Result</label>
                                                </td>
                                                <td>
                                                    <asp:FileUpload ID="file_Medical" runat="server" CssClass="file-path validate" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblFilename_Medical" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblDate_Medical" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRemarks_Medical" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnSubmit_Medical" runat="server" Text="Submit" CssClass="btn btn-blue" OnClick="btnSubmit_Medical_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="form-label">Medical Health Card</label>
                                                </td>
                                                <td>
                                                    <asp:FileUpload ID="file_HealthCard" runat="server" CssClass="file-path validate" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblFilename_HealthCard" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblDate_HealthCard" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRemarks_HealthCard" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnSubmit_HealthCard" runat="server" Text="Submit" CssClass="btn btn-blue" OnClick="btnSubmit_HealthCard_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <div class="card-header">
                                <h5>Documents below will be provided by the STI Baliuag</h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col table table-responsive">
                                        <table class="table table-hover border">
                                            <tr>
                                                <td colspan="1">
                                                    <label class="font-weight-bold">Document</label>
                                                </td>
                                                <td colspan="1">
                                                    <label class="font-weight-bold">File</label>
                                                </td>
                                                <td>
                                                    <label class="font-weight-bold">Date Submitted</label>
                                                </td>
                                                <td>
                                                    <label class="font-weight-bold">HR Signed</label>
                                                </td>
                                                <td></td>
                                            </tr>

                                            <tr>
                                                <td colspan="1">
                                                    <label class="form-label">Employment Contract</label>
                                                </td>
                                                <td colspan="1">
                                                    <asp:LinkButton ID="lblEmployeeContractFileName" runat="server" CssClass="blue-text form-label" Text="Download"></asp:LinkButton>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblDate_Contract" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRemarks_Contract" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <label class="form-label">Signed Code of Conduct</label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                    <asp:Label ID="lblDate_Code" runat="server" CssClass="form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRemarks_Code" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="form-label">Academic Personnel Information Form</label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                    <asp:Label ID="lblDate_AcadInfo" runat="server" CssClass="form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRemarks_AcadInfo" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="form-label">Job Description Form</label>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                    <asp:Label ID="lblDate_Job" runat="server" CssClass="form-label"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRemarks_Job" runat="server" CssClass="label-remarks form-label"></asp:Label>
                                                </td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer justify-content-center text-center">
                                
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit_CV" />
            <asp:PostBackTrigger ControlID="btnSubmit_Pic" />
            <asp:PostBackTrigger ControlID="btnSubmit_Credentials" />
            <asp:PostBackTrigger ControlID="btnRemarks_Cert" />
            <asp:PostBackTrigger ControlID="btnSubmit_COE" />
            <asp:PostBackTrigger ControlID="btnSUbmit_CTC" />
            <asp:PostBackTrigger ControlID="btnSubmit_SSS" />
            <asp:PostBackTrigger ControlID="btnSubmit_Philhealth" />
            <asp:PostBackTrigger ControlID="btnSubmit_Pagibig" />
            <asp:PostBackTrigger ControlID="btnSubmit_Tin" />
            <asp:PostBackTrigger ControlID="btnSubmit_Medical" />
            <asp:PostBackTrigger ControlID="btnSubmit_HealthCard" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
