<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Chudesach.ascx.cs" Inherits="SieuThiSach.UserControls.Chudesach" %>

<div class="box-list">
    <h3>Chủ đề sách</h3>
    <asp:GridView ID="gvChude" runat="server" DataSourceID="sdsChude"
        AutoGenerateColumns="False" ShowHeader="False" GridLines="None"
        CellPadding="0" CellSpacing="0" CssClass="list-grid">
        <Columns>
            <asp:HyperLinkField DataTextField="Tenchude" DataNavigateUrlFields="MaCD"
                DataNavigateUrlFormatString="~/Sachtheochude.aspx?MaCD={0}" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsChude" runat="server"
        ConnectionString="<%$ ConnectionStrings:KetnoiCSDL %>"
        SelectCommand="SELECT MaCD, Tenchude FROM CHUDE ORDER BY MaCD"></asp:SqlDataSource>
</div>