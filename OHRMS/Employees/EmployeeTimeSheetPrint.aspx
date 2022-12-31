<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeTimeSheetPrint.aspx.cs" Inherits="OHRMS.Employees.EmployeeTimeSheetPrint" %>

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
            <!--
            <h5 class="blue-text" style="padding-top: 50px;">TimeSheet Result</h5>
            <div class="divider"></div>
            <div style="text-align: center">
                <input type="button" onclick="printDiv('printableArea')" value="Print Schedule" /></div>
            <asp:Button ID="btnPrint" runat="server" OnClick="btnPrint_Click" Text="Print" />
            -->

            <div class="row text-end">
                <div class="mt-3">
                    <button type="button" class="btn btn-primary" onclick="printDiv('printableArea')">Print Timesheet</button>
                </div>
            </div>
            <div class="row">
                <h5 class="display-5 text-center">STI COLLEGE BALIUAG</h5>
                <h2 class="text-center">---------------- FACULTY TIME SHEET ----------------</h2>
            </div>
            <div class="row">

                <div class="col-6">
                    <label class="form-label fw-bold">Faculty Name: </label><asp:Label ID="lblFacultyName" runat="server" CssClass="fw-bold"></asp:Label>
                </div>
                <div class="col-6 text-end">
                    <label class="form-label fw-bold">Period Covered: </label><asp:Label ID="lblPeriodCovered" runat="server" CssClass="fw-bold"></asp:Label>
                </div>

            </div>
            <div>
                <asp:GridView ID="gvTimeSheet" runat="server" AutoGenerateColumns="False" CssClass="table table-responsive table-bordered border-dark text-center">
                    <Columns>
                        <asp:BoundField DataField="tc_code" HeaderText="TC Code" />
                        <asp:BoundField DataField="subject" HeaderText="Course / Subject" />
                        <asp:BoundField DataField="schedule" HeaderText="Schedule" />
                        <asp:BoundField DataField="day" HeaderText="Day" />
                        <asp:BoundField DataField="col_1_16" HeaderText="1 / 16"/>
                        <asp:BoundField DataField="col_2_17" HeaderText="2 / 17" />
                        <asp:BoundField DataField="col_3_18" HeaderText="3 / 18" />
                        <asp:BoundField DataField="col_4_19" HeaderText="4 / 19" />
                        <asp:BoundField DataField="col_5_20" HeaderText="5 / 20" />
                        <asp:BoundField DataField="col_6_21" HeaderText="6 / 21" />
                        <asp:BoundField DataField="col_7_22" HeaderText="7 / 22" />
                        <asp:BoundField DataField="col_8_23" HeaderText="8 / 23" />
                        <asp:BoundField DataField="col_9_24" HeaderText="9 / 24" />
                        <asp:BoundField DataField="col_10_25" HeaderText="10 / 25" />
                        <asp:BoundField DataField="col_11_26" HeaderText="11 / 26" />
                        <asp:BoundField DataField="col_12_27" HeaderText="12 / 27" />
                        <asp:BoundField DataField="col_13_28" HeaderText="13 / 28" />
                        <asp:BoundField DataField="col_14_29" HeaderText="14 / 29" />
                        <asp:BoundField DataField="col_15_30" HeaderText="15 / 30" />
                        <asp:BoundField DataField="col_31" HeaderText="31" />
                        <asp:BoundField DataField="total_hours" HeaderText="Total Hours" />
                    </Columns>
                    <EmptyDataTemplate>
                        <h6 class="text-warning">No record found</h6>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
            
            <table class="table table-responsive table-bordered border-dark text-center">
                <tr>
                    <td colspan="20" class="text-end"><h5>TOTAL HOURS</h5></td>
                    <td colspan="1"  class="text-end"><asp:label id="lblGrandTotal" runat="server">0</asp:label></td>
                </tr>
                <tr class="text-end">
                    <td colspan="19" rowspan="2"><h3>Deduction</h3></td>
                    <td colspan="1">Late / Undertime</td>
                    <td colspan="1"></td>
                </tr>
                <tr>
                    <td colspan="1" class="text-end">Absenses</td>
                    <td colspan="1"></td>
                </tr>
                <tr class="text-end">
                    <td colspan="20"><h3>TOTAL TERTIARY</h3></td>
                    <td colspan="1"></td>
                </tr>
            </table>

            <table class="table table-responsive table-bordered border-dark text-center">
                <tr>
                    <td>
                        <h3>Prepared by:</h3>
                        <asp:Label ID="lblInstructorName" runat="server">(Name)</asp:Label>
                        <br />
                        <span>Instructor</span>
                    </td>
                    <td>
                        <h3>Checked by:</h3>
                        <asp:Label ID="Label1" runat="server">Ms. Julie Ann C. De Lara</asp:Label>
                        <br />
                        <span>HR Officer</span>
                    </td>
                    <td>
                        <h3>Recommending Approval:</h3>
                        <asp:Label ID="Label2" runat="server">Dr. Corazon R. Cruz</asp:Label>
                        <br />
                        <span>Academic Head</span>
                    </td>
                    <td>
                        <h3>Approved by:</h3>
                        <asp:Label ID="Label3" runat="server">Mrs. Rancy De Guzman-Yu</asp:Label>
                        <br />
                        <span>School Administrator</span>
                    </td>
                </tr>
            </table>

            <asp:HiddenField ID="hidBatchId" runat="server" />
            <asp:HiddenField ID="hidTotalHour" runat="server" />
        </div>
    </form>
    <div class="separator">&nbsp;</div>

    <script src="/../Views/js/scripts.js"></script>
    <script src="/../Views/js/bootstrap.bundle.min.js"></script>
    <script src="/../Views/js/all.min.js"></script>

</body>
</html>
