<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Dashboard.Master" AutoEventWireup="true" CodeBehind="PostJob.aspx.cs" Inherits="OHRMS.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">
        <div class="card-header">
            <div class="row">
                <div class="col-6">
                    <h3 class="text-primary">Post A Job</h3>
                </div>
                <div class="col-6 text-end">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Joblist">View Posted Jobs</button>
                </div>
            </div>
        </div>

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="separator">&nbsp;</div>
                <div class="">
                    <form class="row" id="regForm">
                        <div class="container">
                            <div class="separator">&nbsp;</div>
                            <h4 class="text-primary text-center bg-light p-2">Tell Someting About the Job</h4>
                            <div class="divider"></div>
                            <div>
                                <label class="form-label"><span class="text-danger">*</span>Job Category:</label>
                                <asp:DropDownList ID="drpdwnlst_cat" runat="server" CssClass="form-select dropdown">
                                    <asp:ListItem Value="IT" Text="Information Technology"></asp:ListItem>
                                    <asp:ListItem Value="BA" Text="Business Administrator"></asp:ListItem>
                                    <asp:ListItem Value="HM" Text="Hotel Management"></asp:ListItem>
                                    <asp:ListItem Value="GE" Text="General Education"></asp:ListItem>
                                    <asp:ListItem Value="Tourism" Text="Tourism"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="separator">&nbsp;</div>
                            <div>
                                <label class="form-label"><span class="text-danger">*</span>Job Type:</label>
                                <asp:DropDownList ID="drpdwnlst_type" runat="server" CssClass="form-select dropdown">
                                    <asp:ListItem Value="FT" Text="Full Time"></asp:ListItem>
                                    <asp:ListItem Value="PT" Text="Part Time"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="separator">&nbsp;</div>
                            <div>
                                <label class="form-label"><span class="text-danger">*</span>Job Title:</label>
                                <asp:TextBox ID="txtJobTitle" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                            </div>
                            <br />
                            <h4 class="text-primary text-center bg-light p-2">Job Requirements</p></h4>
                            <div class="separator">&nbsp;</div>
                            <div class="col-12">
                                <label class="form-label">Minimum Experience:  </label>
                                <asp:DropDownList ID="drpdwnlst_exp" runat="server" CssClass="form-select dropdown">
                                    <asp:ListItem Value="1-3y" Text="1-3 years"></asp:ListItem>
                                    <asp:ListItem Value="3-5y" Text="3-5 years"></asp:ListItem>
                                    <asp:ListItem Value="5-10y" Text="5-10 years"></asp:ListItem>
                                    <asp:ListItem Value="more10y" Text=">10 years"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="separator">&nbsp;</div>
                            <div class="col-12">
                                <label class="form-label">Educational Qualification:  </label>
                                <asp:DropDownList ID="drpdwnlst_qual" runat="server" CssClass="form-select dropdown">
                                    <asp:ListItem Value="Bachelor" Text="Bachelor"></asp:ListItem>
                                    <asp:ListItem Value="Master" Text="Master"></asp:ListItem>
                                    <asp:ListItem Value="Doctor" Text="Doctor"></asp:ListItem>
                                    <asp:ListItem Value="Diploma" Text="Diploma"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="separator">&nbsp;</div>
                            <h4 class="text-primary text-center bg-light p-2">More About the Job</p></h4>
                            <div class="separator">&nbsp;</div>
                            <div class="col-12">
                                <label class="form-label"><span class="text-danger">*</span>Job Description:</label>
                                <asp:TextBox ID="txtjob_desc" runat="server" TextMode="MultiLine" CssClass="form-control" required="true"></asp:TextBox>
                            </div>
                            <div class="col-12">
                                <label class="form-label"><span class="text-danger">*</span>General Qualification:</label>
                                <asp:TextBox ID="txtGenQuali" runat="server" TextMode="MultiLine" CssClass="form-control" required="true"></asp:TextBox>
                            </div>
                            <div class="separator">&nbsp;</div>
                            <div class="separator">&nbsp;</div>
                            <div class="text-center">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary btn-lg" Text="Post Job" OnClick="btnSubmit_Click" />
                                <div class="separator">&nbsp;</div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="separator">&nbsp;</div>

                <div class="modal fade" id="Joblist" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Job List</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <asp:GridView ID="gdview_Job" runat="server" Width="90%" HorizontalAlign="Center" AutoGenerateColumns="false" CellPadding="4" CssClass="table table-hover table-responsive border-0">
                                    <Columns>
                                        <asp:BoundField DataField="Job_Title" HeaderText="Title" />
                                        <asp:BoundField DataField="Job_Type" HeaderText="Type" />
                                        <asp:BoundField DataField="Job_Category" HeaderText="Category" />
                                        <asp:TemplateField HeaderText="Remove">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="linkbtnDelete" Text="Delete" runat="server"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
