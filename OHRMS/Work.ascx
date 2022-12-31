<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Work.ascx.cs" Inherits="OHRMS.Work" %>

<div class="container">
    <div class="row">
        <div class="col">
            <div class="md-form">
                <asp:TextBox ID="txtCompany" runat="server" CssClass="form-control"></asp:TextBox>
                <label for="txtCompany" class="form-label">Name of Company/Employer</label>
            </div>
        </div>
        <div class="col">
            <div class="md-form">
                <asp:TextBox ID="txtPosition" runat="server" CssClass="form-control"></asp:TextBox>
                <label for="txtPosition" class="form-label">Position Assigned</label>
            </div>
        </div>
        <div class="col">
            <div class="md-form">
                <asp:TextBox ID="txtDateWork" runat="server" CssClass="form-control"></asp:TextBox>
                <label for="txtDateWork" class="form-label">Inclusive Dates</label>
            </div>
        </div>
        <div class="col">
            <div class="md-form">
                <asp:TextBox ID="txtNatureSeparation" runat="server" CssClass="form-control"></asp:TextBox>
                <label for="txtNatureSeparation" class="form-label">Nature of Separation</label>
            </div>
        </div>
    </div>
</div>



<%--<table>
    <tr>
        <td>
            <label style="position: relative; font-size: 16px;font-weight: 500; width: 400px;">
               Company/Employer</label>
        </td>
        <td>
            <label style="position: relative; font-size: 16px;font-weight: 500; width: 150px;">
                Position</label>
        </td>
        <td>
            <label style="position: relative; font-size: 16px;font-weight: 500; width: 150px;">
                Inclusive Dates</label>
        </td>
        <td>
            <label style="position: relative; font-size: 16px;font-weight: 500; width: 150px;">
                Nature of Separation</label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:TextBox ID="txtCompany" runat="server" Width="400px" Font-Size="14px"></asp:TextBox>
        </td>
         <td>
            <asp:TextBox ID="txtPosition" runat="server" Width="200px" Font-Size="14px"></asp:TextBox>
        </td>
         <td>
            <asp:TextBox ID="txtDateWork" runat="server" Width="200px" Font-Size="14px"></asp:TextBox>
        </td>
         <td>
            <asp:TextBox ID="txtNatureSeparation" runat="server" Width="200px" Font-Size="14px"></asp:TextBox>
        </td>
    </tr>
</table>--%>
