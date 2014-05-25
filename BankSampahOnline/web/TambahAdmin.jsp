<%-- 
    Document   : AddAdmin
    Created on : May 25, 2014, 12:34:35 PM
    Author     : van
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="banksampahonline.database.BankSampahOnlineDB"%>
<%@page import="banksampahonline.util.Sampah"%>
<%@page import="banksampahonline.util.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <title>Tambah Admin</title>
    </head>
    <body>
        <% //debugging
            Account account = (Account) session.getAttribute("account");
            ArrayList<Sampah> sesampahan = new ArrayList<Sampah>();
            BankSampahOnlineDB bdb = new BankSampahOnlineDB();
//            int unread = 0;
            if (account == null) {
                response.sendRedirect("Login");
            } else {
                if (!account.getRole().equals("superadmin")) {
                    response.sendRedirect("Login");
                }
                //unread = bdb.getUnreadMessagesCount(account.getUsername());
//                sesampahan = bdb.getSampah(account.getUsername());
            }
            out.print(bdb.failBecause);
        %>

        <nav class="navbar navbar-inverse" role="navigation">
            <div class="container">
                <ul class="nav navbar-nav navbar-right">                    
                    <li>
                        <a href="Login.jsp?logout=1" style="color: red; font-weight: bold">
                            Keluar
                        </a>
                    </li>
                </ul>

            </div>                
        </nav>

        <div class="container">
            <div class="row">
                <div class="col-xs-3">
                    <ul class="nav nav-pills nav-stacked">
                        <li class="active">
                            <a>Tambah Admin</a>
                        </li>
                        <li>
                            <a href="HapusAdmin.jsp">Hapus Admin</a>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-9">
                    <h1>Tambah Admin</h1>
                    
                    <div style="text-align: center">
                        ${errorMessage}
                    </div>
                    
                    <form role="form" action="TambahAdmin" method="post">
                        <div class="form-group">
                            <label for="">Username Admin baru:</label>
                            <input name="username" type="text" class="form-control" placeholder="Username" required="required">
                        </div>
                        <div class="form-group">
                            <label for="">Password:</label>
                            <input name="password1" type="password" class="form-control" placeholder="Password" required="required">
                        </div>
                        <div class="form-group">
                            <label for="">Konfirmasi Password:</label>
                            <input name="password2" type="password" class="form-control" placeholder="Konfirmasi Password" required="required">
                        </div>
                        <button class="btn btn-primary" type="submit">
                            Tambah Admin
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
