<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Seminar.ascx.cs" Inherits="OHRMS.Seminar" %>

<div class="container">
    <div class="row">
        <div class="col">
            <div class="md-form">
                <asp:TextBox ID="txtName_Seminar" runat="server" CssClass="form-control"></asp:TextBox>
                <label for="txtName_Seminar" class="form-label">Name/Title Of Seminar</label>
            </div>
        </div>
        <div class="col">
            <div class="md-form">
                <asp:TextBox ID="txtInstitution_Seminar" runat="server" CssClass="form-control"></asp:TextBox>
                <label for="txtInstitution_Seminar" class="form-label">Institution/Organization</label>
            </div>
        </div>
        <div class="col">
            <div class="md-form">
                <asp:TextBox ID="txtSeminar_Date" runat="server" CssClass="form-control"></asp:TextBox>
                <label for="txtSeminar_Date" class="form-label">Inclusive Dates</label>
            </div>
        </div>
    </div>
</div>










<%--<table>
    <tr>
        <td>
            <label style="position: relative; font-size: 16px;font-weight: 500; width: 400px;">
                Name/Type of Seminar</label>
        </td>
        <td>
            <label style="position: relative; font-size: 16px;font-weight: 500; width: 150px;">
                Institution</label>
        </td>
        <td>
            <label style="position: relative; font-size: 16px;font-weight: 500; width: 150px;">
                Inclusive Dates</label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:TextBox ID="txtName_Seminar" runat="server" Width="400px" Font-Size="14px"></asp:TextBox>
        </td>
         <td>
            <asp:TextBox ID="txtInstitution_Seminar" runat="server" Width="200px" Font-Size="14px"></asp:TextBox>
        </td>
         <td>
            <asp:TextBox ID="txtSeminar_Date" runat="server" Width="200px" Font-Size="14px"></asp:TextBox>
        </td>
    </tr>
</table>--%>