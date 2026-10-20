<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Giohang.aspx.cs" Inherits="SieuThiSach.Giohang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="page-title">Giỏ hàng của bạn</h2>

    <asp:Panel ID="pnlGiohang" runat="server">
        <asp:GridView ID="gvGiohang" runat="server" AutoGenerateColumns="False" GridLines="None"
            CssClass="cart-table" DataKeyNames="Masach" OnRowCommand="gvGiohang_RowCommand"
            EmptyDataText="Giỏ hàng đang trống." EmptyDataRowStyle-CssClass="empty-text">
            <Columns>
                <asp:TemplateField HeaderText="Sách">
                    <ItemTemplate>
                        <asp:HyperLink ID="hplTen" runat="server" Text='<%# Eval("Tensach") %>'
                            NavigateUrl='<%# "~/Chitietsach.aspx?Masach=" + Eval("Masach") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SL">
                    <ItemTemplate>
                        <asp:TextBox ID="txtSoluong" runat="server" Text='<%# Eval("Soluong") %>' MaxLength="3" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Đơn giá">
                    <ItemStyle CssClass="num" />
                    <ItemTemplate><%# Eval("Dongia", "{0:#,##0}") %></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Thành tiền">
                    <ItemStyle CssClass="num" />
                    <ItemTemplate><%# Eval("Thanhtien", "{0:#,##0}") %></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtXoa" runat="server" CommandName="Xoa"
                            CommandArgument='<%# Eval("Masach") %>' Text="Xóa"
                            OnClientClick="return confirm('Xóa sách này khỏi giỏ hàng?');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <div class="cart-total">Tổng tiền: <b><asp:Label ID="lbTong" runat="server" /> VND</b></div>

        <div class="cart-actions">
            <asp:HyperLink ID="hplTiep" runat="server" NavigateUrl="~/Default.aspx">&laquo; Tiếp tục mua sách</asp:HyperLink>
            <span>
                <asp:Button ID="btCapnhat" runat="server" Text="Cập nhật" CssClass="btn" OnClick="btCapnhat_Click" />
                <asp:Button ID="btDathang" runat="server" Text="Đặt hàng" CssClass="btn" OnClick="btDathang_Click" />
            </span>
        </div>
    </asp:Panel>

    <asp:Label ID="lbThongbao" runat="server" CssClass="baoloi" />
</asp:Content>
