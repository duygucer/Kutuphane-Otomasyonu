# Kutuphane-Otomasyonu

I. ÖZET
Sunucu-istemci mimarisi ve görüntü işleme algoritmaları kullanılarak kütüphane sistemi uygulanmaktadır.

II. GİRİŞ
Bu proje, sunucu-istemci mimarisini örnekler. Bir yönetici (admin) sayfası bir de kullanıcı (user) sayfasından oluşur.

III. BILEŞENLER
A. Yönetici (Admin): Kitap ekleme, zaman atlama ve kullanıcı listeleme ara yüzlerini kullanır.
a. Kitap ekleme: Kitabın adı ve ISBN numarasının göründüğü resim yönetici tarafından girilir. Sistem görüntü işleme algoritmalarını kullanarak resimden ISBN numarasını alır ve veri tabanına kayıt işlemini gerçekleştirir.
b. Zaman atlama: Zaman atla modülünde 20 gün girilirse sistem zamanı mevcut zamandan 20 gün sonraya öteleyecektir.
c. Kullanıcı listeleme: Tüm kullanıcılar ve üzerinde bulunan kitapların listelenmesi.
B. Kullanıcı (User): Kitap arama, kitap alıp verme ara yüzlerini kullanır.
a. Kitap arama: Kitabın ismine ya da ISBN numarasına göre arama yapılabilir.
b. Kitap Alma: Kitap 1 haftalık süre ile kullanıcının üstüne atanır. Başkasının üstünde bulunan kitap sistem tarafından verilemez. Kullanıcı üstünde en fazla 3 kitap bulunabilir. Kullanıcının üzerinde teslim tarihi geçmiş kitap var ise kullanıcı başka kitap alamaz. Yeni kitap alabilmesi için teslim tarihi geçmiş tüm kitapları sisteme geri vermelidir.
c. Kitap Verme: Kullanıcı kitabın ISBN numarasının bulunduğu resmi sisteme yükler. Sistem resimden aldığı ISBN numarasını ve kullanıcının üzerinde bulunan kitaplardaki ISBN numarasını karşılaştırır. Eşleştirme bulursa kitap sisteme geri verilir ve kullanıcının üstündeki kitap bilgileri güncellenir.

C. 3) Veri tabanı (Database): Kullanıcı bilgileri, kitap bilgileri, hangi kitabın kimde olduğu bilgisi vb. bilgileri tutar.

D. TEMEL BİLGİLER
Bu program ‘C#’, ‘Asp.net’ dilinde ve Visual Studio IDE’sinde yazılmıştır.
Gerekli kütüphaneler:
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IronOcr;
Projede 8 temel .aspx web sayfası bulunur:
Admin.aspx
KitapAra.aspx
KitapEkle.aspx
KitapTeslim.aspx
Kullanici.aspx
KullaniciListele.aspx
Login.aspx
ZamanAtla.aspx
Bu sayfalara ek olarak 2 adet master page sayfası bulunmaktadır:
Admin.Master
Kullanici.Master
2 tane de .css dosyası bulunmaktadır:
Kullanici.css
StyleSheet1.css
