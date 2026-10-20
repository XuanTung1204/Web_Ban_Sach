using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SieuThiSach
{
    public partial class Sachtheochude : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int macd;
            if (int.TryParse(Request.QueryString["MaCD"], out macd))
            {
                string ten = XLDL.Getdata("SELECT Tenchude FROM CHUDE WHERE MaCD = @m",
                                          new SqlParameter("@m", macd));
                lbTieude.Text = ten == "" ? "Chủ đề không tồn tại" : ten;
                if (ten != "") Page.Title = ten + " - Book Online";
            }
            else
            {
                lbTieude.Text = "Chưa chọn chủ đề";
            }
        }
    }
}