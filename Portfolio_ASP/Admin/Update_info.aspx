<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeBehind="Update_info.aspx.cs" Inherits="Portfolio_ASP.Admin.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Update Info</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
        .small-image {
            max-width: 150px; /* Set the maximum width of the image */
            max-height: 150px; /* Set the maximum height of the image */
        }

        .form-container {
            display: flex;
            justify-content: space-around flex-wrap: wrap;
        }

            .form-container > div {
                width: 50%; /* Adjust width as needed */
            }

        /* Media query for phones */
        @media screen and (max-width: 600px) {
            .form-container > div {
                width: 100%; /* Make each div occupy full width on smaller screens */
            }
        }

        @media screen and (max-width: 1400px) {
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <form id="form1">

        <div class="form-container">
            <div> 
                <asp:Label ID="Label_home_des" runat="server" Text="Home Description :"></asp:Label>
                <br />
                <asp:TextBox ID="home_des_text" runat="server"></asp:TextBox> 
                <asp:Button ID="home_des_up" runat="server" Text="Upload Text" OnClick="home_des_up_Click" />
<%--                <asp:Button ID="home_des_retrive" runat="server" Text="Retrieve Text" OnClick="home_des_re_Click" /> --%>
            </div>
        </div>
        <div class="form-container">
            <div> 
                <asp:Label ID="Label_about" runat="server" Text="About Text :"></asp:Label>
                <br />
                <asp:TextBox ID="about_text" runat="server"></asp:TextBox> 
                <asp:Button ID="about_up" runat="server" Text="Upload Text" OnClick="about_up_Click" />
<%--                <asp:Button ID="about_retrive" runat="server" Text="Retrieve Text" OnClick="about_re_Click" /> --%>
            </div>
        </div>
        <div class="form-container">
            <div> 
                <asp:Label ID="Label_thanks_des" runat="server" Text="Thanks Message :"></asp:Label>
                <br />
                <asp:TextBox ID="thanks_text" runat="server"></asp:TextBox> 
                <asp:Button ID="thanks_text_up" runat="server" Text="Upload Text" OnClick="thanks_text_up_Click"  />
<%--                <asp:Button ID="thanks_text_retrive" runat="server" Text="Retrieve Text" OnClick="thanks_text_re_Click" /> --%>
            </div>
        </div>
        <div class="form-container">
            <div> 
                <br />
                <asp:Label ID="Label1" runat="server" Text="Home Image :"></asp:Label>
                <br />
                <asp:FileUpload ID="home_image" runat="server" />
                <asp:Button ID="home_image_up" runat="server" Text="Upload Image" OnClick="home_image_up_Click" />
                <asp:Button ID="home_image_retrive" runat="server" Text="Retrieve Image" OnClick="home_image_re_Click" />
                <br />
                <asp:Image ID="home_image_view" CssClass="small-image" runat="server" Visible="false" />
            </div>
        </div>

        <div class="form-container">
            <div>
                <br />
                <asp:Label ID="about_label" runat="server" Text="About Image :"></asp:Label>
                <br />
                <asp:FileUpload ID="about_image" runat="server" />
                <asp:Button ID="about_image_up" runat="server" Text="Upload Image" OnClick="about_image_up_Click" />
                <asp:Button ID="about_image_retrive" runat="server" Text="Retrieve Image" OnClick="about_image_re_Click" />
                <br />
                <asp:Image ID="about_image_view" CssClass="small-image" runat="server" Visible="false" />
            </div>
        </div>

        <div class="form-container">
            <div>
                <br />
                <asp:Label ID="Label2" runat="server" Text="Thanks Image :"></asp:Label>
                <br />
                <asp:FileUpload ID="thanks_image" runat="server" />
                <asp:Button ID="thanks_image_up" runat="server" Text="Upload Image" OnClick="thanks_image_up_Click" />
                <asp:Button ID="thanks_image_retrive" runat="server" Text="Retrieve Image" OnClick="thanks_image_re_Click" />
                <br />
                <asp:Image ID="thanks_image_view" CssClass="small-image" runat="server" Visible="false" />
            </div>
        </div>
        </div>
    </form>


</asp:Content>
