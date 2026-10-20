using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SieuThiSach.UserControls
{
    public partial class Giohang : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbTongtien.Text = "Tổng tiền là: " + CartHelper.Tongtien().ToString("#,##0");
        }
    }
}