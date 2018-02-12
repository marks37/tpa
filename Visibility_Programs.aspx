<%@ Page Title="" Language="C#" MasterPageFile="~/VisibilityMain.master" AutoEventWireup="true" CodeFile="Visibility_Programs.aspx.cs" Inherits="Visibility_Programs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .table > tbody > tr {
            background-color: #fff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h3 class="text-muted">Visibility Programs</h3>
        <br />
        <div class="pull-left">
            <%--<a class="btn btn-primary" href="New_Visibility.aspx">New Visibility</a>--%>
            <!-- Button trigger modal -->
            <a class="btn btn-primary" data-toggle="modal" data-target="#myModal">New Program</a>
        </div>
        <div class="clearfix">
        </div>
        <br />
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>CODE</th>
                    <th>CATEGORY</th>
                    <th>BRAND</th>
                    <th>ASSIGNED</th>
                    <th>ACTION</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="parentRepeater" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("itemCode") %></td>
                            <td><%# Eval("category") %></td>
                            <td><%# Eval("brand") %></td>
                            <td>MDC</td>
                            <td><a class="btn btn-default">View</a></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>

                
            </tbody>
        </table>
    </div>
</asp:Content>

