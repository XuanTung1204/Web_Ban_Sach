<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Thamdo.ascx.cs" Inherits="SieuThiSach.UserControls.Thamdo" %>
<div class="poll-box">
    <h3>Thăm dò ý kiến</h3>
    <div class="poll-body">
        <asp:Label ID="lbCauhoi" runat="server" CssClass="poll-q" />

        <asp:Panel ID="pnlBinhchon" runat="server">
            <asp:RadioButtonList ID="rblTraloi" runat="server" RepeatLayout="Flow" CssClass="poll-list" />
            <asp:RequiredFieldValidator ID="rfvTraloi" runat="server" ControlToValidate="rblTraloi"
                ValidationGroup="thamdo" Display="Dynamic" ForeColor="#b71c1c"
                ErrorMessage="Hãy chọn một đáp án." />
            <asp:Button ID="btBinhchon" runat="server" Text="Bình chọn" CssClass="btn"
                ValidationGroup="thamdo" OnClick="btBinhchon_Click" />
        </asp:Panel>

        <asp:Panel ID="pnlKetqua" runat="server" Visible="false">
            <asp:Repeater ID="rptKetqua" runat="server">
                <ItemTemplate>
                    <div class="poll-item">
                        <span><%# Eval("Noidungtraloi") %></span>
                        <div class="poll-bar"><div style='width:<%# Eval("Tyle") %>%'></div></div>
                        <small><%# Eval("Solanbinhchon") %> phiếu (<%# Eval("Tyle") %>%)</small>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Label ID="lbTong" runat="server" CssClass="poll-q" />
        </asp:Panel>
    </div>
</div>