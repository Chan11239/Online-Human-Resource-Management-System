<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefaultPage.aspx.cs" Inherits="OHRMS.DefaultPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title><%: Page.Title %>OHRMS - STI College Baliuag</title>

    <%--<link rel="icon" href="../images/favicon.ico" type="image/ico" />--%>

    <link href="Views/css/styles.css" rel="stylesheet" />

</head>
<body>

    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-primary shadow">
        <a class="navbar-brand ps-3" href="#">
            <img src="Views/assets/ohrms-logo.png" alt="" height="55" />
        </a>

        <div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <ul class="nav justify-content-end">
                <li class="nav-item">
                    <a class="nav-link link-light" aria-current="page" href="#">FAQ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link link-light" href="#" data-bs-toggle="modal" data-bs-target="#modalLogin">Login</a>
                </li>
                <li class="nav-item">
                    <div><a class="nav-link link-light" href="Applicants/JobListing.aspx">Applicants</a></div>
                </li>
            </ul>
        </div>
    </nav>

    <div id="carouselHome" class="carousel slide carousel-fade" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="Images/slide01.jpg" class="d-block w-100" alt="OHRMS" />
            </div>
            <div class="carousel-item">
                <img src="Images/slide02.jpg" class="d-block w-100" alt="OHRMS" />
            </div>
            <div class="carousel-item">
                <img src="Images/slide03.jpg" class="d-block w-100" alt="OHRMS" />
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselHome" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselHome" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>


    <form id="form1" runat="server">
        <div class="modal fade" id="modalLogin" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Login</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="form-floating mb-3">
                            <asp:TextBox ID="txtUsername" runat="server" placeholder="Employee ID" CssClass="form-control"></asp:TextBox>
                            <label for="txtUsername">Employee Id</label>
                        </div>
                        <div class="form-floating mb-3">
                            <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            <label for="txtPassword">Password</label>
                        </div>
                        <div class="form-check mb-3">
                            <input class="form-check-input" id="inputRememberPassword" type="checkbox" value="" />
                            <label id="rmCheck" class="form-check-label" for="inputRememberPassword">Remember Password</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-primary" OnClick="btnLogin_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>

    <footer class="footer mt-auto py-3 fixed-bottom justify-content-center text-center bg-primary">
        <div class="container">
            <span class="text-light small">Copyright &copy; 2021 STI Baliuag All Rights Reserved</span>
        </div>
    </footer>

    <script src="Views/js/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    <script src="Views/js/scripts.js"></script>
</body>
</html>
