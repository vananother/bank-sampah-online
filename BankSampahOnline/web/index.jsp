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
        <title>Welcome to Bank Sampah Online TesVerdiGithub</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    </head>
    <body background="assets/images/wood013.jpg">
        <%
            BankSampahOnlineDB db = new BankSampahOnlineDB();
            boolean addAccount = false;
            boolean regFail = false;
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

                boolean regSuccess = db.addAccount(username, encPass);
                if (regSuccess) {
                    int id = db.getAccountID(username);
                    regFail = db.addPengguna(id, username, firstname, lastname, email, address, phone);
                } else {
                    regFail = false;
                }
            }
            if (session.getAttribute("account") != null) {
                response.sendRedirect("Riwayat.jsp");
            }

        %>

        <%
        %>
        <div class="container">
            <div class="row">
                <div class="xs-12">
                    <div class="jumbotron">
                        <h1 align="center">Welcome to Bank Sampah Online!!!</h1>
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
                        <label>Logout Success</label>
                        <%
                        } else if (request.getParameter("loginFail") != null) {
                        %>
                        <label>Login Fail, Wrong Username or Password</label>   
                        <%
                        } else if (addAccount) {
                            if (regFail) {
                        %> 
                        <label>Registration Failed, Check Your Input</label> 
                        <%
                            } else {
                        %> 
                        <label>Registration Success</label> 
                        <%
                            }
                        }
                        %>
                        <form role="form" method="post" action="Riwayat.jsp">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Username:</label>
                                <input name="username" type="username" class="form-control" id="exampleInputEmail1" placeholder="Enter username">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password:</label>
                                <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                            </div>
                            <div style="text-align:center">
                                <button type="submit" class="btn btn-default">Login</button>
                            </div>
                            <a href="register.jsp"><button type="button" class="btn btn-success">Register new account</button></a><br/>
                            <button type="button" class="btn btn-danger">Forget Password</button>
                            

                        </form>
                    </div>
                </div>
                <div class="col-xs-3"></div>
            </div>
        </div>
    </body>
</html>
