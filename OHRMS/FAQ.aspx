<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Applicant.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="OHRMS.FAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-5 py-5 bg-white z-depth-1">

        <!--Section: Content-->
        <section>

            <h6 class="font-weight-normal text-uppercase font-small grey-text mb-4 text-center">FAQ</h6>
            <!-- Section heading -->
            <h3 class="font-weight-bold black-text mb-4 pb-2 text-center">Frequently Asked Questions</h3>
            <hr class="w-header">
            <!-- Section description -->
            <p class="lead text-muted mx-auto mt-4 pt-2 mb-5 text-center">Got a question? We've got answers. If you have some other questions, see our support center.</p>

            <div class="row">
                <div class="col-md-12 col-lg-10 mx-auto mb-5">

                    <!--Accordion wrapper-->
                    <div class="accordion md-accordion" id="accordionEx" role="tablist" aria-multiselectable="true">

                        <!-- Accordion card -->
                        <div class="card border-top border-bottom-0 border-left border-right border-light">

                            <!-- Card header -->
                            <div class="card-header border-bottom border-light" role="tab" id="headingOne1">
                                <a data-toggle="collapse" data-parent="#accordionEx" href="#collapseOne1" aria-expanded="true"
                                    aria-controls="collapseOne1">
                                    <h5 class="black-text font-weight-normal mb-0">Employee Help <i class="fas fa-angle-down rotate-icon"></i>
                                    </h5>
                                </a>
                            </div>

                            <!-- Card body -->
                            <div id="collapseOne1" class="collapse show table-responsive" role="tabpanel" aria-labelledby="headingOne1"
                                data-parent="#accordionEx">
                                <div class="card-body">
                                    <asp:GridView ID="gvEmployee" runat="server" AutoGenerateColumns="False" ShowHeader="false" CssClass="table border table-responsive">
                                        <Columns>
                                            <asp:TemplateField HeaderText="FAQ Employee">
                                                <ItemTemplate>
                                                    <div>
                                                        <ul class="list-unstyled">
                                                            <li>
                                                                <h5><%# Eval("question") %></h5>
                                                                <p class="black-text"><%# Eval("answer") %></p>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EmptyDataTemplate>
                                            <h6 class="text-warning">No record found.</h6>
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                </div>
                            </div>

                        </div>
                        <!-- Accordion card -->

                        <!-- Accordion card -->
                        <div class="card border-bottom-0 border-left border-right border-light">

                            <!-- Card header -->
                            <div class="card-header border-bottom border-light" role="tab" id="headingTwo2">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx" href="#collapseTwo2"
                                    aria-expanded="false" aria-controls="collapseTwo2">
                                    <h5 class="black-text font-weight-normal mb-0">Applicant Help <i class="fas fa-angle-down rotate-icon"></i>
                                    </h5>
                                </a>
                            </div>

                            <!-- Card body -->
                            <div id="collapseTwo2" class="collapse table-responsive" role="tabpanel" aria-labelledby="headingTwo2"
                                data-parent="#accordionEx">
                                <div class="card-body">
                                    <asp:GridView ID="gvApplicant" runat="server" AutoGenerateColumns="False" ShowHeader="false" CssClass="table border table-responsive">
                                        <Columns>
                                            <asp:TemplateField HeaderText="FAQ Applicant">
                                                <ItemTemplate>
                                                    <div>
                                                        <ul class="list-unstyled">
                                                            <li>
                                                                <h5><%# Eval("question") %></h5>
                                                                <p class="black-text"><%# Eval("answer") %></p>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EmptyDataTemplate>
                                            <h6 class="text-warning">No record found.</h6>
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                </div>
                            </div>

                        </div>
                        <!-- Accordion card -->

                    </div>
                    <!-- Accordion wrapper -->

                </div>
            </div>

        </section>
    </div>

</asp:Content>
