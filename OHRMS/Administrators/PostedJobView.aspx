<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="PostedJobView.aspx.cs" Inherits="OHRMS.Administrators.PostedJobView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">

    <div class="container my-3 clearfix md-form">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>View Job Posting</h4>
                    </div>
                    <div class="card-body">
                        <div class="row mb-3">
                            <div class="col">
                                <div class="form-group">
                                    <label class="active"><span class="red-text">* </span>Classification</label>
                                    <asp:DropDownList ID="ddlClassification" runat="server" CssClass="mdb-select md-form" AutoPostBack="true" OnSelectedIndexChanged="ddlClassification_SelectedIndexChanged">
                                        <asp:ListItem Value="-" Text="-- Select --"></asp:ListItem>
                                        <asp:ListItem Value="Teaching" Text="Teaching"></asp:ListItem>
                                        <asp:ListItem Value="Non-Teaching" Text="Non-Teaching"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label class="active"><span class="red-text">* </span>Title</label>
                                    <asp:DropDownList ID="ddlTitle" runat="server" CssClass="mdb-select md-form">
                                        <asp:ListItem Value="-" Text="-- Select --"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <div class="col">
                                    <div class="form-group">
                                        <label class="active"><span class="text-danger">* </span>Department</label>
                                        <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="mdb-select md-form">
                                            <asp:ListItem Value="-" Text="-- Select --"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label class="active"><span class="red-text">* </span>Job Type</label>
                                    <asp:DropDownList ID="ddlType" runat="server" CssClass="mdb-select md-form">
                                        <asp:ListItem Value="-" Text="-- Select --"></asp:ListItem>
                                        <asp:ListItem Value="Full Time" Text="Full Time"></asp:ListItem>
                                        <asp:ListItem Value="Part Time" Text="Part Time"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <div class="form-group">
                                    <label class="active"><span class="red-text">* </span>Educational Qualification</label>
                                    <asp:DropDownList ID="ddlEducQualification" runat="server" CssClass="mdb-select md-form">
                                        <asp:ListItem Value="-" Text="-- Select --"></asp:ListItem>
                                        <asp:ListItem Value="High school (grades 9-12, no degree)" Text="High school (grades 9-12, no degree)"></asp:ListItem>
                                        <asp:ListItem Value="High school graduate (or equivalent)" Text="High school graduate (or equivalent)"></asp:ListItem>
                                        <asp:ListItem Value="Some college (1-4 years, no degree)" Text="Some college (1-4 years, no degree)"></asp:ListItem>
                                        <asp:ListItem Value="Associate's degree " Text="Associate's degree "></asp:ListItem>
                                        <asp:ListItem Value="Bachelor's degree" Text="Bachelor's degree"></asp:ListItem>
                                        <asp:ListItem Value="Master's degree" Text="Master's degree"></asp:ListItem>
                                        <asp:ListItem Value="Professional school degree" Text="Professional school degree"></asp:ListItem>
                                        <asp:ListItem Value="Doctorate degree" Text="Doctorate degree"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label class="active"><span class="red-text">* </span>Minimum Experience</label>
                                    <asp:DropDownList ID="ddlExperience" runat="server" CssClass="mdb-select md-form">
                                        <asp:ListItem Value="-" Text="-- Select --"></asp:ListItem>
                                        <asp:ListItem Value="1-3 years" Text="1-3 years"></asp:ListItem>
                                        <asp:ListItem Value="3-5 years" Text="3-5 years"></asp:ListItem>
                                        <asp:ListItem Value="5-10 years" Text="5-10 years"></asp:ListItem>
                                        <asp:ListItem Value="10 years or more" Text="10 years or more"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">&nbsp;</div>
                            <div class="col">
                                <div class="md-form md-outline input-with-post-icon datepicker">
                                    <label for="txtDurationDate" class="active"><span class="red-text">* </span>Post Available Until</label>
                                    <asp:TextBox ID="txtDurationDate" runat="server"  CssClass="form-control" type="date" required="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <div class="col md-form">
                                    <label class="active"><span class="red-text">* </span>Job Description</label>
                                    <asp:TextBox ID="txtJobDescription" runat="server" TextMode="MultiLine" CssClass="md-textarea form-control" required="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <div class="col md-form">
                                    <label class="active"><span class="red-text">* </span>Job Responsibilities</label>
                                    <asp:TextBox ID="txtjobResponsibilities" runat="server" TextMode="MultiLine" CssClass="md-textarea form-control" required="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer justify-content-around text-center">
                        <a href="<%=Page.ResolveUrl("~/Administrators/JobPostList.aspx")%>" class="btn btn-blue" tabindex="-1" role="button">Cancel</a>
                        <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-blue" Text="Update" OnClick="btnUpdate_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>


    

</asp:Content>
