<%-- 
    Document   : index
    Created on : Apr 14, 2014, 12:16:09 PM
    Author     : van
--%>

<%@page import="java.util.ArrayList"%>
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
            if (account == null) {
                out.print("session.getattribut(account) == null <br>");
                response.sendRedirect("PenjemputanSampah");
            }
        %>
        <nav class="navbar navbar-inverse" role="navigation">
            <div class="container">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="index.jsp?logout=1">Keluar</a></li>
                </ul>
            </div>                
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-xs-3">
                    <ul class="nav nav-pills nav-stacked">
                        <li>
                            <a href="RiwayatB.jsp">Riwayat</a>
                        </li>
                        <li>
                            <a href="PesanKeAdminB.jsp">Kirim Pesan ke Admin</a>
                        </li>
                        <li class="active">
                            <a>Penjemputan Sampah</a>
                        </li>
                        <li>
                            <a href="update_profileB.jsp">Memperbarui Profil</a>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-9">
                    <h1 style="text-align:center">Meminta Penjemputan Sampah</h1>
                    <div style="text-align: center">
                        ${errorMessage}
                    </div>
                    <form role="form" method="post" action="PenjemputanSampah">
                        <div class="form-group">
                            <label for="">Jenis Sampah:</label>
                            <select class="form-control" name="jenisSampah">
                                <%
                                    ArrayList<String> kategori = db.getKategori();
                                    for (String ktgr : kategori) {
                                        out.println("<option>" + ktgr + "</option>");
                                    }
                                %>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="">Berat:</label>
                            <input name="berat" type="number" class="form-control" min="1" step="any" required="required" placeholder="Dalam Kilogram">
                        </div>

                        <div class="form-group">
                            <label for="">Tanggal Penjemputan:</label>
                            <input name="tanggaljemput" required="required" type="date" class="form-control" placeholder="yyyy-mm-dd">
                        </div>

                        <div class="form-group">
                            <label for="">Jam Penjemputan:</label>
                            <input name="jamjemput" required="required" type="time" class="form-control" placeholder="hh:mm">
                        </div>

                        <div class="form-group">
                            <label for="">Keterangan Tambahan:</label>
                            <textarea name="keterangan" class="form-control" rows="3"></textarea>
                        </div>

                        <button type="submit" class="btn btn-primary">Kirim</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
