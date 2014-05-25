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
                out.print("ID: " + account.getId() + "<BR>");
                out.print("Role: " + account.getRole() + "<BR>");
                out.print("Username: " + account.getUsername() + "<BR>");                
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
            <a class="item" href="KirimUangVirtual.jsp">
                Kirim Uang Virtual <span class="ui label">n</span>
            </a>
            <a class="item" href="PesanKeAdmin.jsp">
                Kirim Pesan ke Admin <span class="ui label">n</span>
            </a>
            <a class="active item" href="#">
                Penjemputan Sampah <span class="ui label">n</span>
            </a>
            <a class="item" href="update_profile.jsp">
                Memperbarui Profil <span class="ui label">n</span>
            </a>
        </div>

        <div class="ui celled grid">
            <div class="ten wide right column">
                <form role="form" method="post" action="PenjemputanServlet">
                    <h1 class="ui center header">Meminta Penjemputan Sampah</h1>
                    
                    <div class="ui divider"></div>
                    <div class="ui divider"></div>
                    <div class="ui form">
                        <div class="ui one column grid">
                            <div class="row">
                                <div class="column">
                                    <div class="ui segment">
                                        <div class="ui top attached label">Jenis Sampah</div>
                                        <div class="ui fluid dropdown">
                                            <input type="hidden" name="jenisSampah" id="jenisSampah" value="default">
                                            <input type="hidden" name="addnew" value="1">
                                            <div id="kategori" name="kategori" class="text"  onclick="jemputDropdown()">Daftar Jenis Sampah</div>
                                            <i class="dropdown icon"></i>
                                            <div class="menu">
                                                <div class="item">Botol Plastik</div>
                                                <div class="item">Furnitur Bekas</div>
                                                <div class="item">Alat Elektronik</div>
                                                <div class="item">Baju Bekas</div>
                                                <div class="item">Mainan</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="column">
                                    <div class="ui segment">
                                        <div class="ui top attached label">Berat</div>
                                        <input name="berat" placeholder="Dalam Kilogram" type="text">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="column">
                                    <div class="ui segment">
                                        <div class="ui top attached label">Tanggal Penjemputan</div>
                                        <div class="date field">
                                            <input name="tanggaljemput" placeholder="xxxx-xx-xx" type="text">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="column">
                                    <div class="ui segment">
                                        <div class="ui top attached label">Jam Penjemputan</div>
                                        <div class="date field">
                                            <input name="jamjemput" placeholder="xx:xx" type="text">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="column">
                                    <div class="ui segment">
                                        <div class="ui top attached label">Keterangan Tambahan</div>
                                        <div class="field">
                                            <input name="keterangan" placeholder="" type="text">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <button type="submit" onclick="jemputDropdown()"><div class="positive ui button">Kirim</div></button>
                </form>
            </div>
        </div>
    </body>
</html>
