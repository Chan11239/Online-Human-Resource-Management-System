<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Applicant.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OHRMS.Applicants.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-5 py-5 z-depth-1 bg-white">

        <!--Section: Content-->
        <section class="px-md-5 mx-md-5 text-center text-lg-left dark-grey-text">

            <!--Grid row-->
            <div class="row d-flex justify-content-center">

                <!--Grid column-->
                <div class="col-md-6">

                    <!-- Default form login -->
                    <div class="text-center" action="#!">

                        <p class="h4 mb-4">Sign in</p>

                        <!-- Email -->
                        <%--<input type="email" id="defaultLoginFormEmail" class="form-control mb-4" placeholder="E-mail">--%>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control mb-4" placeholder="E-mail"></asp:TextBox>

                        <!-- Password -->
                        <%--<input type="password" id="defaultLoginFormPassword" class="form-control mb-4" placeholder="Password">--%>

                        <div class="d-flex justify-content-around">
                            <div>
                                <!-- Remember me -->
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="defaultLoginFormRemember">
                                    <label class="custom-control-label" for="defaultLoginFormRemember">Remember me</label>
                                </div>
                            </div>
                            <%--<div>
                                <!-- Forgot password -->
                                <a href="#">Forgot password?</a>
                            </div>--%>
                        </div>

                        <!-- Sign in button -->
                        <%--<button class="btn btn-info btn-block my-4" type="submit">Sign in</button>--%>
                        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn btn-deep-purple btn-block my-4" />

                        <!-- Register -->
                        <p>
                            Not a member?
                            <a href="<%=Page.ResolveUrl("~/Applicants/Registration.aspx")%>">Register</a>
                        </p>

                    </div>
                    <!-- Default form login -->

                </div>
                <!--Grid column-->

            </div>
            <!--Grid row-->


        </section>
        <!--Section: Content-->

    </div>
</asp:Content>
