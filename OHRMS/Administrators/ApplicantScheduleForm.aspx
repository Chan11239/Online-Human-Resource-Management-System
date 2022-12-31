<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicantScheduleForm.aspx.cs" Inherits="OHRMS.Administrators.ApplicantScheduleForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="padding-top: 25px">
            <asp:Label ID="lblId" runat="server" Visible="false"></asp:Label>
            <%--<br />--%>
            Date: <asp:TextBox ID="txtDate" runat="server" TextMode="Date" type="date"></asp:TextBox>
            <br />
            Time: <asp:TextBox ID="txtTime" runat="server" TextMode="Time"></asp:TextBox>
            <br />
            Place: <asp:TextBox ID="txtPlace" runat="server" TextMode="MultiLine"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Approved" OnClick="btnSubmit_Click" />
        </div>
    </form>
</body>
</html>
