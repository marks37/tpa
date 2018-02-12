<%@ Page Title="Admin Visibility" Language="C#" MasterPageFile="~/VisibilityMain.master" AutoEventWireup="true" CodeFile="admin_visibility.aspx.cs" Inherits="admin_visibility" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <ol class="breadcrumb">
            <li class="active">Home</li>
        </ol>
        <div class="">
            <div class="">
                <h2 class="">Visibility Submissions</h2>
            </div>
        </div>
        <hr style="margin-bottom: 5px;" />
        <a class="btn btn-primary" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i>&nbsp;New</a>
        <a class="btn btn-primary" data-toggle="modal" data-target="#myModal"><i class="fa fa-filter"></i>&nbsp;Filter</a>        
        <hr />
        <br />
        <div>
            <table id="visibTbl" class="table table-bordered table-condensed table-hover">
                <thead>
                    <tr>
                        <th class="no-sort">
                            <asp:CheckBox ID="CheckBox1" runat="server" /></th>
                        <th class="no-sort">STATUS</th>
                        <th>BRANCH</th>
                        <th>ACCOUNT</th>
                        <th>CHANNEL</th>
                        <th>CALL DATE</th>
                        <th>COORDINATOR</th>
                        <th>SALES REP</th>
                        <th>DATE CREATED</th>
                        <th class="no-sort">ACTION</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="visibRepeater" runat="server" OnItemCommand="visibRepeater_ItemCommand" OnItemDataBound="visibRepeater_ItemDataBound">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="CheckBox2" runat="server" />
                                </td>
                                <td>
                                    <asp:Label ID="statuslbl" runat="server" Text=""></asp:Label></td>
                                <td><%# DataBinder.Eval(Container.DataItem, "branchName") %></td>
                                <td><%# DataBinder.Eval(Container.DataItem, "accountGroup") %></td>
                                <td><%# DataBinder.Eval(Container.DataItem, "channel") %></td>
                                <td>
                                    <asp:Label ID="calldatelbl" runat="server" Text=""></asp:Label>
                                </td>
                                <td><%# DataBinder.Eval(Container.DataItem, "coordinator") %></td>
                                <td><%# DataBinder.Eval(Container.DataItem, "cds") %></td>
                                <td>
                                    <asp:Label ID="datecreatedlbl" runat="server" Text=""></asp:Label>
                                </td>
                                <td>
                                    <asp:LinkButton ID="viewBtn" runat="server" CssClass="btn btn-link"  CommandName="view" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "id") %>'>View</asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('#visibTbl').DataTable({
                "order": [],
                "columnDefs": [{
                    "targets": 'no-sort',
                    "orderable": false,
                }]
            });
        });
    </script>
</asp:Content>

