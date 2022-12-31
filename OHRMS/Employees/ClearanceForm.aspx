<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Employee.Master" AutoEventWireup="true" CodeBehind="ClearanceForm.aspx.cs" Inherits="OHRMS.Employees.ClearanceForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>Clearance Form and Statement</h4>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Policy Statement</h5>
                        <p>
                            Obtaining clearances may be required for employment, such as a security clearance. 
                        This is often mandated from any State to assure that the employee is not someone who causes 
                        trouble and commits a crime in the premises of the company. Normally, the individual who submits 
                        for a clearance will have his clearance form within 90 days prior to his submission.
                        </p>
                    </div>
                    <div class="card-footer justify-content-center text-center">
                        <asp:LinkButton ID="lnkClearance" runat="server" Text="Print Clearance Form" CommandArgumet='<%#Eval("fileName")%>' OnCommand="lnkClearance_Command" CssClass="btn btn-blue btn-lg"></asp:LinkButton>
                        <asp:HiddenField ID="hidFilename" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
