<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPanel.Master" AutoEventWireup="true" CodeBehind="faqMaintenance.aspx.cs" Inherits="OHRMS.Admin.WebForm6" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <asp:ScriptManager ID="ScriptManagerBody" runat="server" />
    <style>
        label {
            font-size: 14px;
        }

        .answerText {
            resize: none;
            height: 100px;
        }

        .dropdown {
            position: relative;
            font-size: 14px;
            left: 15px;
            border: none;
            width: 100%;
            border-bottom: 1px solid;
            background-color: black;
            width: 150px;
        }
    </style>
    <div class="container-fluid z-depth-3 mt-5">
        <div class="row">
            <div class="col-12 left">
                <h3 class="blue-text text-lighten-2">FAQ Maintenance</h3>
            </div>
        </div>

        <div class="container">
            <table class="table highlight striped">
                <tr>
                    <td style="width: 18%;">
                        <label class="blue-text text-lighten-2">Group: </label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlGroup" runat="server" CssClass="form-select dropdown">
                            <asp:ListItem Text="Select Option" Value="value1"></asp:ListItem>
                            <asp:ListItem Text="Employee Help" Value="Employee Help"></asp:ListItem>
                            <asp:ListItem Text="Applicant Help" Value="Applicant Help"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 18%;">
                        <label class="blue-text text-lighten-2">Question: </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtQuestion" runat="server" CssClass="textbox-EmpMaintenance"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 18%;">
                        <label class="blue-text text-lighten-2">Answer: </label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAnswer" runat="server" CssClass="answerText" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn waves-effect waves-light btn-flat blue white-text right" OnClick="btnSave_Click" />
        </div>
    </div>
</asp:Content>
