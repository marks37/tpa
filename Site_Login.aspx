<%@ Page Title="" Language="C#" MasterPageFile="~/SiteStartup.master" AutoEventWireup="true" CodeFile="Site_Login.aspx.cs" Inherits="Site_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #eee;
        }

        /*.form-signin {
            max-width: 300px;
            padding: 15px;
            margin: 0 auto;
        }

        hr{
            margin-bottom: 35px !important;
        }

        .panel{
            border-radius: 0;
        }

        .form-control{
            border-radius: 0;
        }*/

        .panel{
            border-radius: 0;
        }

        .form-signin {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }

        .form-signin-subheading{
            margin-top:30px;
            margin-bottom: 20px;
        }

            .form-signin .form-signin-heading,
            .form-signin .checkbox {
                margin-bottom: 15px;
            }

            .form-signin .checkbox {
                font-weight: normal;
            }

            .form-signin .form-control {
                position: relative;
                height: auto;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                padding: 10px;
                font-size: 16px;
                border-radius: 0;
            }

                .form-signin .form-control:focus {
                    z-index: 2;
                }

            .form-signin input#inputUsername {
                margin-bottom: -1px;
                border-bottom-right-radius: 0;
                border-bottom-left-radius: 0;
            }

            .form-signin input#inputPassword {
                margin-bottom: 10px;
                border-top-left-radius: 0;
                border-top-right-radius: 0;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="">
            <br />
            <div class="panel panel-default form-signin">
                <div class="panel-body">
                    <h2 class="form-signin-heading text-center">Visibility Portal</h2>
                    <hr />
                    <h3 class="form-signin-subheading text-center text-muted"><small>Login Account</small></h3>
                    <div class="form-group">
                        <label for="inputEmail" class="sr-only">Email address</label>
                        <asp:TextBox ID="inputUsername" CssClass="form-control" placeholder="Username" runat="server" required="true" autofocus="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="sr-only">Password</label>
                        <asp:TextBox ID="inputPassword" CssClass="form-control" placeholder="Password" required="trues" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                    <asp:Label ID="invalidLogin" runat="server" Text=""></asp:Label>
                    <div class="checkbox hidden">
                        <label>
                            <asp:CheckBox ID="rememberCheckBox" runat="server" />
                            Remember me
                        </label>
                    </div>
                    <br />
                    <asp:Button ID="loginBtn" CssClass="btn btn-primary btn-block" runat="server" Text="Sign in" OnClick="loginBtn_Click"/>
                    
                </div>
            </div>
        </div>
        
    </div>
    <!-- /container -->

</asp:Content>

