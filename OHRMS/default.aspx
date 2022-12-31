<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="OHRMS.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <%--<meta content="initial-scale=1, shrink-to-fit=no, width=device-width" name="viewport" />--%>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>OHRMS - STI College Baliuag</title>
    <link rel="icon" type="image/x-icon" href="UI/img/favicon.ico" />

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

    <header>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top scrolling-navbar">
            <div class="container">
                <a class="navbar-brand" href="#">
                    <img src="UI/img/ohrms-logo.png" width="200" class="shadow"/>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-7"
                    aria-controls="navbarSupportedContent-7" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent-7">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link blue-text" href="/FAQ.aspx">FAQ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link blue-text" href="#" data-toggle="modal" data-target="#modalLoginForm">Employee Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link blue-text" href="/Applicants/JobListing.aspx">For Applicants</a>
                        </li>
                    </ul>
                </div>
                <div class="">
                    <a class="yt-ic mr-3" role="button" href="https://www.sti.edu/" target="_blank"><i class="fab fa-lg fa-internet-explorer"></i></a>
                    <a class="fb-ic mr-3" role="button" href="https://www.facebook.com/baliuag.sti.edu" target="_blank"><i class="fab fa-lg fa-facebook-f"></i></a>
                    <a class="tw-ic mr-3" role="button" href="https://twitter.com/sticollege" target="_blank"><i class="fab fa-lg fa-twitter"></i></a>
                    <a class="ins-ic mr-3" role="button" href="https://www.instagram.com/stidotedu/" target="_blank"><i class="fab fa-lg fa-instagram"></i></a>
                    <a class="yt-ic mr-3" role="button" href="https://youtube.com/user/STIdotEdu" target="_blank"><i class="fab fa-lg fa-youtube"></i></a>
                </div>
            </div>
        </nav>
        <!-- Navbar -->
        <!-- Full Page Intro -->
        <div class="view  jarallax" data-jarallax='{"speed": 0.2}' style="background-image: url('UI/img/gradient3.png'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
            <!-- Mask & flexbox options-->
            <div class="mask rgba-blue-slight d-flex justify-content-center align-items-center">
                <!-- Content -->
                <div class="container">
                    <!--Grid row-->
                    <div class="row wow fadeIn">
                        <!--Grid column-->
                        <div class="col-md-12 text-center">
                            <h3 class="display-4 font-weight-bold mb-0 pt-md-5 pt-5 wow fadeInUp">Be future-ready</h3>
                            <h1 class="display-3 font-weight-bold pt-md-5 pt-sm-2 pt-5 pb-md-5 pb-sm-3 pb-5 wow fadeInUp indigo-text" data-wow-delay="0.2s">Be STI</h1>
                            <div class="wow fadeInUp" data-wow-delay="0.4s">
                                <a href="#" class="btn btn-blue btn-rounded" data-toggle="modal" data-target="#modalLoginForm"><i class="fas fa-user left"></i>Employee Login</a>
                                <a href="/Applicants/JobListing.aspx" class="btn btn-blue btn-rounded"><i class="fas fa-book left"></i>Job Openings</a>
                            </div>
                        </div>
                        <!--Grid column-->
                    </div>
                    <!--Grid row-->
                </div>
                <!-- Content -->
            </div>
            <!-- Mask & flexbox options-->
        </div>
        <!-- Full Page Intro -->
    </header>
    <!-- Main navigation -->

    <form id="form1" runat="server">

        <div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <h4 class="modal-title w-100 font-weight-bold">Sign in</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body mx-3">
                        <div class="md-form mb-5">
                            <i class="fas fa-envelope prefix grey-text"></i>
                            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                            <label data-error="wrong" data-success="right" for="txtUserName">Your Employee Number</label>
                        </div>

                        <div class="md-form mb-4">
                            <i class="fas fa-lock prefix grey-text"></i>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" required="true"></asp:TextBox>
                            <label data-error="wrong" data-success="right" for="txtPassword">Your password</label>
                        </div>

                    </div>
                    <div class="d-flex justify-content-around mb-3">
                            <div>
                                <!-- Remember me -->
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="defaultLoginFormRemember"/>
                                    <label class="custom-control-label" for="defaultLoginFormRemember">Remember me</label>
                                </div>
                            </div>
                            <%--<div>
                                <!-- Forgot password -->
                                <a href="#">Forgot password?</a>
                            </div>--%>
                        </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-blue btn-rounded" OnClick="btnLogin_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>



    <!-- Footer -->
    <footer class="page-footer font-small blue darken-3">

        <!-- Footer Elements -->
        <div class="container">

            <!-- Grid row-->
            <div class="row">

                <!-- Grid column -->
                <div class="col-md-12 py-5">
                    <div class="mb-5 flex-center">

                        <!-- Official Site -->
                        <a class="fb-ic" href="https://www.sti.edu/" target="_blank">
                            <i class="fab fa-internet-explorer fa-lg white-text mr-md-5 mr-3 fa-2x"></i>
                        </a>
                        <!-- Facebook -->
                        <a class="fb-ic" href="https://www.facebook.com/baliuag.sti.edu" target="_blank">
                            <i class="fab fa-facebook-f fa-lg white-text mr-md-5 mr-3 fa-2x"></i>
                        </a>
                        <!-- Twitter -->
                        <a class="tw-ic" href="https://twitter.com/sticollege" target="_blank">
                            <i class="fab fa-twitter fa-lg white-text mr-md-5 mr-3 fa-2x"></i>
                        </a>
                        <!--Instagram-->
                        <a class="ins-ic" href="https://www.instagram.com/stidotedu/" target="_blank">
                            <i class="fab fa-instagram fa-lg white-text mr-md-5 mr-3 fa-2x"></i>
                        </a>
                        <!--Youtube-->
                        <a class="ins-ic" href="https://youtube.com/user/STIdotEdu" target="_blank">
                            <i class="fab fa-youtube fa-lg white-text mr-md-5 mr-3 fa-2x"></i>
                        </a>
                    </div>
                </div>
                <!-- Grid column -->

            </div>
            <!-- Grid row-->

        </div>
        <!-- Footer Elements -->

        <!-- Copyright -->
        <div class="footer-copyright text-center py-3">
            © 2021 Copyright:
    <a href="#">STI Baliuag OHRMS</a>
        </div>
        <!-- Copyright -->

    </footer>
    <!-- Footer -->

</body>
</html>
