<%-- 
    Document   : register
    Created on : Apr 16, 2014, 9:05:25 AM
    Author     : Verdiyanto Saputra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrasi Akun Baru</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <script src="others/registerFunctions.js"></script>
    </head>
    <body background="assets/images/wood013.jpg">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="well well-lg">
                        <h1 align="center">Registrasi Akun Baru</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="well well-lg">                        
                        <form name="registerform" role="form" method="post" action="Register">
                            <div class="form-group">
                                <div class="row">
                                    <div style="text-align: center">
                                        ${errorMessage}
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-5">
                                        <label for="exampleInputEmail1">Username:</label>
                                        <input maxlength="32" required="required" name="regusername" type="text" class="form-control" id="exampleInputEmail1" placeholder="Masukkan username" oninput="usernameValidation(this)">
                                    </div>
                                    <div class="col-xs-2"></div>
                                    <div class="col-xs-5">
                                        <label for="exampleInputEmail1">Nama Depan:</label>
                                        <input name="regfirstname" type="text" class="form-control" id="exampleInputEmail1" placeholder="Masukkan nama depan" required="required" oninput="normalInputValidation(this)">
                                    </div>
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <label for="exampleInputPassword1">Password:</label>
                                        <input name="regpassword" type="password" id="password" class="form-control" id="exampleInputPassword1" placeholder="Masukkan Password" required="required" oninput="passwordValidation(this)">
                                    </div>
                                    <div class="col-xs-2"></div>
                                    <div class="col-xs-5">
                                        <label for="exampleInputEmail1">Nama Belakang:</label>
                                        <input name="reglastname" type="text" class="form-control" id="exampleInputEmail1" placeholder="Masukkan nama belakang" required="required" oninput="normalInputValidation(this)">
                                    </div>
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <label for="exampleInputPassword1">Konfirmasi Password:</label>
                                        <input name="regpassword2" type="password" class="form-control" id="exampleInputPassword1" placeholder="Ulangi Password" required="required" oninput="confirmPassword(this)">
                                    </div>
                                    <div class="col-xs-2"></div>
                                    <div class="col-xs-5">
                                        <label for="exampleInputEmail1">Alamat:</label>
                                        <textarea name="regalamat" rows="3" class="form-control" id="exampleInputEmail1" placeholder="Masukkan Alamat" required="required" oninput="normalInputValidation(this)"></textarea>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-xs-5"></div>
                                <div class="col-xs-2"></div>
                                <div class="col-xs-5">
                                    <label for="exampleInputPassword1">Nomor Handphone:</label>
                                    <input name="regphone" type="text" class="form-control" id="exampleInputPassword1" placeholder="Masukkan Nomor Telepon" required='required' oninput="phoneValidation(this)">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-5"></div>
                                <div class="col-xs-2"></div>
                                <div class="col-xs-5">
                                    <label for="exampleInputEmail">Alamat Email:</label>
                                    <input name="regemail" type="email" class="form-control" id="exampleInputPassword1" placeholder="Masukkan Alamat Email" required='required' oninput="normalInputValidation(this)">
                                </div>
                            </div>
                            <br/>
                            <div class="row">
                                <div style="text-align:center">
                                    <button name="register" type="submit" onclick="submitForm()" class="btn btn-primary">Buat Akun Baru</button>
                                    <a href="Login.jsp"><div class="btn btn-default">Kembali</div></a>
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
