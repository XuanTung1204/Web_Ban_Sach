using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SieuThiSach
{
    public partial class Sachtheonhaxuatban : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int manxb;
            if (int.TryParse(Request.QueryString["MaNXB"], out manxb))
            {
                string ten = XLDL.Getdata("SELECT TenNXB FROM NHAXUATBAN WHERE MaNXB = @m",
                                          new SqlParameter("@m", manxb));
                lbTieude.Text = ten == "" ? "Nhà xuất bản không tồn tại" : ten;
                if (ten != "") Page.Title = ten + " - Book Online";
            }
            else
            {
                lbTieude.Text = "Chưa chọn nhà xuất bản";
            }
        }
    }
}