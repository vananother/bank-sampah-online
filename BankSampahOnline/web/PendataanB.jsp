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
                    <li><a href="index.jsp">Keluar</a></li>
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
                    <form>
                        <table class="table table-hover">
                            <thead>
                            <th>Jenis Sampah</th>
                            <th>Jumlah</th>
                            <th width="300">Bayaran</th>
                            </thead>
                            <tbody>
                                <tr>
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
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>

                </body>
                </html>
