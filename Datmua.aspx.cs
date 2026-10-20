using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SieuThiSach
{
    public partial class Datmua : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int masach;
            if (int.TryParse(Request.QueryString["Masach"], out masach))
                CartHelper.Them(masach);
            Response.Redirect("~/Giohang.aspx");
        }
    }
}