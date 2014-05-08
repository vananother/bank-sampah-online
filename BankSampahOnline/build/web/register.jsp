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
                        <script>
                            function registerValidation() {
                                if (document.registerform.regusername.value == "") {
                                    alert("Please enter username."); //java script message will be display
                                    document.registerform.regusername.focus();
                                    return false;
                                }
                                if (document.registerform.regfirstname.value == "") {
                                    alert("Please enter First Name."); //java script message will be display
                                    document.registerform.regfirstname.focus();
                                    return false;
                                }
                                if (document.registerform.regpassword.value == "") {
                                    alert("Please enter Password."); //java script message will be display
                                    document.registerform.regpassword.focus();
                                    return false;
                                }
                                if (document.registerform.regpassword2.value != document.registerform.regpassword.value) {
                                    alert("Password doesn't match."); //java script message will be display
                                    document.registerform.regpassword2.focus();
                                    return false;
                                }
                                if (document.registerform.reglastname.value == "") {
                                    alert("Please enter Last Name."); //java script message will be display
                                    document.registerform.reglastname.focus();
                                    return false;
                                }
                                if (document.registerform.regalamat.value == "") {
                                    alert("Please enter Address."); //java script message will be display
                                    document.registerform.regalamat.focus();
                                    return false;
                                }
                                if (document.registerform.regphone.value == "") {
                                    alert("Please enter Phone Number."); //java script message will be display
                                    document.registerform.regphone.focus();
                                    return false;
                                }
                                if (document.registerform.regemail.value == "") {
                                    alert("Please enter Email."); //java script message will be display
                                    document.registerform.regemail.focus();
                                    return false;
                                }
                                return true
                            }
                        </script>
                        <form name="registerform" role="form" method="post" action="index.jsp" onsubmit="return registerValidation()">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <label for="exampleInputEmail1">Username:</label>
                                        <input name="regusername" type="text" class="form-control" id="exampleInputEmail1" placeholder="Masukkan username">
                                    </div>
                                    <div class="col-xs-2"></div>
                                    <div class="col-xs-5">
                                        <label for="exampleInputEmail1">Nama Depan:</label>
                                        <input name="regfirstname" type="text" class="form-control" id="exampleInputEmail1" placeholder="Masukkan nama depan">
                                    </div>
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <label for="exampleInputPassword1">Password:</label>
                                        <input name="regpassword" type="password" class="form-control" id="exampleInputPassword1" placeholder="Masukkan Password">
                                    </div>
                                    <div class="col-xs-2"></div>
                                    <div class="col-xs-5">
                                        <label for="exampleInputEmail1">Nama Belakang:</label>
                                        <input name="reglastname" type="text" class="form-control" id="exampleInputEmail1" placeholder="Masukkan nama belakang">
                                    </div>
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-xs-5">
                                        <label for="exampleInputPassword1">Konfirmasi Password:</label>
                                        <input name="regpassword2" type="password" class="form-control" id="exampleInputPassword1" placeholder="Ulangi Password">
                                    </div>
                                    <div class="col-xs-2"></div>
                                    <div class="col-xs-5">
                                        <label for="exampleInputEmail1">Alamat:</label>
                                        <textarea name="regalamat" rows="3" class="form-control" id="exampleInputEmail1" placeholder="Masukkan Alamat" ></textarea>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-xs-5"></div>
                                <div class="col-xs-2"></div>
                                <div class="col-xs-5">
                                    <label for="exampleInputPassword1">Nomor Handphone:</label>
                                    <input name="regphone" type="number" class="form-control" id="exampleInputPassword1" placeholder="Masukkan Nomor Telepon">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-5"></div>
                                <div class="col-xs-2"></div>
                                <div class="col-xs-5">
                                    <label for="exampleInputEmail">Alamat Email:</label>
                                    <input name="regemail" type="email" class="form-control" id="exampleInputPassword1" placeholder="Masukkan Alamat Email">
                                </div>
                            </div>
                            <br/>
                            <div class="row">
                                <div style="text-align:center">
                                    <button name="register" value="register" type="submit" class="btn btn-primary">Buat Akun Baru</button>
                                    <a href="index.jsp"><div class="btn btn-default">Kembali</div></a>
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
