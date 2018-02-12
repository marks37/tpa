<%@ Page Title="Oops.." Language="C#" MasterPageFile="~/VisibilityMain.master" AutoEventWireup="true" CodeFile="Oops.aspx.cs" Inherits="ErrorPages_Oops" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .container-table {
            display: table;
        }
        .vertical-center-row {
            display: table-cell;
            vertical-align: middle;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid container-table">
        <div class="row vertical-center-row">
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <div class="text-left">
                <h1 class="text-capitalize text-muted"><i class="fa fa-frown-o"></i> Oops...</h1>
                <h3><small>This is embarassing. Something went wrong.</small></h3>
                <a href="../Visibility.aspx" class="btn btn-primary">Back to Home</a>
            </div>

        </div>

    </div>
</asp:Content>

