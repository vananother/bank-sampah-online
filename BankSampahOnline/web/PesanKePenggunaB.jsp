<%-- 
    Document   : index
    Created on : Apr 14, 2014, 12:16:09 PM
    Author     : van
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="banksampahonline.util.Pesan"%>
<%@page import="banksampahonline.database.BankSampahOnlineDB"%>
<%@page import="banksampahonline.util.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <title>Dashboard</title>
    </head>
    <body>
        <%
            Account account = (Account) session.getAttribute("account");
            BankSampahOnlineDB db = new BankSampahOnlineDB();
            ArrayList<Pesan> messages = new ArrayList<Pesan>();
            if (account == null) {
                response.sendRedirect("index.jsp");
            } else {
                out.print("Account Info: <BR>");
                out.print("ID: " + account.getId() + "<BR>");
                out.print("Role: " + account.getRole() + "<BR>");
                out.print("Username: " + account.getUsername() + "<BR>");
            }
        %>
        <nav class="navbar navbar-inverse" role="navigation">
            <div class="container">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="index.jsp">Keluar</a></li>
                </ul>
            </div>                
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-xs-3">
                    <ul class="nav nav-pills nav-stacked">
                        <li class="active">
                            <a>Kirim Pesan ke Pengguna</a>
                        </li>
                        <li>
                            <a href="PendataanB.jsp">Pendataan Sampah</a>
                        </li>
                        <li>
                            <a href="DaftarPenjemputanB.jsp">Daftar Penjemputan</a>
                        </li>
                    </ul>
                </div>

                <div class="col-xs-9">
                    <h1 style="text-align:center">Kirim Pesan ke Pengguna</h1>
                    <form role="form" action="Pesan" method="post">
                        <div class="form-group">
                            <label for="">Cari Pengguna:</label>
                            <input name="penerima" type="text" class="form-control" placeholder="Username Pengguna" required="required">
                        </div>

                        <div class="form-group">
                            <label for="">Subjek:</label>
                            <input name="subjek" type="text" class="form-control" placeholder="Subjek" required="required">
                        </div>

                        <div class="form-group">
                            <label for="">Pesan:</label>
                            <textarea name="isi" class="form-control" rows="3"></textarea>
                        </div>

                        <button type="submit" class="btn btn-primary">Kirim Pesan</button>
                    </form>

                    <br>
                    <br>
                    <h1>Pesan</h1>
                    <br>

                    <div class="panel panel-primary">
                        <div class="panel-heading">Pengguna 1 (05/17/2014)</div>
                        <div class="panel-body">
                            <h4>Meminta Penjemputan</h4>
                            Mas, tolong cek penjemputan sampah dong, saya baru submit tuh...
                        </div>
                    </div>

                    <div class="panel panel-danger">
                        <div class="panel-heading">Admin 1 (05/17/2014)</div>
                        <div class="panel-body">
                            <h4>RE: Meminta Penjemputan</h4>
                            Okay, nanti saya kesana!
                        </div>
                    </div>

                    <div class="panel panel-primary">
                        <div class="panel-heading">Pengguna 1 (05/17/2014)</div>
                        <div class="panel-body">
                            <h4>Tanpa Subjek</h4>
                            k
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
