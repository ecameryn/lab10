<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id" AutoPostBack="True"></asp:DropDownList>

    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="SqlDataSource2">
        <Fields>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title"></asp:BoundField>
            <asp:BoundField DataField="Summary" HeaderText="Summary" SortExpression="Summary"></asp:BoundField>
        </Fields>
    </asp:DetailsView>

    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:dbHolstickConnectionString %>' SelectCommand="SELECT [Title], [Summary] FROM [Review] WHERE ([GenreId] = @GenreId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" DefaultValue="1" Name="GenreId" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:dbHolstickConnectionString %>' SelectCommand="SELECT [Id], [Name] FROM [Genre] ORDER BY [Name]"></asp:SqlDataSource>
    
    <input id="Button1" type="button" value="button" />

    <script>
        $(document).ready(function ()
        {
        $('#MainContent').css('background-color', 'green')
        $('#Button1').click(function ()
        {
        $('#MainContent').css('background-color', 'red').animate({ width: '100px', height: '800px' })
        });
        });
</script>
</asp:Content>

