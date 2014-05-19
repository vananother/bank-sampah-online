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
            Account account = null;
            if (session.getAttribute("account") == null) {
                out.print("session.getattribut(account) == null <br>");
            } else {
                account = (Account) session.getAttribute("account");
                out.print("already login <br>");
                out.print("Account Info: <BR>");
                out.print("ID: " + account.getId() + "<BR>");
                out.print("Role: " + account.getRole() + "<BR>");
                out.print("Username: " + account.getUsername() + "<BR>");
                out.print("Firstname: " + account.getFirstname() + "<BR>");
                out.print("Lastname: " + account.getLastname() + "<BR>");
                out.print("Email: " + account.getEmail() + "<BR>");
                out.print("Address: " + account.getAlamat() + "<BR>");
                out.print("Phone: " + account.getPhone() + "<BR>");
                out.print("Balance: " + account.getUangvirtual() + "<BR>");
            }
            
            if (account != null) {
                BankSampahOnlineDB bdb = new BankSampahOnlineDB();
                ArrayList<Sampah> sesampahan = bdb.getSampah(account.getId());
                for (Sampah temp : sesampahan) {
                    out.println("id: " + temp.getIdPengguna() + "<br>");
                    out.println("kategori: " + temp.getKategori() + "<br>");
                    out.println("jumlah: " + temp.getJumlah() + "<br>");
                    out.println("waktu: " + temp.getTanggal() + " pukul " + temp.getJam() + "<br>");
                    out.println("keterangan: " + temp.getKeterangan() + "<br>");
                    out.println("status: " + temp.getStatus() + "<br>");
                }
            }
            out.println("failure: "+BankSampahOnlineDB.failBecause);
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
                        <li class="active">
                            <a>Riwayat</a>
                        </li>
                        <li>
                            <a href="PesanKeAdminB.jsp">Kirim Pesan ke Admin</a>
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
                    <br>
                    <br>

                    <table class="table table-hover">
                        <tr>
                            <th>Jenis Sampah</th>
                            <th>Jumlah</th>
                            <th>Status</th>
                            <th>Tanggal Diterima</th>
                            <th>Bayaran</th>
                        </tr>
                        <tr>
                            <td>Botol Plastik</td>
                            <td>2 Kg</td>
                            <td>Sudah Diterima</td>
                            <td>11-04-2014</td>                            
                            <td>50</td>
                        </tr>
                        <tr>
                            <td>Furnitur Bekas</td>
                            <td>10 Kg</td>
                            <td>Sudah Diterima</td>
                            <td>12-04-2014</td>                            
                            <td>350</td>
                        </tr>
                        <tr>
                            <td>Alat Elektronik</td>
                            <td>5 Kg</td>
                            <td>Sudah Diterima</td>
                            <td>14-04-2014</td>
                            <td>200</td>
                        </tr>
                        <tr>
                            <td>Baju Bekas</td>
                            <td>2 Kg</td>
                            <td>Sudah Diterima</td>
                            <td>15-04-2014</td>                            
                            <td>300</td>
                        </tr>
                        <tr>
                            <td>Mainan</td>
                            <td>3 Kg</td>
                            <td>Belum Diterima</td>
                            <td>-</td>                            
                            <td>-</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
