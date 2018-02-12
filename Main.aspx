<%@ Page Title="Marketing Operations Portal" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* Move down content because we have a fixed navbar that is 50px tall */
        body {
            padding-top: 150px;
            padding-top: 60px;
            padding-bottom: 20px;
            /*background-color: #eeeeee;*/
            background: url('../images/windows-8.jpg') no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }

        /* Wrapping element */
        /* Set some basic padding to keep content from hitting the edges */
        .body-content {
            padding-left: 15px;
            padding-right: 15px;
            padding-left: 15px;
            padding-right: 15px;
        }

        .navbar-default {
            background-color: transparent !important;
            border-bottom: none;
        }

            .navbar-default .navbar-brand {
                color: #ffffff;
                font-weight: 100;
            }

                .navbar-default .navbar-brand:focus, .navbar-default .navbar-brand:hover {
                    color: rgba(255,255,255,0.77);
                }

            .navbar-default .navbar-nav > li > a {
                color: #ffffff;
            }

                .navbar-default .navbar-nav > li > a:focus, .navbar-default .navbar-nav > li > a:hover {
                    color: rgba(255,255,255,0.77);
                }

        .panel {
            background-color: transparent !important;
            margin-bottom: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <div class="container">
        <div class="">
            <div class="col-md-4">
                <a class="panel" href="Site_Login.aspx">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h2>Visibility</h2>
                            <span>Open</span>
                        </div>
                        <%--<div class="panel-footer">
                            <span class="pull-left">Open</span>
                            <span class="pull-right">
                                <i class="fa fa-arrow-circle-right"></i>
                            </span>
                            <div class="clearfix"></div>
                        </div>--%>
                    </div>
                </a>
            </div>
            <div class="col-md-4">
                <a class="panel" href="sd_overview1.aspx">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <h2>Implementation</h2>
                            <span>Under Construction</span>
                        </div>
                        <%--<div class="panel-footer">
                            <span class="pull-left">Open</span>
                            <span class="pull-right">
                                <i class="fa fa-arrow-circle-right"></i>
                            </span>
                            <div class="clearfix"></div>
                        </div>--%>
                    </div>
                </a>
                <%--<div class="panel panel-green">
                    <div class="panel-heading">
                        <h2>Implementation</h2>
                    </div>
                    <a class="">
                        <div class="panel-footer">
                            <span class="pull-left">Open</span>
                            <span class="pull-right">
                                <i class="fa fa-arrow-circle-right"></i>
                            </span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>--%>
            </div>
            <div class="col-md-4">
                <a class="panel" href="#">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <h2>Saturation</h2>
                            <span>Under Construction</span>
                        </div>
                        <%--<div class="panel-footer">
                            <span class="pull-left">Open</span>
                            <span class="pull-right">
                                <i class="fa fa-arrow-circle-right"></i>
                            </span>
                            <div class="clearfix"></div>
                        </div>--%>
                    </div>
                </a>
                <%--<div class="panel panel-yellow">
                    <div class="panel-heading">
                        <h2>Saturation</h2>
                    </div>
                    <a class="">
                        <div class="panel-footer">
                            <span class="pull-left">Under Construction</span>
                            <span class="pull-right">
                                <i class="fa fa-arrow-circle-right"></i>
                            </span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>--%>
            </div>
        </div>
        <div class="">
            <div class="col-md-4">
                <a class="panel" href="Visibility.aspx">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h2>Accounts</h2>
                            <span>Open</span>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-4">
                <a class="panel" href="Visibility.aspx">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h2>Manpower</h2>
                            <span>Open</span>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>

</asp:Content>

