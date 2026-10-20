using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SieuThiSach
{
    public partial class Giohang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                HienThi();
        }

        void HienThi()
        {
            gvGiohang.DataSource = CartHelper.Lay();
            gvGiohang.DataBind();
            lbTong.Text = CartHelper.Tongtien().ToString("#,##0");
            bool coHang = CartHelper.Lay().Rows.Count > 0;
            btCapnhat.Visible = coHang;
            btDathang.Visible = coHang;
        }

        protected void gvGiohang_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Xoa")
            {
                CartHelper.Xoa(int.Parse(e.CommandArgument.ToString()));
                HienThi();
            }
        }

        protected void btCapnhat_Click(object sender, EventArgs e)
        {
            CapnhatSoluong();
            HienThi();
        }

        void CapnhatSoluong()
        {
            foreach (GridViewRow row in gvGiohang.Rows)
            {
                int masach = (int)gvGiohang.DataKeys[row.RowIndex].Value;
                TextBox txt = (TextBox)row.FindControl("txtSoluong");
                int sl;
                if (int.TryParse(txt.Text, out sl)) CartHelper.Capnhat(masach, sl);
            }
        }

        protected void btDathang_Click(object sender, EventArgs e)
        {
            CapnhatSoluong();

            // Phải đăng nhập mới được đặt hàng
            if (Session["TenDN"] == null)
            {
                Response.Redirect("~/Dangnhap.aspx");
                return;
            }

            DataTable gio = CartHelper.Lay();
            if (gio.Rows.Count == 0)
            {
                lbThongbao.Text = "Giỏ hàng đang trống.";
                return;
            }

            try
            {
                int soDH;
                using (SqlConnection cnn = new SqlConnection(XLDL.ChuoiKetnoi))
                {
                    cnn.Open();
                    using (SqlTransaction tr = cnn.BeginTransaction())
                    {
                        try
                        {
                            SqlCommand cmd = new SqlCommand("SELECT MaKH FROM KHACHHANG WHERE TenDN = @t", cnn, tr);
                            cmd.Parameters.AddWithValue("@t", Session["TenDN"].ToString());
                            object maKH = cmd.ExecuteScalar();
                            if (maKH == null) throw new Exception("Không tìm thấy khách hàng.");

                            cmd = new SqlCommand(
                                @"INSERT INTO DONDATHANG (MaKH, NgayDH, Trigia, Dagiao) VALUES (@mk, GETDATE(), @tg, 0);
                              SELECT CAST(SCOPE_IDENTITY() AS INT);", cnn, tr);
                            cmd.Parameters.AddWithValue("@mk", (int)maKH);
                            cmd.Parameters.AddWithValue("@tg", CartHelper.Tongtien());
                            soDH = (int)cmd.ExecuteScalar();

                            foreach (DataRow r in gio.Rows)
                            {
                                cmd = new SqlCommand(
                                    @"INSERT INTO CTDATHANG (SoDH, Masach, Soluong, Dongia) VALUES (@so, @ms, @sl, @dg);
                                  UPDATE SACH SET Soluongban = ISNULL(Soluongban, 0) + @sl WHERE Masach = @ms;", cnn, tr);
                                cmd.Parameters.AddWithValue("@so", soDH);
                                cmd.Parameters.AddWithValue("@ms", (int)r["Masach"]);
                                cmd.Parameters.AddWithValue("@sl", (int)r["Soluong"]);
                                cmd.Parameters.AddWithValue("@dg", Convert.ToDecimal(r["Dongia"]));
                                cmd.ExecuteNonQuery();
                            }
                            tr.Commit();
                        }
                        catch
                        {
                            tr.Rollback();
                            throw;
                        }
                    }
                }

                CartHelper.Xoahet();
                pnlGiohang.Visible = false;
                lbThongbao.CssClass = "baoloi thongbao-ok";
                lbThongbao.Text = "Đặt hàng thành công! Mã đơn hàng của bạn là " + soDH + ". Cảm ơn bạn đã mua sách.";
            }
            catch (Exception)
            {
                lbThongbao.Text = "Đặt hàng thất bại, vui lòng thử lại!";
            }
        }
    }
}