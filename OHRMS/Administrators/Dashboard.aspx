<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="OHRMS.Administrators.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container-fluid my-3 clearfix">
        <div class="card">
            <div class="card-body">

                <div class="row">
                    <div class="col-lg-3 col-md-12 col-sm-12">
                        <div class="card-body text-center blue-gradient-rgba">
                            <div id="clock">
                                <h6 id="time" style="text-shadow: 0px 0px 3px;" class="white-text"></h6>
                                <h6 id="date" style="text-shadow: 0px 0px 3px;" class="white-text"></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-12 col-sm-12">
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
                                <div class="carousel-item active">
                                    <blockquote class="blockquote mb-0">
                                        <p>Do not look for something that was not in the plan, you will never find it.</p>
                                        <footer class="blockquote-footer">Anonymous <cite title="Source Title"></cite></footer>
                                    </blockquote>
                                </div>
                                <div class="carousel-item">
                                    <blockquote class="blockquote mb-0">
                                        <p>A good mentor will not look for something that was not discussed.</p>
                                        <footer class="blockquote-footer">Anonymous <cite title="Source Title"></cite></footer>
                                    </blockquote>
                                </div>
                                <div class="carousel-item">
                                    <blockquote class="blockquote mb-0">
                                        <p>If it's not in the document, it does not exists.</p>
                                        <footer class="blockquote-footer">Anonymous <cite title="Source Title"></cite></footer>
                                    </blockquote>
                                </div>
                                <!--First slide-->
                                <div class="carousel-item">
                                    <blockquote class="blockquote mb-0">
                                        <p>A whip will never earn respect but guidance will.</p>
                                        <footer class="blockquote-footer">Anonymous <cite title="Source Title"></cite></footer>
                                    </blockquote>
                                </div>
                                <!--/First slide-->
                                <!--Second slide-->
                                <div class="carousel-item">
                                    <blockquote class="blockquote mb-0">
                                        <p>Only a fool will look for something that was not part of the original plan.</p>
                                        <footer class="blockquote-footer">Anonymous <cite title="Source Title"></cite></footer>
                                    </blockquote>
                                </div>
                                <div class="carousel-item">
                                    <blockquote class="blockquote mb-0">
                                        <p>A good mentor is one that will never lead their students astray.</p>
                                        <footer class="blockquote-footer">Anonymous <cite title="Source Title"></cite></footer>
                                    </blockquote>
                                </div>
                                <!--/Second slide-->
                                <!--Third slide-->
                                <div class="carousel-item">
                                    <blockquote class="blockquote mb-0">
                                        <p>Nobody started knowing everything, we all started from nothing. That's why there are teachers.</p>
                                        <footer class="blockquote-footer">Anonymous <cite title="Source Title"></cite></footer>
                                    </blockquote>
                                </div>
                                <!--/Third slide-->
                                <!--Fourth slide-->
                                <div class="carousel-item">
                                    <blockquote class="blockquote mb-0">
                                        <p>A good mentor will never demoralize a trying student.</p>
                                        <footer class="blockquote-footer">Anonymous <cite title="Source Title"></cite></footer>
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

                <div class="dropdown-divider">
                </div>
                <div class="row bg-light">&nbsp;</div>

                <div class="row mt-2">
                    <div class="col">
                        <div class="card-header">
                            <h5>Calendar</h5>
                        </div>
                        <div class="card-body">
                            <div class="col table table-responsive">
                                <asp:Calendar ID="clndr_dash" runat="server" CssClass="table table-hover border" BackColor="White" BorderColor="White" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" NextPrevFormat="FullMonth">
                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                    <TitleStyle BackColor="White" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                    <TodayDayStyle BackColor="#CCCCCC" />
                                </asp:Calendar>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card-header">
                            <div class="row">
                                <div class="col">
                                    <h5>To do</h5>
                                </div>
                                <div class="col text-right">
                                    <a href="<%=Page.ResolveUrl("~/Administrators/ToDoForm.aspx")%>" class="red-text" tabindex="-1" role="button"><i class="far fa-calendar-plus"></i></a>
                                </div>
                            </div>
                            
                        </div>
                        <div class="card-body">
                            <div class="col table table-responsive">
                                <asp:GridView ID="gvToDo" runat="server" AutoGenerateColumns="False" CssClass="table table-hover border">
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
                    </div>
                    <div class="col">
                        <div class="card-header">
                            <div class="row">
                                <div class="col">
                                    <h5>Announcement</h5>
                                </div>
                                <div class="col text-right">
                                    <a href="<%=Page.ResolveUrl("~/Admin/Announcement/Create.aspx")%>" class="red-text" tabindex="-1" role="button"><i class="far fa-calendar-plus"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="col table table-responsive">
                                <asp:GridView ID="gvAnnouncement" runat="server" AutoGenerateColumns="False" CssClass="table table-hover border">
                                    <Columns>
                                        <asp:BoundField DataField="title" HeaderText="Title" />
                                        <asp:BoundField DataField="message" HeaderText="Message" />
                                        <asp:BoundField DataField="endDate" HeaderText="Period Until" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <h6 class="text-warning">No accouncement for today.</h6>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card-header">
                            <div class="row">
                                <div class="col">
                                    <h5>Memorandum</h5>
                                </div>
                                <div class="col text-right">
                                    <a href="<%=Page.ResolveUrl("~/Admin/Memorandum/Create.aspx")%>" class="red-text" tabindex="-1" role="button"><i class="far fa-calendar-plus"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="col table table-responsive">
                                <asp:GridView ID="gvMemorandum" runat="server" AutoGenerateColumns="False" CssClass="table table-hover border">
                                    <Columns>
                                        <asp:BoundField DataField="asOfDateFormated" HeaderText="Date Issued" />
                                        <asp:BoundField DataField="memoNumber" HeaderText="No." />
                                        <asp:BoundField DataField="subject" HeaderText="Subject" />
                                        <asp:BoundField DataField="message" HeaderText="Message" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <h6 class="text-warning">No memorandum for today.</h6>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <%--Card Ends--%>
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
