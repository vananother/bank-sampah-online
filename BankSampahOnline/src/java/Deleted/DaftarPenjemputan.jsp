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
            <a class="item" href="Pendataan.jsp">
                Pendataan Sampah <span class="ui label">n</span>
            </a>
            <a class="active item">
               Daftar Penjemputan <span class="ui label">n</span>
            </a>
        </div>

        <div class="ui celled grid">
            <div class="column">
                <h1 class="ui center header">Daftar Permintaan Penjemputan Sampah</h1>
                <div class="ui divider"></div>

                <table class="ui compact table segment">
                    <thead>
                        <tr><th>Jenis Sampah</th>
                            <th>Jumlah</th>
                            <th>Alamat</th>
                            <th>Tanggal</th>                            
                            <th>Jam</th>
                            <th>Keterangan Tambahan</th>
                            <th>Status</th>
                        </tr></thead>
                    <tbody>
                        <tr>
                            <td>Botol Plastik</td>
                            <td>2 Kg</td>
                            <td>Jalan Tenggiri 1 Nomor 1 Jakarta Selatan</td>
                            <td>26-04-2014</td>          
                            <td>12:00</td>
                            <td>Bawa Karung</td>
                            <td>
                                <div class="ui checkbox">
                                    <input name="fun" type="checkbox">
                                    <label>Dijemput</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Mainan</td>
                            <td>4 Kg</td>
                            <td>Jalan Kentang Raya nomor 12 Perumahan Puri Indah, Bekasi Selatan</td>
                            <td>7-05-2014</td>          
                            <td>15:00</td>
                            <td>-</td>
                            <td>
                                <div class="ui checkbox">
                                    <input name="fun" type="checkbox">
                                    <label>Dijemput</label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Furnitur</td>
                            <td>15 Kg</td>
                            <td>Jalan Kambing 4 Nomor 5 Jakarta Barat</td>
                            <td>25-04-2014</td>          
                            <td>13:00</td>
                            <td>Sepertinya butuh mobil pickup</td>
                            <td>
                                <div class="ui checkbox">
                                    <input name="fun" type="checkbox">
                                    <label>Dijemput</label>
                                </div></td>
                        </tr>
                        <tr>
                            <td>Baju Bekas</td>
                            <td>2 Kg</td>
                            <td>Jalan Tikung 3 Nomor 19 Jakarta Timur</td>
                            <td>23-04-2014</td>          
                            <td>12:00</td>
                            <td>-</td>
                            <td>
                                <div class="ui checkbox">
                                    <input name="fun" type="checkbox">
                                    <label>Dijemput</label>
                                </div></td>
                        </tr>
                        <tr>
                            <td>Alat Elektronik</td>
                            <td>5 Kg</td>
                            <td>Jalan Tenggiri 1 Nomor 1 Jakarta Selatan</td>
                            <td>2-05-2014</td>          
                            <td>12:00</td>
                            <td>-</td>
                            <td>
                                <div class="ui checkbox">
                                    <input name="fun" type="checkbox">
                                    <label>Dijemput</label>
                                </div></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
