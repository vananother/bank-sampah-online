<%-- 
    Document   : index
    Created on : Apr 14, 2014, 12:16:09 PM
    Author     : van
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="banksampahonline.util.Sampah"%>
<%@page import="banksampahonline.util.Account"%>
<%@page import="banksampahonline.util.UtilMethods"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="banksampahonline.database.BankSampahOnlineDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <title>Dashboard</title>
    </head>
    <body id="feed">
        <% //debugging
            Account account = (Account) session.getAttribute("account");
            ArrayList<Sampah> sesampahan = new ArrayList<Sampah>();
            BankSampahOnlineDB bdb = new BankSampahOnlineDB();
            int unread = 0;
            if (account == null) {
                response.sendRedirect("Login");
            } else {
                unread = bdb.getUnreadMessagesCount(account.getUsername());
                sesampahan = bdb.getSampah(account.getUsername());
            }
            out.print(bdb.failBecause);
        %>
        <nav class="navbar navbar-inverse" role="navigation">
            <div class="container">
                <ul class="nav navbar-nav navbar-right">                    
                    <li>
                        <a href="index.jsp?logout=1" style="color: red; font-weight: bold">
                            Keluar
                        </a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-left">
                    <li><a href="update_profileB.jsp" style="color: #6ECFF5"><b><%= account == null ? "" : account.getFirstname() + " " + account.getLastname()%></b></a></li>
                    <li><a style="color: #6ECFF5"><b>Uang virtual anda saat ini: <%= account == null ? "" : account.getUangvirtual()%></b></a></li>
                </ul>
            </div>                
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-xs-3">
                    <ul class="nav nav-pills nav-stacked">
                        <li class="active">
                            <a>Riwayat</a>
                        </li>
                        <li>
                            <%
                                if (unread == 0) {
                                    out.print("<a href=\"PesanKeAdminB.jsp\">Kirim Pesan ke Admin</a>");
                                } else {
                                    out.print("<a href=\"PesanKeAdminB.jsp\">Kirim Pesan ke Admin: ");
                                    out.print(unread);
                                    out.print(" <span class=\"glyphicon glyphicon-envelope\"></span></a>");
                                }
                            %>  
                        </li>
                        <li>
                            <a href="PenjemputanSampahB.jsp">Penjemputan Sampah</a>
                        </li>
                        <li>
                            <a href="update_profileB.jsp">Memperbarui Profil</a>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-9">
                    <h1>Riwayat Pengiriman Sampah</h1>
                    <div style="text-align: center">
                        ${errorMessage}
                    </div>
                    <a href="PenjemputanSampahB.jsp">
                        <span class="glyphicon glyphicon-plus"></span>
                    </a>
                    <table class="table table-hover">
                        <tr>
                            <th>Jenis Sampah</th>
                            <th>Jumlah</th>
                            <th>Status</th>
                            <th>Tanggal Diterima</th>
                            <th>Bayaran</th>
                            <th></th>
                        </tr>
                        <%
                            for (Sampah temp : sesampahan) {
                                String status = temp.getStatus();
                                String tanggal = "-";
                                String bayaran = "-";
                                if (!status.equals("Belum Dijemput")) {
                                    tanggal = temp.getTanggal();
                                }
                                if (status.equals("Sudah Dibayar")) {
                                    bayaran = temp.getBayaran() + "";
                                }
                        %>
                        <tr>
                            <td><%=temp.getKategori()%></td>
                            <td><%=temp.getJumlah() + " Kg"%></td>
                            <td><%=status%></td>
                            <td><%=tanggal%></td>
                            <td><%=bayaran%></td>
                        <form method="post" action="HapusPenjemputan">
                            <td>
                                <%
                                    if (temp.getStatus().equals("Belum Dijemput")) {


                                %>
                                <button class="btn btn-danger" type="submit" name="hapus" value="<%=temp.getIdSampah()%>">
                                    Batalkan
                                </button>
                                <%

                                } else {
                                %>
                                <button class="btn btn-danger" disabled="disable">
                                    Batalkan
                                </button>
                                <%
                                    }
                                %>
                            </td>
                        </form>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
