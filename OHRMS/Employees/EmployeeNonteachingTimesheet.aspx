<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeNonteachingTimesheet.aspx.cs" Inherits="OHRMS.Employees.EmployeeNonteachingTimesheet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Employee Timesheet</title>
    <script src="/../Views/js/jquery.min.js"></script>
    <link href="/../Views/css/styles.css" rel="stylesheet" />
</head>
<body>
    <script>
        function printDiv(divName) {
            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;
            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;
        }
    </script>
    <form id="form1" runat="server">
        <div class="container" id="printableArea">
            <div class="row text-end">
                <div class="mt-3">
                    <button type="button" class="btn btn-primary" onclick="printDiv('printableArea')">Print Timesheet</button>
                </div>
            </div>

            <div class="row">
                <h5 class="display-5 text-center">STI COLLEGE BALIUAG</h5>
                <h2 class="text-center">---------------- NON TEACHING TIME SHEET ----------------</h2>
            </div>

            <div class="row">

                <div class="col-6">
                    <label class="form-label fw-bold">Faculty Name: </label><asp:Label ID="lblFacultyName" runat="server" CssClass="fw-bold"></asp:Label>
                </div>
                <div class="col-6 text-end">
                    <label class="form-label fw-bold">Period Covered: </label><asp:Label ID="lblPeriodCovered" runat="server" CssClass="fw-bold"></asp:Label>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
