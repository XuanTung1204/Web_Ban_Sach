using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.SessionState;


public static class CartHelper
{
    const string KEY = "Giohang";

    public static DataTable Lay()
    {
        HttpSessionState s = HttpContext.Current.Session;
        DataTable dt = s[KEY] as DataTable;
        if (dt == null)
        {
            dt = new DataTable();
            dt.Columns.Add("Masach", typeof(int));
            dt.Columns.Add("Tensach", typeof(string));
            dt.Columns.Add("Hinhminhoa", typeof(string));
            dt.Columns.Add("Soluong", typeof(int));
            dt.Columns.Add("Dongia", typeof(decimal));
            dt.Columns.Add("Thanhtien", typeof(decimal), "Soluong * Dongia");
            s[KEY] = dt;
        }
        return dt;
    }

    public static void Them(int masach)
    {
        DataTable gio = Lay();
        DataRow[] cu = gio.Select("Masach = " + masach);
        if (cu.Length > 0)
        {
            cu[0]["Soluong"] = (int)cu[0]["Soluong"] + 1;
            return;
        }
        DataTable sach = XLDL.Docbang(
            "SELECT Masach, Tensach, Hinhminhoa, Dongia FROM SACH WHERE Masach = @m",
            new SqlParameter("@m", masach));
        if (sach.Rows.Count == 0) return;
        DataRow r = sach.Rows[0];
        gio.Rows.Add(masach, r["Tensach"], r["Hinhminhoa"], 1, Convert.ToDecimal(r["Dongia"]));
    }

    public static void Xoa(int masach)
    {
        DataRow[] cu = Lay().Select("Masach = " + masach);
        if (cu.Length > 0) cu[0].Delete();
        Lay().AcceptChanges();
    }

    public static void Capnhat(int masach, int soluong)
    {
        if (soluong <= 0) { Xoa(masach); return; }
        DataRow[] cu = Lay().Select("Masach = " + masach);
        if (cu.Length > 0) cu[0]["Soluong"] = soluong;
    }

    public static void Xoahet()
    {
        Lay().Rows.Clear();
    }

    public static decimal Tongtien()
    {
        decimal tong = 0;
        foreach (DataRow r in Lay().Rows)
            tong += Convert.ToDecimal(r["Thanhtien"]);
        return tong;
    }
}
