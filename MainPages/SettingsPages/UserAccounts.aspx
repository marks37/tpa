<%@ Page Title="" Language="C#" MasterPageFile="~/MainPages/SettingsPages/Main_Settings.master" AutoEventWireup="true" CodeFile="UserAccounts.aspx.cs" Inherits="MainPages_SettingsPages_UserAccounts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <h2>User Accounts</h2>
    <hr style="margin-bottom: 5px;" />
    <a class="btn btn-primary" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i>&nbsp;New User</a>
    <hr />
    <br />
    <br />
    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>ID</th>
                <th>USERNAME</th>
                <th>ROLE</th>
                <th>ACTIONS</th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="userRepeater" runat="server">
                <ItemTemplate>
                    <tr>
                        <td>1</td>
                        <td>mbsantiago</td>
                        <td>Admin</td>
                        <td>Delete</td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">New User</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="">First Name</label>
                        <input type="text" class="form-control" id="firstName" placeholder="First Name">
                    </div>
                    <div class="form-group">
                        <label for="">Last Name</label>
                        <input type="text" class="form-control" id="lastName" placeholder="Last Name">
                    </div>
                    <br />
                    <hr />
                    <br />
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Password</label>
                        <input type="password" class="form-control" id="password1" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Confirm Password</label>
                        <input type="password" class="form-control" id="password2" placeholder="Confirm Password">
                    </div>
                    <br />
                    <hr />
                    <br />
                    <div class="form-group">
                        <label for="exampleInputEmail1">User Role</label>
                        <input type="email" class="form-control">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

