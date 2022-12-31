<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="OHRMS.Admin.Dashboard" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MemoList" runat="server">
    <asp:GridView ID="gvMemorandum" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvMemorandum_SelectedIndexChanged" CssClass="table  table-hover table-responsive">
        <Columns>
            <%--<asp:TemplateField HeaderText="Memos">--%>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="lblMemoNo" runat="server" Width="80px" Text='<%# Eval("memoNumber") %>'></asp:Label>
                    <asp:Label ID="lblMessage" runat="server" Width="150px" Text='<%# Eval("message") %>'></asp:Label>
                    <asp:Label ID="lblAsOfDate" runat="server" Width="150px" Text='<%# Eval("asOfDate","{0:dd-MMM-yyyy}") %>'></asp:Label>
                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                    <asp:LinkButton ID="lbtnView" runat="server" CausesValidation="False" CommandName="Select" Text=">" Style="width: 20px; padding-right: 10px; padding-left: 10px"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <h3>Memorandum</h3>
        </EmptyDataTemplate>
    </asp:GridView>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="AnnounceList" runat="server">
        <asp:GridView ID="gvAnnouncement" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvAnnouncement_SelectedIndexChanged" CssClass=" table  table-hover table-responsive">
            <Columns>
                <%--<asp:TemplateField HeaderText="Announcement">--%>
                    <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label ID="lblTitle" runat="server" Width="80px" Text='<%# Eval("title") %>'></asp:Label>
                        <asp:Label ID="lblMessage" runat="server" Width="150px" Text='<%# Eval("message") %>'></asp:Label>
                        <asp:Label ID="lblEndDate" runat="server" Width="150px" Text='<%# Eval("endDate","{0:dd-MMM-yyyy}") %>'></asp:Label>
                        <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                        <asp:LinkButton ID="lbtnView" runat="server" CausesValidation="False" CommandName="Select" Text=">" Style="width: 20px; padding-right: 10px; padding-left: 10px"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <h3>Announcement</h3>
            </EmptyDataTemplate>
        </asp:GridView>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="TodoList" runat="server">
    <div class="side-dtr">
        <h3>To Do</h3>
        <a href="#">
            <i class='bx bx-show'></i>
        </a>
        <hr />
    </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="DTRList" runat="server">
    <div class="side-dtr">
        <h3>DTR</h3>
        <a href="#">
            <i class='bx bx-show'></i>
        </a>
        <hr />
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="DashCal" runat="server">
    <div id="cal-container">
        <div class="side-calendar z-depth-2">
            <asp:Calendar ID="clndr_dash" runat="server" CssClass="calendar-admin" BackColor="White" BorderColor="White" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="269px" NextPrevFormat="FullMonth" Width="300px">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="White" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                <TodayDayStyle BackColor="#CCCCCC" />
            </asp:Calendar>
        </div>
    </div>
</asp:Content>



