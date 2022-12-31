<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Children.ascx.cs" Inherits="OHRMS.Children" %>

<div class="row">
    <div class="col">
        <div class="form-group">
            <asp:TextBox ID="txtChildrenName" runat="server" CssClass="form-control"></asp:TextBox>
            <label for="txtChildrenName" class="form-label">Fullname</label>
        </div>
    </div>
    <div class="col">
        <div class="form-group">
            <asp:TextBox ID="txtChildrenAge" runat="server" CssClass="form-control"></asp:TextBox>
            <label for="txtChildrenAge" class="form-label">Age</label>
        </div>
    </div>
    <div class="col">
        <div class="form-group">
            <asp:TextBox ID="txtChildrenOccupaion" runat="server" CssClass="form-control"></asp:TextBox>
            <label for="txtChildrenOccupaion" class="form-label">Occupation</label>
        </div>
    </div>
</div>



<%--<table>
    <tr>
        <td>
            <label style="position: relative; font-size: 16px;font-weight: 500; width: 400px;">
                Name</label>
        </td>
        <td>
            <label style="position: relative; font-size: 16px;font-weight: 500; width: 150px;">
                Age</label>
        </td>
        <td>
            <label style="position: relative; font-size: 16px;font-weight: 500; width: 150px;">
                Occupation</label>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:TextBox ID="txtChildrenName" runat="server" Width="400px" Font-Size="14px"></asp:TextBox>
        </td>
         <td>
            <asp:TextBox ID="txtChildrenAge" runat="server" Width="200px" Font-Size="14px"></asp:TextBox>
        </td>
         <td>
            <asp:TextBox ID="txtChildrenOccupaion" runat="server" Width="200px" Font-Size="14px"></asp:TextBox>
        </td>
        <td><asp:Button ID="btnSaveChild" runat="server" Text="Save" CssClass="btn btn-blue btn-sm" /></td>
    </tr>
</table>--%>