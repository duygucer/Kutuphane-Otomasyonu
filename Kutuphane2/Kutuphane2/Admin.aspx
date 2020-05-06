<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Kutuphane2.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">


        .auto-style9 {
            color: #FFFFFF;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
    <strong><span class="auto-style9">Hoşgeldiniz!</span></strong></p>
<p>
    <strong><span class="auto-style9">Kullanıcı Adı:&nbsp;
        </span>
    <asp:Label ID="Label1" runat="server" CssClass="auto-style9"></asp:Label>
    </strong>
</p>
</asp:Content>
