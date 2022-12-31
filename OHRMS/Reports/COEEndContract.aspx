<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="COEEndContract.aspx.cs" Inherits="OHRMS.Reports.COEEndContract" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Printing Certification</title>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
    <script src="/../UI/js/jquery.js"></script>
    <script src="/../UI/js/popper.js"></script>
    <script src="/../UI/js/bootstrap.min.js"></script>
    <script src="/../UI/js/mdb.min.js"></script>
    <link href="/../UI/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/../UI/css/mdb.css" rel="stylesheet" />
    <link href="/../UI/css/app-style.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
        <div class="card p-5">
            <h1 class="text-center font-weight-bolder mt-5">C E R T I F I C A T I O N  O F  E M P L O Y M E N T</h1>
            <br /><br />
            <p>This is to certify that, <asp:Label ID="lblEmployeeName" runat="server" Text="{Employee Name}" CssClass="font-weight-bold"></asp:Label> was employed with this company as <asp:Label ID="lblPosition" runat="server" Text="{Position}" CssClass="font-weight-bold"></asp:Label> from <asp:Label ID="lblDateHired" runat="server" Text="{Date Hired}" CssClass="font-weight-bold"></asp:Label> to <asp:Label ID="lblEndContractDate" runat="server" Text="{End Contract Date}" CssClass="font-weight-bold"></asp:Label>.</p>
            <br />
            <p>This further certifies that <asp:Label ID="lblCertificant" runat="server" Text="{Employee Name}" CssClass="font-weight-bold"></asp:Label> is cleared of financial, properties and other accountabilities to the company.</p>
            <br />
            <p>This certification was issued upon the request of <asp:Label ID="lblRequestor" runat="server" Text="{Employee Name}" CssClass="font-weight-bold"></asp:Label> for whatever legal purposes it may serve him.</p>
            <br />
            <p>Given this <asp:Label ID="lblDay" runat="server" Text="{Day}" CssClass="font-weight-bold"></asp:Label> day of <asp:Label ID="lblMonth" runat="server" Text="{Month}" CssClass="font-weight-bold"></asp:Label>, <asp:Label ID="lblYear" runat="server" Text="{Year}" CssClass="font-weight-bold"></asp:Label> at <span class="font-weight-bold">STI College, Poblacion, Baliwag, Bulacan</span>.</p>
            <br />
            <asp:Label ID="lblHrOfficer" runat="server" Text="Signature over Printed Name"></asp:Label>
            <div class="mt-3"><span>_____________________________</span></div>
            <span class="font-italic">Human Resource Officer</span>
        </div>
            </div>
    </form>
</body>
</html>
