<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/sitemaster.Master" AutoEventWireup="true" CodeBehind="EmployeeDashboard.aspx.cs" Inherits="OHRMS.Employee.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="text" style="position: relative; left: 15px; font-size: 30px; color: rgb(0, 191, 255);">Dashboard</h1>
    <hr />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container jumbotron">
                <div class="welcome-box">
                    <h1>Welcome!</h1>
                    <p>"Great vision without great peole is irrelevant" -Jim Collins</p>
                    <asp:Label ID="lblName_dash" runat="server" Text="Name" CssClass="name_dash"></asp:Label>
                </div>
                <div class="side">
                    <div class="sidecalendar">
                        <asp:Calendar ID="clndremp" runat="server" CssClass="calendar-box" BackColor="White" BorderColor="White" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="269px" NextPrevFormat="FullMonth" Width="300px">
                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                            <TitleStyle BackColor="White" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                            <TodayDayStyle BackColor="#CCCCCC" />
                        </asp:Calendar>
                    </div>
                    <br />
                    <br />
                    <div class="side-announce">
                        <h4>Announcement</h4>
                        <hr />
                        <div class="data-emp">
                            <asp:PlaceHolder ID="placeholder1" runat="server"></asp:PlaceHolder>
                        </div>
                        <br />
                    </div>
                    <br />
                    <br />
                    <div class="timesheet-dash">
                        <h4>Timesheet</h4>
                        <a href="#">
                            <i class='bx bx-show'></i>
                        </a>
                        <hr />
                    </div>
                </div>
                <br />
                <br />
                <div class="sched">
                    <h4>Schedule</h4>
                    <a href="UpdateSchedule">
                        <i class='bx bx-plus'></i>
                    </a>
                    <hr />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
