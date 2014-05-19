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
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <title>Dashboard</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse" role="navigation">
            <div class="container">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href=href="index.jsp">Keluar</a></li>
                </ul>
            </div>                
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-xs-3">
                    <ul class="nav nav-pills nav-stacked">
                        <li>
                            <a href="PesanKePenggunaB.jsp">Kirim Pesan ke Pengguna</a>
                        </li>
                        <li>
                            <a href="PendataanB.jsp">Pendataan Sampah</a>
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

                    <table class="table table-hover">
                        <thead>
                            <tr>
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
                            <tr>
                                <td>Botol Plastik</td>
                                <td>2 Kg</td>
                                <td>Jalan Tenggiri 1 Nomor 1 Jakarta Selatan</td>
                                <td>26-04-2014</td>          
                                <td>12:00</td>
                                <td>Bawa Karung</td>
                                <td>
                                    <label>Sudah Dijemput</label>
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
                                    <button type="button" class="btn btn-primary">Jemput</button>
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
                                    <button type="button" class="btn btn-primary">Jemput</button>
                            </tr>
                            <tr>
                                <td>Baju Bekas</td>
                                <td>2 Kg</td>
                                <td>Jalan Tikung 3 Nomor 19 Jakarta Timur</td>
                                <td>23-04-2014</td>          
                                <td>12:00</td>
                                <td>-</td>
                                <td>
                                    <button type="button" class="btn btn-primary">Jemput</button>
                                </td>
                            </tr>
                            <tr>
                                <td>Alat Elektronik</td>
                                <td>5 Kg</td>
                                <td>Jalan Tenggiri 1 Nomor 1 Jakarta Selatan</td>
                                <td>2-05-2014</td>          
                                <td>12:00</td>
                                <td>-</td>
                                <td>
                                    <button type="button" class="btn btn-primary">Jemput</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
    </body>
</html>
