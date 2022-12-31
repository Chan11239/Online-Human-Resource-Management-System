<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="DepartmentType.aspx.cs" Inherits="OHRMS.Administrators.DepartmentType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <div class="row">
                            <div class="col">
                                <h4>Department<span class="text-danger lead muted align-top small">  Edit</span></h4>
                            </div>
                        </div>
                    </div>
                    <asp:UpdatePanel ID="upnlLeaveType" runat="server">
                        <ContentTemplate>
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="col">
                                        <div class="form-group md-form">
                                            <label for="ddlClassification" class="active">Classification</label>
                                            <asp:DropDownList ID="ddlClassification" runat="server" CssClass="mdb-select" AutoPostBack="false">
                                                <asp:ListItem Value="Teaching" Text="Teaching"></asp:ListItem>
                                                <asp:ListItem Value="Non-Teaching" Text="Non-Teaching"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group md-form">
                                            <label for="txtDepartment" class="active">Deparment</label>
                                            <asp:TextBox ID="txtDepartment" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="card-footer justify-content-center text-center">
                        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="btn btn-red" />
                        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" CssClass="btn btn-blue" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:HiddenField ID="hidId" runat="server" />

</asp:Content>
