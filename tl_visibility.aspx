<%@ Page Title="" Language="C#" MasterPageFile="~/VisibilityMain.master" AutoEventWireup="true" CodeFile="tl_visibility.aspx.cs" Inherits="tl_visibility" %>

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
            border: 1px solid #ddd;
            /*border-bottom: 1px solid #ddd;*/
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

        body {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="lower-navbar">
        <div class="container-fluid">
            <div class="pull-left">
                <span style="font-size: 100%;" class="text-muted">Visibility</span>
            </div>
            <div class="pull-right">
                <div class="" role="toolbar">
                    <div class="btn-group hidden" role="group">
                        <a class="active btn btn-default btn-sm disabled">All</a>
                        <a class="btn btn-default btn-sm disabled">For Approval</a>
                        <a class="btn btn-default btn-sm disabled">Submitted</a>
                        <a class="btn btn-default btn-sm disabled">Missed</a>
                    </div>
                    &nbsp;
                    <div class="btn-group hidden" role="group">
                        <asp:LinkButton ID="prevBtn" CssClass="btn btn-sm btn-default disabled" runat="server"><span class="fa fa-chevron-left text-muted"></span></asp:LinkButton>
                        <asp:LinkButton ID="nextBtn" CssClass="btn btn-sm btn-default disabled" runat="server"><span class="fa fa-chevron-right text-muted"></span></asp:LinkButton>
                    </div>
                    <div class="btn-group hidden" role="group">
                        <a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">New Visit</a>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <div class="" id="main-content-wrapper">
        <div class="container-fluid">
            <br />
            <div class="">
                <div class="">
                    <table class="table table-hover test-tbl" id="visib">
                        <thead>
                            <tr class="">
                                <th class="text-muted small">Branch</th>
                                <th class="text-center text-muted small">Call Date</th>
                                <th class="text-center text-muted small">Due Date</th>
                                <th class="text-muted small">Coordinator</th>
                                <th class="text-left text-muted small col-md-1">Status</th>
                                <th class="text-muted text-right small"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="workplan_rptr" runat="server" OnItemDataBound="workplan_rptr_ItemDataBound" OnItemCommand="workplan_rptr_ItemCommand">
                                <ItemTemplate>
                                    <tr class="">
                                        <td>
                                            <asp:Label ID="branchlbl" runat="server" Text="">
                                            </asp:Label>
                                        </td>
                                        <td class="text-center">
                                            <asp:Label ID="calldatelbl" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td class="text-center">
                                            <asp:Label ID="deadlinelbl" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="coordinatorlbl" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td class="text-left">
                                            <asp:Label ID="statuslbl" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <asp:LinkButton ID="viewBtn" runat="server" CssClass="btn btn-link" CommandName="view" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>'>View</asp:LinkButton>
                                            </div>
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
    <script type="text/javascript">
        function pageLoad() {




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

