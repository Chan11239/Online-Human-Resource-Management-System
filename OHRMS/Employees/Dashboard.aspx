<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Employee.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="OHRMS.Employees.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container-fluid my-3 p-3">

        <%--<asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Post Job" OnClick="btnSubmit_Click" />--%>

        <div class="card mb-2">
            <div class="card-header">
                <h4 class="">Welcome!</h4>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-4">
                        <h5 class="responsive-font-size blue-text">Hello
                    <asp:Label ID="lblEmployeeName" runat="server" Text="XXXXX, XXXXX"></asp:Label></h5>
                        <div id="clock" class="text-center blue-gradient-rgba py-2 shadow">
                            <h6 id="time" style="text-shadow: 0px 0px 3px;" class="white-text"></h6>
                            <h6 id="date" style="text-shadow: 0px 0px 3px;" class="white-text"></h6>
                        </div>
                    </div>
                    <div class="col-8">
                        <!--Carousel Wrapper-->
                        <div id="carousel-example-1z" class="carousel slide carousel-fade" data-ride="carousel">
                            <!--Indicators-->
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-1z" data-slide-to="1"></li>
                                <li data-target="#carousel-example-1z" data-slide-to="2"></li>
                            </ol>
                            <!--/.Indicators-->
                            <!--Slides-->
                            <div class="carousel-inner" role="listbox">
                                <!--First slide-->
                                <div class="carousel-item active">
                                    <blockquote class="blockquote mb-0">
                                        <p>The art of reading and studying consists in remembering the essentials and forgetting what is not essential.</p>
                                        <footer class="blockquote-footer">Adolf Hitler <cite title="Source Title">Mein Kampf</cite></footer>
                                    </blockquote>
                                </div>
                                <!--/First slide-->
                                <!--Second slide-->
                                <div class="carousel-item">
                                    <blockquote class="blockquote mb-0">
                                        <p>You can always be better.</p>
                                        <footer class="blockquote-footer">Tiger Woods <cite title="Source Title"></cite></footer>
                                    </blockquote>
                                </div>
                                <!--/Second slide-->
                                <!--Third slide-->
                                <div class="carousel-item">
                                    <blockquote class="blockquote mb-0">
                                        <p>Knowing yourself is the beginning of all wisdom.</p>
                                        <footer class="blockquote-footer">Aristotle <cite title="Source Title"></cite></footer>
                                    </blockquote>
                                </div>
                                <!--/Third slide-->
                                <!--Fourth slide-->
                                <div class="carousel-item">
                                    <blockquote class="blockquote mb-0">
                                        <p>There is no substitute for hard work.</p>
                                        <footer class="blockquote-footer">Thomas Edison <cite title="Source Title"></cite></footer>
                                    </blockquote>
                                </div>
                                <!--/Fourth slide-->
                            </div>
                            <!--/.Slides-->
                            <!--Controls-->
                            <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                            <!--/.Controls-->
                        </div>
                        <!--/.Carousel Wrapper-->
                    </div>
                </div>

                <div class="dropdown-divider"></div>
                <div class="row bg-light">&nbsp;</div>

                <div class="row mt-3">
                    <div class="col mt-2">
                        <div class="card-header">
                            Calendar
                        </div>
                        <div class="card-body">
                            <asp:Calendar ID="clndrEmployee" BorderStyle="None" runat="server" BackColor="White" BorderColor="White" Width="100%">
                                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                <TodayDayStyle BackColor="#CCCCCC" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                                <DayStyle Font-Size="11pt" />
                                <TitleStyle BackColor="White" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                            </asp:Calendar>
                        </div>
                    </div>

                    <div class="col mt-2">
                        <div class="card-header">
                            <div class="row">
                                <div class="col">
                                    To do
                                </div>
                                <div class="col justify-content-end text-right"><a href="<%=Page.ResolveUrl("~/Employees/ToDoForm.aspx")%>" class="red-text" tabindex="-1" role="button"><i class="far fa-calendar-plus"></i>  Add New</a></div>
                            </div>
                        </div>
                        <div class="card-body table table-responsive table-borderless">
                            <asp:GridView ID="gvToDo" runat="server" AutoGenerateColumns="False" ShowHeader="false" CssClass="table table-hover border">
                                <Columns>
                                    <asp:BoundField DataField="title" HeaderText="Title" />
                                    <asp:BoundField DataField="message" HeaderText="Message" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <h6 class="text-warning">No task for today.</h6>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>

                    <div class="col mt-2">
                        <div class="card-header">
                            Schedule
                        </div>
                        <div class="card-body table-responsive">
                            <asp:GridView ID="gvSchedule" runat="server" AutoGenerateColumns="False" ShowHeader="false" CssClass="table table-hover border">
                                <Columns>
                                    <asp:BoundField DataField="subjectName" HeaderText="Subject" />
                                    <asp:BoundField DataField="periodFrom" HeaderText="Period From" />
                                    <asp:BoundField DataField="periodTo" HeaderText="Period To" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <h6 class="text-warning">No schedule for today.</h6>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>

                    <div class="col mt-2">
                        <div class="card-header">
                            Announcements
                        </div>
                        <div class="card-body table-responsive">
                            <asp:GridView ID="gvAnnouncement" runat="server" AutoGenerateColumns="False" ShowHeader="false" CssClass="table table-hover border">
                                <Columns>
                                    <asp:BoundField DataField="title" HeaderText="Title" />
                                    <asp:BoundField DataField="message" HeaderText="Message" />
                                    <asp:BoundField DataField="endDate" HeaderText="Period Until" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <h6 class="text-warning">No announcement for today.</h6>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>

                </div>

            </div>
            <%--Card-Body End--%>
        </div>
    </div>

    <script>
        window.setInterval(ut, 1000);

        function ut() {
            var d = new Date();
            document.getElementById("time").innerHTML = d.toLocaleTimeString();
            document.getElementById("date").innerHTML = d.toLocaleDateString();
        }
    </script>
</asp:Content>
