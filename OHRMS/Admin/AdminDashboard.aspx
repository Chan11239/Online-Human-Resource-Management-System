<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPanel.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="OHRMS.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <h1 class="text" style="position: relative; left: 15px; font-size: 30px; color: rgb(0, 191, 255);">Dashboard</h1>

    <hr />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="dashboard-memo">
                    <h3>Memo</h3>
                    <a href="Announcement.aspx">
                        <i class='bx bx-plus'></i>
                    </a>
                    <hr />
                    <br />
                    <div class="data">
                        <asp:PlaceHolder ID="placeholder1" runat="server"></asp:PlaceHolder>
                    </div>
                </div>

                <br />
                <br />
                <div class="dashboard-Announce">
                    <h3>Announcement</h3>
                    <a href="Announcement.aspx">
                        <i class='bx bx-plus'></i>
                    </a>
                    <hr />
                    <br />
                    <div class="data">
                        <asp:PlaceHolder ID="placeholder2" runat="server"></asp:PlaceHolder>
                    </div>
                </div>
                <div class="side-admin">
                    <div class="side-calendar">
                        <asp:Calendar ID="clndr_dash" runat="server" CssClass="calendar-admin" BackColor="White" BorderColor="White" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="269px" NextPrevFormat="FullMonth" Width="300px">
                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                            <TitleStyle BackColor="White" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                            <TodayDayStyle BackColor="#CCCCCC" />
                        </asp:Calendar>
                    </div>
                    <br />
                    <div class="side-todo">
                        <h3>To-do</h3>
                        <a href="#">
                            <i class='bx bx-plus'></i>
                        </a>
                        <hr />

                    </div>
                    <br />
                    <div class="side-dtr">
                        <h3>DTR</h3>
                        <a href="#">
                            <i class='bx bx-show'></i>
                        </a>
                        <hr />
                    </div>
                </div>
                <br />
                <br />
                <div class="table-emp-admin">
                    <h3>Employee</h3>
                    <a href="#">
                        <i class='bx bx-plus'></i>
                    </a>
                    <hr />
                    <asp:GridView ID="gvDashEmp" runat="server" Width="90" HorizontalAlign="Center" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333">
                        <Columns>
                            <asp:BoundField DataField="Emp_ID" HeaderText="Employee ID" />
                            <asp:BoundField DataField="Emp_Name" HeaderText="Fullname" />
                            <asp:BoundField DataField="Emp_Position" HeaderText="Position" />
                            <asp:BoundField DataField="Emp_Department" HeaderText="Department" />
                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                        <AlternatingRowStyle BackColor="#FFCC66" />
                    </asp:GridView>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
