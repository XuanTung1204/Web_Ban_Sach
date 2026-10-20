<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sachmoi.ascx.cs" Inherits="SieuThiSach.UserControls.Sachmoi" %>

<h2 class="sec-title">Sách mới</h2>
<asp:GridView ID="gvSachmoi" runat="server" DataSourceID="sdsSachmoi"
    AutoGenerateColumns="False" ShowHeader="False" GridLines="None"
    CellPadding="0" CellSpacing="0" CssClass="book-grid">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <div class="book-item">
                    <asp:HyperLink ID="hplTen" runat="server" CssClass="book-name"
                        Text='<%# Eval("Tensach") %>'
                        NavigateUrl='<%# "~/Chitietsach.aspx?Masach=" + Eval("Masach") %>' />
                    <asp:HyperLink ID="hplHinh" runat="server" CssClass="book-cover"
                        Text='<%# Eval("Tensach") %>'
                        ImageUrl='<%# "~/Images/Sach/" + Eval("Hinhminhoa") %>'
                        NavigateUrl='<%# "~/Chitietsach.aspx?Masach=" + Eval("Masach") %>' />
                    <img src="~/Images/new.png" alt="NEW" class="badge-new" runat="server" />
                    <div class="book-price">Đơn giá: <b><%# Eval("Dongia", "{0:#,##0}") %> VND</b></div>
                    <div class="book-buy">
                        <asp:HyperLink ID="hplMua" runat="server" Text="Đặt mua"
                            NavigateUrl='<%# "~/Datmua.aspx?Masach=" + Eval("Masach") %>' />
                    </div>
                </div>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="sdsSachmoi" runat="server"
    ConnectionString="<%$ ConnectionStrings:KetnoiCSDL %>"
    SelectCommand="SELECT TOP 4 Masach, Tensach, Dongia, Hinhminhoa FROM SACH ORDER BY Ngaycapnhat DESC, Masach DESC"></asp:SqlDataSource>