<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListOfEmployees.aspx.cs" Inherits="OHRMS.Reports.ListOfEmployees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Employee Records</h1>
    <table>
        <tr>
            <td>
                <b>Picture</b>
            </td>

            <th>
                Employee ID
            </th>

            <th>
                Employee Name
            </th>

            <th>
                Department
            </th>
            
            <th>
                Position
            </th>
       </tr>

       <tr>
       <td><asp:Label ID="lblEmpListPi" runat="server" Text="{Picture}"></asp:Label></td>

       <td><asp:Label ID="lblEmpListEmpI" runat="server" Text="{Employee ID}"></asp:Label></td>

       <td><asp:Label ID="lblEmpListEmpNam" runat="server" Text="{Employee Name}"></asp:Label></td>

       <td><asp:Label ID="lblEmpListEmpDepartmen" runat="server" Text="{Department}"></asp:Label></td>

       <td><asp:Label ID="lblEmpListEmpPositio" runat="server" Text="{Position}"></asp:Label></td>
       </tr>
    </table>
<style>
    table, th, td {
    border: 2px solid rgb(112, 81, 81);
    margin-left: auto;
    margin-right: auto;
    border-collapse: collapse;
  }

html{
    font-family: Arial, Helvetica, sans-serif;
    }
</style>
        </div>
    </form>
</body>
</html>
