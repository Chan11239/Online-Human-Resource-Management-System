<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="COEMultiPurpose.aspx.cs" Inherits="OHRMS.Reports.COEMultiPurpose" %>

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
    <form id="form2" runat="server">
        <div class="container mt-5">
            <div class="card p-5">
                <h1 class="font-weight-bold text-center mt-5">C E R T I F I C A T I O N   O F  E M P L O Y M E N T</h1>
                <br />
                <p>This is to certify that
                    <u><asp:Label ID="lblEmployeeName" runat="server" Text="{Employee Name}" CssClass="font-weight-bold text-uppercase"></asp:Label></u>
                    is presently employed with this company as
                    <u><asp:Label ID="lblPosition" runat="server" Text="{Position}" CssClass="font-weight-bold text-uppercase"></asp:Label></u>
                    since
                    <asp:Label ID="lblDateHired" runat="server" Text="{Date Hired}" CssClass="font-weight-bold"></asp:Label> and is currently receiving a monthly salary of
                    <u>PHP <asp:Label ID="lblSalary" runat="server" Text="{Salary Amount}" CssClass="font-weight-bold"></asp:Label>.00</u>.</p>
                <br />
                <p>This certification is being issued upon the request of
                    <u><asp:Label ID="lblRequestor" runat="server" Text="{Employee Name}" CssClass="font-weight-bold text-uppercase"></asp:Label></u>
                    for any legal purposes it may serve him/her.</p>
                <br />
                <p>Given this<u class="font-weight-bold">
                    <asp:Label ID="lblDay" runat="server" Text="{Day}"></asp:Label>
                    day of
                    <asp:Label ID="lblMonth" runat="server" Text="{Month}"></asp:Label>
                    <asp:Label ID="lblYear" runat="server" Text="{Year}"></asp:Label></u>
                    at Poblacion, Baliwag, Bulacan.</p>
                <br /><br />
                <h4>STI COLLEGE-BALIUAG</h4>
                <p>By:</p>
                <br />
                <asp:Label ID="lblHrOfficer" runat="server" Text=""></asp:Label>
                <label>_________________________</label>
                <label>Human Resource Officer</label>
            </div>
        </div>
    </form>

</body>
</html>
