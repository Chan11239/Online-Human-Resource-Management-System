<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="COEResigned.aspx.cs" Inherits="OHRMS.COEResigned" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="container bg-white shadow mt-3 col-12 mb-5 p-3">


        <div class="card-header">
            <div class="row">
                <div class="col-12">
                    <h3 class="text-primary">COE Resigned</h3>
                </div>
            </div>
        </div>

        <div class="container mt-5">

            <table class="table table-hover table-responsive border">
                <tr>
                    <td>Employee Name: 
                    </td>
                    <td>
                        <asp:TextBox ID="txtname" runat="server" Text="General Announcement" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Position:
                    </td>
                    <td>
                        <asp:TextBox ID="txtPosition" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Date Hired:
                    </td>
                    <td>
                        <asp:TextBox ID="txtDateHired" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Date Resigned:
                    </td>
                    <td>
                        <asp:TextBox ID="txtDateResigned" runat="server"  CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Day:
                    </td>
                    <td>
                        <asp:TextBox ID="txtDay" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Month:
                    </td>
                    <td>
                        <asp:TextBox ID="txtMonth" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Year:
                    </td>
                    <td>
                        <asp:TextBox ID="txtYear" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <div class="separator"></div>
            <div class="text-end">
                <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-warning" />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
</asp:Content>
