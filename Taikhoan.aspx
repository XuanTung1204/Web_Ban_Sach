<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Taikhoan.aspx.cs" Inherits="SieuThiSach.Taikhoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-page">
        <h2>THÔNG TIN TÀI KHOẢN</h2>

        <div class="frow">
            <asp:Label ID="lblTenDN" runat="server" AssociatedControlID="txtTenDN" Text="Tên đăng nhập:" />
            <asp:TextBox ID="txtTenDN" runat="server" ReadOnly="true" />
        </div>
        <div class="frow">
            <asp:Label ID="lblHoten" runat="server" AssociatedControlID="txtHoten" Text="Họ và tên:" />
            <asp:TextBox ID="txtHoten" runat="server" MaxLength="50" />
            <asp:RequiredFieldValidator ID="rfvHoten" runat="server" ControlToValidate="txtHoten"
                Display="Dynamic" CssClass="req" Text="*" ErrorMessage="Vui lòng nhập họ và tên." />
        </div>
        <div class="frow">
            <asp:Label ID="lblDiachi" runat="server" AssociatedControlID="txtDiachi" Text="Địa chỉ:" />
            <asp:TextBox ID="txtDiachi" runat="server" MaxLength="50" />
            <asp:RequiredFieldValidator ID="rfvDiachi" runat="server" ControlToValidate="txtDiachi"
                Display="Dynamic" CssClass="req" Text="*" ErrorMessage="Vui lòng nhập địa chỉ." />
        </div>
        <div class="frow">
            <asp:Label ID="lblDienthoai" runat="server" AssociatedControlID="txtDienthoai" Text="Điện thoại:" />
            <asp:TextBox ID="txtDienthoai" runat="server" MaxLength="10" />
            <asp:RegularExpressionValidator ID="revDienthoai" runat="server" ControlToValidate="txtDienthoai"
                ValidationExpression="^\d{8,10}$" Display="Dynamic" CssClass="req" Text="*"
                ErrorMessage="Điện thoại chỉ gồm 8 đến 10 chữ số." />
        </div>
        <div class="frow frow-btn">
            <asp:Button ID="btLuu" runat="server" Text="Lưu thay đổi" OnClick="btLuu_Click" />
        </div>
        <div class="frow frow-link">
            <asp:HyperLink ID="hplDoimk" runat="server" NavigateUrl="~/Doimatkhau.aspx">Đổi mật khẩu</asp:HyperLink>
        </div>

        <asp:ValidationSummary ID="vsTaikhoan" runat="server" CssClass="validation-summary" />
        <asp:Label ID="lbBaoloi" runat="server" CssClass="baoloi" />
    </div>
</asp:Content>