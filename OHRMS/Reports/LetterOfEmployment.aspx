<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LetterOfEmployment.aspx.cs" Inherits="OHRMS.Reports.LetterOfEmployment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Dear Mr./Ms. <asp:Label ID="Label1" runat="server" Text="{Applicant Name}" />, </h1>
            <br />
            <p>Congratulations!</p>
            <br />
            <p>We would like to welcome you at STI Baliuag. 
                Upon evaluating your application, 
                this confirms your appointment as 
                
                <asp:Label ID="lbPosition" runat="server" Text="{Position}" /> starting
                
                <asp:Label ID="lbHiredDate" runat="server" Text="{Hired Date}" />. 
                
                Please report in my office on <asp:Label ID="lbAppointmentDate" runat="server" Text="{Appointment Date}" /> to attend an employment orientation.</p>
            <br />
            <p>Bring the following requirements:</p>
            <br />
            <p>a. Latest Resume with 2x2 ID Picture</p>
            <p>b. 3 copies of 2x2 picture</p>
            <p>d. TOR</p>
            <p>e. Diploma</p>
            <p>f. Certificates (PRC, TESDA, etc.)</p>
            <p>g. Certificate of Employment from Previous Employer</p>
            <p>h.	Community Tax Certificate</p>
            <p>i.	SSS (E1 Form/SSS ID)</p>
            <p>j.	Philhealth Reg. Form/ ID</p>
            <p>k.	PAG-IBIG Form/ID</p>
            <p>l.	TIN (1902/ID)</p>
            <p>m.	X-Ray Medical Result</p>
            <p>n.	Medical Health Card</p>
            <br />

            <p>If you have any question, you may contact me at (044) 766-6722.</p>
            <br />
            <p>Thank you,</p>

            <p><asp:Label ID="lblHROffice" runat="server" Text="{HR Officer}" /></p>
            <p>HR Officer-STI Baliuag</p>
        </div>
    </form>
</body>
</html>
