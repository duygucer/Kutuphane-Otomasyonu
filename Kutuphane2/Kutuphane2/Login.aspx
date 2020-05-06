<%@ Page Language="C#" AutoEventWireup="false" CodeBehind="Login.aspx.cs" Inherits="Kutuphane2.Login" %>

<!DOCTYPE html>

<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet1.css" />
    <style type="text/css">
        .yeniStil1 {
            font-family: Arial;
            font-size: 40px;
            font-weight: bold;
            font-style: inherit;
            font-variant: normal;
        }
    </style>
</head>
<body>
        <div class="wrapper">
	<div class="container">
		<h1><span class="yeniStil1">Hoşgeldiniz</span>!</h1>
		<form id="form1" runat="server" class="form">
            <asp:Label ID="Label1" runat="server"></asp:Label><br>
			Kullanıcı Adı:
			<asp:TextBox  runat="server" ID="TextBox1"></asp:TextBox>
			
			Sifre:
            <asp:TextBox  runat="server" ID="TextBox2" TextMode="Password"></asp:TextBox>

			<asp:Button  runat="server" ID="Button1" Text="Giris" OnClick="Button1_Click" Width="250px"></asp:Button><br>
		</form>
	</div>
	
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
</div>
    <script src="JavaScript.js"></script>
</body>

</html>
