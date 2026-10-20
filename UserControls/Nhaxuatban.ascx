<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Nhaxuatban.ascx.cs" Inherits="SieuThiSach.UserControls.Nhaxuatban" %>

<div class="box-list">
    <h3>Nhà xuất bản</h3>
    <asp:GridView ID="gvNXB" runat="server" DataSourceID="sdsNXB"
        AutoGenerateColumns="False" ShowHeader="False" GridLines="None"
        CellPadding="0" CellSpacing="0" CssClass="list-grid">
        <Columns>
            <asp:HyperLinkField DataTextField="TenNXB" DataNavigateUrlFields="MaNXB"
                DataNavigateUrlFormatString="~/Sachtheonhaxuatban.aspx?MaNXB={0}" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsNXB" runat="server"
        ConnectionString="<%$ ConnectionStrings:KetnoiCSDL %>"
        SelectCommand="SELECT MaNXB, TenNXB FROM NHAXUATBAN ORDER BY MaNXB"></asp:SqlDataSource>
</div>