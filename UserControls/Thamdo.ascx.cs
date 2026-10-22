using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SieuThiSach.UserControls
{
    public partial class Thamdo : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) NapCauHoi();
        }

        void NapCauHoi()
        {
            DataTable ch = XLDL.Docbang(
                "SELECT TOP 1 MaCH, Noidungthamdo FROM THAMDO ORDER BY Ngaydang DESC, MaCH DESC");
            if (ch.Rows.Count == 0) { this.Visible = false; return; }

            int mach = (int)ch.Rows[0]["MaCH"];
            ViewState["MaCH"] = mach;
            lbCauhoi.Text = Server.HtmlEncode(ch.Rows[0]["Noidungthamdo"].ToString());

            if (Session["DaBinhchon_" + mach] != null) { HienKetqua(mach); return; }

            rblTraloi.DataSource = XLDL.Docbang(
                "SELECT STT, Noidungtraloi FROM CTTHAMDO WHERE MaCH = @m ORDER BY STT",
                new SqlParameter("@m", mach));
            rblTraloi.DataTextField = "Noidungtraloi";
            rblTraloi.DataValueField = "STT";
            rblTraloi.DataBind();
        }

        protected void btBinhchon_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid || rblTraloi.SelectedItem == null) return;

            int mach = (int)ViewState["MaCH"];
            if (Session["DaBinhchon_" + mach] != null) { HienKetqua(mach); return; }

            int stt = int.Parse(rblTraloi.SelectedValue);

            XLDL.Thuchienlenh(@"SET XACT_ABORT ON;
            BEGIN TRANSACTION;
            UPDATE CTTHAMDO SET Solanbinhchon = ISNULL(Solanbinhchon, 0) + 1
                WHERE MaCH = @mach AND STT = @stt;
            UPDATE THAMDO SET Tongsobinhchon = ISNULL(Tongsobinhchon, 0) + 1
                WHERE MaCH = @mach;
            COMMIT TRANSACTION;",
                new SqlParameter("@mach", mach),
                new SqlParameter("@stt", stt));

            Session["DaBinhchon_" + mach] = true;
            HienKetqua(mach);
        }

        void HienKetqua(int mach)
        {
            pnlBinhchon.Visible = false;
            pnlKetqua.Visible = true;

            DataTable kq = XLDL.Docbang(
                @"SELECT C.Noidungtraloi, C.Solanbinhchon,
                     ISNULL(CAST(ROUND(C.Solanbinhchon * 100.0 / NULLIF(T.Tongsobinhchon, 0), 0) AS INT), 0) AS Tyle
              FROM CTTHAMDO C INNER JOIN THAMDO T ON C.MaCH = T.MaCH
              WHERE C.MaCH = @m
              ORDER BY C.STT",
                new SqlParameter("@m", mach));
            rptKetqua.DataSource = kq;
            rptKetqua.DataBind();

            lbTong.Text = "Tổng số lượt bình chọn: " +
                XLDL.Getdata("SELECT Tongsobinhchon FROM THAMDO WHERE MaCH = @m", new SqlParameter("@m", mach));
        }
    }
}