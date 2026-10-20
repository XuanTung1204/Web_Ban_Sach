<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sachbannhieu.ascx.cs" Inherits="SieuThiSach.UserControls.Sachbannhieu" %>

<div class="box-hot">
    <h3>Sách bán chạy</h3>
    <asp:DataList ID="dlBanchay" runat="server" DataSourceID="sdsBanchay"
        RepeatLayout="Flow" CssClass="hot-list" ItemStyle-CssClass="hot-item">
        <ItemTemplate>
            <asp:HyperLink ID="hplSach" runat="server" Text='<%# Eval("Tensach") %>'
                NavigateUrl='<%# "~/Chitietsach.aspx?Masach=" + Eval("Masach") %>' />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="sdsBanchay" runat="server"
        ConnectionString="<%$ ConnectionStrings:KetnoiCSDL %>"
        SelectCommand="SELECT TOP 5 S.Masach, S.Tensach
                       FROM SACH S LEFT JOIN CTDATHANG C ON S.Masach = C.Masach
                       GROUP BY S.Masach, S.Tensach, S.Soluongban
                       ORDER BY ISNULL(SUM(C.Soluong), 0) DESC, S.Soluongban DESC"></asp:SqlDataSource>
</div>