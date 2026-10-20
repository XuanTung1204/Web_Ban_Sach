<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Sachtheonhaxuatban.aspx.cs" Inherits="SieuThiSach.Sachtheonhaxuatban" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="page-title"><asp:Label ID="lbTieude" runat="server" /></h2>
    <asp:GridView ID="gvSach" runat="server" DataSourceID="sdsSach"
        AutoGenerateColumns="False" ShowHeader="False" GridLines="None"
        CellPadding="0" CellSpacing="0" CssClass="book-grid"
        EmptyDataText="Chưa có sách của nhà xuất bản này." EmptyDataRowStyle-CssClass="empty-text">
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
    <asp:SqlDataSource ID="sdsSach" runat="server"
        ConnectionString="<%$ ConnectionStrings:KetnoiCSDL %>"
        SelectCommand="SELECT Masach, Tensach, Dongia, Hinhminhoa FROM SACH WHERE MaNXB = @MaNXB ORDER BY Ngaycapnhat DESC, Masach">
        <SelectParameters>
            <asp:QueryStringParameter Name="MaNXB" QueryStringField="MaNXB" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>