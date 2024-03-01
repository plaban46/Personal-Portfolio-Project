<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_User/MasterPageUser.master" AutoEventWireup="true" CodeBehind="UserPage.aspx.cs" Inherits="Portfolio_ASP.Admin_User.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>User Dashboard</title> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <p>this is home page for User Dashboard</p> 
    <p>Username : <asp:Label ID="user_lavel" runat="server" Text="Label"></asp:Label> </p> 
    

</asp:Content>
