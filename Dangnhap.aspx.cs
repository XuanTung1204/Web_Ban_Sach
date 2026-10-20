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
    public partial class Dangnhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) txtTenDN.Focus();
        }

        protected void btDangnhap_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            bool thanhcong = false;
            try
            {
                DataTable dt = XLDL.Docbang(
                    "SELECT * FROM KHACHHANG WHERE TenDN = @tdn AND Matkhau = @mk",
                    new SqlParameter("@tdn", txtTenDN.Text.Trim()),
                    new SqlParameter("@mk", txtMatkhau.Text));

                if (dt.Rows.Count != 0)
                {
                    Session["TenDN"] = dt.Rows[0]["TenDN"].ToString();
                    thanhcong = true;
                }
                else
                {
                    lbBaoloi.Text = "Tên đăng nhập hoặc mật khẩu không hợp lệ!";
                }
            }
            catch (Exception)
            {
                lbBaoloi.Text = "Thất bại! Không kết nối được cơ sở dữ liệu.";
            }

            if (thanhcong) Response.Redirect("~/Default.aspx");
        }
    }
}