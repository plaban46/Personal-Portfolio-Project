<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeBehind="AddProjects.aspx.cs" Inherits="Portfolio_ASP.Admin.AddProjects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Add Projects</title>
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
        .table-text {
            color: black;
        }

        .row {
            display: flex;
            justify-content: center;
        }

        .col-sm-2,
        .col-sm-8 {
            flex: 0 0 auto; /* Ensure columns don't grow or shrink */
            width: auto;
        }

        .form-group-sm {
            margin-bottom: 15px;
        }

        .background-white {
            background-color: orange;
        }
        .some-styles{
            border-radius:5px; 
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="file"],
        button {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #28a745;
            color: #fff;
            border: none;
        }

            button:hover {
                background-color: #218838;
            }

        .btn-lg {
            font-size: 18px;
        }

        @media screen and (max-width: 768px) {
            .row {
                flex-direction: column; /* Stack columns vertically on smaller screens */
                align-items: center; /* Center align content */
            }

            .col-sm-2,
            .col-sm-8 {
                width: 100%; /* Full width for columns on smaller screens */
            }
        }

        .btn-success {
            background-color: #28a745; /* Green */
            border-color: #28a745;
            color: #ffffff;
            width: 148px;
        }

        .btn-success:hover {
            background-color: #218838; /* Darker green on hover */
            border-color: #1e7e34;
            color: #ffffff; /* White */
        }
        .gridview-font {
            font-family: Arial, sans-serif; /* Specify your preferred font */
            font-size: 17px; 
        }
    </style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <div class="row">
        <div class="col-sm-2">
        </div>
        <div class="col-sm-8">
            <div class="form-group-sm">
                <label>Project Name</label>
                <asp:TextBox ID="txtProName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group-sm">
                <label>Project Year</label>
                <asp:TextBox ID="txtProYear" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group-sm">
                <label>Project Description</label>
                <asp:TextBox ID="txtProDes" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group-sm">
                <label>Project Link</label>
                <asp:TextBox ID="txtProLink" CssClass="form-control" runat="server"></asp:TextBox>
            </div> 
            <div class="form-group-sm">
                <label>Project Image</label>
                <asp:FileUpload ID="FileUpload1" CssClass="form-control background-white" runat="server" />
            </div>
            <div class="form-group-sm">
                <p>
                </p>
                <asp:Button ID="btnAddProject" CssClass="btn btn-success btn-lg " runat="server" Text="ADD Project"
                    OnClick="AddProjectButton" />
                <p> 
                <p>
                </p>
            </div>
        </div>
        <div class="col-sm-2">
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="table table-responsive">
                <asp:GridView ID="GridView1" CssClass="background-white table-text gridview-font some-styles" runat="server" AllowPaging="True"
                    AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                        <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:BoundField DataField="Link" HeaderText="Link" SortExpression="Link" /> 
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PortfolioCon %>"
                    DeleteCommand="DELETE FROM [AddProject] WHERE [ID] = @ID" InsertCommand="INSERT INTO [AddProject] ([Name], [Image], [Year], [Description], [Link]) VALUES (@Name,@Image,@Year,@Description,@Link)"
                    SelectCommand="SELECT [ID], [Name], [Image], [Year], [Description], [Link] FROM [AddProject]"
                    UpdateCommand="UPDATE [AddProject] SET [Name] = @Name, [Image] = @Image, [Year] = @Year, [Description] = @Description, [Link] = @Link WHERE [ID] = @ID">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Image" Type="String" />
                        <asp:Parameter Name="Year" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Link" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Image" Type="String" />
                        <asp:Parameter Name="Year" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Link" Type="String" /> 
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>


</asp:Content>
