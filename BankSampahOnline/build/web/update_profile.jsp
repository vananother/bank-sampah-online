<%-- 
    Document   : register
    Created on : Apr 16, 2014, 9:05:25 AM
    Author     : Verdiyanto Saputra
--%>

<%@page import="banksampahonline.database.BankSampahOnlineDB"%>
<%@page import="banksampahonline.util.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Profile</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <script src="others/updateProfileFunctions.js"></script>
    </head>
    <body>
        <%
            Account account = (Account) session.getAttribute("account");
            BankSampahOnlineDB db = new BankSampahOnlineDB();
            int unread = 0;
            if (account == null) {
                response.sendRedirect("Login");
            } else {
                if (account.getRole().equals("superadmin")) {
                    response.sendRedirect("Login");
                    return;
                }
                unread = db.getUnreadMessagesCount(account.getUsername());
            }
        %>
        <nav class="navbar navbar-inverse" role="navigation">
            <div class="container">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="Login.jsp?logout=1" style="color: red; font-weight: bold">Keluar</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-left">
                    <li><a href="update_profile.jsp" style="color: #6ECFF5"><b><%= account == null ? "" : account.getFirstname() + " " + account.getLastname()%></b></a></li>
                    <li><a style="color: #6ECFF5"><b>Uang virtual anda saat ini: <%= account == null ? "" : account.getUangvirtual()%></b></a></li>
                </ul>
            </div>                
        </nav>

        <div class="container">
            <div class="row">
                <div class="col-xs-3">
                    <ul class="nav nav-pills nav-stacked">
                        <li>
                            <a href="Riwayat.jsp">Riwayat</a>
                        </li>
                        <li>
                            <%
                                if (unread == 0) {
                                    out.print("<a href=\"PesanKeAdmin.jsp\">Kirim Pesan ke Admin</a>");
                                } else {
                                    out.print("<a href=\"PesanKeAdmin.jsp\">Kirim Pesan ke Admin: ");
                                    out.print(unread);
                                    out.print(" <span class=\"glyphicon glyphicon-envelope\"></span></a>");
                                }
                            %>  
                        </li>
                        <li>
                            <a href="PenjemputanSampah.jsp">Penjemputan Sampah</a>
                        </li>
                        <li class="active">
                            <a>Memperbarui Profil</a>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-9">
                    <div class="well well-lg">
                        <h1 align="center">Ubah Profile</h1>
                        <div style="text-align: center">
                            ${errorMessage}
                        </div>
                    </div>
                    <div class="well well-lg">
                        <form role="form" action="Update_profile" method="post">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <label>Username:</label>
                                        <input class="form-control" disabled="disabled" value="<%= account == null ? "" : account.getUsername()%>">
                                    </div>
                                    <div class="col-xs-2"></div>
                                    <div class="col-xs-5">
                                        <label for="exampleInputEmail1">Nama Depan:</label>
                                        <input name="fname" type="text" class="form-control" id="exampleInputEmail1" placeholder="Ubah Nama Depan" value="<%= account == null ? "" : account.getFirstname()%>">
                                    </div>
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <label for="oldPassword">Password Lama:</label>
                                        <input name="oldPassword" type="password" class="form-control" id="oldPassword" placeholder="Masukkan Password">
                                    </div>
                                    <div class="col-xs-2"></div>
                                    <div class="col-xs-5">
                                        <label for="namaBelakang">Nama Belakang:</label>
                                        <input name="lname" type="text" class="form-control" id="namaBelakang" placeholder="Ubah Nama Belakang" value="<%= account == null ? "" : account.getLastname()%>">
                                    </div>
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <label for="newPassword1">Password Baru:</label>
                                        <input name="newPassword1" type="password" class="form-control" id="newPassword1" placeholder="Masukkan Password Baru" oninput="passwordValidation(this)">
                                    </div>
                                    <div class="col-xs-2"></div>
                                    <div class="col-xs-5">
                                        <label for="address">Alamat:</label>
                                        <textarea name="address" rows="3" class="form-control" id="address" placeholder="Ubah Alamat"><%= account == null ? "" : account.getAlamat()%></textarea>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-xs-5">
                                    <label for="exampleInputPassword1">Konfirmasi Password Baru:</label>
                                    <input name="newPassword2" type="password" class="form-control" id="exampleInputPassword1" placeholder="Confirm new password" oninput="confirmPassword(this)">
                                </div>
                                <div class="col-xs-2"></div>
                                <div class="col-xs-5">
                                    <label for="phone">Nomor Handphone:</label>
                                    <input name="phone" type="number" class="form-control" id="phone" placeholder="Ubah Nomor Telepon" value="<%= account == null ? "" : account.getPhone()%>">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-5"></div>
                                <div class="col-xs-2"></div>
                                <div class="col-xs-5">
                                    <label for="exampleInputPassword1">Alamat email:</label>
                                    <input disabled="disabled" class="form-control" value="<%= account == null ? "" : account.getEmail()%>">
                                </div>
                            </div>
                            <br/>
                            <div class="row">
                                <div style="text-align:center">
                                    <button type="submit" class="btn btn-default">Update Profile</button>
                                    <a href="Riwayat.jsp">
                                        <button type="button" class="btn btn-warning">Kembali</button>
                                    </a>
                                </div>
                                <small>*Kosongkan atau biarkan input jika tidak ingin mengubah informasi</small>
                            </div>

                        </form>

                    </div>
                </div>
            </div>                
        </div>
    </body>
</html>