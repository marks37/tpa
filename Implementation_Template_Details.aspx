<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.master" AutoEventWireup="true" CodeFile="Implementation_Template_Details.aspx.cs" Inherits="Implementation_Template_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <h4 class="page-header">OCT 2016 Implementation</h4>
        <a class="btn btn-default" href="Implementation_Templates.aspx">Back</a>
        <a class="btn btn-default" href="Edit_Implementation_Template.aspx">Edit Template</a>
        <a class="btn btn-default" href="New_Implementation_Update.aspx">Submit Weekly Update</a>

        <br />
        <br />
        <h4 class="page-content-header">Summary</h4>
        <div class="panel panel-default">
                <div class="table-responsive">
                    <table class="table table-bordered nowrap" id="" style="font-size: 12px;">
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
        <br />
        <%--<h5 class="page-content-header">Implementation Template</h5>
        <div class="" style="">
                <table class="table table-bordered table-striped table-hover nowrap" id="initiatives_tbl">
                    <thead>
                        <tr style="font-size: 12px;">
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
            </div>--%>

    </div>
    <script>
        $(document).ready(function () {
            $('#initiatives_tbl').DataTable({
                "searching": false,
                colReorder: true,
                deferRender: true,
                scrollY: 500,
                scrollX: true,
                scrollCollapse: true,
                scroller: true,
                columnDefs: [
            { width: '20%', targets: 0 }
                ],
                //fixedColumns: {
                //    leftColumns: 5,
                //    heightMatch: 'none'
                //},
                //dom: 'Bfrtip',
                //buttons: [
                //    'colvis'
                //]
            });
        });
    </script>
</asp:Content>

