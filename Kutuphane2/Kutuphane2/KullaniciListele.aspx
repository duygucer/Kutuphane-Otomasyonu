<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="KullaniciListele.aspx.cs" Inherits="Kutuphane2.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style33 {
            width: 100%;
            border-style: solid;
            border-width: 1px;
            background-color: #FFFFFF;
        }
        .auto-style34 {
            width: 100%;
            border: 1px solid #000000;
            background-color: #FFFFFF;
        }
        .auto-style36 {
            text-align: center;
            width: 115px;
        }
        .auto-style38 {
            text-align: center;
            width: 158px;
        }
        .auto-style39 {
            background-color: #FFFFFF;
            font-size: medium;
        }
        .auto-style40 {
            text-align: right;
            width: 140px;
        }
        .auto-style42 {
            text-align: left;
            width: 80px;
        }
        .auto-style48 {
            text-align: center;
            width: 130px;
        }
        .auto-style49 {
            text-align: center;
            width: 119px;
        }
        .auto-style50 {
            text-align: center;
            width: 110px;
        }
        .auto-style51 {
            text-align: center;
            width: 146px;
        }
        .auto-style52 {
            text-align: center;
            width: 135px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
            <span class="auto-style23"><strong><span class="auto-style39">KULLANICI VERİLERİ LİSTELENİYOR</span></strong></span><br />
            <table class="auto-style34">
                <tr>
                    <td class="auto-style36"><strong>Kullanıcı Adı</strong></td>
                    <td class="auto-style50"><strong>Kitap İsmi</strong></td>
                    <td class="auto-style38"><strong>ISBN Numarası</strong></td>
                    <td class="auto-style49"><strong>Alınan Zaman</strong></td>
                    <td class="auto-style6"><strong>Iade Zamanı</strong></td>
                </tr>
            </table>
    <asp:DataList ID="DataList1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" GridLines="Both" Width="100%" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="White" />
        <ItemTemplate>
            <table class="auto-style33">
                <tr>
                    <td class="auto-style42">
                        <asp:Label ID="KullaniciAdi" runat="server" Text='<%# Eval("KullaniciAdi") %>' />
                    </td>
                    <td class="auto-style51">
                        <asp:Label ID="KitapIsmiLabel" runat="server" Text='<%# Eval("KitapIsmi") %>' />
                        &nbsp;</td>
                    <td class="auto-style48">
                        <asp:Label ID="ISBNLabel" runat="server" Text='<%# Eval("ISBN") %>' />
                    </td>
                    <td class="auto-style52">
                        <asp:Label ID="AlinanZaman" runat="server" Text='<%# Eval("AlinanZaman") %>'></asp:Label>
                    </td>
                    <td class="auto-style40">
                        <asp:Label ID="IadeZamani" runat="server" Text='<%# Eval("IadeZamani") %>'></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
            <br />
</asp:Content>
