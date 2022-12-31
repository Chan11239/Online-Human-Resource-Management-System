<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Applicant.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="OHRMS.Applicants.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-5 py-5 z-depth-1 bg-white">

 
    <!--Section: Content-->
    <section class="px-md-5 mx-md-5 text-center text-lg-left dark-grey-text">


      <!--Grid row-->
      <div class="row d-flex justify-content-center">

        <!--Grid column-->
        <div class="col-md-6">

          <!-- Default form register -->
          <div class="text-center" action="#!">

            <p class="h4 mb-4">Register</p>

            <div class="form-row mb-4">
              <div class="col">
                <!-- First name -->
                <%--<input type="text" id="defaultRegisterFormFirstName" class="form-control" placeholder="First name">--%>
                  <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="First name" required="true"></asp:TextBox>
              </div>
              <div class="col">
                <!-- Last name -->
                <%--<input type="text" id="defaultRegisterFormLastName" class="form-control" placeholder="Last name">--%>
                  <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Last name" required="true"></asp:TextBox>
              </div>
            </div>

            <!-- E-mail -->
            <%--<input type="email" id="defaultRegisterFormEmail" class="form-control mb-4" placeholder="E-mail">--%>
              <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="E-mail" required="true"></asp:TextBox>

            <!-- Sign up button -->
            <%--<button class="btn btn-info my-4 btn-block" type="submit">Sign in</button>--%>
              <asp:Button ID="btnSignUp" runat="server" Text="Register" OnClick="btnSignUp_Click" CssClass="btn btn-blue"/>

            <hr>

            <!-- Terms of service -->
            <p>By clicking
              <em>Sign up</em> you agree to our
              <a href="#" target="_blank">terms of service</a>

          </div>
          <!-- Default form register -->

        </div>
        <!--Grid column-->

      </div>
      <!--Grid row-->


    </section>
    <!--Section: Content-->

  </div>

</asp:Content>
