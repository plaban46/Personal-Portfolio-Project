<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_User/MasterPageUser.Master" AutoEventWireup="true" CodeBehind="Logout_user.aspx.cs" Inherits="Portfolio_ASP.Admin_User.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .button_st {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <asp:Button ID="logout" CssClass="button_st" runat="server" Text="Logout User" OnClick="btnlogout_Click" />
     
</asp:Content>
