<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NonTeachingTimeSheetPrint.aspx.cs" Inherits="OHRMS.Employees.NonTeachingTimeSheetPrint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Employee Timesheet</title>

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
        <div class="container clearfix" id="printableArea">
            <!--
            <h5 class="blue-text" style="padding-top: 50px;">TimeSheet Result</h5>
            <div class="divider"></div>
            <div style="text-align: center">
                <input type="button" onclick="printDiv('printableArea')" value="Print Schedule" /></div>
            <asp:Button ID="btnPrint" runat="server" OnClick="btnPrint_Click" Text="Print" />
            -->

            <div class="row text-right justify-content-end">
                <div class="mt-3">
                    <button type="button" class="btn btn-blue" onclick="printDiv('printableArea')">Print Timesheet</button>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <asp:HiddenField ID="hidBatchId" runat="server" />
                    <asp:HiddenField ID="hidTotalHour" runat="server" />
                    <h3 class="display-5 text-center">STI COLLEGE BALIUAG</h3>
                    <h4 class="text-center">---------------- STAFF TIME SHEET ----------------</h4>
                </div>

            </div>
            <div class="row mt-3">
                <div class="col-6">
                    <label class="form-label">STAFF: &nbsp;</label><asp:Label ID="lblFacultyName" runat="server" CssClass="font-weight-bold"></asp:Label>
                </div>
                <div class="col-6 text-right">
                    <label class="form-label">Date Covered: &nbsp;</label><asp:Label ID="lblPeriodCovered" runat="server" CssClass="font-weight-bold"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col table-responsive">
                    <asp:GridView ID="gvTimeSheet" runat="server" AutoGenerateColumns="False" CssClass="table border" ShowFooter="true">
                        <Columns>
                            <%--<asp:BoundField DataField="tc_code" HeaderText="" />--%>
                            <asp:BoundField DataField="" HeaderText="" />
                            <asp:BoundField DataField="inOutTag" HeaderText="In / Out" />
                            <asp:BoundField DataField="employeeTimeLog" HeaderText="Date / Time" />
                            <asp:BoundField DataField="scheduleTimeLog" HeaderText="Office Hours" />
                            <asp:BoundField DataField="OverTime" HeaderText="OT" />
                            <asp:BoundField DataField="UnderTime" HeaderText="UT" />
                            <asp:BoundField DataField="late" HeaderText="Late" />
                            <asp:BoundField DataField="recordedDate" HeaderText="Day" />
                        </Columns>
                        <EmptyDataTemplate>
                            <h6 class="text-warning">No record(s) found.</h6>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

            <div class="row">
                <div class="col table-responsive">
                    <table class="table border table-bordered">
                        <tr>
                            <td>OT</td>
                            <td>0</td>
                            <td>Prev. OT</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td>UT</td>
                            <td>0</td>
                            <td>Prev. UT</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td>Name</td>
                            <td colspan="3"><asp:Label ID="lblInstructorName" runat="server"></asp:Label></td>
                            
                        </tr>
                        <tr>
                            <td colspan="1">Total Number of Days</td>
                            <td colspan="3"></td>
                        </tr>
                        <tr>
                            <td>Total Overtime</td>
                            <td class="text-center">0</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Total Late</td>
                            <td class="text-center">0</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="1">Prev.Remaining Leave</td>
                            <td colspan="1" class="text-center">0</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">Total Acc. Leave this period</td>
                            <td colspan="1" class="text-center">0</td>
                        </tr>
                        <tr>
                            <td colspan="3">Total Remaining Leave</td>
                            <td colspan="1" class="text-center">0</td>
                        </tr>
                        <tr>
                            <td>On Duty</td>
                            <td colspan="3" class="text-right">10</td>
                        </tr>
                        <tr>
                            <td>Holiday</td>
                            <td colspan="3" class="text-right">0</td>
                        </tr>
                        <tr>
                            <td>Leave</td>
                            <td colspan="3" class="text-right">0</td>
                        </tr>
                        <tr>
                            <td>Total Number of Days</td>
                            <td colspan="3" class="text-right">9</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
