<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListagemPessoas.aspx.cs" Inherits="ListagemPessoas.ListagemPessoas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gdvpessoa" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AllowCustomPaging="True" AllowPaging="True" DataSourceID="SqlDataSource1" Height="314px" PageIndex="1">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                    <asp:BoundField DataField="NOME" HeaderText="NOME" SortExpression="NOME" />
                    <asp:BoundField DataField="CARGO" HeaderText="CARGO" SortExpression="CARGO" />
                    <asp:BoundField DataField="CREDITO" HeaderText="CREDITO" ReadOnly="True" SortExpression="CREDITO" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <br />
            <br />
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT pessoa.id, pessoa.nome, cargo.nome AS cargo, SUM(vencimentos.valor) AS credito
FROM pessoa
JOIN cargo ON pessoa.cargo_id = cargo.id
JOIN cargo_vencimentos ON cargo.id = cargo_vencimentos.cargo_id
JOIN vencimentos ON cargo_vencimentos.vencimento_id = vencimentos.id
WHERE vencimentos.tipo = 'CREDITO'
GROUP BY pessoa.id, pessoa.nome, cargo.nome"></asp:SqlDataSource>
    </form>
</body>
</html>
