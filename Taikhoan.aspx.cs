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
    public partial class Taikhoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TenDN"] == null)
            {
                Response.Redirect("~/Dangnhap.aspx");
                return;
            }
            if (!IsPostBack) NapThongTin();
        }

        void NapThongTin()
        {
            DataTable dt = XLDL.Docbang(
                "SELECT TenDN, HoTenKH, DiachiKH, DienthoaiKH FROM KHACHHANG WHERE TenDN = @t",
                new SqlParameter("@t", Session["TenDN"].ToString()));

            if (dt.Rows.Count == 0)
            {
                Session.Clear();
                Response.Redirect("~/Dangnhap.aspx");
                return;
            }

            DataRow r = dt.Rows[0];
            txtTenDN.Text = r["TenDN"].ToString();
            txtHoten.Text = r["HoTenKH"].ToString();
            txtDiachi.Text = r["DiachiKH"].ToString();
            txtDienthoai.Text = r["DienthoaiKH"].ToString();
        }

        protected void btLuu_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            if (Session["TenDN"] == null)
            {
                Response.Redirect("~/Dangnhap.aspx");
                return;
            }

            try
            {
                XLDL.Thuchienlenh(
                    @"UPDATE KHACHHANG
                      SET HoTenKH = @hoten, DiachiKH = @diachi, DienthoaiKH = @dienthoai
                      WHERE TenDN = @tdn",
                    new SqlParameter("@hoten", txtHoten.Text.Trim()),
                    new SqlParameter("@diachi", txtDiachi.Text.Trim()),
                    new SqlParameter("@dienthoai", txtDienthoai.Text.Trim()),
                    new SqlParameter("@tdn", Session["TenDN"].ToString()));

                lbBaoloi.CssClass = "baoloi thongbao-ok";
                lbBaoloi.Text = "Cập nhật thông tin thành công!";
            }
            catch (Exception)
            {
                lbBaoloi.CssClass = "baoloi";
                lbBaoloi.Text = "Cập nhật thất bại!";
            }
        }
    }
}