<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Doimatkhau.aspx.cs" Inherits="SieuThiSach.Doimatkhau" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="form-page">
        <h2>ĐỔI MẬT KHẨU</h2>

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
                Display="Dynamic" CssClass="req" Text="*" ErrorMessage="Vui lòng nhập mật khẩu hiện tại." />
        </div>

        <hr class="sep-line" />

        <div class="frow">
            <asp:Label ID="lblMatkhaumoi" runat="server" AssociatedControlID="txtMatkhaumoi" Text="Mật khẩu mới:" />
            <asp:TextBox ID="txtMatkhaumoi" runat="server" TextMode="Password" MaxLength="15" />
            <asp:RequiredFieldValidator ID="rfvMatkhaumoi" runat="server" ControlToValidate="txtMatkhaumoi"
                Display="Dynamic" CssClass="req" Text="*" ErrorMessage="Vui lòng nhập mật khẩu mới." />
            <asp:CompareValidator ID="cvKhacCu" runat="server" ControlToValidate="txtMatkhaumoi"
                ControlToCompare="txtMatkhau" Operator="NotEqual" Type="String"
                Display="Dynamic" CssClass="req" Text="*" ErrorMessage="Mật khẩu mới phải khác mật khẩu cũ." />
        </div>
        <div class="frow">
            <asp:Label ID="lblNhaplai" runat="server" AssociatedControlID="txtNhaplaimkmoi" Text="Nhập lại mật khẩu:" />
            <asp:TextBox ID="txtNhaplaimkmoi" runat="server" TextMode="Password" MaxLength="15" />
            <asp:RequiredFieldValidator ID="rfvNhaplai" runat="server" ControlToValidate="txtNhaplaimkmoi"
                Display="Dynamic" CssClass="req" Text="*" ErrorMessage="Vui lòng nhập lại mật khẩu mới." />
            <asp:CompareValidator ID="cvNhaplai" runat="server" ControlToValidate="txtNhaplaimkmoi"
                ControlToCompare="txtMatkhaumoi" Operator="Equal" Type="String"
                Display="Dynamic" CssClass="req" Text="*" ErrorMessage="Mật khẩu nhập lại không khớp." />
        </div>
        <div class="frow frow-btn">
            <asp:Button ID="btDongy" runat="server" Text="Đồng ý" OnClick="btDongy_Click" />
        </div>

        <asp:ValidationSummary ID="vsDoimk" runat="server" CssClass="validation-summary" />
        <asp:Label ID="lbBaoloi" runat="server" CssClass="baoloi" />
    </div>
</asp:Content>