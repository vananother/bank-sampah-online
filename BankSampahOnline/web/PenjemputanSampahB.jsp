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
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <script src="others/jquery.js"></script>
        <script src="others/jquery.address.js"></script>

        <link rel="stylesheet" type="text/css" href="semantic-ui/css/semantic.css">
        <script src="semantic-ui/javascript/semantic.js"></script>
        <link rel="stylesheet" type="text/css" href="others/feed.css">
        <script src="others/feed.js"></script>

        <title>Dashboard</title>
    </head>
    <body id="feed">
        <%--
            Account account = (Account) session.getAttribute("account");
            if (account == null) {
                response.sendRedirect("index.jsp");
            } else {
                out.print("Account Info: <BR>");
                out.print("ID: " + account.getId() + "<BR>");
                out.print("Role: " + account.getRole() + "<BR>");
                out.print("Username: " + account.getUsername() + "<BR>");
                out.print("Kategori: "+request.getParameter("dropdown1") + "<BR>");
                out.print("Berat: "+request.getParameter("berat") + "<BR>");
                out.print("Tanggal Jemput: "+request.getParameter("tanggaljemput") + "<BR>");
                out.print("Jam Penjemputan: "+request.getParameter("jamjemput")+"<BR>");
                out.print("Keterangan Tambahan: "+request.getParameter("keterangan") + "<BR>");
                
            }
        --%>
        <nav class="navbar navbar-inverse" role="navigation">
                <div class="container">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="indexx.jsp?logout=1">Keluar</a></li>
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
                        <form role="form" action="#">
                            <div class="form-group">
                                <label for="">Jenis Sampah:</label>
                                <select class="form-control">
                                    <option>Botol Plastik</option>
                                    <option>Furnitur Bekas</option>
                                    <option>Alat Elektronik</option>
                                    <option>Baju Bekas</option>
                                    <option>Mainan</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="">Berat:</label>
                                <input type="number" class="form-control" min="0" step="any" placeholder="Dalam Kilogram">
                            </div>
                            
                            <div class="form-group">
                                <label for="">Tanggal Penjemputan:</label>
                                <input type="date" class="form-control" placeholder="mm/dd/yyyy">
                            </div>
                            
                            <div class="form-group">
                                <label for="">Jam Penjemputan:</label>
                                <input type="time" class="form-control" placeholder="hh/mm AM/PM">
                            </div>
                            
                            <div class="form-group">
                                <label for="">Keterangan Tambahan:</label>
                                <textarea class="form-control" rows="3"></textarea>
                            </div>
                            
                            <button type="submit" class="btn btn-primary">Kirim</button>
                        </form>
                    </div>
                </div>
            </div>
    </body>
</html>
