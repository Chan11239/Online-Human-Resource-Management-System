<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="FAQForm.aspx.cs" Inherits="OHRMS.Administrators.FAQForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <div class="row">
                            <div class="col">
                                <h4>FAQ<span class="text-danger lead muted align-top">  New</span></h4>
                            </div>
                        </div>
                    </div>
                    <div class="card-body md-form">
                        <div class="row mb-3">
                            <div class="col form-group">
                                <label class="active"><span class="text-danger">*</span>Group:</label>
                                <asp:DropDownList ID="ddlGroup" runat="server" CssClass="mdb-select md-form">
                                    <asp:ListItem Text="--select--" Value="-"></asp:ListItem>
                                    <asp:ListItem Text="Employee Help" Value="Employee Help"></asp:ListItem>
                                    <asp:ListItem Text="Applicant Help" Value="Applicant Help"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            </div>
                        <div class="row mb-3">
                            <div class="col form-group">
                                <label class=""><span class="text-danger">*</span>Question:</label>
                                <asp:TextBox ID="txtQuestion" runat="server" TextMode="MultiLine" CssClass="form-control md-form md-textarea" required="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col form-group">
                                <label class=""><span class="text-danger">*</span>Answer:</label>
                                <asp:TextBox ID="txtAnswer" runat="server" TextMode="MultiLine" CssClass="form-control md-form md-textarea" required="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer justify-content-center text-center">
                        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-blue btn-lg" Text="Save" OnClick="btnSave_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
