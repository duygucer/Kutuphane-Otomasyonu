using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Kutuphane2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SQLsinif bgl = new SQLsinif();
        string ISBN = "";
        string islem = "";
        string kullanici = "";
        string KitapIsmi = "";
        string KitapAdet = "";
        int donendeger = 0;
        int time = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand("Select * From Kutuphane", bgl.baglanti());
            SqlDataReader dr = komut.ExecuteReader();
            DataList2.DataSource = dr;
            DataList2.DataBind();
            string[] iadeler = new string[3];
            string[] words = new string[3];
            string v = "0";
            string a = "0";
            string c = "0";
            string ilkteslim = "0";
            string ikinciteslim = "0";
            string ucuncuteslim = "0";
            double atladı3 = 0;
            double atladı = 0;
            double atladı2 = 0;
            if (Page.IsPostBack == false)
            {
                ISBN = Request.QueryString["ISBN"];
                islem = Request.QueryString["islem"];
                KitapAdet = Request.QueryString["KitapAdet"];
                KitapIsmi = Request.QueryString["KitapIsmi"];
                kullanici = Session["Kullanici"].ToString();
                //kullanıcı adına göre kaç adet kayıt var?
                SqlCommand komut2 = new SqlCommand("Select Count(*) From KullaniciKitap WHERE KullaniciAdi=@p1 ", bgl.baglanti());
                komut2.Parameters.AddWithValue("@p1", kullanici);
                donendeger = (int)komut2.ExecuteScalar();
                bgl.baglanti().Close();
                //teslim zamanı gelmiş bir kitap var mı kontrol edelim

                SqlCommand IadeZamaniAl = new SqlCommand("Select IadeZamani From KullaniciKitap Where KullaniciAdi=@p1", bgl.baglanti());
                IadeZamaniAl.Parameters.AddWithValue("@p1", kullanici);
                SqlDataReader dr2 = IadeZamaniAl.ExecuteReader();
                for (int i = 0; dr2.Read(); i++)
                {
                    iadeler[i] = Convert.ToString(dr2["IadeZamani"]);
                    words = iadeler[i].Split('.', ' ', ':');
                    if (i == 0)
                    {
                        v = "";
                        ilkteslim = "";
                        foreach (string word in words)
                        {
                            v = v + word;//ilk teslim tarihi

                        }
                        v = v.Substring(0, 8);
                        ilkteslim = v.Substring(4, 4);
                        ilkteslim = ilkteslim + v.Substring(2, 2);
                        ilkteslim = ilkteslim + v.Substring(0, 2);

                    }
                    if (i == 1)
                    {
                        a = "";
                        ikinciteslim = "";
                        foreach (string word in words)
                        {
                            a = a + word;//ikinci teslim tarihi

                        }
                        a = a.Substring(0, 8);
                        ikinciteslim = a.Substring(4, 4);
                        ikinciteslim = ikinciteslim + a.Substring(2, 2);
                        ikinciteslim = ikinciteslim + a.Substring(0, 2);
                    }
                    if (i == 2)
                    {
                        c = "";
                        ucuncuteslim = "";
                        foreach (string word in words)
                        {
                            
                            c = c + word;//üçüncü teslim tarihi

                        }
                        c = c.Substring(0, 8);
                        ucuncuteslim = c.Substring(4, 4);
                        ucuncuteslim = ucuncuteslim + c.Substring(2, 2);
                        ucuncuteslim = ucuncuteslim + c.Substring(0, 2);
                        bgl.baglanti().Close();
                    }

                }



                SqlCommand timegetir = new SqlCommand("SELECT top 1 time FROM Time order by id desc", bgl.baglanti());
                time = (int)timegetir.ExecuteScalar();
                bgl.baglanti().Close();

                double n = double.Parse(DateTime.Now.AddDays(time).ToString("yyyyMMdd"));

                if (ilkteslim != "0")
                {
                    atladı = (n - Convert.ToDouble(ilkteslim));
                }
                if (ikinciteslim != "0")
                {
                    atladı2 = (n - Convert.ToDouble(ikinciteslim));
                }
                if (ucuncuteslim != "0")
                {
                    atladı3 = (n - Convert.ToDouble(ucuncuteslim));
                }


                if (atladı> 0 || atladı2>0 || atladı3>0)
                {
                    MessageBox.Show("Teslim Edilmemiş Kitabınız Bulunmaktadır!Lütfen önce bu kitapları teslim edin.", "Bilgilendirme Penceresi");
                    Response.Redirect("KitapTeslim.aspx");
                }
                //alma islemi
                if (islem == "al" && KitapAdet == "1" && donendeger < 3 && atladı<=0 && atladı2<=0 && atladı3<=0)
                {
                    SqlCommand komutal = new SqlCommand("Update Kutuphane SET KitapAdet=0 WHERE ISBN=@p1", bgl.baglanti());
                    komutal.Parameters.AddWithValue("@p1", ISBN);
                    komutal.ExecuteNonQuery();
                    bgl.baglanti().Close();

                    SqlCommand komutekle = new SqlCommand("INSERT INTO KullaniciKitap (KullaniciAdi,KitapIsmi,ISBN,AlinanZaman,IadeZamani) values (@p1,@p2,@p3,@p4,@p5)", bgl.baglanti());
                    komutekle.Parameters.AddWithValue("@p1", kullanici);
                    komutekle.Parameters.AddWithValue("@p2", KitapIsmi);
                    komutekle.Parameters.AddWithValue("@p3", ISBN);
                    komutekle.Parameters.AddWithValue("@p4", DateTime.Now.AddDays(time));
                    komutekle.Parameters.AddWithValue("@p5", DateTime.Now.AddDays(time + 7));
                    komutekle.ExecuteNonQuery();
                    bgl.baglanti().Close();
                    MessageBox.Show("Kitap başarıyla alındı!", "Bilgilendirme Penceresi");
                    Response.Redirect("KitapAra.aspx");

                }
                if (donendeger >= 3 && KitapAdet == "1" && islem == "al")
                {
                    Label3.Text = "*Kitap alım sınırına ulaştınız. Lütfen önce elinizdeki kitapları teslim ediniz.";
                }
                if (KitapAdet != "1" && islem == "al")
                {
                    Label4.Text = "Üzgünüz bu kitap alınmış ve kütüphanede kalmamış.";
                }

            }
        }
        private void BindData()
        {
            string aranan = tb_search.Text.ToLower();
            if (tb_search.Text == string.Empty)
            {
                SqlCommand komut = new SqlCommand("select *  from Kutuphane ", bgl.baglanti());
            }
            else
            {
                SqlCommand komut = new SqlCommand("select *  from Kutuphane where KitapIsmi LIKE '%" + aranan + "%'", bgl.baglanti());
                SqlDataAdapter da = new SqlDataAdapter(komut);
                DataSet ds = new DataSet();
                da.Fill(ds);
                DataList2.DataSource = ds;
                DataList2.DataBind();
            }
        }
        private void ISBNArama()
        {
            string aranan = ISBN_search.Text.ToLower();
            if (ISBN_search.Text == string.Empty)
            {
                SqlCommand komut = new SqlCommand("select *  from Kutuphane ", bgl.baglanti());
            }
            else
            {
                SqlCommand komut = new SqlCommand("select *  from Kutuphane where ISBN LIKE '%" + aranan + "%'", bgl.baglanti());
                SqlDataAdapter da = new SqlDataAdapter(komut);
                DataSet ds = new DataSet();
                da.Fill(ds);
                DataList2.DataSource = ds;
                DataList2.DataBind();
            }
        }

        protected void tb_search_TextChanged(object sender, EventArgs e)
        {
            BindData();
        }

        protected void ISBN_search_TextChanged(object sender, EventArgs e)
        {
            ISBNArama();
        }

        protected void DataList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}