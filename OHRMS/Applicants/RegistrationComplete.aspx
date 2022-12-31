<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Applicant.Master" AutoEventWireup="true" CodeBehind="RegistrationComplete.aspx.cs" Inherits="OHRMS.Applicants.RegistrationComplete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-5 py-5 z-depth-1 bg-white">

        <!--Section: Content-->
        <section class="text-center px-md-5 mx-md-5 dark-grey-text">

            <div class="row mb-5">
                <div class="col-md-4 mx-auto">
                    <div class="view mb-4 pb-2">
                        <img src="https://mdbootstrap.com/img/illustrations/undraw_connected_world_wuay.svg" class="img-fluid" alt="smaple image">
                    </div>
                </div>
            </div>

            <h3 class="font-weight-bold mb-4 pb-2"><asp:Label ID="lblTitle" runat="server" Text="Notification"></asp:Label></h3>

            <p class="text-center mx-auto mb-4 pb-2">
                <asp:Label ID="lblMessage" runat="server" Text="You have reach the registration. Please register first your email to continue your application."></asp:Label>
            </p>

            <div id="lnkRegistration" runat="server">
                <a href="<%=Page.ResolveUrl("~/Applicants/Registration.aspx")%>" class="btn btn-deep-purple btn-rounded">Register</a>
            </div>

            <div id="lnkLogIn" runat="server">
                <a href="<%=Page.ResolveUrl("~/Applicants/Login.aspx")%>" class="btn btn-deep-purple btn-rounded">Login</a>
            </div>

        </section>
        <!--Section: Content-->

    </div>














<%--


    <div class="container mt-5 bg-white p-3 shadow">
        <div class="row text-start p-3">
            <h2 class="text-primary">Welcome</h2>
        </div>
        <div class="row">
            <h4></h4>
        </div>
        <div class="row">
            <p>
                
            </p>
        </div>
        <div class="row text-end" >
            <div id="lnkRegistration" runat="server"><a href="<%=Page.ResolveUrl("~/Applicants/Registration.aspx")%>">Go to Registration Page >> </a></div>
            <div id="lnkLogIn" runat="server"><a href="<%=Page.ResolveUrl("~/Applicants/Login.aspx")%>">Go to Log-In Page >> </a></div>
        </div>
    </div>--%>
</asp:Content>
