<%@ Page Title="" Language="C#" MasterPageFile="~/SiteEdit.master" AutoEventWireup="true" CodeFile="Edit_Implementation_Template.aspx.cs" Inherits="Edit_Implementation_Template" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-header-wrap">
        <div id="page-header">
            <div class="container-fluid">
                <a class="page-breadcrumb" href="Implementation_Template2.aspx">Home / TPA Reports / Implementation Reports / Edit Data</a>
                <h3 class="page-title">OCT 2016 – Implementation Template</h3>
                <!-- Nav tabs -->
                <div class="clearfix">
                    <ul class="nav nav-tabs" role="tablist" id="tabs">
                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab" style="border-top: 3px solid #ff6a00;">Data</a></li>
                        <li role="presentation"><a href="#">Pictures</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="page-toolbar">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-8">
                    <div class="form-inline">

                        <button class="btn btn-default" type="button"><i class="fa fa-filter" aria-hidden="true"></i> Filter</button>
                        <input type="text" class="form-control" id="exampleInputAmount" placeholder="Search" />
                        <div class="btn-group" role="group" aria-label="...">
                            <button type="button" class="btn btn-primary">ALL</button>
                            <button type="button" class="btn btn-default">GMSI</button>
                            <button type="button" class="btn btn-default">PBCS</button>
                        </div>
                    </div>

                </div>
                <div class="col-xs-4">
                    <div class="text-right">
                        <button class="btn btn-default">Download Template</button>
                        <button class="btn btn-default"><i class="fa fa-cog" aria-hidden="true"></i> Options</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="page-content-wrap">
        <br />
        <div class="container-fluid">
            <div class="table-responsive" style="">
                <table class="table table-hover table-condensed table-bordered" id="initiatives_tbl">
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
</asp:Content>

