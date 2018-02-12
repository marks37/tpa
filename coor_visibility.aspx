﻿<%@ Page Title="Visibility" Language="C#" MasterPageFile="~/VisibilityMain.master" AutoEventWireup="true" CodeFile="coor_visibility.aspx.cs" Inherits="Visibility" %>

<%@ MasterType VirtualPath="~/VisibilityMain.master" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        dl {
            margin-bottom: 0;
            font-size: 14px;
        }

        dt {
            font-weight: 500;
            color: rgba(0,0,0,0.60);
            /*color: #9E9E9E;*/
            font-weight: normal;
        }

        dd {
            font-weight: normal;
            color: rgba(0,0,0,0.80);
        }

        .test-tbl thead tr th:first-child {
            /*vertical-align: top;*/
            /*padding: 10px 5px;*/
            /*text-align: left;*/
            /*font-size: 14px;*/
            /*padding: 10px 15px;*/
            padding-left: 15px;
        }

        .test-tbl thead tr th:last-child {
            padding-right: 15px;
            /*padding-right: 50px;*/
        }

        .test-tbl tbody tr td:last-child {
            padding-right: 20px;
        }

        .test-tbl tbody tr td:first-child {
            /*vertical-align: top;*/
            /*padding: 10px 5px;*/
            /*text-align: left;*/
            /*font-size: 14px;*/
            /*padding: 10px 15px;*/
            padding-left: 20px;
        }

        .test-tbl tbody tr td:nth-child(2) {
        }

        .test-tbl tbody tr td {
            /*padding: 8px 20px;*/
            border-top: 0px solid #EEEEEE;
            /*border-bottom-color: #f5f5f5;*/
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .table {
            /*border-bottom: 1px solid #ddd;*/
            border: 1px solid #ddd;
            background-color: #fff;
        }

        table.dataTable {
            /*margin-top:5px;*/
            /*margin-top: 0px !important;*/
            /*border-bottom: 0px solid #ddd;*/
            /*margin-bottom: 5px !important;*/
        }

        .table > thead > tr > th {
            font-weight: 600;
            line-height: 25px;
            border-bottom-width: 1px;
            border-bottom-color: #EEEEEE;
            /*padding: 15px 20px;*/
            padding-bottom: 8px;
            padding-top: 10px;
        }

        .table > tbody > tr {
        }

        .table > tbody{
        }

        .select2-container {
            width: 100% !important;
            padding: 0;
        }

        .lower-navbar-wrapper {
            position: fixed;
            top: 50px;
            z-index: 100;
            width: 100%;
        }

        .lower-navbar-wrapper {
            background-color: #FAFAFA;
            padding-top: 7px;
            padding-bottom: 7px;
            border-bottom: 1px solid #ddd;
        }

        body {
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="lower-navbar" class="">
        <div class="container-fluid">
            <div class="pull-left">
                <span style="font-size: 100%;">My Visits</span>
            </div>
            <div class="pull-right">
                <div class="" role="toolbar">
                    <div class="btn-group" role="group">
                        <a class="active btn btn-default btn-sm disabled">All</a>
                        <a class="btn btn-default btn-sm disabled">Pending</a>
                        <a class="btn btn-default btn-sm disabled">Submitted</a>
                        <a class="btn btn-default btn-sm disabled">Missed</a>
                    </div>
                    &nbsp;
                    <div class="btn-group" role="group">
                        <asp:LinkButton ID="prevBtn" CssClass="btn btn-sm btn-default disabled" runat="server"><span class="fa fa-chevron-left text-muted"></span></asp:LinkButton>
                        <asp:LinkButton ID="nextBtn" CssClass="btn btn-sm btn-default disabled" runat="server"><span class="fa fa-chevron-right text-muted"></span></asp:LinkButton>
                    </div>
                    <div class="btn-group hidden" role="group">
                        <a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">New Visit</a>
                    </div>
                </div>
                <%--<nav aria-label="Page navigation pull-right">
                    <ul class="pagination">
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>--%>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="" id="main-content-wrapper">
        <br />
        <div class="container-fluid">
            <div class="">
                <div class="">
                    <table class="table table-hover test-tbl" id="visib">
                        <thead>
                            <tr class="">
                                <th class="text-muted">Branch</th>
                                <th class="text-muted">Call Date</th>
                                <th class="text-muted">Due</th>
                                <th class="text-muted hidden">Reference</th>
                                <th class="text-muted">Status</th>
                                <th class="text-muted text-right"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="workplans_rptr" runat="server" OnItemDataBound="workplans_rptr_ItemDataBound" OnItemCommand="workplans_rptr_ItemCommand">
                                <ItemTemplate>
                                    <tr class="" runat="server" id="tablerow">
                                        <td>
                                            <asp:Label ID="branchlbl" runat="server" Text="">
                                    <%# DataBinder.Eval(Container.DataItem, "branchCode") %>&nbsp;
                                    <%# DataBinder.Eval(Container.DataItem, "branchName") %>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="calldatelbl" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="deadlinelbl" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td class="hidden">
                                            <%# DataBinder.Eval(Container.DataItem, "reference") %>
                                        </td>
                                        <td>
                                            <asp:Label ID="statuslbl" runat="server" Text=""></asp:Label>
                                            <%--<span class="label label-primary"><%# DataBinder.Eval(Container.DataItem, "status") %></span>--%>
                                            <%--<span class="label label-warning">Required</span>--%>
                                        </td>
                                        <td class="text-center">
                                            <%--<a class="btn btn-default btn-sm" href="view_visibility.aspx?pk=<%# DataBinder.Eval(Container.DataItem, "id") %>">View</a>--%>
                                            <asp:LinkButton ID="viewBtn" runat="server" CssClass="btn btn-sm btn-link" CommandName="view" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>'>View</asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <footer class="">
            <br />
            <br />
            <div class="container-fluid">
                <p class="text-muted text-right">Developed by: <a href="#">BSDGSYS</a>. 2017</p>
            </div>
            <br />
        </footer>
    </div>



    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">New Visit</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>CALL DATE</label>
                                        <asp:TextBox ID="callDate" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:Label ID="callDateValidation" runat="server"></asp:Label>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <label>ACCOUNT</label>
                                        <asp:DropDownList ID="branchSelect" runat="server" CssClass="form-control">
                                            <asp:ListItem></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Label ID="branchValidation" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="btn-group" role="group">
                                <asp:Button ID="cancelBtn" runat="server" CssClass="btn btn-default" Text="Cancel" OnClick="cancelBtn_Click" />
                                <asp:Button ID="submitBtn" UseSubmitBehavior="false" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="submitBtn_Click" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="submitBtn" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
    <script type="text/javascript">
        
        <%--$("#branchSelect").change(function () {
            var str = "";
            var id = "";
            $("#branchSelect option:selected").each(function () {
                str += $(this).text() + " " + $(this).val();
                id = $(this).val();
            });
            document.getElementById('<%= branchHidden.ClientID %>').value = id;
            console.log(document.getElementById('<%= branchHidden.ClientID %>').value);
        });

        $(document).on('change', '#callDate', function () {
            var str = $('#callDate').val();

            document.getElementById('<%= callDateHidden.ClientID %>').value = str;
            console.log(document.getElementById('<%= callDateHidden.ClientID %>').value);
        });--%>

        function pageLoad() {
            // replace your DOM Loaded settings here. 
            // If you already have document.ready event, 
            // just take the function part and replace here. 
            // Not with document.ready 
            $('#<%= branchSelect.ClientID %>').select2({
                placeholder: "Select Branch",
                theme: "bootstrap"
            });

            $('#<%= callDate.ClientID %>').datepicker({
                maxDate: new Date
            });
        }

        function closeModal() {
            $('#myModal').modal('hide');
        }

        $(document).ready(function () {
            $('#visib').DataTable({
                //"paging": false,
                "ordering": false,
                //"info": false,
                "language": {
                    "emptyTable": "No data available",
                }
            });
        });
    </script>
</asp:Content>

