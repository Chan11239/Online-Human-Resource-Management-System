<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="RankType.aspx.cs" Inherits="OHRMS.Administrators.RankType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <div class="row">
                            <div class="col">
                                <h4>Rank<span class="text-danger lead muted align-top">  New</span></h4>
                            </div>
                        </div>
                    </div>
                    <asp:UpdatePanel ID="upnlLeaveType" runat="server">
                        <ContentTemplate>
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="col form-group md-form">
                                        <label class="active">Classification</label>
                                        <asp:TextBox ID="txtClassification" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col form-group md-form">
                                        <label class="active">Start Point</label>
                                        <asp:TextBox ID="txtStartPoint" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col form-group md-form">
                                        <label class="active">End Point</label>
                                        <asp:TextBox ID="txtEndPoint" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <label for="ddlType" class="active">Type</label>
                                    <asp:DropDownList ID="ddlType" runat="server" CssClass="mdb-select" AutoPostBack="false">
                                        <asp:ListItem Value="Full Time" Text="Full Time"></asp:ListItem>
                                        <asp:ListItem Value="Part Time" Text="Part Time"></asp:ListItem>
                                    </asp:DropDownList>
                                    <div class="col form-group md-form">
                                        <label class="active">Rank</label>
                                        <asp:TextBox ID="txtRank" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col form-group md-form">
                                        <label class="active">Rate per Hour</label>
                                        <asp:TextBox ID="txtSalaryRate" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="card-footer justify-content-center text-center">
                        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="btn btn-blue" />
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-blue" />
                        <asp:HiddenField ID="hidId" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
