<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="OHRMS.Admin.Memorandum.Create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>Memorandum <span class="red-text small align-top">New</span></h4>
                    </div>
                    <div class="card-body md-form">
                        <div class="row mb-3">
                            <div class="col">
                                <label for="txtMemoNo" class="">Memo No</label>
                                <asp:TextBox ID="txtMemoNo" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col">
                                <label for="txtTo" class="">To</label>
                                <asp:TextBox ID="txtTo" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label for="txtCc" class="">CC</label>
                                <asp:TextBox ID="txtCc" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col">
                                <label for="txtTo" class="">From</label>
                                <asp:TextBox ID="txtFrom" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label for="txtAsOfDate" class="active">Date</label>
                                <asp:TextBox ID="txtAsOfDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col">
                                <label for="txtSubject" class="">Subject</label>
                                <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label for="txtMessage" class="active">Message</label>
                                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" CssClass="md-textarea form-control mt-2"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col file-path-wrapper">
                                <label for="file_Memo" class="active">Upload File</label>
                                <asp:FileUpload ID="file_Memo" runat="server" CssClass="file-path validate mt-3" />
                            </div>
                        </div>
                    </div>
                    <div class="card-footer justify-content-center text-center">
                        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="btn btn-red" />
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-blue" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
