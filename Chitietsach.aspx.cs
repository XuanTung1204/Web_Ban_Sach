using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SieuThiSach
{
    public partial class Chitietsach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int masach;
            if (!int.TryParse(Request.QueryString["Masach"], out masach))
            {
                KhongTimThay();
                return;
            }

            DataTable dt = XLDL.Docbang(
                @"SELECT S.Masach, S.Tensach, S.Donvitinh, S.Dongia, S.Mota, S.Hinhminhoa,
                     S.MaCD, S.MaNXB, C.Tenchude, N.TenNXB
              FROM SACH S
                   LEFT JOIN CHUDE C      ON S.MaCD  = C.MaCD
                   LEFT JOIN NHAXUATBAN N ON S.MaNXB = N.MaNXB
              WHERE S.Masach = @m",
                new SqlParameter("@m", masach));

            if (dt.Rows.Count == 0)
            {
                KhongTimThay();
                return;
            }
            DataRow r = dt.Rows[0];

            Page.Title = r["Tensach"].ToString() + " - Book Online";
            lbTensach.Text = Server.HtmlEncode(r["Tensach"].ToString());

            if (r["Hinhminhoa"] != DBNull.Value && r["Hinhminhoa"].ToString() != "")
            {
                imgBia.ImageUrl = "~/Images/Sach/" + r["Hinhminhoa"];
                imgBia.AlternateText = r["Tensach"].ToString();
            }
            else imgBia.Visible = false;

            // Nhà xuất bản, chủ đề
            hplNXB.Text = Server.HtmlEncode(r["TenNXB"].ToString());
            hplNXB.NavigateUrl = "~/Sachtheonhaxuatban.aspx?MaNXB=" + r["MaNXB"];
            hplChude.Text = Server.HtmlEncode(r["Tenchude"].ToString());
            hplChude.NavigateUrl = "~/Sachtheochude.aspx?MaCD=" + r["MaCD"];

            // Mô tả
            string mota = Server.HtmlEncode(r["Mota"].ToString())
                                .Replace("\r\n", "<br />").Replace("\n", "<br />");
            ltMota.Text = mota;

            lbDongia.Text = Convert.ToDecimal(r["Dongia"]).ToString("#,##0") + " VND";
            lbDonvi.Text = Server.HtmlEncode(r["Donvitinh"].ToString());
            hplMua.NavigateUrl = "~/Datmua.aspx?Masach=" + masach;

            // Các tác giả
            DataTable tg = XLDL.Docbang(
                @"SELECT T.MaTG, T.TenTG, V.Vaitro
              FROM VIETSACH V INNER JOIN TACGIA T ON V.MaTG = T.MaTG
              WHERE V.Masach = @m
              ORDER BY CASE V.Vaitro WHEN N'Tác giả' THEN 1 WHEN N'Đồng tác giả' THEN 2
                                     WHEN N'Hiệu đính' THEN 3 ELSE 4 END, T.TenTG",
                new SqlParameter("@m", masach));
            StringBuilder sb = new StringBuilder();
            foreach (DataRow row in tg.Rows)
            {
                sb.Append("<li>")
                  .Append(Server.HtmlEncode(row["Vaitro"].ToString())).Append(": <b>")
                  .Append(Server.HtmlEncode(row["TenTG"].ToString())).Append("</b></li>");
            }
            ltTacgia.Text = sb.ToString();

            // Tăng số lần xem
            if (!IsPostBack)
            {
                XLDL.Thuchienlenh("UPDATE SACH SET Solanxem = ISNULL(Solanxem, 0) + 1 WHERE Masach = @m",
                                  new SqlParameter("@m", masach));
            }
        }

        void KhongTimThay()
        {
            pnlChitiet.Visible = false;
            lbThongbao.Visible = true;
            lbThongbao.Text = "Không tìm thấy quyển sách bạn yêu cầu.";
        }
    }
}