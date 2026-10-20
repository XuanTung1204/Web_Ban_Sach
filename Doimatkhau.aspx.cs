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
    public partial class Doimatkhau : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["TenDN"] != null) txtTenDN.Text = Session["TenDN"].ToString();
                (txtTenDN.Text == "" ? txtTenDN : txtMatkhau).Focus();
            }
        }

        protected void btDongy_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            bool thanhcong = false;
            try
            {
                string tenDN = txtTenDN.Text.Trim();

                DataTable dt = XLDL.Docbang(
                    "SELECT MaKH FROM KHACHHANG WHERE TenDN = @tdn AND Matkhau = @mk",
                    new SqlParameter("@tdn", tenDN),
                    new SqlParameter("@mk", txtMatkhau.Text));

                if (dt.Rows.Count == 0)
                {
                    lbBaoloi.Text = "Sai tên đăng nhập hoặc mật khẩu!";
                }
                else
                {
                    XLDL.Thuchienlenh(
                        "UPDATE KHACHHANG SET Matkhau = @mkmoi WHERE TenDN = @tdn",
                        new SqlParameter("@mkmoi", txtMatkhaumoi.Text),
                        new SqlParameter("@tdn", tenDN));
                    thanhcong = true;
                }
            }
            catch (Exception)
            {
                lbBaoloi.Text = "Thao tác cập nhật dữ liệu thất bại!";
            }

            if (thanhcong) Response.Redirect("~/Default.aspx");
        }
    }
}