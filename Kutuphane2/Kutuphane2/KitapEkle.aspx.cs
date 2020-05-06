using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using IronOcr;
namespace Kutuphane2
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        SQLsinif bgl = new SQLsinif();
        string kitapAdet = "1";
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand("Select * From Kutuphane", bgl.baglanti());
            SqlDataReader dr = komut.ExecuteReader();
            DataList2.DataSource = dr;
            DataList2.DataBind();
        }

        protected void SecButton_Click(object sender, EventArgs e)
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
                SqlCommand komut2 = new SqlCommand("Select ISBN From Kutuphane WHERE ISBN=@a1", bgl.baglanti());
                komut2.Parameters.AddWithValue("@a1", sonuc);
                SqlDataReader dr2 = komut2.ExecuteReader();
                if (!dr2.Read())
                {
                    SqlCommand komutekle = new SqlCommand("INSERT INTO Kutuphane (KitapIsmi,ISBN,KitapAdet) values (@p1,@p2,@p3)", bgl.baglanti());
                    komutekle.Parameters.AddWithValue("@p1", KitapAdiBox.Text);
                    komutekle.Parameters.AddWithValue("@p2", sonuc);
                    komutekle.Parameters.AddWithValue("@p3", kitapAdet);
                    komutekle.ExecuteNonQuery();
                    bgl.baglanti().Close();
                    MessageBox.Show("Kitap başarıyla eklendi!", "Bilgilendirme Penceresi");
                    Response.Redirect("KitapEkle.aspx");
                }
                else
                {
                    MessageBox.Show("Kitap eklenemedi. Girilen bilgilere sahip kitap kütüphanede bulunmakta!", "Bilgilendirme Penceresi");
                    Response.Redirect("KitapEkle.aspx");
                }

            }
        }

        protected void DataList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}