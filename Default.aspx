<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--<div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>--%>

    <div class="">

    
    <div class="row">
        <div class="col-md-12">
            <br />
            <ul class="nav nav-pills">
                <li role="presentation" class="active"><a href="#">All</a></li>
                <li role="presentation"><a href="#">Key Accounts</a></li>
                <li role="presentation"><a href="#">Modern Trade</a></li>
                <li role="presentation"><a href="#">General Trade</a></li>
                <li role="presentation"><a href="#">Modern Trade</a></li>
            </ul>
            <br />
            <table class="table table-striped table-hover table-condensed table-bordered table-responsive" id="initiatives_tbl">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Agency</th>
                        <th style="width: 10%;">Coordinator</th>
                        <%--<th>Initiative Type</th>
                        <th>Initiative Sub-Type</th>
                        <th>Category</th>
                        <th>Division</th>
                        <th>Brand</th>--%>
                        <th>Initiative</th>
                        <th style="width: 5%;">Start</th>
                        <th style="width: 5%;">End</th>
                        <th style="width: 5%;">Account</th>
                        <th>Branches</th>
                        <th>TL'S Name</th>
                        <th>CDS</th>
                        <%--<th>Delivery Date</th>
                        <th>Delivery Status</th>
                        <th>Remarks on Delivery Status</th>--%>
                        <%--<th>Date Receive LOA</th>--%>
                        <th>Status</th>
                        <th>Date</th>
                        <th>Issues</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>GMSI</td>
                        <td>Orlando Espera</td>
                       <%-- <td>Promotion</td>
                        <td>In Store Bundling</td>
                        <td>OTC</td>
                        <td>UHP Regional</td>
                        <td>Rexidol</td>--%>
                        <%--<td>Rexidol 8+2 In Store Bundling</td>
                        <td>September 1, 2016</td>
                        <td>October 31, 2016</td>
                        <td>Farmacia Southern</td>
                        <td>Ilustre</td>
                        <td></td>
                        <td>Don Johnson Torayno</td>--%>
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
                    </tr>
                </tbody>
                <tfoot></tfoot>
            </table>

        </div>
    </div>

    </div>
    <%--<div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>--%>
</asp:Content>
