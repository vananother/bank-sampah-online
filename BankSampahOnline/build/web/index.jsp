<%-- 
    Document   : index.jsp
    Created on : May 25, 2014, 12:03:04 PM
    Author     : van
--%>
<%@page errorPage="Error.jsp" %>
<%@page import="javafx.util.Pair"%>
<%@page import="java.util.ArrayList"%>
<%@page import="banksampahonline.database.BankSampahOnlineDB"%>
<%@page import="banksampahonline.util.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Bank Sampah Online</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="assets/css/style.css">
        <script src="others/jquery.js"></script>
        <script src="others/jquery.address.js"></script>
    </head>
    <body background="assets/images/wood013.jpg">
        <nav class="navbar navbar-inverse" role="navigation">
            <div class="container">
                <ul class="nav navbar-nav navbar-right">
                    <%
                        Account account = (Account) session.getAttribute("account");
                        if (account == null) {


                    %>
                    <li><a href="Login.jsp">Login/Register</a></li>
                        <%                    } else {
                        %>
                    <li><a href="Riwayat.jsp"><%= account.getUsername()%></a></li>
                        <%
                            }
                            BankSampahOnlineDB db = new BankSampahOnlineDB();
                            ArrayList<Pair<String, String>> topTen = db.getTopTen();
                        %>

                </ul>
            </div>                
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="page-header">
                        <h1 align="center">Bank Sampah Online</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-1"></div>
                <div class="col-xs-10">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <img src="assets/images/carousels/sampah1.jpg" alt="handbag1">
                                <div class="carousel-caption font-carousel">

                                    <p>
                                        Sampah yang ada di Jakarta volumenya sangat banyak sehingga hampir tidak tertampung lagi di tempat penampungan sampah. Bank Sampah Online bertujuan untuk mengurangi volume sampah yang ada di Jakarta.
                                    </p>
                                </div>
                            </div>

                            <div class="item">
                                <img src="assets/images/carousels/sampah2.jpg" alt="handbag2">
                                <div class="carousel-caption font-carousel">

                                    <p>
                                        Kami menerima berbagai macam sampah yang dapat didaur ulang.
                                    </p>
                                </div>
                            </div>

                            <div class="item">
                                <img src="assets/images/carousels/sampah3.jpg" alt="handbag3">
                                <div class="carousel-caption font-carousel">

                                    <p>
                                        Sampah yang kami terima nantinya akan kami daur ulang dan kami proses agar menjadi barang yang berguna serta dapat dipakai dalam kehidupan sehari-hari.
                                    </p>
                                </div>
                            </div>

                            <div class="item">
                                <img src="assets/images/carousels/sampah4.jpg" alt="handbag3">
                                <div class="carousel-caption font-carousel">

                                    <p>
                                        Kami tidak ingin sampah yang masih bisa diolah dan didaur ulang terbengkalai begitu saja dan merusak pemandangan.
                                    </p>
                                </div>
                            </div>

                            <div class="item">
                                <img src="assets/images/carousels/sampah5.jpg" alt="handbag3">
                                <div class="carousel-caption font-carousel">

                                    <p>
                                        Kami memiliki visi dan misi agar Kota Jakarta terbebas dari sampah menumpuk yang ada di Kota Jakart.
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control tbl-carousel" href="#carousel-example-generic" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control tbl-carousel" href="#carousel-example-generic" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                </div>
                <div class="col-xs-1"></div>
            </div>
            <hr>
            <br>
            <br>
            <br>
            <div class="row">
                <div class="col-xs-1"></div>
                <div class="col-xs-10">
                    <div class="jumbotron">
                        <h3 align="center">Our Background</h3>
                        <h5 align="center">
                            Permasalahan sampah yang ada di Indonesia hingga saat ini masih sering terjadi, mulai dari tidak teraturnya pengelolaan sampah hingga tersumbatnya sungai, kali dan parit karena ketidakdisiplinan masyarakat dalam membuang sampah. Padahal, dari sekian banyaknya sampah ada yang dapat didaur ulang sehingga menghasilkan suatu produk baru yang bernilai. Selain itu, jika sampah-sampah yang ada dapat dikelola dengan baik maka sampah-sampah tersebut juga dapat menjadi lahan bisnis baru. Di sisi lain, dengan adanya bisnis pengolahan sampah, jumlah sampah yang teronggok sebelum dibakar dapat dikurangi.
                            Permasalahan tersebut memicu kami dalam menentukan ide proyek untuk mata kuliah Layanan & Apliksi Web ini, yaitu membuat sistem BANK SAMPAH ONLINE.
                        </h5>
                    </div>
                </div>
                <div class="col-xs-1"></div>
            </div>
            <br>
            <br>
            <br>

            <div class="row">
                <div class="col-xs-4"></div>
                <div class="col-xs-4">
                    <div class="page-header">
                        <h1 align="center">Top 10</h1>
                        <h1 align="center">Penyumbang Sampah</h1><br>
                        <table background-color="white" class="table table-hover">
                            <thead>
                                <tr>
                                    <td>No.</td>
                                    <td>Nama</td>
                                    <td>Total Poin</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int index = 1;
                                    for (Pair<String, String> temp : topTen) {
                                        out.print("<tr>");
                                        out.print("<td>" + index + "</td>");
                                        out.print("<td>" + temp.getKey() + "</td>");
                                        out.print("<td>" + temp.getValue() + "</td>");
                                        out.print("</tr>");
                                        index++;
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>

                </div>
                <div class="col-xs-4"></div>

            </div>
        </div>
        <footer>
            <div class="footer-top"></div>
            <div class="footer-content">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-1"></div>
                        <div class="col-xs-10">
                            <h4 align="center">Chosensan &copy; 2014</h4>	
                        </div>
                        <div class="col-xs-1"></div>
                    </div>
                </div>
            </div>
        </footer>
        <script src="bootstrap/js/bootstrap.js"></script>
        <script>
            $(document).ready(function() {
                $('.carousel').carousel();
            });
        </script>

    </body>
</html>