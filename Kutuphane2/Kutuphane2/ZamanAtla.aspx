<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ZamanAtla.aspx.cs" Inherits="Kutuphane2.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style33 {
            background-color: #990033;
        }
        .auto-style36 {
            width: 261px;
            height: 62px;
        }
        .auto-style37 {
            color: #00FFFF;
        }
        .auto-style40 {
            height: 62px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table class="auto-style5">
        <tr>
            <td class="auto-style33" colspan="2" style="border: medium solid #000000; color: #CC0066;">
                <h2 class="auto-style37">ZAMAN ATLAMA</h2>
            </td>
        </tr>
        <tr>
            <td class="auto-style36" style="border: medium solid #000000; background-color: #00FFFF; color: #CC0066;">
                <h4>Atlamak İstediğiniz Gün Sayısını Giriniz:</h4>
            </td>
            <td class="auto-style40" style="border: medium solid #000000; background-color: #00FFFF; color: #CC0066;">
                <asp:TextBox ID="TextBox1" runat="server" Height="25px" Width="300px" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style36" style="color: #CC0066;"></td>
            <td class="auto-style40" style="border: medium solid #000000; background-color: #00FFFF; color: #CC0066;">
                <asp:Button ID="ZamanAtlaButton" runat="server" BorderColor="#FFFFCC" CssClass="button2" Font-Bold="True" ForeColor="#990033" Height="25px" OnClick="ZamanAtlaButton_Click" Text="Atla" Width="100px" />
            </td>
        </tr>
    </table>
</asp:Content>
