<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="Implementation_Template2.aspx.cs" Inherits="Implementation_Template2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <section id="page-header-wrap">
        <div class="container">
            <a class="page-breadcrumb">Home / TPA Reports / Implementation Reports</a>
            <h3 class="page-title">OCT 2016 – Implementation Report</h3>
            <!-- Nav tabs -->
            <div class="right-tabs clearfix">
                <ul class="nav nav-tabs" role="tablist" id="tabs">
                    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab" style="border-top: 3px solid #ff6a00;">Details</a></li>
                    <%--<li role="presentation"><a href="#">Initiatives</a></li>--%>
                    <li role="presentation"><a href="#">Pulse</a></li>
                    <li role="presentation"><a href="#">Graphs</a></li>
                </ul>
            </div>
        </div>
    </section>

    <br />

    <section id="page-content-wrap">
        <%--<hr />--%>
        <div class="container">
            <%--<div class="stats-wrapper panel panel-default">
                <div class="panel-body" style="padding: 0px;">
                    <div class="">
                        <table class="table-stats table table-condensed">
                            <tbody>
                                <tr class="text-center">
                                    <td><a class="btn"><strong><span class="status-color" style="background-color: #6cc644;"></span>Implemented <span class="text-muted">65%</span></strong></a></td>
                                    <td><a class="btn"><strong><span class="status-color" style="background-color: #0094ff;"></span>Approved, For Implementation <span class="text-muted">0%</span></strong></a></td>
                                    <td><a class="btn"><strong><span class="status-color" style="background-color: #ff6a00;"></span>Not Applicable <span class="text-muted">0%</span></strong></a></td>
                                    <td><a class="btn"><strong><span class="status-color" style="background-color: #b200ff;"></span>Waiting for LOA <span class="text-muted">0%</span></strong></a></td>
                                    <td><a class="btn"><strong><span class="status-color" style="background-color: #ffd800;"></span>Waiting for Pre-bundled Packs <span class="text-muted">0%</span></strong></a></td>
                                    <td><a class="btn"><strong><span class="status-color" style="background-color: #ededed;"></span>Blank <span class="text-muted">0%</span></strong></a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="progress" style="margin: 0px; margin-top: 0px; border-top-left-radius: 0px; border-top-right-radius: 0px; height: 12px;">
                        <div class="progress-bar progress-bar-success" style="width: 65%">
                            <span class="sr-only">35% Complete (success)</span>
                        </div>
                    </div>
                </div>
            </div>--%>
            
            <div class="row">
                        <div class="col-xs-6">
                            <div class="">
                                <input type="text" class="form-control" id="exampleInputAmount" placeholder="Search.." />
                            </div>
                        </div>
                        <div class="col-xs-6">
                            <div class="text-right">
                                <a type="button" class="btn btn-info" href="NewImplementationTemplate.aspx">Export</a>
                                &nbsp;
                        <a type="button" class="btn btn-success" href="Edit_Implementation_Template.aspx">Edit Data</a>
                            </div>
                        </div>
                    </div>

            <br />

            <div class="panel panel-default">
                <div class="table-responsive">
                    <table class="table table-bordered" id="initiatives_tbl">
                        <thead>
                            <tr class="">
                                <th class="col-xs-2 text-center">Initiative Title</th>
                                <th class="col-xs-2">Accounts</th>
                                <th class="col-xs-1 text-center"># Accounts</th>
                                <th class="col-xs-1 text-center">Implemented</th>
                                <th class="col-xs-1 text-center">Availability</th>
                                <th class="col-xs-1 text-center">LOA Date Received</th>
                                <th class="col-xs-1 text-center">Implementation Status</th>
                                <th class="col-xs-1 text-center">Date of Implementation</th>
                                <th class="col-xs-2">Remarks</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td rowspan="6" class="text-center">Enervon Prime Wave 2
                                <br />
                                    Supermarket Moveout<br />
                                    9/1/2016-10/31/2016</td>
                                <td>Robinsons</td>
                                <td class="text-center">109</td>
                                <td class="text-center">109</td>
                                <td class="text-center">100%</td>
                                <td class="text-center"></td>
                                <td class="text-center">Implemented</td>
                                <td class="text-center">9/14/2016</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Landmark</td>
                                <td class="text-center">3</td>
                                <td class="text-center">3</td>
                                <td class="text-center">100%</td>
                                <td class="text-center">8/18/2016</td>
                                <td class="text-center">Implemented</td>
                                <td class="text-center">9/1/2016</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>Bohol Quality</td>
                                <td class="text-center">1</td>
                                <td class="text-center">1</td>
                                <td class="text-center">100%</td>
                                <td class="text-center">9/24/2016</td>
                                <td class="text-center">Implemented</td>
                                <td class="text-center">10/8/2016</td>
                                <td>Sell in August 2, 2016</td>
                            </tr>
                            <tr>
                                <td>Alfamart</td>
                                <td class="text-center">1</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="text-center">Approved by account, for implementation</td>
                                <td></td>
                                <td>Sell in July 27, 2016</td>
                            </tr>
                            <tr>
                                <td>SVI</td>
                                <td class="text-center">47</td>
                                <td class="text-center">47</td>
                                <td class="text-center">100%</td>
                                <td class="text-center">9/20/2016</td>
                                <td class="text-center">Implemented</td>
                                <td class="text-center">10/4/2016</td>
                                <td>Sell in August 3, 2016, for Warehouse bundling on September 26, 2016, DC bundling delayed due to  featured product is for backloading</td>
                            </tr>
                            <tr>
                                <td>Savemore</td>
                                <td class="text-center">107</td>
                                <td class="text-center">107</td>
                                <td class="text-center">100%</td>
                                <td class="text-center">9/20/2016</td>
                                <td class="text-center">Implemented</td>
                                <td class="text-center">10/4/2016</td>
                                <td>Sell in August 3, 2016, for Warehouse bundling on September 26, 2016, DC bundling delayed due to  featured product is for backloading</td>
                            </tr>
                            <tr>
                                <td class="text-center">CBU Vitamins<br />
                                    Umbrella Program in MT<br />
                                    9/1/2016-10/31/2016</td>
                                <td class="">Robinsons</td>
                                <td class="text-center">30</td>
                                <td class="text-center">30</td>
                                <td class="text-center">100%</td>
                                <td class="text-center"></td>
                                <td class="text-center">Implemented</td>
                                <td class="text-center">9/2/2016</td>
                                <td>For September 15, 2016 Implementation, early implementation</td>
                            </tr>
                            <tr>
                                <td class="text-center" rowspan="3">Vzone Shaver + Free pH Care Naturals Papaya 50ml<br />
                                    9/1/2016-10/31/2016</td>
                                <td>Shopwise</td>
                                <td class="text-center">1</td>
                                <td class="text-center">1</td>
                                <td class="text-center">100%</td>
                                <td class="text-center">8/4/2016</td>
                                <td class="text-center">Implemented</td>
                                <td class="text-center">8/3/2016</td>
                                <td>Sell in done last July 18, PO last August 3, 2016</td>
                            </tr>
                            <tr>
                                <td>Rustans</td>
                                <td class="text-center">1</td>
                                <td class="text-center">1</td>
                                <td class="text-center">100%</td>
                                <td class="text-center">8/4/2016</td>
                                <td class="text-center">Implemented</td>
                                <td class="text-center">8/3/2016</td>
                                <td>Sell in done last July 18, PO last August 3, 2016</td>
                            </tr>
                            <tr>
                                <td>Metro Gaisano</td>
                                <td class="text-center">1</td>
                                <td class="text-center"></td>
                                <td class="text-center"></td>
                                <td class="text-center"></td>
                                <td class="text-center">Waiting for Pre-bundled pack</td>
                                <td class="text-center"></td>
                                <td>Sell in August 2, 2016</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

    </section>
</asp:Content>

