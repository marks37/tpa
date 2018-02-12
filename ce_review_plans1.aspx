<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCoordinator.master" AutoEventWireup="true" CodeFile="ce_review_plans1.aspx.cs" Inherits="ce_review_plans1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .panel panel-default{
            /*border: 1px solid rgb(242, 242, 242);
            border: 0px;
            
            border-top: 1px solid #ddd;*/
        }

        /*.panel{
            background-color: #FBFBFB;
        }

        .table>thead>tr>th{
            border-bottom: 0px;
            font-size: 12px; 
            padding-top: 15px; 
            padding-bottom: 15px; 
            background-color: rgb(231, 230,230);
            color: rgb(89, 89, 89);
            font-weight: 800;
        }

        .table>tbody>tr>td{
            padding-top: 25px;
            padding-bottom: 25px;
            border-bottom: 1px solid rgb(242, 242, 242);
        }

        .table>tbody>tr>td>strong{
            font-size: 16px;
            color: #767171;
            color: #4D4D4D;
        }

        .table>tbody>tr>td>small{
            font-size: 14px;
        }

        .table>tbody>tr>td>span>.fa{
            font-size: 15px;
        }*/

        .info-stat-title {
            font-size: 14px;
            font-weight: bold;
            background-color: #ddd;
            width: 100%;
            display: inline-block;
            padding: 5px;
            /*display: none;*/
        }

        .info-stat-content {
            height: 70px;
    /*height: 100px;*/
            padding: 5px;
            width: 100px;
            display: table-cell;
            text-align: center;
            vertical-align: middle;
        }

        .info-stat-txt {
            display: table-cell;
            vertical-align: top;
            height: 100px;
            width: 100px;
        }

        .info-stat {
            display: inline-block;
            height: 100px;
            width: 100px;
            padding: 0px;
            border-radius: 5px;
            border: 1px solid #ddd;
            margin-left: 10px;
            float:left;
            display: table-cell;
            vertical-align: bottom;
        }

        .info-stat p{
            height: 100px;
            width: 100px;
            display: table-cell;
            vertical-align: bottom;
        }

        .dates span {
            /*font-size: 10px;*/
        }

        .dates .month {
            font-size: 20px;
        }

        .dates .day {
            font-size: 20px;
        }

        .num {
            font-size: 24px;
        }

        .panel {
            background-color: #FBFBFB;
        }

        .prodName {
            /*font-weight: bold;*/
            /*color: blue;
            color: rgb(68, 114, 196);*/
        }

        .prodDesc {
            font-size: 13px;
        }

        .product {
            padding-left: 15px;
            font-size: 24px;
        }
        
        .status>.fa{
            font-size: 24px !important;
        }

        .success {
            background-color: #3a9b1e;
            color: white;
        }

        .table > thead > tr > th {
            border-bottom: 0px;
            font-size: 12px;
            padding-top: 15px;
            padding-bottom: 15px;
            background-color: rgb(231, 230,230);
            color: rgb(89, 89, 89);
            font-weight: 800;
            /*border-bottom: 1px solid rgb(89, 89, 89);*/
            padding-left: 30px;
            /*background-color: transparent;*/
        }

        .table > tbody > tr > td {
            vertical-align: middle;
            padding-top: 15px;
            padding-bottom: 15px;
            border-bottom: 10px solid rgb(242, 242, 242);
            border-color: rgb(242, 242, 242);
            color: #4D4D4D;
            padding: 15px;
        }


            .table > tbody > tr > td > strong {
                font-size: 16px;
                color: #767171;
                color: #4D4D4D;
            }

            .table > tbody > tr > td > small {
                font-size: 14px;
            }

            .table > tbody > tr > td > span > .fa {
                font-size: 15px;
            }

        .table > tbody > tr {
            background-color: #FBFBFB;
            cursor: pointer;
            margin-bottom: 10px;
            /*border: 1px solid rgb(242, 242, 242);*/
            /*border-top: 1px solid rgb(89, 89, 89);*/
        }

        .table > tbody > tr:hover {
            /*background-color: rgb(68, 114, 196);*/
            /*border: 1px solid rgb(242, 242, 242);*/
            /*border-top: 1px solid rgb(89, 89, 89);*/
        }

        .table > tbody > tr:hover > td{
            /*color: #FBFBFB;*/
        }

        .table {
            background-color: #FBFBFB;
            background-color: transparent;
            /*-webkit-box-shadow: 0px 1px 5px 0px rgba(227,227,227,1);
-moz-box-shadow: 0px 1px 5px 0px rgba(227,227,227,1);
box-shadow: 0px 1px 5px 0px rgba(227,227,227,1);*/
            border-collapse: collapse;
            /*border-top: 1px solid #000000;*/
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            $(window).bind('scroll', function () {
                console.log($(window).scrollTop())
                if ($(window).scrollTop() > 25) {
                    $('.page-header-1-wrapper').addClass('page-header-1-wrapper-fixed');
                    $('.page-content').addClass('page-content-fixed');
                    $('.lower-navbar-wrapper').addClass('lower-navbar-wrapper-fixed');
                } else {
                    $('.page-content').removeClass('page-content-fixed');
                    $('.page-header-1-wrapper').removeClass('page-header-1-wrapper-fixed');
                    $('.lower-navbar-wrapper').removeClass('lower-navbar-wrapper-fixed');
                }
            });
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="page-content">
    <div class="page-header-1-wrapper" style="">
        <div class="text-center">
            <h3>Implementation Check</h3>
        </div>
    </div>
    <div class="lower-navbar-wrapper">
        <nav class="navbar navbar-default">
            <div class="container">
                <div class="navbar-collapse collapse">
                    <ul class="" id="implem_steps">
                        <li class="active"><a href="ce_review_plans1.aspx">Review Plans</a></li> 
                        <li><a href="ce_implementation_check1.aspx">Initiatives Check</a></li>
                        <li><a href="ce_competitors.aspx">Competitor's Activity</a></li>
                        <li><a href="ce_closing.aspx">Closing</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
               <div class="page-header-2-wrapper">
                        <%--<h3>Initiatives Check - 0/3</h3>--%>
                    </div>
                <div class="">
                    <table class="table table-hover">
                        <%--<thead>
                            <tr style="">
                                <th class="col-md-2 text-center">STATUS</th>
                                <th class="col-md-6">ACCOUNT</th>
                                <th class="col-md-4">IMPLEMENTATION</th>
                            </tr>
                        </thead>--%>
                         <thead>
                                
                            </thead>
                        <tbody>
                            <tr class="clickable-row" data-href='ce_implementation_check1.aspx'>
                                <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                <td class="col-md-6"  style="border-left: 1px solid rgb(242, 242, 242);">
                                    <div class="product">
                                        <span class="prodName">Budgetlane Sta. Cruz</span>
                                        <br />
                                        <span class="prodDesc">Status: <span class="label label-info">Pending</span><br />Address: P. Guevarra St. Sta Cruz, Laguna</span>
                                        <br />
                                            <ul class="tags">
                                                <li class="filter-item">Budgetlane</li>
                                            </ul>
                                    </div>
                                    <%--<strong>BUDGETLANE - BUDGETLANE STA. CRUZ</strong>
                                    <br />
                                    <small class="text-muted">P. Guevarra St. Sta Cruz, Laguna</small>--%>
                                </td>
                                <td class=""></td>
                            </tr>
                            <tr>
                                <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                <td class=""  style="border-left: 1px solid rgb(242, 242, 242);">
                                    <div class="product">
                                        <span class="prodName">Budgetlane Sta. Cruz</span>
                                        <br />
                                        <span class="prodDesc">Status: <span class="label label-info">Pending</span><br />Address: P. Guevarra St. Sta Cruz, Laguna</span>
                                        <br />
                                            <ul class="tags">
                                                <li class="filter-item">Budgetlane</li>
                                            </ul>
                                    </div>
                                    <%--<strong>BUDGETLANE - BUDGETLANE STA. CRUZ</strong>
                                    <br />
                                    <small class="text-muted">P. Guevarra St. Sta Cruz, Laguna</small>--%>
                                </td>
                                <td class=""></td>
                            </tr>
                            <tr>
                                <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                <td class="col-md-6"  style="border-left: 1px solid rgb(242, 242, 242);">
                                    <div class="product">
                                        <span class="prodName">Budgetlane Sta. Cruz</span>
                                        <br />
                                        <span class="prodDesc">Status: <span class="label label-info">Pending</span><br />Address: P. Guevarra St. Sta Cruz, Laguna</span>
                                        <br />
                                            <ul class="tags">
                                                <li class="filter-item">Budgetlane</li>
                                            </ul>
                                    </div>
                                    <%--<strong>BUDGETLANE - BUDGETLANE STA. CRUZ</strong>
                                    <br />
                                    <small class="text-muted">P. Guevarra St. Sta Cruz, Laguna</small>--%>
                                </td>
                                <td class=""></td>
                            </tr>
                            <tr>
                                <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                <td class="col-md-6"  style="border-left: 1px solid rgb(242, 242, 242);">
                                    <div class="product">
                                        <span class="prodName">Budgetlane Sta. Cruz</span>
                                        <br />
                                        <span class="prodDesc">Status: <span class="label label-info">Pending</span><br />Address: P. Guevarra St. Sta Cruz, Laguna</span>
                                        <br />
                                            <ul class="tags">
                                                <li class="filter-item">Budgetlane</li>
                                            </ul>
                                    </div>
                                    <%--<strong>BUDGETLANE - BUDGETLANE STA. CRUZ</strong>
                                    <br />
                                    <small class="text-muted">P. Guevarra St. Sta Cruz, Laguna</small>--%>
                                </td>
                                <td class=""></td>
                            </tr>
                            <tr>
                                <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                <td class="col-md-6"  style="border-left: 1px solid rgb(242, 242, 242);">
                                    <div class="product">
                                        <span class="prodName">Budgetlane Sta. Cruz</span>
                                        <br />
                                        <span class="prodDesc">Status: <span class="label label-info">Pending</span><br />Address: P. Guevarra St. Sta Cruz, Laguna</span>
                                        <br />
                                            <ul class="tags">
                                                <li class="filter-item">Budgetlane</li>
                                            </ul>
                                    </div>
                                    <%--<strong>BUDGETLANE - BUDGETLANE STA. CRUZ</strong>
                                    <br />
                                    <small class="text-muted">P. Guevarra St. Sta Cruz, Laguna</small>--%>
                                </td>
                                <td class=""></td>
                            </tr>
                            <tr>
                                <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                <td class="col-md-6"  style="border-left: 1px solid rgb(242, 242, 242);">
                                    <div class="product">
                                        <span class="prodName">Budgetlane Sta. Cruz</span>
                                        <br />
                                        <span class="prodDesc">Status: <span class="label label-info">Pending</span><br />Address: P. Guevarra St. Sta Cruz, Laguna</span>
                                        <br />
                                            <ul class="tags">
                                                <li class="filter-item">Budgetlane</li>
                                            </ul>
                                    </div>
                                    <%--<strong>BUDGETLANE - BUDGETLANE STA. CRUZ</strong>
                                    <br />
                                    <small class="text-muted">P. Guevarra St. Sta Cruz, Laguna</small>--%>
                                </td>
                                <td class=""></td>
                            </tr>
                            <tr>
                                <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                <td class="col-md-6"  style="border-left: 1px solid rgb(242, 242, 242);">
                                    <div class="product">
                                        <span class="prodName">Budgetlane Sta. Cruz</span>
                                        <br />
                                        <span class="prodDesc">Status: <span class="label label-info">Pending</span><br />Address: P. Guevarra St. Sta Cruz, Laguna</span>
                                        <br />
                                            <ul class="tags">
                                                <li class="filter-item">Budgetlane</li>
                                            </ul>
                                    </div>
                                    <%--<strong>BUDGETLANE - BUDGETLANE STA. CRUZ</strong>
                                    <br />
                                    <small class="text-muted">P. Guevarra St. Sta Cruz, Laguna</small>--%>
                                </td>
                                <td class=""></td>
                            </tr>
                            <tr>
                                <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                <td class="col-md-6"  style="border-left: 1px solid rgb(242, 242, 242);">
                                    <div class="product">
                                        <span class="prodName">Budgetlane Sta. Cruz</span>
                                        <br />
                                        <span class="prodDesc">Status: <span class="label label-info">Pending</span><br />Address: P. Guevarra St. Sta Cruz, Laguna</span>
                                        <br />
                                            <ul class="tags">
                                                <li class="filter-item">Budgetlane</li>
                                            </ul>
                                    </div>
                                    <%--<strong>BUDGETLANE - BUDGETLANE STA. CRUZ</strong>
                                    <br />
                                    <small class="text-muted">P. Guevarra St. Sta Cruz, Laguna</small>--%>
                                </td>
                                <td class=""></td>
                            </tr>
                            <tr>
                                <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                <td class="col-md-6"  style="border-left: 1px solid rgb(242, 242, 242);">
                                    <div class="product">
                                        <span class="prodName">Budgetlane Sta. Cruz</span>
                                        <br />
                                        <span class="prodDesc">Status: <span class="label label-info">Pending</span><br />Address: P. Guevarra St. Sta Cruz, Laguna</span>
                                        <br />
                                            <ul class="tags">
                                                <li class="filter-item">Budgetlane</li>
                                            </ul>
                                    </div>
                                    <%--<strong>BUDGETLANE - BUDGETLANE STA. CRUZ</strong>
                                    <br />
                                    <small class="text-muted">P. Guevarra St. Sta Cruz, Laguna</small>--%>
                                </td>
                                <td class=""></td>
                            </tr>
                            <tr>
                                <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                <td class="col-md-6"  style="border-left: 1px solid rgb(242, 242, 242);">
                                    <div class="product">
                                        <span class="prodName">Budgetlane Sta. Cruz</span>
                                        <br />
                                        <span class="prodDesc">Status: <span class="label label-info">Pending</span><br />Address: P. Guevarra St. Sta Cruz, Laguna</span>
                                        <br />
                                            <ul class="tags">
                                                <li class="filter-item">Budgetlane</li>
                                            </ul>
                                    </div>
                                    <%--<strong>BUDGETLANE - BUDGETLANE STA. CRUZ</strong>
                                    <br />
                                    <small class="text-muted">P. Guevarra St. Sta Cruz, Laguna</small>--%>
                                </td>
                                <td class=""></td>
                            </tr>
                            <tr>
                                <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                <td class="col-md-6"  style="border-left: 1px solid rgb(242, 242, 242);">
                                    <div class="product">
                                        <span class="prodName">Budgetlane Sta. Cruz</span>
                                        <br />
                                        <span class="prodDesc">Status: <span class="label label-info">Pending</span><br />Address: P. Guevarra St. Sta Cruz, Laguna</span>
                                        <br />
                                            <ul class="tags">
                                                <li class="filter-item">Budgetlane</li>
                                            </ul>
                                    </div>
                                    <%--<strong>BUDGETLANE - BUDGETLANE STA. CRUZ</strong>
                                    <br />
                                    <small class="text-muted">P. Guevarra St. Sta Cruz, Laguna</small>--%>
                                </td>
                                <td class=""></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <br />
                <br />

                <br />


                <%--<div class="">
                    <table class="table table-hover">
                        <thead>
                            <tr style="">
                                <th class="col-md-2 text-center">STATUS</th>
                                <th class="col-md-6">ACCOUNT</th>
                                <th class="col-md-4">IMPLEMENTATION</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="col-md-2 text-center text-center middle"><span class="text-danger"><i class="fa fa-circle"></i></span></td>
                                <td class="col-md-6">
                                    <div class="product">
                                        <span class="prodName">Budgetlane Sta. Cruz</span>
                                        <br />
                                        <span class="prodDesc">P. Guevarra St. Sta Cruz, Laguna</span>
                                        <br />
                                            <ul class="tags">
                                                <li class="filter-item">Budgetlane</li>
                                            </ul>
                                    </div>
                                    <strong>BUDGETLANE - BUDGETLANE STA. CRUZ</strong>
                                    <br />
                                    <small class="text-muted">P. Guevarra St. Sta Cruz, Laguna</small>
                                </td>
                                <td class="col-md-4"></td>
                            </tr>
                            <tr>
                                <td class="col-md-2 text-center text-center middle"><span class="text-danger"><i class="fa fa-circle"></i></span></td>
                                <td class="col-md-6">
                                    <strong>BUDGETLANE - BUDGETLANE STA. CRUZ</strong>
                                    <br />
                                    <small class="text-muted">P. Guevarra St. Sta Cruz, Laguna</small>
                                </td>
                                <td class="col-md-4"></td>
                            </tr>
                            <tr>
                                <td class="text-center middle"><span class="text-danger"><i class="fa fa-circle"></i></span></td>
                                <td class="">
                                    <strong>LIANAS - LIANA'S SUPERMARKET (CALAMBA)</strong>
                                    <br />
                                    <small class="text-muted">National Highway,Parian, Calamba City Laguna</small>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="text-center middle"><span class="text-danger"><i class="fa fa-circle"></i></span></td>
                                <td class="">
                                    <strong>LANDMARK – THE LANDMARK SUPERMART</strong>
                                    <br />
                                    <small class="text-muted">Makati Avenue, Ayala Center, Makati City </small>
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>--%>
            </div>
        </div>
    </div>
        </div>
</asp:Content>

