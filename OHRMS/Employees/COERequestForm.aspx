<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Employee.Master" AutoEventWireup="true" CodeBehind="COERequestForm.aspx.cs" Inherits="OHRMS.Employees.COERequestForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>COE Request Form<span class="red-text lead muted align-top">New</span></h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col md-form">
                                <asp:TextBox ID="lblEmployeeNo" runat="server" CssClass="form-control" Text="{Employee No}" ReadOnly="true"></asp:TextBox>
                                <label data-error="wrong" data-success="right" for="lblEmployeeNo" class="active">Employee No</label>
                            </div>
                            <div class="col md-form">
                                <asp:TextBox ID="lblRequestorName" runat="server" CssClass="form-control" Text="{Employee Name}" ReadOnly="true"></asp:TextBox>
                                <label data-error="wrong" data-success="right" for="lblRequestorName" class="active">Requestor Name</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col md-form">
                                <asp:TextBox ID="txtPrescribeDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                <label data-error="wrong" data-success="right" for="txtPrescribeDate" class="active">Date Needed Before</label>
                            </div>
                            <div class="col"></div>
                        </div>
                        <div class="row">
                            <div class="col md-form">
                                <asp:TextBox ID="txtPurpose" TextMode="MultiLine" runat="server" CssClass="md-textarea form-control"></asp:TextBox>
                                <label data-error="wrong" data-success="right" for="txtPurpose" class="active">Purpose</label>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer justify-content-center text-center">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-blue btn-lg" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
