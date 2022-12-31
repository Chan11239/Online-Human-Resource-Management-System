<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="PositionType.aspx.cs" Inherits="OHRMS.Administrators.PositionType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <div class="row">
                            <div class="col">
                                <h4>Position<span class="text-danger lead muted align-top">  New</span></h4>
                            </div>
                        </div>
                    </div>
                    <asp:UpdatePanel ID="upnlLeaveType" runat="server">
                        <ContentTemplate>
                            <div class="card-body">
                                <div class="row mb-3 justify-content-center">
                                    <div class="col">
                                    <label for="ddlClassification">Classification</label>
                                        </div>
                                    <div class="col">
                                        <asp:DropDownList ID="ddlClassification" runat="server" CssClass="dropdown form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlClassification_SelectedIndexChanged">
                                            <%--<asp:ListItem Value="-" Text="- Select -"></asp:ListItem>--%>
                                            <asp:ListItem Value="Teaching" Text="Teaching"></asp:ListItem>
                                            <asp:ListItem Value="Non-Teaching" Text="Non-Teaching"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col">
                                        <label>Department</label>
                                    </div>
                                    <div class="col">
                                        <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="dropdown form-control" AutoPostBack="true">
                                            <%--<asp:ListItem Value="-" Text="--select--"></asp:ListItem>--%>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col">
                                        <label>Position</label>
                                    </div>
                                    <div class="col">
                                        <asp:TextBox ID="txtPosition" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="card-footer justify-content-center text-center">
                        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="btn btn-red" />
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-blue" />
                        <asp:HiddenField ID="hidId" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
