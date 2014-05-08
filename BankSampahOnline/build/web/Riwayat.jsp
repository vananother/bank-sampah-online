<%-- 
    Document   : index
    Created on : Apr 14, 2014, 12:16:09 PM
    Author     : van
--%>

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
            String username;
            int id;
            Account account = null;
            BankSampahOnlineDB bsodb = new BankSampahOnlineDB();
            if (session.getAttribute("account") == null) {

                username = request.getParameter("username");
                String password = request.getParameter("password");
                String encPass = UtilMethods.hashInput(request.getParameter("password"));

                boolean login = bsodb.isLoginValid(username, encPass);
                if (login) {
                    account = bsodb.login(username, encPass);
                    session.setAttribute("account", account);
                    out.print("account id: " + account.getId() + "<br>");
                    out.print("account role: " + account.getRole() + "<br>");
                    out.print("account username: " + account.getUsername() + "<br>");
                    out.print("Account Info: <BR>");
                    out.print("ID: " + account.getId() + "<BR>");
                    out.print("Role: " + account.getRole() + "<BR>");
                    out.print("Username: " + account.getUsername() + "<BR>");
                } else { //login fail
                    session.setAttribute("account", null);
                    response.sendRedirect("index.jsp?loginFail=1");
                }
                out.print("entered username: " + username + "<br>");
                out.print("entered password: " + password + "<br>");
                out.print("encoded password: " + UtilMethods.hashInput(password) + "<br>");
            } else {
                account = null;
                account = (Account) session.getAttribute("account");
                out.print("already login <br>");
                out.print("Account Info: <BR>");
                out.print("ID: " + account.getId() + "<BR>");
                out.print("Role: " + account.getRole() + "<BR>");
                out.print("Username: " + account.getUsername() + "<BR>");
            }

            String addnew = request.getParameter("addnew");
            if (addnew != null) {
                Sampah sampah = new Sampah();
                sampah.setIdPengguna(account.getId());
                sampah.setKategori(request.getParameter("dropdown1"));
                sampah.setJumlah(Double.parseDouble(request.getParameter("berat")));
                sampah.setTanggal(request.getParameter("tanggaljemput"));
                sampah.setJam(request.getParameter("jamjemput"));
                sampah.setKeterangan(request.getParameter("keterangan"));
                boolean addsukses = bsodb.addSampah(sampah);
                if (addsukses) {
                    out.print("Permintaan penjemputan telah terdaftar: <BR>");
                } else {
                    out.print("Permintaan penjemputan gagal <BR>");
                }
                out.print("Form Info: <BR>");
                out.print("Kategori: " + request.getParameter("dropdown1") + "<BR>");
                out.print("Berat: " + request.getParameter("berat") + "<BR>");
                out.print("Tanggal Jemput: " + request.getParameter("tanggaljemput") + "<BR>");
                out.print("Jam Penjemputan: " + request.getParameter("jamjemput") + "<BR>");
                out.print("Keterangan Tambahan: " + request.getParameter("keterangan") + "<BR>");

            }
        %>
        <div class="ui green inverted menu">
            <div class="ui black launch button">
                <i class="list layout icon"></i>
            </div>
            <div class="right menu">
                <a class="item" href="index.jsp?logout=1">Keluar</a>
            </div>
        </div>
        <div class="ui large inverted vertical sidebar menu">
            <a class="active item" href="#">
                Riwayat <span class="ui label">n</span>
            </a>
            <a class="item" href="KirimUangVirtual.jsp">
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
            <div class="ten wide right column">
                <h1 class="ui center header">Riwayat Pengiriman Sampah</h1>
                <div class="ui divider"></div>

                <table class="ui compact table segment">
                    <thead>
                        <tr><th>Jenis Sampah</th>
                            <th>Jumlah</th>
                            <th>Status</th>
                            <th>Tanggal Diterima</th>                            
                            <th>Bayaran</th>
                        </tr></thead>
                    <tbody>
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
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
