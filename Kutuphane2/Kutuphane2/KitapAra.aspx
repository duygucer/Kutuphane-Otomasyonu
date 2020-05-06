<%@ Page Title="" Language="C#" MasterPageFile="~/Kullanici.Master" AutoEventWireup="true" CodeBehind="KitapAra.aspx.cs" Inherits="Kutuphane2.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style21 {
            font-size: medium;
            color: #FFFFFF;
        }

        .auto-style22 {
            width: 673px;
            border-style: solid;
            border-width: 1px;
        }

        .auto-style23 {
            width: 100%;
            background-color: #FFFFFF;
        }

        .auto-style26 {
            margin-left: 70px;
            margin-top: 40px;
            text-align: justify;
            width: 458px;
            height: 29px;
        }

        .auto-style30 {
            text-align: right;
            width: 223px;
            height: 29px;
        }

        .auto-style33 {
            text-align: left;
            width: 149px;
            height: 29px;
        }

        .auto-style34 {
            text-align: left;
            width: 432px;
            height: 29px;
        }

        .auto-style35 {
            text-decoration: underline;
            color: #FF0000;
            font-size: medium;
        }
        .auto-style36 {
            width: 100%;
            color: #660033;
            font-size: medium;
            background-color: #FFFFFF;
        }
        .auto-style37 {
            color: #660033;
            background-color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <asp:Panel ID="Panel1" runat="server" Height="1135px">
        <br />
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" Font-Names="Comic Sans MS" Font-Size="Medium" ForeColor="#660033" Text="İsme göre kitap arama:" CssClass="auto-style37"></asp:Label>
        &nbsp;
        <asp:TextBox ID="tb_search" runat="server" Width="200px" OnTextChanged="tb_search_TextChanged" AutoPostBack="True"></asp:TextBox>
        <br />
        <br />
        <strong>
            <asp:Label ID="Label2" runat="server" CssClass="auto-style36" Text="ISBN numarasına göre kitap arama: "></asp:Label>
            &nbsp; </strong>
        <asp:TextBox ID="ISBN_search" runat="server" Width="200px" AutoPostBack="True" OnTextChanged="ISBN_search_TextChanged"></asp:TextBox>
        <br />
        <span class="auto-style9">(*Sadece rakamları giriniz)</span><br />
        <strong><em>
            <asp:Label ID="Label4" runat="server" CssClass="auto-style35"></asp:Label>
        </em></strong>
        <br />
        <strong><em>
            <asp:Label ID="Label3" runat="server" CssClass="auto-style35"></asp:Label>
        </em></strong>
        <br />
        <table class="auto-style23">
            <tr>
                <td>Kitap İsmi</td>
                <td>ISBN Numarası</td>
                <td>Kitap Adedi</td>
                <td>Kitabı Al</td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:DataList ID="DataList2" runat="server" HorizontalAlign="Center" RepeatColumns="1" Width="100%" CellPadding="0" OnSelectedIndexChanged="DataList2_SelectedIndexChanged">
                        <ItemTemplate>
                            <table border="0" class="auto-style22" style="border-top-color: #FFFFFF">
                                <tr>
                                    <td class="auto-style26">
                                        <asp:Label ID="KitapIsmiLabel" runat="server" Text='<%# Eval("KitapIsmi") %>' />
                                    </td>
                                    <td class="auto-style34">
                                        <asp:Label ID="ISBNLabel" runat="server" Text='<%# Eval("ISBN") %>' />
                                    </td>
                                    <td class="auto-style33">
                                        <asp:Label ID="KitapAdetLabel" runat="server" Text='<%# Eval("KitapAdet") %>' />
                                    </td>
                                    <td class="auto-style30">
                                        <a href="KitapAra.aspx?ISBN=<%#Eval("ISBN")%>&KitapIsmi=<%#Eval("KitapIsmi")%>&KitapAdet=<%#Eval("KitapAdet")%>&islem=al">
                                            <asp:Image ID="Image1" runat="server" Height="40px" ImageUrl="~/images/take.png" Width="50px" />
                                        </a>
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </ItemTemplate>
                        <SelectedItemStyle  BackColor="#CC3333" Font-Bold="True" ForeColor="White"  />
                    </asp:DataList>

                </td>
            </tr>
        </table>

        <br />
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KutuphaneConnectionString4 %>" SelectCommand="SELECT * FROM [Kutuphane]"></asp:SqlDataSource>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
    </asp:Panel>

</asp:Content>
