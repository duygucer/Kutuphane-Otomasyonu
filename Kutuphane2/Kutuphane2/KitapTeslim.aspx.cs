using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Web.Hosting;
using IronOcr;
using System.IO;

namespace Kutuphane2
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        SQLsinif bgl = new SQLsinif();
        string ISBN = "";
        string islem = "";
        string KitapIsmi = "";
        string AlinanZaman = "";
        string IadeZamani = "";
        //string DosyaYolu = "";
        List<string> liste = new List<string>();
        string[] str = new string[2];
        String sonuc = "";
        int time = 0;


        protected void Upload(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                if (fileName != "")
                {
                    FileUpload1.SaveAs(Server.MapPath("~/images/") + fileName);
                }
                var Ocr = new AutoOcr();
                string Result = Ocr.Read(@Server.MapPath("~/Images/") + fileName).Text;
                string sonuc = "";
                foreach (char c in Result)
                {
                    if (Char.IsNumber(c))
                    {
                        sonuc += c;
                    }
                }
                //isbn -> sonuc
                SqlCommand komut2 = new SqlCommand("Select ISBN From KullaniciKitap WHERE KullaniciAdi=@p1 AND  ISBN=@a1", bgl.baglanti());
                komut2.Parameters.AddWithValue("@p1", Session["kullanici"].ToString());
                komut2.Parameters.AddWithValue("@a1", sonuc);
                SqlDataReader dr2 = komut2.ExecuteReader();

                if (dr2.Read())
                {
                    //eşleşme var
                    SqlCommand komutguncelle = new SqlCommand("Update Kutuphane SET KitapAdet=1 WHERE ISBN=@p1", bgl.baglanti());
                    komutguncelle.Parameters.AddWithValue("@p1", sonuc);
                    komutguncelle.ExecuteNonQuery();
                    bgl.baglanti().Close();
                    SqlCommand kullaniciguncelle = new SqlCommand("Delete From KullaniciKitap WHERE ISBN=@p1", bgl.baglanti());
                    kullaniciguncelle.Parameters.AddWithValue("@p1", sonuc);
                    kullaniciguncelle.ExecuteNonQuery();
                    bgl.baglanti().Close();
                    MessageBox.Show("Iade İşlemi Tamamlandı!", "Bilgilendirme Penceresi");
                    Response.Redirect("KitapTeslim.aspx");

                }
                else
                {
                    MessageBox.Show("Iade İşlemi Tamamlanamadı. Sisteme yüklenen veriler eşleşmiyor!", "Bilgilendirme Penceresi");
                    Response.Redirect("KitapTeslim.aspx");
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //Panel1.Visible = false;
            ISBN = Request.QueryString["ISBN"];
            islem = Request.QueryString["islem"];
            KitapIsmi = Request.QueryString["KitapIsmi"];
            AlinanZaman = Request.QueryString["AlinanZaman"];
            IadeZamani = Request.QueryString["IadeZamani"];
            //Sistemdeki Kullanıcıyı gösterelim.
            KullaniciAdi.Text = Session["kullanici"].ToString();
            //Veritabanından dataliste verileri çekiyoruz.
            SqlCommand komut = new SqlCommand("Select * From KullaniciKitap WHERE KullaniciAdi=@p1", bgl.baglanti());
            komut.Parameters.AddWithValue("@p1", Session["kullanici"].ToString());
            SqlDataReader dr = komut.ExecuteReader();
            DataList1.DataSource = dr;
            DataList1.DataBind();
            Panel1.Visible = false;
            //tarihi labele yazdıralım
            SqlCommand timegetir = new SqlCommand("SELECT top 1 time FROM Time order by id desc", bgl.baglanti());
            time = (int)timegetir.ExecuteScalar();
            bgl.baglanti().Close();
            tarihLabel.Text = DateTime.Now.AddDays(time).ToString("dd/MM/yyyy");

            //Kitap Teslimi için 

            if (Page.IsPostBack == false)
            {
                if (islem == "teslim")
                {

                    Panel1.Visible = true;
                    Label1.Text = "Lütfen teslim edeceğiniz kitabın ISBN numarasının fotoğrafını yükleyiniz.";
                    SqlCommand komut2 = new SqlCommand("Select ISBN From KullaniciKitap WHERE KullaniciAdi=@p1 ", bgl.baglanti());
                    komut2.Parameters.AddWithValue("@p1", Session["kullanici"].ToString());
                    SqlDataReader dr2 = komut2.ExecuteReader();
                    bgl.baglanti().Close();
                    
                } 

            }


        }


        protected void DosyaSec_Click(object sender, EventArgs e)
        {


        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}