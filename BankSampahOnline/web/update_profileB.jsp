<%-- 
    Document   : register
    Created on : Apr 16, 2014, 9:05:25 AM
    Author     : Verdiyanto Saputra
--%>

<%@page import="banksampahonline.util.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Profile</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />

        <script src="others/jquery.js"></script>
        <script src="others/jquery.address.js"></script>

        <link rel="stylesheet" type="text/css" href="semantic-ui/css/semantic.css">
        <script src="semantic-ui/javascript/semantic.js"></script>
        <link rel="stylesheet" type="text/css" href="others/feed.css">
        <script src="others/feed.js"></script>
    </head>
    <body background="assets/images/wood013.jpg">
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
                            <a href="RiwayatB.jsp">Riwayat</a>
                        </li>
                        <li>
                            <a href="PesanKeAdminB.jsp">Kirim Pesan ke Admin</a>
                        </li>
                        <li>
                            <a href="PenjemputanSampahB.jsp">Penjemputan Sampah</a>
                        </li>
                        <li class="active">
                            <a>Memperbarui Profil</a>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-9">
                    <div class="well well-lg">
                        <h1 align="center">Update Profile</h1>
                    </div>
                    <div class="well well-lg">
                        <form role="form">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <label for="exampleInputEmail1">Username:</label>
                                        <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter email" value="otong123">
                                    </div>
                                    <div class="col-xs-2"></div>
                                    <div class="col-xs-5">
                                        <label for="exampleInputEmail1">First Name:</label>
                                        <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter username" value="otong">
                                    </div>
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <label for="exampleInputPassword1">Old Password:</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter old password">
                                    </div>
                                    <div class="col-xs-2"></div>
                                    <div class="col-xs-5">
                                        <label for="exampleInputEmail1">Last Name:</label>
                                        <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter last name" value="marutong">
                                    </div>
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <label for="exampleInputPassword1">New Password:</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter new password">
                                    </div>
                                    <div class="col-xs-2"></div>
                                    <div class="col-xs-5">
                                        <label for="exampleInputEmail1">Alamat:</label>
                                        <textarea rows="3" class="form-control" id="exampleInputEmail1" placeholder="Enter address">Jalan Salak No. 13</textarea>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-xs-5">
                                    <label for="exampleInputPassword1">Confirm New Password:</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Confirm new password">
                                </div>
                                <div class="col-xs-2"></div>
                                <div class="col-xs-5">
                                    <label for="exampleInputPassword1">Nomor Handphone:</label>
                                    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Enter handphone number" value="08561234567">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-5"></div>
                                <div class="col-xs-2"></div>
                                <div class="col-xs-5">
                                    <label for="exampleInputPassword1">Alamat email:</label>
                                    <input type="email" class="form-control" id="exampleInputPassword1" placeholder="Enter email address" value="otong@otong.com">
                                </div>
                            </div>
                            <br/>
                            <div class="row">
                                <div style="text-align:center">
                                    <button type="submit" class="btn btn-default">Update Profile</button>
                                </div>
                            </div>

                        </form>

                    </div>
                </div>
            </div>                
        </div>
    </div>
</body>
</html>
