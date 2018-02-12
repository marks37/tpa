<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="Implementation_Template.aspx.cs" Inherits="Implementation_Template" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <section id="page-header">
        <div class="container">
            <a class="page-breadcrumb">Home / TPA Reports / Implementation Reports</a>
            <h3 class="page-title">OCT 2016 – Implementation Template</h3>
            <!-- Nav tabs -->
            <div class="">
                <ul class="nav nav-tabs" role="tablist" id="tabs">
                    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab" style="border-top: 3px solid #ff6a00;">Template</a></li>
                    <li role="presentation"><a href="#">Initiatives</a></li>
                    <li role="presentation"><a href="#">Pulse</a></li>
                    <li role="presentation"><a href="#">Graphs</a></li>
                </ul>
            </div>
        </div>
    </section>

    <br />

    <section id="page-content">
        <div class="container">
            <%--<div class="overall-summary overall-summary-bottomless">
                <div class="stats-wrapper">
                    <ul class="numbers-summary list-inline">
                        <li class=""><a href="#">Implementated %</a></li>
                        <li class=""><a>Approved, For implementation %</a></li>
                        <li class=""><a>Not Applicable %</a></li>
                        <li class=""><a>Waiting for LOA %</a></li>
                    </ul>
                </div>
            </div>
            <div class="template-stats">
                <span class="status-color" style="width: 50%; background-color: #6cc644;">Implemented</span>
                <span class="status-color" style="width: 50%; background-color: #ededed;">Blank</span>
            </div>
            <br />--%>
            <div class="stats-wrapper panel panel-default">
                <div class="panel-body" style="padding: 0px;">
                    <div class="">
                        <table class="table-stats table table-condensed">
                            <tbody>
                                <tr class="text-center">
                                    <td><a class="btn"><strong><span class="status-color" style="background-color: #6cc644;"></span> Implemented <span class="text-muted">65%</span></strong></a></td>
                                    <td><a class="btn"><strong><span class="status-color" style="background-color: #0094ff;"></span> Approved, For Implementation <span class="text-muted">0%</span></strong></a></td>
                                    <td><a class="btn"><strong><span class="status-color" style="background-color: #ff6a00;"></span> Not Applicable <span class="text-muted">0%</span></strong></a></td>
                                    <td><a class="btn"><strong><span class="status-color" style="background-color: #b200ff;"></span> Waiting for LOA <span class="text-muted">0%</span></strong></a></td>
                                    <td><a class="btn"><strong><span class="status-color" style="background-color: #ffd800;"></span> Waiting for Pre-bundled Packs <span class="text-muted">0%</span></strong></a></td>
                                    <td><a class="btn"><strong><span class="status-color" style="background-color: #ededed;"></span> Blank <span class="text-muted">0%</span></strong></a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="progress" style="margin: 0px; margin-top: 0px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 12px;">
                        <div class="progress-bar progress-bar-success" style="width: 65%">
                            <span class="sr-only">35% Complete (success)</span>
                        </div>
                        <%--<div class="progress-bar progress-bar-warning" style="width: 20%">
                            <span class="sr-only">20% Complete (warning)</span>
                        </div>
                        <div class="progress-bar progress-bar-danger" style="width: 10%">
                            <span class="sr-only">10% Complete (danger)</span>
                        </div>--%>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-6">
                    <div class="input-group">
                        <div class="input-group-addon">Filter</div>
                        <input type="text" class="form-control input-sm" id="exampleInputAmount" placeholder="Search.." />
                    </div>
                    <%--<input class="form-control" placeholder="Search" />--%>
                </div>
                <div class="col-xs-6">
                    <div class="text-right">
                        <a type="button" class="btn btn-default btn-sm" href="NewImplementationTemplate.aspx">Download Template</a>
                        &nbsp;
                        <a type="button" class="btn btn-primary btn-sm" href="UpdateImplementationTemplate.aspx">Upload Report</a>
                    </div>
                </div>
            </div>
            <br />
            <div class="panel panel-default" style="border-color: transparent;">
                <div class="panel-heading">
                    <strong>OCT 2016 - Implementation Template</strong>
                    <span class="pull-right text-muted">Filter</span>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover table-condensed" id="initiatives_tbl">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Agency</th>
                                <th>Coordinator</th>
                                <th>Initiative</th>
                                <th>Start</th>
                                <th>End</th>
                                <th>Account</th>
                                <th>Branches</th>
                                <th>TL'S Name</th>
                                <th>CDS</th>
                                <th>Status</th>
                                <th>Date</th>
                                <th>Issues</th>
                                <th>Picture</th>
                                <th>Allocation</th>
                                <th>Actual Bundle</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>GMSI</td>
                                <td>Orlando Espera</td>
                                <td>CBU Vitamins Umbrella Program in Supermarkets</td>
                                <td>9/1/2016</td>
                                <td>10/31/201</td>
                                <td>Robinsons</td>
                                <td>ROBINSONS BALAGTAS</td>
                                <td>Thea Valderrama</td>
                                <td>Maia Gana</td>
                                <td>Implemented</td>
                                <td>9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                                <td>No</td>
                                <td>10,000</td>
                                <td>9,000</td>
                            </tr>
                        </tbody>
                        <tfoot></tfoot>
                    </table>
                </div>
            </div>

        </div>
    </section>
</asp:Content>

