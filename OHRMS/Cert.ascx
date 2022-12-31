<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Cert.ascx.cs" Inherits="OHRMS.Cert" %>

<div class="container">
    <div class="row">
        <div class="col">
            <div class="md-form">
                <asp:TextBox ID="txtCert_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                <label for="txtCert_PIS" class="form-label">Certification/Training</label>
            </div>
        </div>
        <div class="col">
            <div class="md-form">
                <asp:TextBox ID="txtInstitution_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                <label for="txtInstitution_PIS" class="form-label">Institution/Organization</label>
            </div>
        </div>
        <div class="col">
            <div class="md-form">
                <asp:TextBox ID="txtCertDate_PIS" runat="server" CssClass="form-control"></asp:TextBox>
                <label for="txtCertDate_PIS" class="form-label">Inclusive Dates</label>
            </div>
        </div>
    </div>
</div>












<%--<table>
    <tr>
        <td>
            <label style="position: relative; font-size: 16px;font-weight: 500; width: 400px;">
                Name/Type of Certification/Training</label>
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
            <asp:TextBox ID="txtCert_PIS" runat="server" Width="400px" Font-Size="14px"></asp:TextBox>
        </td>
         <td>
            <asp:TextBox ID="txtInstitution_PIS" runat="server" Width="200px" Font-Size="14px"></asp:TextBox>
        </td>
         <td>
            <asp:TextBox ID="txtCertDate_PIS" runat="server" Width="200px" Font-Size="14px"></asp:TextBox>
        </td>
    </tr>
</table>--%>