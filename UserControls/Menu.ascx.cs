using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SieuThiSach.UserControls
{
    public partial class Menu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool daDangNhap = Session["TenDN"] != null;
            liDangky.Visible = !daDangNhap;
            liDangnhap.Visible = !daDangNhap;
            liXinchao.Visible = daDangNhap;
            liDangxuat.Visible = daDangNhap;
            if (daDangNhap)
                lbTenDN.Text = Server.HtmlEncode(Session["TenDN"].ToString());
        }
    }
}