<%@ Page Title="" Language="C#" MasterPageFile="~/Disers.master" AutoEventWireup="true" CodeFile="sd_overview.aspx.cs" Inherits="sd_overview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-header-2-wrapper" style="">
        <div class="text-center">
            <h4>Start Of Day</h4>
        </div>
    </div>
    <div class="lower-navbar-wrapper">
        <nav class="navbar navbar-default">
            <div class="container">
                <%--<div class="navbar-header">
                    <a class="navbar-brand">Start Of Day</a>
                </div>--%>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="ce_review_plans.aspx">Dashboard</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <br />
<%--    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <strong>On-Going Implementation</strong>
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover table-striped">
                            <thead>
                                <tr class="">
                                    <th style="width: 4%;">Status</th>
                                    <th>Account Name</th>
                                    <th>Branches</th>
                                    <th>Activity</th>
                                    <th style="width: 15%;"></th>
                                </tr>
                            </thead>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </div>--%>
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <strong>For Implementation</strong>
                    </div>
                    <table class="table table-hover">
                        <thead>
                            <tr class="">
                                <th style="" class="text-center">Status</th>
                                <th>Account Name</th>
                                <th>Branches</th>
                                <th>Implementation</th>
                                <th style="width: 15%;">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="text-center">
                                    <span class="text-danger"><i class="fa fa-circle"></i></span>
                                </td>
                                <td>Robinsons</td>
                                <td>Robinsons Balagtas</td>
                                <td>Pending</td>
                                <td><a class="btn btn-primary btn-group-justified" href="ce_implementation_check.aspx">Visit</a></td>
                            </tr><tr>
                                <td class="text-center">
                                    <span class="text-danger"><i class="fa fa-circle"></i></span>
                                </td>
                                <td>Robinsons</td>
                                <td>Robinsons Balagtas</td>
                                <td>On-Going</td>
                                <td><a class="btn btn-primary btn-group-justified" href="ce_implementation_check.aspx">Visit</a></td>
                            </tr><tr>
                                <td class="text-center">
                                    <span class="text-success"><i class="fa fa-circle"></i></span>
                                </td>
                                <td>Robinsons</td>
                                <td>Robinsons Balagtas</td>
                                <td>Implemented</td>
                                <td><a class="btn btn-primary btn-group-justified" href="ce_implementation_check.aspx">Visit</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

