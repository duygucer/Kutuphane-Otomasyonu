using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Kutuphane2
{
    public class SQLsinif
    {
        public SqlConnection baglanti()
        {
            SqlConnection baglan = new SqlConnection(@"Data Source=DUYGUCER\MSSQLSERVER01; Initial Catalog=Kutuphane;Integrated Security=True; Persist Security Info=False");
            baglan.Open();
            return baglan;
        }
    }
}