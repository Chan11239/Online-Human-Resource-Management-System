<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPanel.Master" AutoEventWireup="true" CodeBehind="Applicantsx.aspx.cs" Inherits="OHRMS.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <div class="container">

    <%--<h1 class="text" style="position: relative; left: 15px; font-size: 30px; color: rgb(0, 191, 255);">Applicants</h1>--%>

    <div class="row">
        <div class="col-12 left">
            <h3 class="blue-text lighten-4">Applicants</h3>
        </div>
    </div>
    <hr />

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
        <ContentTemplate>
            <div class="container-fluid z-depth-3">
                    <div class="separator"></div>
                    <%--<h3>Applicant Management</h3>--%>
                    <div class="container-fluid">
                        <h4 class="blue-text">New Applicants</h4>
                        <asp:Repeater ID="rptr_NewApplicant" runat="server" OnItemCommand="rptr_NewApplicant_ItemCommand" OnItemDataBound="rptr_NewApplicant_ItemDataBound">
                            <HeaderTemplate>
                                <table class="striped highlight responsive-table centered">
                                    <tr>
                                        <td width="500px">
                                            <label>Name</label>
                                        </td>
                                        <td style="width: 150px; text-align: center;">
                                            <label>Job Title</label>
                                        </td>
                                        <td style="width: 150px; text-align: center;">
                                            <label>CV/Resume</label>
                                        </td>
                                        <td style="width: 200px; text-align: center;">
                                            <label>Initial Interview</label>
                                        </td>
                                        <td style="width: 200px; text-align: center;">
                                            <label>Teaching Demo</label>
                                        </td>
                                        <td style="width: 200px; text-align: center;">
                                            <label>Examination</label>
                                        </td>
                                        <td style="width: 200px; text-align: center;">
                                            <label>Final Interview</label>
                                        </td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                            <tr>
                                <td style="text-align: center;">
                                    <asp:Label ID="lblName" runat="server" CssClass="label-app" Text='<%# Eval("Name") %>' ></asp:Label>
                                </td>
                                <td style="text-align: center;" >
                                    <asp:Label ID="lblJob" runat="server" CssClass="label-app" Text='<%# Eval("JobTitle") %>' ></asp:Label>
                                </td>
                                <td style="text-align: center;">
                                    <asp:LinkButton ID="lnkResume" runat="server" Text="View" CommandName="View" CommandArgument='<%# Eval("UserID") %>' CausesValidation="False"></asp:LinkButton>
                                </td>
                                <td style="text-align: center;">
                                    <asp:DropDownList ID="drpdwnInitial" runat="server">
                                    </asp:DropDownList>
                                </td>
                                <td style="text-align: center;">
                                    <asp:DropDownList ID="drpdwnDemo" runat="server" >
                                    </asp:DropDownList>
                                </td>
                                <td style="text-align: center;">
                                    <asp:DropDownList ID="drpdwnExam" runat="server">
                                    </asp:DropDownList>
                                </td>
                                <td style="text-align: center;">
                                    <asp:DropDownList ID="drpdwnFinal" runat="server">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Button ID="btnOk" runat="server" Text="Done" CssClass="white-text btn waves-effect waves-light btn-flat blue" OnClick="btnOk_Click" CommandName="OK" CommandArgument='<%# Eval("UserID") %>' />
                                </td>
                            </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="container-fluid">
                        <h4 class="blue-text">In Progress</h4>
                        <asp:Repeater ID="rptProgress" runat="server" OnItemCommand="rptProgress_ItemCommand" OnItemDataBound="rptProgress_ItemDataBound">
                            <HeaderTemplate>
                                <table class="striped highlight responsive-table centered">
                                    <tr>
                                        <td width="500px">
                                            <label>Name</label>
                                        </td>
                                        <td style="width: 150px; text-align: center;">
                                            <label>Job Title</label>
                                        </td>
                                        <td style="width: 150px; text-align: center;">
                                            <label>CV/Resume</label>
                                        </td>
                                        <td style="width: 200px; text-align: center;">
                                            <label>Initial Interview</label>
                                        </td>
                                        <td style="width: 200px; text-align: center;">
                                            <label>Teaching Demo</label>
                                        </td>
                                        <td style="width: 200px; text-align: center;">
                                            <label>Examination</label>
                                        </td>
                                        <td style="width: 200px; text-align: center;">
                                            <label>Final Interview</label>
                                        </td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                            <tr>
                                <td style="text-align: center;">
                                    <asp:Label ID="lblName" runat="server" CssClass="label-app" Text='<%# Eval("Name") %>' ></asp:Label>
                                </td>
                                <td style="text-align: center;" >
                                    <asp:Label ID="lblJob" runat="server" CssClass="label-app" Text='<%# Eval("JobTitle") %>' ></asp:Label>
                                </td>
                                <td style="text-align: center;">
                                    <asp:LinkButton ID="lnkResume" runat="server" Text="View" CommandName="View" CommandArgument='<%# Eval("UserID") %>' CausesValidation="False"></asp:LinkButton>
                                </td>
                               <td style="text-align: center;">
                                    <asp:DropDownList ID="drpdwnInitial" runat="server">
                                    </asp:DropDownList>
                                </td>
                                <td style="text-align: center;">
                                    <asp:DropDownList ID="drpdwnDemo" runat="server" >
                                    </asp:DropDownList>
                                </td>
                                <td style="text-align: center;">
                                    <asp:DropDownList ID="drpdwnExam" runat="server">
                                    </asp:DropDownList>
                                </td>
                                <td style="text-align: center;">
                                    <asp:DropDownList ID="drpdwnFinal" runat="server">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Button ID="btnOk" runat="server" Text="Done" CssClass="white-text btn waves-effect waves-light btn-flat blue" OnClick="btnOk_Click1" CommandName="OK" CommandArgument='<%# Eval("UserID") %>' />
                                </td>
                            </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
            <div class="separator">&nbsp;</div>
        </ContentTemplate>
    </asp:UpdatePanel>

        </div>

    <script>
        function shwwindow(myurl) {
            window.open(myurl, '_blank');
        }
    </script>
</asp:Content>
