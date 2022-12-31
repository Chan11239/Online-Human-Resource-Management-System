<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmationOfApplication.aspx.cs" Inherits="OHRMS.Reports.ConfirmationOfApplication" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Confirmation of Application</h1>
            <br />
            <p>Dear {ApplicantName},</p>
            <br />
            <p>Greetings!</p>
            <br />
            <p>We have received your application. Thank you for your interest to be part of our institution. Your application will be processed and reviewed for 3-7 days. If qualified, you will be receiving a phone call from our HR staff.</p>
            <br />
            <p>Again, thank you.</p>
            <br />
            <p>Regards,</p>
            <br />
            <p>{HROfficer}</p>
            <p>HR Officer- STI Baliuag</p>
        </div>
    </form>
</body>
</html>
