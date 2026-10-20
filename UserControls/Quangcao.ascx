<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Quangcao.ascx.cs" Inherits="SieuThiSach.UserControls.Quangcao" %>

<h3 class="ad-title">QUẢNG CÁO</h3>
<asp:GridView ID="gvQuangcao" runat="server" DataSourceID="sdsQuangcao"
    AutoGenerateColumns="False" ShowHeader="False" GridLines="None"
    CellPadding="0" CellSpacing="0" CssClass="ad-grid">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:HyperLink ID="hplQC" runat="server" Target="_blank"
                    ImageUrl='<%# "~/Images/" + Eval("Hinhminhoa") %>'
                    NavigateUrl='<%# Eval("Href") %>'
                    ToolTip='<%# Eval("TenCty") %>' Text='<%# Eval("TenCty") %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<%-- Chỉ lấy quảng cáo còn hiệu lực (đã bắt đầu và chưa hết hạn) --%>
<asp:SqlDataSource ID="sdsQuangcao" runat="server"
    ConnectionString="<%$ ConnectionStrings:KetnoiCSDL %>"
    SelectCommand="SELECT STT, TenCty, Hinhminhoa, Href FROM QUANGCAO
                   WHERE (Ngaybatdau IS NULL OR Ngaybatdau &lt;= GETDATE())
                     AND (Ngayhethan IS NULL OR Ngayhethan &gt;= GETDATE())
                   ORDER BY STT"></asp:SqlDataSource>