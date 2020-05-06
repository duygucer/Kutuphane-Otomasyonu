using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kutuphane2
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        SQLsinif bgl = new SQLsinif();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ZamanAtlaButton_Click(object sender, EventArgs e)
        {
            SqlCommand komutekle = new SqlCommand("INSERT INTO Time (time) Values (@p1)", bgl.baglanti());
            komutekle.Parameters.AddWithValue("@p1", TextBox1.Text);
            komutekle.ExecuteNonQuery();
            bgl.baglanti().Close();
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}