<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="Portfolio_ASP.Admin.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Admin Dashboard</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <p>this is home page for admin</p> 
        <p>Username : <asp:Label ID="admin_label" runat="server" Text="Label"></asp:Label> </p> 

</asp:Content>
