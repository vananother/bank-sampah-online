<%-- 
    Document   : index
    Created on : Apr 16, 2014, 8:16:08 AM
    Author     : Verdiyanto Saputra
--%>
<%@page errorPage="Error.jsp" %>
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
                        <div style="text-align: center">
                            ${errorMessage}
                        </div>


                        <%                            //handle logout
                            if (request.getParameter("logout") != null) {
                                session.setAttribute("account", null);
                        %>
                        <div style="text-align: center">
                            <label class="label label-success">Logout Sukses</label>
                        </div>
                        <%
                            }
                            if (session.getAttribute("account") != null) {
                                response.sendRedirect("Riwayat.jsp");
                            }
                        %>
                        <form name="loginForm" action="Login"  method="post" >
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
