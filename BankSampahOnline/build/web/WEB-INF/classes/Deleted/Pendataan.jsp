<%-- 
    Document   : index
    Created on : Apr 14, 2014, 12:16:09 PM
    Author     : van
--%>

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
        <div class="ui green inverted menu">
            <div class="ui black launch button">
                <i class="list layout icon"></i>
            </div>
            <div class="right menu">
                <a class="item" href="index.jsp">Keluar</a>
            </div>
        </div>
        <div class="ui large inverted vertical sidebar menu">
            <a class="item" href="PesanKePengguna.jsp">
                Kirim Pesan ke Pengguna <span class="ui label">n</span>
            </a>
            <a class="active item">
                Pendataan Sampah <span class="ui label">n</span>
            </a>
            <a class="item" href="DaftarPenjemputan.jsp">
                Daftar Penjemputan <span class="ui label">n</span>
            </a>
        </div>

        <div class="ui celled grid">
            <div class="ten wide right column">
                <h1 class="ui center header">Pendataan Sampah</h1>
                <div class="ui divider"></div>

                <!--
                                
                                <div class="ui form">
                                    <div class="inline fields">
                                        <div class="field">
                                            <label>Cari Pengguna: </label>
                                            <input placeholder="Nama Pengguna" type="text">
                                        </div>
                                        <div class="field">
                                            <a class="circular tiny ui teal button"><i class="users icon"></i></a>
                                        </div>
                                    </div>
                                </div>
                
                                
                                <div class="ui divider"></div>
                                
                                <a class="ui green inverted label">Nama Pengguna</a>
                -->
                <table class="ui compact table segment">
                    <thead>
                        <tr><th>Jenis Sampah</th>
                            <th>Jumlah</th>
                            <th>Bayaran</th>
                        </tr></thead>
                    <tbody>
                        <tr>
                            <td>Benda Plastik</td>
                            <td>2 Kg</td>
                            <td>
                                <div class="ui left icon input">
                                    <input placeholder=" " type="text">
                                    <i class="dollar basic icon"></i>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Furnitur Bekas</td>
                            <td>10 Kg</td>
                            <td>
                                <div class="ui left icon input">
                                    <input placeholder=" " type="text">
                                    <i class="dollar basic icon"></i>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Alat Elektronik</td>
                            <td>5 Kg</td>
                            <td>
                                <div class="ui left icon input">
                                    <input placeholder=" " type="text">
                                    <i class="dollar basic icon"></i>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Baju Bekas</td>
                            <td>2 Kg</td>
                            <td>
                                <div class="ui left icon input">
                                    <input placeholder=" " type="text">
                                    <i class="dollar basic icon"></i>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Mainan</td>
                            <td>3 Kg</td>
                            <td>
                                <div class="ui left icon input">
                                    <input placeholder=" " type="text">
                                    <i class="dollar basic icon"></i>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="positive ui button">Kirim</div>
            </div>
        </div>
    </body>
</html>
