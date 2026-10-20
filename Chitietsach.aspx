<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage.Master" AutoEventWireup="true" CodeBehind="Chitietsach.aspx.cs" Inherits="SieuThiSach.Chitietsach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="lbThongbao" runat="server" CssClass="empty-text" Visible="false" />
    <asp:Panel ID="pnlChitiet" runat="server" CssClass="detail">
        <h2 class="detail-title"><asp:Label ID="lbTensach" runat="server" /></h2>
        <div class="detail-body">
            <div class="detail-cover">
                <asp:Image ID="imgBia" runat="server" />
            </div>
            <ul class="detail-meta">
                <asp:Literal ID="ltTacgia" runat="server" />
            </ul>
            <div class="detail-info">
                <b>Nhà xuất bản: <asp:HyperLink ID="hplNXB" runat="server" /></b><br />
                <b>Chủ đề: <asp:HyperLink ID="hplChude" runat="server" /></b>
            </div>
            <div class="detail-desc">
                <asp:Literal ID="ltMota" runat="server" />
            </div>
            <div class="detail-buy">
                Đơn giá: <b><asp:Label ID="lbDongia" runat="server" /></b>
                (<asp:Label ID="lbDonvi" runat="server" />) &nbsp;
                <asp:HyperLink ID="hplMua" runat="server" CssClass="book-buy-link" Text="Đặt mua" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>