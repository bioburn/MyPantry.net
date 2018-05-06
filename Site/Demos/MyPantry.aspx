<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyPantry.aspx.cs" Inherits="Demos_Database" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Pantry</title>
    <link href="../Styles/Styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="PageWrapper">
            <header></header>
            <nav></nav>
            <section id="MainContent">
                <h1>Welcome to MyPantry</h1>

            </section>

        </div>


        <div id="GroceryBox">
            <asp:Label ID="Label1" runat="server" Text="Groceries"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" CellPadding ="5" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="Delete" />
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" ShowHeader="True" />
                    <asp:BoundField DataField="Title" HeaderText="Item" SortExpression="Title" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Expiration" HeaderText="Expiration" SortExpression="Expiration" />
                    <asp:BoundField DataField="Tag" HeaderText="Tag" SortExpression="Tag" />
                </Columns>
            </asp:GridView>

        </div>

        <br />
        <br />
        <div id="InputForm">
            <span class="auto-style1"><strong>Add Groceries</strong><br />
                <br />
                Item</span>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <br />
            <span class="auto-style1">Quantity</span>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" type="number" min="0" OnTextChanged="TextBox2_TextChanged" Width="42px" ></asp:TextBox>
            <br />
            <span class="auto-style1">Price</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <span class="auto-style1">Expiration</span>&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox4" runat="server" Enabled="False"></asp:TextBox>
            <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged1"></asp:Calendar>
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <br />
            <span class="auto-style1">Tag</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegiConnectionString %>" SelectCommand="uspGroceryList_Get" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
