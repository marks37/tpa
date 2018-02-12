<%@ Page Title="" Language="C#" MasterPageFile="~/VisibilityMain.master" AutoEventWireup="true" CodeFile="tl_new_workplan.aspx.cs" Inherits="tl_new_workplan" %>

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

        #test-tbl thead tr th:first-child {
            /*vertical-align: top;*/
            /*padding: 10px 5px;*/
            /*text-align: left;*/
            /*font-size: 14px;*/
            /*padding: 10px 15px;*/
            padding-left: 15px;
        }

        #test-tbl thead tr th:last-child {
            padding-right: 15px;
        }

        #test-tbl tbody tr td:last-child {
            padding-right: 15px;
        }

        #test-tbl tbody tr td:first-child {
            /*vertical-align: top;*/
            /*padding: 10px 5px;*/
            /*text-align: left;*/
            /*font-size: 14px;*/
            /*padding: 10px 15px;*/
            padding-left: 15px;
        }

        .table {
            /*margin-top:5px;*/
            border-bottom: 1px solid #ddd;
            margin-bottom: 10px;
        }

            .table > thead > tr > th {
                font-weight: normal;
                line-height: 25px;
                border-bottom: 0;
            }

            .table > tbody > tr {
                background-color: #fff;
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
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>

    <div id="lower-navbar" class="" style="line-height: 40px; border-bottom: 1px solid #ddd;">
        <div class="container-fluid">
            <div class="pull-left">
                <span style="font-size: 100%;">New Workplan</span>
            </div>
            <div class="pull-right">
                <div class="" role="toolbar">
                    <div class="btn-group" role="group">
                    </div>
                    &nbsp;
                    <div class="btn-group" role="group">
                        <a class="btn btn-success btn-sm">Save Workplan</a>
                        <a class="btn btn-danger btn-sm" href="tl_workplan.aspx">Cancel</a>
                    </div>
                    <%--&nbsp;
                    <div class="btn-group" role="group">
                        <a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">Import</a>
                    </div>--%>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <div id="main-content-wrapper">
        <div class="">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="hidden">
                        <div class="">
                            <table class="table table-hover table-condensed" id="test-tbl">
                                <tbody>
                                    <tr>
                                        <td class="col-md-5">
                                            <div class="input-group">
                                                <span class="input-group-addon">Branches</span>
                                                <asp:DropDownList ID="branchSelect" CssClass="form-control input-sm" runat="server">
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                        <td class="col-md-3">
                                            <div class="input-group">
                                                <span class="input-group-addon">Call Date</span>
                                                <asp:TextBox ID="callDate" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                            </div>
                                        </td>
                                        <td class="col-md-4">
                                            <div class="input-group">
                                                <span class="input-group-addon">Coordinator</span>
                                                <asp:DropDownList ID="coordinatorSelect" CssClass="form-control input-sm" runat="server"></asp:DropDownList>
                                            </div>
                                        </td>
                                        <td class="text-right">
                                            <a class="btn btn-primary btn-sm"><i class="fa fa-plus"></i>&nbsp;Add</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

</asp:Content>

