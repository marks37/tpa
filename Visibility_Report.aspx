<%@ Page Title="" Language="C#" MasterPageFile="~/VisibilityMain.master" AutoEventWireup="true" CodeFile="Visibility_Report.aspx.cs" Inherits="Visibility_Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h3 class="text-muted">Visibility Reports</h3>
        <br />
        <table class="table">
            <tbody>
                <tr><td><a class="btn btn-lg" href="WFAR.aspx">Field Activity Report</a></td></tr>
                <tr><td><a class="btn btn-lg">Visibility Pictures</a></td></tr>
                <tr><td><a class="btn btn-lg">Visibility Report by Program</a></td></tr>
            </tbody>
        </table>
    </div>
</asp:Content>

