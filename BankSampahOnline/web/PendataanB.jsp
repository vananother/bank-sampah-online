<%-- 
    Document   : index
    Created on : Apr 14, 2014, 12:16:09 PM
    Author     : van
--%>

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
            ArrayList<Sampah> sesampahan = new ArrayList<Sampah>();
            int unread = 0;
            if (account == null) {
                response.sendRedirect("Login");
            } else {
                if (account.getRole().equals("pengguna")) {
                    response.sendRedirect("Login");
                }
                unread = db.getUnreadMessagesCount(account.getUsername());
                sesampahan = db.getPayList();
            }
            out.println(db.failBecause);
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
                                    out.print("<a href=\"PesanKePenggunaB.jsp\">Kirim Pesan ke Pengguna</a>");
                                } else {
                                    out.print("<a href=\"PesanKePenggunaB.jsp\">Kirim Pesan ke Pengguna: ");
                                    out.print(unread);
                                    out.print(" <span class=\"glyphicon glyphicon-envelope\"></span></a>");
                                }
                            %>
                        </li>
                        <li class="active">
                            <a>Pendataan Sampah</a>
                        </li>
                        <li>
                            <a href="DaftarPenjemputanB.jsp">Daftar Penjemputan</a>
                        </li>
                    </ul>
                </div>

                <div class="col-xs-9">
                    <h1>Pendataan Sampah</h1>
                    <table class="table table-hover">
                        <thead>
                        <th>Pengirim</th>
                        <th>Jenis Sampah</th>
                        <th>Jumlah</th>
                        <th width="300">Bayaran</th>
                        <th></th>
                        </thead>
                        <tbody>
                            <%
                                for (Sampah temp : sesampahan) {
                            %>
                            <tr>
                        <form method="post" action="Pendataan">
                            <td><%=temp.getIdPengguna()%></td>
                            <td><%=temp.getKategori()%></td>
                            <td><%=temp.getJumlah() + " Kg"%></td>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon">Rp</span>
                                    <input name="bayaran" type="number" min="0" required="required" class="form-control">
                                    <span class="input-group-addon">.00</span>
                                </div>
                            </td>
                            <td>
                                <input name="username" type="hidden" value="<%=temp.getIdPengguna()%>">
                                <button class="btn btn-primary" type="submit" name="bayar" value="<%=temp.getIdSampah()%>">
                                Bayar
                                </button>
                            </td>
                        </form>
                        </tr>
                        <%
                            }
                        %>
                        <!--tr>
                            <td>Benda Plastik</td>
                            <td>2 Kg</td>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon">Rp</span>
                                    <input type="number" min="0" class="form-control">
                                    <span class="input-group-addon">.00</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Furnitur Bekas</td>
                            <td>10 Kg</td>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon">Rp</span>
                                    <input type="number" min="0" class="form-control">
                                    <span class="input-group-addon">.00</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Alat Elektronik</td>
                            <td>5 Kg</td>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon">Rp</span>
                                    <input type="number" min="0" class="form-control">
                                    <span class="input-group-addon">.00</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Baju Bekas</td>
                            <td>2 Kg</td>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon">Rp</span>
                                    <input type="number" min="0" class="form-control">
                                    <span class="input-group-addon">.00</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Mainan</td>
                            <td>3 Kg</td>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon">Rp</span>
                                    <input type="number" min="0" class="form-control">
                                    <span class="input-group-addon">.00</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><button type="submit" class="btn btn-primary">Kirim</button></td>
                        </tr-->
                        </tbody>
                    </table>

                </div>

                </body>
                </html>
