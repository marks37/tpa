<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="Implementation_Reports.aspx.cs" Inherits="Implementation_Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        #menubar_container{
            /*display:none;*/
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <section id="page-header-wrap">
        <div class="container">
            <a class="page-breadcrumb">Home / TPA Reports /</a>
            <h3 class="page-title">Implementation Reports</h3>
            <!-- Nav tabs -->
            <div class="">
                <ul class="nav nav-tabs" role="tablist" id="tabs">
                    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab" style="border-top: 3px solid #ff6a00;">Repositories</a></li>
                </ul>
            </div>
        </div>
    </section>

    <br />
    <section id="page-content">
        <div class="container">

            <div class="row">
                <div class="col-xs-6">
                    <div class="">
                        <%--<div class="input-group-addon">Filter</div>--%>
                        <input type="text" class="form-control" id="exampleInputAmount" placeholder="Search.." />
                    </div>
                    <%--<input class="form-control" placeholder="Search" />--%>
                </div>
                <div class="col-xs-6">
                    <div class="text-right">
                        <a type="button" class="btn btn-primary" href="NewImplementationTemplate.aspx">New Template</a>
                    </div>
                </div>
            </div>

            <br />
            <div class="panel panel-default">
                <%--<div class="panel-heading">
                    2 Pending 1 Closed
                </div>--%>
                <div class="list-group template-list">
                    <a href="Implementation_Template2.aspx" class="list-group-item">
                        <div class="row">
                            <div class="col-sm-6">
                                <%--<div class="template-channel"></div>
                                <h4 class="template-heading">OCT 2016 - Implementation Template</h4>
                                <p class="template-body text-muted">
                                    <strong>Pending</strong> Last updated 21 mins ago
                                <br />
                                    #0004 Created on Sep 28
                                </p>--%>
                                <div class="media">
                                    <div class="media-left media-middle">
                                        <div class="template-channel"><strong>LKA</strong></div>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="template-heading">OCT 2016 - Implementation Report</h4>
                                        <p class="template-body text-muted">
                                            <strong>Pending</strong> Last updated 21 mins ago
                                <br />
                                            #0004 Created on Sep 28
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="template-progress">
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                            <span class="sr-only">60% Complete</span>
                                        </div>
                                    </div>
                                    <p class="text-muted"><strong>65%</strong> Implemented <strong>3,900</strong> Pending <strong>2,100</strong> Closed</p>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a href="#" class="list-group-item">
                        <div class="row">
                            <div class="col-sm-6">
                                <%--<div class="template-channel"></div>
                                <h4 class="template-heading">OCT 2016 - Implementation Template</h4>
                                <p class="template-body text-muted">
                                    <strong>Pending</strong> Last updated 21 mins ago
                                <br />
                                    #0004 Created on Sep 28
                                </p>--%>
                                <div class="media">
                                    <div class="media-left media-middle">
                                        <div class="template-channel"><strong>LKA</strong></div>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="template-heading">SEPT 2016 - Implementation Report</h4>
                                        <p class="template-body text-muted">
                                            <strong>Pending</strong> Last updated 21 mins ago
                                <br />
                                            #0004 Created on Sep 28
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="template-progress">
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                            <span class="sr-only">60% Complete</span>
                                        </div>
                                    </div>
                                    <p class="text-muted"><strong>65%</strong> Implemented <strong>3,900</strong> Pending <strong>2,100</strong> Closed</p>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a href="#" class="list-group-item">
                        <div class="row">
                            <div class="col-sm-6">
                                <%--<div class="template-channel"></div>
                                <h4 class="template-heading">OCT 2016 - Implementation Template</h4>
                                <p class="template-body text-muted">
                                    <strong>Pending</strong> Last updated 21 mins ago
                                <br />
                                    #0004 Created on Sep 28
                                </p>--%>
                                <div class="media">
                                    <div class="media-left media-middle">
                                        <div class="template-channel"><strong>LKA</strong></div>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="template-heading">AUG 2016 - Implementation Report</h4>
                                        <p class="template-body text-muted">
                                            <strong>Pending</strong> Last updated 21 mins ago
                                <br />
                                            #0004 Created on Sep 28
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="template-progress">
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                            <span class="sr-only">60% Complete</span>
                                        </div>
                                    </div>
                                    <p class="text-muted"><strong>65%</strong> Implemented <strong>3,900</strong> Pending <strong>2,100</strong> Closed</p>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>

            <!-- Tab panes -->
            <%--<div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="home">...</div>
                <div role="tabpanel" class="tab-pane" id="profile">...</div>
                <div role="tabpanel" class="tab-pane" id="messages">...</div>
                <div role="tabpanel" class="tab-pane" id="settings">...</div>
            </div>--%>
        </div>
    </section>

</asp:Content>

