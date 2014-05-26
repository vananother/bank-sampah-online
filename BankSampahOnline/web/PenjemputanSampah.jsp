<%-- 
    Document   : index
    Created on : Apr 14, 2014, 12:16:09 PM
    Author     : van
--%>
<%@page errorPage="Error.jsp" %>
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
            int unread = 0;
            if (account == null) {
                response.sendRedirect("PenjemputanSampah");
            } else {
                if (account.getRole().equals("superadmin")) {
                    response.sendRedirect("Login");
                    return;
                }
                unread = db.getUnreadMessagesCount(account.getUsername());
            }
        %>
        <nav class="navbar navbar-inverse" role="navigation">
            <div class="container">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="Login.jsp?logout=1" style="color: red; font-weight: bold">Keluar</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-left">
                    <li><a href="update_profile.jsp" style="color: #6ECFF5"><b><%= account == null ? "" : account.getFirstname() + " " + account.getLastname()%></b></a></li>
                    <li><a style="color: #6ECFF5"><b>Uang virtual anda saat ini: <%= account == null ? "" : account.getUangvirtual()%></b></a></li>
                </ul>
            </div>                
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-xs-3">
                    <ul class="nav nav-pills nav-stacked">
                        <li>
                            <a href="Riwayat.jsp">Riwayat</a>
                        </li>
                        <li>
                            <%
                                if (unread == 0) {
                                    out.print("<a href=\"PesanKeAdmin.jsp\">Kirim Pesan ke Admin</a>");
                                } else {
                                    out.print("<a href=\"PesanKeAdmin.jsp\">Kirim Pesan ke Admin: ");
                                    out.print(unread);
                                    out.print(" <span class=\"glyphicon glyphicon-envelope\"></span></a>");
                                }
                            %>  
                        </li>
                        <li class="active">
                            <a>Penjemputan Sampah</a>
                        </li>
                        <li>
                            <a href="update_profile.jsp">Memperbarui Profil</a>
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
                            <select class="form-control" name="jenisSampah"  >

                                <%
                                    ArrayList<String> kategori = db.getKategori();
                                    String jenis = (String) request.getAttribute("jenisSampah");
                                    for (String ktgr : kategori) {
                                        if (jenis != null && ktgr.equals(jenis)) {
                                %>
                                <option selected="selected"><%= jenis%> </option>
                                <%
                                } else {
                                %>
                                <option><%= ktgr%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="">Berat:</label>
                            <input name="berat" type="number" class="form-control" min="1" step="any" required="required" placeholder="Dalam Kilogram" value="${berat}">                            
                        </div>

                        <div class="form-group">
                            <label for="">Tanggal Penjemputan:</label>
                            <input name="tanggaljemput" value="${tanggaljemput}" id="datePicker" required="required" type="date" class="form-control" placeholder="yyyy-mm-dd">
                            <small>*Tanggal penjemputan minimal 1 minggu setelah hari ini</small>
                        </div>

                        <div class="form-group">
                            <label for="">Jam Penjemputan:</label>
                            <input name="jamjemput" value="${jamjemput}" id="timePicker" required="required" type="time" class="form-control" placeholder="hh:mm">
                            <small>*Penjemputan hanya dapat dilakukan dari jam 8 pagi sampai jam 10 malam</small>
                        </div>

                        <div class="form-group">
                            <label for="">Keterangan Tambahan:</label>
                            <textarea name="keterangan"  class="form-control" rows="3">${keterangan}</textarea>
                        </div>

                        <button type="submit" class="btn btn-primary">Kirim</button>
                        <hr>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
