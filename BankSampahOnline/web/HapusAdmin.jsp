<%-- 
    Document   : DeleteAdmin
    Created on : May 25, 2014, 12:34:47 PM
    Author     : van
--%>
<%@page errorPage="Error.jsp" %>
<%@page import="banksampahonline.util.Sampah"%>
<%@page import="banksampahonline.database.BankSampahOnlineDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="banksampahonline.util.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <title>Hapus Admin</title>
    </head>
    <body>
        <% //debugging
            Account account = (Account) session.getAttribute("account");
            ArrayList<Sampah> sesampahan = new ArrayList<Sampah>();
            BankSampahOnlineDB db = new BankSampahOnlineDB();
//            int unread = 0;
            if (account == null) {
                response.sendRedirect("Login");
            } else {
                if(!account.getRole().equals("superadmin")){
                    response.sendRedirect("Login");
                }
                //unread = bdb.getUnreadMessagesCount(account.getUsername());
//                sesampahan = bdb.getSampah(account.getUsername());
            }
//            out.print(bdb.failBecause);
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
                        <li>
                            <a href="TambahAdmin.jsp">Tambah Admin</a>
                        </li>
                        <li class="active">
                            <a>Hapus Admin</a>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-9">
                    <h1>Hapus Admin</h1>
                    
                    <div style="text-align: center">
                        ${errorMessage}
                    </div>
                    
                    <form role="form" action="HapusAdmin" method="post">
                        <div class="form-group">
                            <label for="">Pilih Admin:</label>
                            <select name="target" class="form-control">
                                <%
                                    ArrayList<String> admins = db.getAdmins();
                                    for (String admin : admins) {
                                        out.println("<option>" + admin + "</option>");
                                    }
                                %>
                            </select>
                            <br>
                            <button type="submit" class="btn btn-danger" onclick="return confirm('Anda yakin ingin menghapus admin ini?')">
                                Hapus
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
