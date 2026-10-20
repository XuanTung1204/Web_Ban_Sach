<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Dangnhap.aspx.cs" Inherits="SieuThiSach.Dangnhap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="form-page">
        <h2>ĐĂNG NHẬP</h2>

        <div class="frow">
            <asp:Label ID="lblTenDN" runat="server" AssociatedControlID="txtTenDN" Text="Tên đăng nhập:" />
            <asp:TextBox ID="txtTenDN" runat="server" MaxLength="15" />
            <asp:RequiredFieldValidator ID="rfvTenDN" runat="server" ControlToValidate="txtTenDN"
                Display="Dynamic" CssClass="req" Text="*" ErrorMessage="Vui lòng nhập tên đăng nhập." />
        </div>
        <div class="frow">
            <asp:Label ID="lblMatkhau" runat="server" AssociatedControlID="txtMatkhau" Text="Mật khẩu:" />
            <asp:TextBox ID="txtMatkhau" runat="server" TextMode="Password" MaxLength="15" />
            <asp:RequiredFieldValidator ID="rfvMatkhau" runat="server" ControlToValidate="txtMatkhau"
                Display="Dynamic" CssClass="req" Text="*" ErrorMessage="Vui lòng nhập mật khẩu." />
        </div>
        <div class="frow frow-btn">
            <asp:Button ID="btDangnhap" runat="server" Text="Đăng nhập" OnClick="btDangnhap_Click" />
        </div>
        <div class="frow frow-link">
            <asp:HyperLink ID="hplDoimatkhau" runat="server" NavigateUrl="~/Doimatkhau.aspx">Đổi mật khẩu</asp:HyperLink>
        </div>

        <asp:ValidationSummary ID="vsDangnhap" runat="server" CssClass="validation-summary" />
        <asp:Label ID="lbBaoloi" runat="server" CssClass="baoloi" />
    </div>
</asp:Content>