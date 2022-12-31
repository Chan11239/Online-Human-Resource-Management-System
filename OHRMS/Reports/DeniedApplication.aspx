<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeniedApplication.aspx.cs" Inherits="OHRMS.Reports.DeniedApplication" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Denied Application</h1>
            <br />
            <p>Dear <asp:Label ID="Label1" runat="server" Text="{Applicant Name}" />,</p>
            <br />
            <p>Greetings!</p>
            <br />
            <p>I am sorry to inform you that we cannot proceed with your application. Though we have seen your qualification, the job opportunity has been given to another applicant. We will still keep your record for future references.</p>
            <br />
            <p>Thank you, <asp:Label ID="Label2" runat="server" Text="{Applicant Name}" /></p>
            <br />
         
            <p><asp:Label ID="lblHROffice" runat="server" Text="{HR Officer}" /></p>
            <p>HR Officer-STI Baliuag</p>
        </div>
    </form>
</body>
</html>
