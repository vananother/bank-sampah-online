<%-- 
    Document   : index
    Created on : Apr 14, 2014, 12:16:09 PM
    Author     : van
--%>

<%@page import="banksampahonline.util.Penjemputan"%>
<%@page import="java.util.ArrayList"%>
<%@page import="banksampahonline.util.Sampah"%>
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
            ArrayList<Penjemputan> wL = new ArrayList<Penjemputan>();
            int unread = 0;
            if (account == null) {
                response.sendRedirect("Login");
            } else {
                if (account.getRole().equals("pengguna")) {
                    response.sendRedirect("Login");
                }
                unread = db.getUnreadMessagesCount(account.getUsername());
                wL = db.getWaitingList();
                out.print(db.failBecause);
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
                            <%
                                if (unread == 0) {
                                    out.print("<a href=\"PesanKePengguna.jsp\">Kirim Pesan ke Pengguna</a>");
                                } else {
                                    out.print("<a href=\"PesanKePengguna.jsp\">Kirim Pesan ke Pengguna: ");
                                    out.print(unread);
                                    out.print(" <span class=\"glyphicon glyphicon-envelope\"></span></a>");
                                }
                            %>
                        </li>
                        <li>
                            <a href="Pendataan.jsp">Pendataan Sampah</a>
                        </li>
                        <li class="active">
                            <a>Daftar Penjemputan</a>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-9">
                    <h1>Daftar Penjemputan Sampah</h1>
                    <br>
                    <br>
                    <form action="DaftarPenjemputan" method="post">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Pengirim</th>
                                    <th>Jenis Sampah</th>
                                    <th>Jumlah</th>
                                    <th>Alamat</th>
                                    <th>Tanggal</th>                            
                                    <th>Jam</th>
                                    <th>Keterangan Tambahan</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Penjemputan temp : wL) {
                                %>
                                <tr>
                                    <td><%=temp.getPengirim()%></td>
                                    <td><%=temp.getKategori()%></td>
                                    <td><%=temp.getJumlah()%></td>
                                    <td><%=temp.getAlamat()%></td>
                                    <td><%=temp.getTanggal()%></td>
                                    <td><%=temp.getJam().substring(0, 5) %></td>
                                    <td><%=temp.getKeterangan()%></td>
                                    <td>
                                        <button class="btn btn-primary" type="submit" name="jemput" value="<%=temp.getIdSampah()%>">
                                            Jemput
                                        </button>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>                            
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
    </body>
</html>
