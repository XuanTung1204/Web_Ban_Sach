<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu.ascx.cs" Inherits="SieuThiSach.UserControls.Menu" %>

<div class="menu">
    <ul>
        <li><a href="~/Default.aspx" runat="server">Trang chủ</a></li>
        <li><a href="~/Gioithieu.aspx" runat="server">Giới thiệu</a></li>
        <li id="liDangky" runat="server"><a href="~/Dangky.aspx" runat="server">Đăng ký</a></li>
        <li id="liDangnhap" runat="server"><a href="~/Dangnhap.aspx" runat="server">Đăng nhập</a></li>
        <li id="liXinchao" runat="server" visible="false"><span>Xin chào, <asp:Label ID="lbTenDN" runat="server" /></span></li>
        <li id="liDangxuat" runat="server" visible="false"><a href="~/Dangxuat.aspx" runat="server">Đăng xuất</a></li>
    </ul>
</div>