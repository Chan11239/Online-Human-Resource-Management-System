<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="ToDoForm.aspx.cs" Inherits="OHRMS.Administrators.ToDoForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>New To Do<span class="red-text small align-top"> New</span></h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col mb-3">
                                <label for="txtTitle" class="form-label">Title</label>
                                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col mb-3">
                                <label for="txtMessage" class="form-label">Message</label>
                                <asp:TextBox ID="txtMessage" TextMode="MultiLine" Height="150px" runat="server" CssClass="md-textarea form-control" required="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="col justify-content-center text-center">
                                <a href="<%=Page.ResolveUrl("~/Administrators/Dashboard.aspx")%>" class="btn btn-red" tabindex="-1" role="button">Cancel</a>
                                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-blue" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
