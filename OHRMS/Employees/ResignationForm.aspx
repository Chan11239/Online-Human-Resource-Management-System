<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Employee.Master" AutoEventWireup="true" CodeBehind="ResignationForm.aspx.cs" Inherits="OHRMS.Employees.ResignationForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>Resignation Form<span class="red-text lead muted align-top">New</span></h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col md-form">
                                <asp:TextBox ID="txtTo" runat="server" CssClass="form-control mb-4" required="true"></asp:TextBox>
                                <label data-error="wrong" data-success="right" for="txtTo">To</label>
                            </div>
                            <div class="col md-form">
                                <asp:TextBox ID="txtEffectivity" runat="server" TextMode="Date" CssClass="form-control" required="true"></asp:TextBox>
                                <label data-error="wrong" data-success="right" for="txtEffectivity">Effectivity Date</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col md-form">
                                <asp:TextBox ID="txtMessage" TextMode="MultiLine" runat="server" CssClass="md-textarea form-control" required="true"></asp:TextBox>
                                <label data-error="wrong" data-success="right" for="txtMessage">Message</label>
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
