<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="KitapEkle.aspx.cs" Inherits="Kutuphane2.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style33 {
            width: 100%;
            border: 1px solid #000000;
            background-color: #FFFFCC;
        }
        .auto-style34 {
            height: 61px;
            background-color: #FF9933;
        }
        .auto-style36 {
            height: 60px;
        }
        .auto-style37 {
            height: 108px;
        }
        .auto-style39 {
            color: #FFFFFF;
        }
        .auto-style40 {
            height: 69px;
            color: #FF9933;
            width: 302px;
        }
        .auto-style41 {
            height: 108px;
            width: 302px;
        }
        .auto-style43 {
            height: 69px;
        }
        .auto-style44 {
            color: #33CC33;
        }
        .auto-style46 {
            width: 100%;
            height: 60px;
            border: 1px solid #000000;
            background-color: #FFFFCC;
        }
        .auto-style49 {
            text-decoration: underline;
        }
        .auto-style50 {
            text-decoration: underline;
            width: 230px;
        }
        .auto-style51 {
            width: 42%;
            height: 60px;
            border: 1px solid #000000;
            background-color: #FFFFCC;
        }
        .auto-style52 {
            width: 33%;
            height: 60px;
            border: 1px solid #000000;
            background-color: #FFFFCC;
        }
        .auto-style53 {
            background-color: #FFFFFF;
            width: 666px;
        }
        .auto-style54 {
            margin-left: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table class="auto-style33">
        <tr>
            <td class="auto-style34" colspan="2">
                <h2 class="auto-style39"><strong>KİTAP EKLE</strong></h2>
            </td>
        </tr>
        <tr>
            <td class="auto-style40">
                <h4 class="auto-style44"><strong>Kitap Adı Giriniz:</strong></h4>
            </td>
            <td class="auto-style43">
                <asp:TextBox ID="KitapAdiBox" runat="server" Height="30px" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style41">
                <h4 class="auto-style44">ISBN Numarasının Olduğu Görseli Yükleyiniz:</h4>
            </td>
            <td class="auto-style37">
                <asp:FileUpload ID="FileUpload1" runat="server" BorderColor="#FFCC66" CssClass="auto-style54" Font-Bold="True" ForeColor="#009933" Height="30px" Width="200px" />
&nbsp;
                <asp:Button ID="SecButton" runat="server" BackColor="#FFCC66" CssClass="button2" Font-Bold="True" ForeColor="#009933" Height="30px" OnClick="SecButton_Click" Text="Seç" Width="100px" />
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style36" colspan="2">
                <table class="auto-style5">
                    <tr>
                        <td class="auto-style50">
                            <h5><strong>Kitap İsmi</strong></h5>
                        </td>
                        <td class="auto-style49">
                            <h5><strong>ISBN Numarası</strong></h5>
                        </td>
                        <td class="auto-style49">
                            <h5><strong>Kitap Adedi</strong></h5>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="auto-style36" colspan="2">
                    <asp:DataList ID="DataList2" runat="server" HorizontalAlign="Center" RepeatColumns="1" Width="100%" OnSelectedIndexChanged="DataList2_SelectedIndexChanged">
                        <ItemTemplate>
                            <table border="0" class="auto-style53" style="border-top-color: #FFFFFF">
                                <tr>
                                    <td class="auto-style52">
                                        <asp:Label ID="KitapIsmiLabel" runat="server" Text='<%# Eval("KitapIsmi") %>' />
                                    </td>
                                    <td class="auto-style51">
                                        <asp:Label ID="ISBNLabel" runat="server" Text='<%# Eval("ISBN") %>' />
                                    </td>
                                    <td class="auto-style46">
                                        <asp:Label ID="KitapAdetLabel" runat="server" Text='<%# Eval("KitapAdet") %>' />
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </ItemTemplate>
                    </asp:DataList>

                </td>
        </tr>
    </table>
</asp:Content>
