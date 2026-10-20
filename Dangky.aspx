<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Dangky.aspx.cs" Inherits="SieuThiSach.Dangky" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="form-page">
        <h2>ĐĂNG KÝ THÀNH VIÊN</h2>

        <div class="frow">
            <asp:Label ID="lblHoten" runat="server" AssociatedControlID="txtHoten" Text="Họ và tên:" />
            <asp:TextBox ID="txtHoten" runat="server" MaxLength="50" />
            <asp:RequiredFieldValidator ID="rfvHoten" runat="server" ControlToValidate="txtHoten"
                Display="Dynamic" CssClass="req" Text="*" ErrorMessage="Vui lòng nhập họ và tên." />
        </div>
        <div class="frow">
            <asp:Label ID="lblGioitinh" runat="server" CssClass="flabel" Text="Giới tính:" />
            <span class="opt-inline"><asp:RadioButton ID="rdNam" runat="server" GroupName="Gioitinh" Text="Nam" Checked="true" /></span>
            <span class="opt-inline"><asp:RadioButton ID="rdNu" runat="server" GroupName="Gioitinh" Text="Nữ" /></span>
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
        <div class="frow">
            <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" Text="Email:" />
            <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" />
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                Display="Dynamic" CssClass="req" Text="*" ErrorMessage="Vui lòng nhập email." />
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                ValidationExpression="^[\w\.\-]+@([\w\-]+\.)+[A-Za-z]{2,}$" Display="Dynamic" CssClass="req" Text="*"
                ErrorMessage="Email không đúng định dạng." />
        </div>
        <div class="frow">
            <asp:Label ID="lblNgaysinh" runat="server" AssociatedControlID="ddlNgaysinh" Text="Ngày sinh:" />
            <asp:DropDownList ID="ddlNgaysinh" runat="server" />
            &nbsp;Tháng&nbsp;<asp:DropDownList ID="ddlThangsinh" runat="server" />
            &nbsp;Năm&nbsp;<asp:TextBox ID="txtNamsinh" runat="server" MaxLength="4" CssClass="w-short" />
            <asp:RequiredFieldValidator ID="rfvNamsinh" runat="server" ControlToValidate="txtNamsinh"
                Display="Dynamic" CssClass="req" Text="*" ErrorMessage="Vui lòng nhập năm sinh." />
            <asp:RangeValidator ID="rvNamsinh" runat="server" ControlToValidate="txtNamsinh"
                Type="Integer" MinimumValue="1900" MaximumValue="2100" Display="Dynamic" CssClass="req" Text="*"
                ErrorMessage="Năm sinh không hợp lệ." />
        </div>

        <hr class="sep-line" />

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
        <div class="frow">
            <asp:Label ID="lblNhaplai" runat="server" AssociatedControlID="txtMatkhaunhaplai" Text="Nhập lại mật khẩu:" />
            <asp:TextBox ID="txtMatkhaunhaplai" runat="server" TextMode="Password" MaxLength="15" />
            <asp:RequiredFieldValidator ID="rfvNhaplai" runat="server" ControlToValidate="txtMatkhaunhaplai"
                Display="Dynamic" CssClass="req" Text="*" ErrorMessage="Vui lòng nhập lại mật khẩu." />
            <asp:CompareValidator ID="cvNhaplai" runat="server" ControlToValidate="txtMatkhaunhaplai"
                ControlToCompare="txtMatkhau" Operator="Equal" Type="String"
                Display="Dynamic" CssClass="req" Text="*" ErrorMessage="Mật khẩu nhập lại không khớp." />
        </div>
        <div class="frow frow-btn">
            <asp:Button ID="btDangky" runat="server" Text="Đăng ký" OnClick="btDangky_Click" />
        </div>

        <asp:ValidationSummary ID="vsDangky" runat="server" CssClass="validation-summary" />
        <asp:Label ID="lbBaoloi" runat="server" CssClass="baoloi" />
    </div>
</asp:Content>