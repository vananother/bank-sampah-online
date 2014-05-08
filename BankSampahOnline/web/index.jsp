<%-- 
    Document   : index
    Created on : Apr 16, 2014, 8:16:08 AM
    Author     : Verdiyanto Saputra
--%>

<%@page import="banksampahonline.database.BankSampahOnlineDB"%>
<%@page import="banksampahonline.util.UtilMethods"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Selamat Datang di Bank Sampah Online</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    </head>
    <body background="assets/images/wood013.jpg">
        <%
            BankSampahOnlineDB db = new BankSampahOnlineDB();
            boolean addAccount = false;
            boolean regSuccess = false;
            int errCode = 0;
            //String t = request.getAttribute("textValue").toString();
            String errMsg = "Registrasi Gagal";
            //handle session already exist
            if (request.getParameter("logout") != null) {
                session.setAttribute("account", null);
            }

            if (request.getParameter("register") != null) {
                addAccount = true;
                session.setAttribute("account", null);
                String username = request.getParameter("regusername");
                String password = request.getParameter("regpassword");
                String password2 = request.getParameter("regpassword2");
                String firstname = request.getParameter("regfirstname");
                String lastname = request.getParameter("reglastname");
                String email = request.getParameter("regemail");
                String address = request.getParameter("regalamat");
                String phone = request.getParameter("regphone");
                String encPass = UtilMethods.hashInput(password);

                out.print("username: " + username + " <br>");
                out.print("password: " + password + " <br>");
                out.print("password2: " + password2 + " <br>");
                out.print("enc password: " + encPass + " <br>");
                out.print("firstname: " + firstname + " <br>");
                out.print("lastname: " + lastname + " <br>");
                out.print("email: " + email + " <br>");
                out.print("address: " + address + " <br>");
                out.print("phone: " + phone + " <br>");

                errCode = UtilMethods.registrationFormValidation(username, password, password2, firstname, lastname, email, address, phone);
                switch (errCode) {
                    case 0:
                        regSuccess = db.addAccount(username, encPass, firstname, lastname, email, address, phone);
                        break;
                    case 1:
                        errMsg = "Username harus 4-32 karakter atau lebih.";
                        break;
                    case 2:
                        errMsg = "Password harus 6 karakter atau lebih.";
                        break;
                    case 3:
                        errMsg = "Konfirmasi Password tidak sesuai.";
                        break;
                    case 4:
                        errMsg = "Nama Depan tidak boleh kosong.";
                        break;
                    case 5:
                        errMsg = "Nama belakang tidak boleh kosong.";
                        break;
                    case 6:
                        errMsg = "Email tidak boleh kosong.";
                        break;
                    case 7:
                        errMsg = "Alamat tidak boleh kosong.";
                        break;
                    case 8:
                        errMsg = "Masukkan nomor telepon yang dapat dihubungi.";
                        break;
                    case 9:
                        errMsg = "Username harus Alphanumeric.";
                        break;
                }
            }

            if (session.getAttribute("account") != null) {
                response.sendRedirect("Riwayat.jsp");
            }

        %>

        <div class="container">
            <div class="row">
                <div class="xs-12">
                    <div class="jumbotron">
                        <h1 align="center">Selamat Datang di Bank Sampah Online!!!</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-3"></div>
                <div class="col-xs-6">
                    <div class="jumbotron">
                        <%                            //handle logout
                            if (request.getParameter("logout") != null) {
                        %>
                        <div style="text-align: center">
                            <label class="label label-success">Logout Sukses</label>
                        </div>
                        <%
                        } else if (request.getParameter("loginFail") != null) {
                        %>
                        <div style="text-align: center">
                            <label class="label label-danger">Login Gagal, Salah Username atau Password</label>   
                        </div>
                        <%
                        } else if (addAccount) {
                            if (regSuccess) {
                        %>
                        <div style="text-align: center">
                            <label class="label label-success">Registrasi Sukses</label>
                        </div>
                        <%
                        } else {
                        %> 
                        <div style="text-align: center">
                            <label class="label label-danger"><%= errMsg%></label>
                        </div>
                        <%
                                }
                            }
                        %>
                        <script>
                            function validLogin() {
                                if (document.loginForm.username.value == "") {
                                    alert("Username tidak boleh kosong."); //java script message will be display
                                    document.loginform.userName.focus();
                                    return false;
                                }

                                if (document.loginForm.password.value == "") {
                                    alert("Password tidak boleh kosong."); //java script message will be display
                                    document.loginform.password.focus();
                                    return false;
                                }
                                return true;
                            }
                        </script>
                        <% 
                            if(request.getAttribute("textValue") != null){
                                out.print(request.getAttribute("textValue").toString());
                            } else {
                                out.print("ini null");
                            }
                             
                        %>
                        <form name="loginForm" action="LoginServlet"  method="post" >
                            <input type="text" name="done" value='${textValue}'/> 
                            
                            <div class="form-group">
                                <label for="exampleInputEmail1">Username:</label>
                                <input required name="username" type="username" class="form-control" id="exampleInputEmail1" placeholder="Masukkan username anda">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password:</label>
                                <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Masukkan password">
                            </div>
                            <div style="text-align:center">
                                <button type="submit" class="btn btn-primary">Login</button>
                            </div>
                            <a href="register.jsp"><button type="button" class="btn btn-success" value="submit">Registrasi</button></a><br/>
                            <!--button type="button" class="btn btn-danger">Forget Password</button-->
                        </form>
                    </div>
                </div>
                <div class="col-xs-3"></div>
            </div>
        </div>
    </body>
</html>
