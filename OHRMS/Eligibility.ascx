<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Eligibility.ascx.cs" Inherits="OHRMS.WebUserControl2" %>

<div class="container">
    <div class="row">
        <div class="col">
            <div class="md-form">
                <asp:TextBox ID="txtLicType" runat="server" type="text" class="form-control"></asp:TextBox>
                <label for="txtLicType">Eligibility Type</label>
            </div>
        </div>
        <div class="col">
            <div class="md-form">
                <asp:TextBox ID="txtLicNo" runat="server" type="text" class="form-control"></asp:TextBox>
                <label for="txtLicNo">License No.</label>
            </div>
        </div>
        <div class="col">
            <div class="md-form">
                <asp:TextBox ID="txtValidity" runat="server" type="text" class="form-control"></asp:TextBox>
                <label for="txtValidity">Validity</label>
            </div>
        </div>
    </div>
</div>






<%--<table border="0" style="width: 90%">
    <tr>
        <td style="text-align: center; width: 75px">
            <label>No.</label>
        </td>
        <td style="text-align: center; width: 400px">
            <label>Type of Professional License</label>
        </td>
        <td style="text-align: center; width: 150px">
            <label>License No.</label>
        </td>
        <td style="text-align: center; width: 150px">
            <label>Date Valid</label>
        </td>
    </tr>
    <tr>
        <td style="text-align: center;">
            <label>1</label>
        </td>
        <td>
            <asp:TextBox ID="txtType" runat="server" CssClass="pis-textbox"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="txtLicenseNo" runat="server" CssClass="pis-textbox"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="txtDateValid" runat="server" CssClass="pis-textbox"></asp:TextBox>
        </td>
    </tr>
</table>--%>
