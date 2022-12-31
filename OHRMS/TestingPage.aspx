<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestingPage.aspx.cs" Inherits="OHRMS.TestingPage" ValidateRequest="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="padding-top:20px">
            <asp:Label ID="lblAutoNumber" runat="server" Text="{Auto Number}"/>
            <br />
            <asp:TextBox ID="txtSuffix" runat="server"/>
            <asp:Button ID="btnAutoNumber" runat="server" Text="Auto Number Generate" OnClick="btnAutoNumber_Click" />
        </div>

        <div style="padding-top:20px">
            <iframe id="iframeReport" runat="server"></iframe>
            <br />
            <asp:TextBox ID="txtIFrameSouce" runat="server" Text="~/UploadFiles/Others/c2d1766546e311ecb2cdf44d3042f5ae.pdf"/>
            <asp:Button ID="btnShowIFrame" runat="server" Text="Show to iFrame" OnClick="btnShowIFrame_Click" />
        </div>

        <div style="padding-top:20px">
            <asp:TextBox ID="txtPageContentDisplay" runat="server" TextMode="MultiLine" Height="150px" Width="400px"/>
            <br />
            <asp:TextBox ID="txtUrl" runat="server" Text="/Reports/CallForInterview.html"/>
            <asp:Button ID="btnCallPageContent" runat="server" Text="Show to iFrame" OnClick="btnCallPageContent_Click" />
        </div>

    </form>
</body>
</html>
