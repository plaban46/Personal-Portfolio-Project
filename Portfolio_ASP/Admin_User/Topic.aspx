<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_User/MasterPageUser.master" AutoEventWireup="true" CodeBehind="Topic.aspx.cs" Inherits="Portfolio_ASP.Admin_User.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    
    <title>Add Your Research</title>
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
            color: #ffffff; /* White */
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
             <label>Writer Name</label>
             <asp:TextBox ID="txtWriterName" CssClass="form-control" runat="server"></asp:TextBox>
         </div>
         <div class="form-group-sm">
             <label>Topic Name</label>
             <asp:TextBox ID="txtTopicName" CssClass="form-control" runat="server"></asp:TextBox>
         </div>
         <div class="form-group-sm">
             <label>Description</label>
             <asp:TextBox ID="txtDesName" CssClass="form-control" runat="server"></asp:TextBox>
         </div> 
         <div class="form-group-sm">
             <p>
             </p>
             <asp:Button ID="btnAddResearch" CssClass="btn btn-success btn-lg " runat="server" Text="Add Topic"
                 OnClick="btnAddResearch_Click" />
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
                 AutoGenerateColumns="False" DataKeyNames="IID" DataSourceID="SqlDataSource1">
                 <Columns>
                     <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                     <asp:BoundField DataField="IID" HeaderText="IID" InsertVisible="False" ReadOnly="True"
                         SortExpression="IID" />
                     <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                     <asp:BoundField DataField="Topic" HeaderText="Topic" SortExpression="Topic" />
                     <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                 </Columns>
             </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PortfolioCon %>"
                 DeleteCommand="DELETE FROM [AddTopic] WHERE [IID] = @IID" InsertCommand="INSERT INTO [AddTopic] ([Name], [Topic], [Description]) VALUES (@Name, @Topic, @Description)"
                 SelectCommand="SELECT [IID], [Name], [Topic], [Description] FROM [AddTopic]"
                 UpdateCommand="UPDATE [AddTopic] SET [Name] = @Name, [Topic] = @Topic, [Description]=@Description WHERE [IID] = @IID">
                 <DeleteParameters>
                     <asp:Parameter Name="IID" Type="Int32" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="Name" Type="String" />
                     <asp:Parameter Name="Topic" Type="String" />
                     <asp:Parameter Name="Description" Type="String" />
                 </InsertParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="Name" Type="String" />
                     <asp:Parameter Name="Topic" Type="String" />
                     <asp:Parameter Name="Description" Type="String" />
                 </UpdateParameters>
             </asp:SqlDataSource>
         </div>
     </div>
 </div>


</asp:Content>
