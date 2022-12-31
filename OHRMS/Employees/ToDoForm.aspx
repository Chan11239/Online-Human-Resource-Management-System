<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Employee.Master" AutoEventWireup="true" CodeBehind="ToDoForm.aspx.cs" Inherits="OHRMS.Employees.ToDoForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>New To Do<span class="text-danger lead muted align-top">New</span></h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <div class="form-group md-form">
                                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control"></asp:TextBox>
                                    <label for="txtTitle">Title</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group md-form">
                                    <asp:TextBox ID="txtMessage" TextMode="MultiLine" runat="server" CssClass="form-control md-textarea"></asp:TextBox>
                                    <label for="txtMessage" >Message</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer justify-content-center text-center">
                        <a href="<%=Page.ResolveUrl("~/Employees/Dashboard.aspx")%>" class="btn btn-red" tabindex="-1" role="button">Cancel</a>
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-blue" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
