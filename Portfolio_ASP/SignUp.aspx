<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Portfolio_ASP.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignUp</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
  
    <style>
        /* Base styles */
        .panel-body {
            width: calc(100% - 40px); 
            padding: 20px; 
            box-sizing: border-box; 
        }

        .panel-heading {
            background-color: greenyellow; 
            color: black; 
            padding: 10px 15px; 
            display: block; 
            width: calc(100% - 40px); 
        }

        .form-group {
            margin-bottom: 15px; 
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        .form-control {
            width: calc(100% - 20px); 
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn {
            width: calc(100% - 20px); 
            padding: 10px;
            margin: 4px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            background-color: #4CAF50; 
            color: white;
        }        
        .btn-red {
            width: calc(100% - 20px); 
            padding: 10px;
            margin: 4px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            background-color: red; 
            color: white;
        }

        /* Responsive styles */
        @media screen and (max-width: 768px) {
            .panel-body {
                padding: 10px; 
            }

            .btn {
                margin-top: 15px; 

            }
        }

        /* Additional Mobile Styles */
        @media screen and (max-width: 480px) {
            .form-control {
                font-size: 14px; 
                padding: 8px; 
            }

            .btn {
                font-size: 14px; 
                padding: 8px; 
            }
        }

        footer {
            text-align: center;
            background-color: #f2f2f2; 
            padding: 20px;
            position: absolute;
            bottom: 0;
            width: 100%;
        }

        footer p {
            margin: 0;
            font-size: 14px;
            color: #666; 
        }
    </style>



</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="col-sm-3">
            </div>
            <div class="col-sm-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        Sign Up For User
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label>Name:</label>
                                    <asp:TextBox ID="txtname" CssClass="form-control" runat="server"></asp:TextBox>
                                </div> 

                                <div class="form-group">
                                    <label>Address:</label>
                                    <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label>City:</label>
                                    <asp:TextBox ID="txtCity" CssClass="form-control" runat="server"></asp:TextBox>
                                </div> 

                                <div class="form-group">
                                    <label>Mobile:</label>
                                    <asp:TextBox ID="txtMobile" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label>
                                        Email or Facebook:</label>
                                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>
                                        Gender:</label>
                                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Female" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Male" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Other" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>
                                        Password:</label>
                                    <asp:TextBox ID="txtpass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                </div> 

                                <div class="form-group">
                                    <asp:Button ID="btnSignup" CssClass="btn" runat="server" Text="Registration" OnClick="btnSignup_Click" />
                                    <asp:Button ID="btnCancel" CssClass="btn-red" runat="server" Text="Cancel" OnClick="cancleSignup"/>
                                    &nbsp;
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
            </div>
        </div> 
    </form>
</body>
</html>
