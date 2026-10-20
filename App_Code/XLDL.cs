using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


public class XLDL
{
    static string StrCnn =
        ConfigurationManager.ConnectionStrings["KetnoiCSDL"].ConnectionString.ToString();

    ///SELECT
    public static DataTable Docbang(string LenhSQL, params SqlParameter[] thamso)
    {
        using (SqlConnection cnn = new SqlConnection(StrCnn))
        {
            SqlDataAdapter bodocghi = new SqlDataAdapter(LenhSQL, cnn);
            if (thamso != null) bodocghi.SelectCommand.Parameters.AddRange(thamso);
            DataTable bang = new DataTable();
            bodocghi.Fill(bang);
            return bang;
        }
    }

    ///INSERT / UPDATE / DELETE
    public static void Thuchienlenh(string LenhSQL, params SqlParameter[] thamso)
    {
        using (SqlConnection cnn = new SqlConnection(StrCnn))
        {
            cnn.Open();
            SqlCommand bolenh = new SqlCommand(LenhSQL, cnn);
            if (thamso != null) bolenh.Parameters.AddRange(thamso);
            bolenh.ExecuteNonQuery();
            cnn.Close();
        }
    }


    public static string Getdata(string LenhSQL, params SqlParameter[] thamso)
    {
        using (SqlConnection cnn = new SqlConnection(StrCnn))
        {
            cnn.Open();
            SqlCommand cmd = cnn.CreateCommand();
            cmd.CommandText = LenhSQL;
            if (thamso != null) cmd.Parameters.AddRange(thamso);
            object kq = cmd.ExecuteScalar();
            cnn.Close();
            return (kq == null || kq == DBNull.Value) ? "" : kq.ToString();
        }
    }


    public static string ChuoiKetnoi
    {
        get { return StrCnn; }
    }
}
