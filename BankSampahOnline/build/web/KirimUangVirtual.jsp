<%-- 
    Document   : index
    Created on : Apr 14, 2014, 12:16:09 PM
    Author     : van
--%>

<%@page import="banksampahonline.util.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src="others/jquery.js"></script>
        <script src="others/jquery.address.js"></script>

        <link rel="stylesheet" type="text/css" href="semantic-ui/css/semantic.css">
        <script src="semantic-ui/javascript/semantic.js"></script>
        <link rel="stylesheet" type="text/css" href="others/feed.css">
        <script src="others/feed.js"></script>

        <title>Dashboard</title>
    </head>
    <body id="feed">
        <%
            Account account = (Account) session.getAttribute("account");
            if (account == null) {
                response.sendRedirect("index.jsp");
            } else {
                out.print("Account Info: <BR>");
                out.print("ID: "+account.getId()+"<BR>");
                out.print("Role: "+account.getRole()+"<BR>");
                out.print("Username: "+account.getUsername()+"<BR>");             
            }
        %>
        <div class="ui green inverted menu">
            <div class="ui black launch button">
                <i class="list layout icon"></i>
            </div>
            <div class="right menu">
                <a class="item" href="index.jsp">Keluar</a>
            </div>
        </div>
        <div class="ui large inverted vertical sidebar menu">
            <a class="item" href="Riwayat.jsp">
                Riwayat <span class="ui label">n</span>
            </a>
            <a class="active item">
                Kirim Uang Virtual <span class="ui label">n</span>
            </a>
            <a class="item" href="PesanKeAdmin.jsp">
                Kirim Pesan ke Admin <span class="ui label">n</span>
            </a>
            <a class="item" href="PenjemputanSampah.jsp">
                Penjemputan Sampah <span class="ui label">n</span>
            </a>
            <a class="item" href="update_profile.jsp">
                Memperbarui Profil <span class="ui label">n</span>
            </a>
        </div>

        <div class="ui celled grid">
            <div class="nine wide right column">
                <h1 class="ui center header">Kirim Uang Virtual</h1>
                <div class="ui divider"></div>

                <form>
                    <div class="ui form">
                        <div class="inline field">
                            <a class="ui green inverted label">Jumlah Uang: </a>
                            <div class="ui input">
                                <div class="ui label">900.0</div>
                            </div>
                        </div>
                        <div class="inline field">
                            <a class="ui green inverted label">ID Toko Online: </a>
                            <div class="ui input">
                                <input placeholder="ID" type="text">
                            </div>
                        </div>
                        <div class="inline field">
                            <a class="ui green inverted label">Jumlah Uang yang Ingin Dikirim: </a>
                            <div class="ui input">
                                <input placeholder="Jumlah" type="text">
                            </div>
                        </div>
                        <a class="ui teal button">KIRIM</a>
                    </div>
                </form>

            </div>
        </div>
    </body>
</html>
