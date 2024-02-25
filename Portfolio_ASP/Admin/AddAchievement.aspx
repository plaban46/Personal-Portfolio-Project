<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeBehind="AddAchievement.aspx.cs" Inherits="Portfolio_ASP.Admin.AddAchievement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Add Item</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" type="text/javascript"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" type="text/javascript"></script>

    <style>
        .table-text{
            color:black;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-sm-2">
        </div>
        <div class="col-sm-8">
            <div class="form-group-sm">
                <label>Achievement Title</label>
                <asp:TextBox ID="txtItemName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>   
            <div class="form-group-sm">
                <label>Achievement Image</label>
                <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
            </div>    
            <div class="form-group-sm">
                <p>
                </p>
                <asp:Button ID="btnAddItem" CssClass="btn btn-success btn-lg" runat="server" Text="ADD ITEM"
                    OnClick="btnAddItem_Click" />
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
                <asp:GridView ID="GridView1" CssClass="table table-condensed table-text" runat="server" AllowPaging="True"
                    AutoGenerateColumns="False" DataKeyNames="IID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="IID" HeaderText="IID" InsertVisible="False" ReadOnly="True"
                            SortExpression="IID" />
                        <asp:BoundField DataField="IName" HeaderText="IName" SortExpression="IName" />
                        <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PortfolioCon %>"
                    DeleteCommand="DELETE FROM [AddAchievement] WHERE [IID] = @IID" InsertCommand="INSERT INTO [AddAchievement] ([IName], [Image]) VALUES (@IName, @Image)"
                    SelectCommand="SELECT [IID], [IName], [Image] FROM [AddAchievement]"
                    UpdateCommand="UPDATE [AddAchievement] SET [IName] = @IName, [Image] = @Image WHERE [IID] = @IID">
                    <DeleteParameters>
                        <asp:Parameter Name="IID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="IName" Type="String" />
                        <asp:Parameter Name="Image" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="IName" Type="String" />
                        <asp:Parameter Name="Image" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>


</asp:Content>
