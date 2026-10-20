using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SieuThiSach
{
    public partial class Dangky : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                for (int d = 1; d <= 31; d++) ddlNgaysinh.Items.Add(new ListItem(d.ToString("00"), d.ToString()));
                for (int m = 1; m <= 12; m++) ddlThangsinh.Items.Add(new ListItem(m.ToString("00"), m.ToString()));
                rvNamsinh.MaximumValue = DateTime.Now.Year.ToString();
                txtHoten.Focus();
            }
        }

        protected void btDangky_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            bool thanhcong = false;
            try
            {
                DateTime ngaysinh;
                try
                {
                    ngaysinh = new DateTime(int.Parse(txtNamsinh.Text),
                                            int.Parse(ddlThangsinh.SelectedValue),
                                            int.Parse(ddlNgaysinh.SelectedValue));
                }
                catch (Exception)
                {
                    lbBaoloi.Text = "Ngày sinh không hợp lệ!";
                    return;
                }
                if (ngaysinh > DateTime.Today)
                {
                    lbBaoloi.Text = "Ngày sinh không được lớn hơn ngày hiện tại!";
                    return;
                }

                string tenDN = txtTenDN.Text.Trim();
                string email = txtEmail.Text.Trim();

                
                if (XLDL.Getdata("SELECT COUNT(*) FROM KHACHHANG WHERE TenDN = @t",
                                 new SqlParameter("@t", tenDN)) != "0")
                {
                    lbBaoloi.Text = "Tên đăng nhập này đã có người sử dụng!";
                    return;
                }
                if (XLDL.Getdata("SELECT COUNT(*) FROM KHACHHANG WHERE Email = @e",
                                 new SqlParameter("@e", email)) != "0")
                {
                    lbBaoloi.Text = "Email này đã được đăng ký!";
                    return;
                }

                XLDL.Thuchienlenh(
                    @"INSERT INTO KHACHHANG (HotenKH, DiachiKH, DienthoaiKH, Email, TenDN, Matkhau, Ngaysinh, Gioitinh)
                  VALUES (@hoten, @diachi, @dienthoai, @email, @tendn, @matkhau, @ngaysinh, @gioitinh)",
                    new SqlParameter("@hoten", txtHoten.Text.Trim()),
                    new SqlParameter("@diachi", txtDiachi.Text.Trim()),
                    new SqlParameter("@dienthoai", txtDienthoai.Text.Trim()),
                    new SqlParameter("@email", email),
                    new SqlParameter("@tendn", tenDN),
                    new SqlParameter("@matkhau", txtMatkhau.Text),
                    new SqlParameter("@ngaysinh", ngaysinh),
                    new SqlParameter("@gioitinh", rdNam.Checked ? 1 : 0));
                thanhcong = true;
            }
            catch (Exception)
            {
                lbBaoloi.Text = "Thất bại!";
            }

            if (thanhcong) Response.Redirect("~/Dangnhap.aspx");
        }
    }
}