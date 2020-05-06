using System;
using System.Data.SqlClient;
namespace Kutuphane2
{
    public partial class Login : System.Web.UI.Page
    {
        SQLsinif bgl = new SQLsinif();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string id = TextBox1.Text;
            string pass = TextBox2.Text;
            SqlCommand sorgu = new SqlCommand("SELECT * FROM Kullanicilar WHERE KullaniciAdi=@KullaniciAdi AND Sifre=@Sifre", bgl.baglanti());
            sorgu.Parameters.AddWithValue("@KullaniciAdi", id);
            sorgu.Parameters.AddWithValue("@Sifre", pass);
            SqlDataReader oku = sorgu.ExecuteReader();
            if (oku.Read())
            {
                if (id == "admin")
                {
                    Session["Kullanici"] = oku["KullaniciAdi"].ToString();
                    Response.Redirect("Admin.aspx");
                }
                if (id != "admin")
                {
                    Session["Kullanici"] = oku["KullaniciAdi"].ToString();
                    Response.Redirect("Kullanici.aspx");
                }
            }
            else
            {
                Label1.Text = "Kullanıcı adı veya şifre hatalı";
            }
                oku.Close();
                sorgu.ExecuteNonQuery();
                bgl.baglanti().Close();
            }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
    }
