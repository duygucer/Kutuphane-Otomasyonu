<%@ Page Title="" Language="C#" MasterPageFile="~/Kullanici.Master" AutoEventWireup="true" CodeBehind="KitapTeslim.aspx.cs" Inherits="Kutuphane2.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Kullanici.css" rel="stylesheet" />

    <style type="text/css">
        .auto-style44 {
            text-align: center;
            width: 80px;
        }
        .auto-style46 {
            width: 100%;
            color: #660066;
            background-color: #FFFFFF;
        }
        .auto-style48 {
            width: 102px;
        }
        .auto-style49 {
            width: 145px;
        }
        .auto-style50 {
            width: 190px;
        }
        .auto-style51 {
            width: 174px;
        }
        .auto-style52 {
            width: 90px;
        }
        .auto-style54 {
            text-align: left;
            width: 190px;
        }
        .auto-style55 {
            text-align: left;
            width: 265px;
        }
        .auto-style56 {
            color: #660066;
            text-align: right;
        }
        .auto-style57 {
            font-size: 16px;
            background-color: #FFFFFF;
        }
        .auto-style58 {
            font-size: 16px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <h4 class="auto-style23"><strong><span class="auto-style22">Kullanıcı Adı:&nbsp;
        </span>
        <asp:Label ID="KullaniciAdi" runat="server" CssClass="auto-style22"></asp:Label>
        </strong>
    </h4>
    <p class="auto-style56"><strong>&nbsp;<span class="auto-style58"><span class="auto-style9">Tarih:</span></span>
        <asp:Label ID="tarihLabel" runat="server" CssClass="auto-style57"></asp:Label>
        </strong>
    </p>
    <table border="1" class="auto-style21">
        <tr>
            <td class="auto-style48" ><strong>Kitap İsmi</strong></td>
            <td class="auto-style49"> <strong>ISBN Numarası</strong></td>
            <td class="auto-style51"><strong>Alınan Zaman</strong></td>
            <td class="auto-style50"><strong>Teslim Zamanı</strong></td>
            <td class="auto-style52"><strong>Teslim Et</strong></td>
        </tr>
    </table>

    <asp:DataList ID="DataList1" runat="server" Width="100%" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" GridLines="Both" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="White" />
        <ItemTemplate>
            <table class="auto-style46">
                <tr>
                    <td class="auto-style54">
                        <asp:Label ID="KitapIsmi" runat="server" Text='<%# Eval("KitapIsmi") %>'></asp:Label>
                    </td>
                    <td class="auto-style54">
                        <asp:Label ID="ISBN" runat="server" Text='<%# Eval("ISBN") %>'></asp:Label>
                    </td>
                    <td class="auto-style55">
                        &nbsp;<asp:Label ID="AlinanZaman" runat="server" Text='<%# Eval("AlinanZaman") %>'></asp:Label>
                    </td>
                    <td class="auto-style55">
                        &nbsp;<asp:Label ID="IadeZamani" runat="server" Text='<%# Eval("IadeZamani") %>'></asp:Label>
                    </td>
                    <td class="auto-style44">
                        <a href="KitapTeslim.aspx?ISBN=<%#Eval("ISBN")%>&KitapIsmi=<%#Eval("KitapIsmi")%>&AlinanZaman=<%#Eval("AlinanZaman")%>&IadeZamani=<%#Eval("IadeZamani")%>&islem=teslim"><asp:Image ID="TeslimButton" runat="server" Height="40px" ImageUrl="~/images/back-button.png" Width="40px" />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
    <h5>
        <asp:Label ID="Label1" runat="server" CssClass="auto-style32"></asp:Label>
    </h5>
    <p>
        &nbsp;&nbsp;
        </p>
    <asp:Panel ID="Panel1" runat="server" Height="145px">
        <asp:FileUpload ID="FileUpload1" runat="server" Height="33px" Width="335px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnUpload" runat="server" CssClass="login-button" Height="32px" OnClick="Upload" Text="Yükle" Width="73px" />
        <br />
        <p class="auto-style22">
            <strong>
            <asp:Label ID="SonucLabel" runat="server" CssClass="auto-style31"></asp:Label>
            </strong></p>
    </asp:Panel>
    
    <br />
    <br />

</asp:Content>
