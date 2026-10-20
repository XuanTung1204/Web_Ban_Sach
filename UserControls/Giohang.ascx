<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Giohang.ascx.cs" Inherits="SieuThiSach.UserControls.Giohang" %>

<div class="cart-box">
    <div class="cart-row">
        <img src="~/Images/icon_cart.png" alt="" runat="server" />
        <asp:HyperLink ID="hplGiohang" runat="server" NavigateUrl="~/Giohang.aspx">Giỏ hàng của bạn</asp:HyperLink>
    </div>
    <div class="cart-row">
        <img src="~/Images/icon_money.png" alt="" runat="server" />
        <asp:Label ID="lbTongtien" runat="server" Text="Tổng tiền là: 0"></asp:Label>
    </div>
</div>