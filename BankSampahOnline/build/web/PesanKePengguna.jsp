<%-- 
    Document   : index
    Created on : Apr 14, 2014, 12:16:09 PM
    Author     : van
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="banksampahonline.util.Pesan"%>
<%@page import="banksampahonline.database.BankSampahOnlineDB"%>
<%@page import="banksampahonline.util.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="others/style.css" />
        <script type="text/javascript" src="others/jquery.min.js"></script>
        <script src="others/jquery.autocomplete.js"></script>
        <script>
            jQuery(function() {
                $("#penerima").autocomplete("list.jsp");
            });
        </script>
    </script>
    <title>Dashboard</title>
</head>
<body>
    <%
        Account account = (Account) session.getAttribute("account");
        BankSampahOnlineDB db = new BankSampahOnlineDB();
        ArrayList<Pesan> messages = new ArrayList<Pesan>();
        int unread = 0;
        if (account == null) {
            response.sendRedirect("index.jsp");
        } else {
            if (account.getRole().equals("pengguna")) {
                response.sendRedirect("Login");
            }
            unread = db.getUnreadMessagesCount(account.getUsername());
            db.readMessages(account.getUsername());
//            out.print("Account Info: <BR>");
//            out.print("ID: " + account.getId() + "<BR>");
//            out.print("Role: " + account.getRole() + "<BR>");
//            out.print("Username: " + account.getUsername() + "<BR>");
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
                    <li class="active">
                        <%
                            if (unread == 0) {
                                out.print("<a>Kirim Pesan ke Pengguna</a>");
                            } else {
                                out.print("<a>Kirim Pesan ke Pengguna: ");
                                out.print(unread);
                                out.print(" <span class=\"glyphicon glyphicon-envelope\"></span></a>");
                            }
                        %>
                    </li>
                    <li>
                        <a href="Pendataan.jsp">Pendataan Sampah</a>
                    </li>
                    <li>
                        <a href="DaftarPenjemputan.jsp">Daftar Penjemputan</a>
                    </li>
                </ul>
            </div>

            <div class="col-xs-9">
                <h1 style="text-align:center">Kirim Pesan ke Pengguna</h1>
                <div style="text-align: center">
                    ${errorMessage}
                </div>
                <form role="form" action="Pesan" method="post">
                    <div class="form-group">
                        <label for="">Cari Pengguna:</label>
                        <input name="penerima" id="penerima" type="text" class="form-control" placeholder="Username Pengguna" required="required">
                    </div>

                    <div class="form-group">
                        <label for="">Subjek:</label>
                        <input name="subjek" type="text" class="form-control" placeholder="Subjek" required="required">
                    </div>

                    <div class="form-group">
                        <label for="">Pesan:</label>
                        <textarea name="isi" class="form-control" rows="3"></textarea>
                    </div>

                    <button type="submit" class="btn btn-primary">Kirim Pesan</button>
                </form>

                <br>
                <br>
                <h1>Pesan</h1>
                <br>
                <%
                    //messages = db.getMessages(id_pengirim, id_penerima)
                    messages = db.getAccountMessages(account.getUsername());
//                    out.println(messages.size());
//                    out.println(db.failBecause);
                    for (Pesan temp : messages) {
                        if (temp.getId_pengirim().equals(account.getUsername())) {

                %>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <b><%=account.getUsername()%></b>
                        ke
                        <b><%=temp.getId_penerima()%></b>
                        pada
                        <%= temp.getTanggal() + " pukul " + temp.getJam()%>
                    </div>
                    <div class="panel-body" style="background-color: #909EFA">
                        <h4><%= temp.getSubjek()%></h4>
                        <%= temp.getIsi()%>
                    </div>
                </div>
                <%                    } else {

                %>
                <div class="panel panel-success">
                    <div class="panel-heading"  style="background-color: #4cae4c; color: #ffffff">

                        <b><%=temp.getId_pengirim()%></b>
                        ke
                        <b><%=account.getUsername()%></b>
                        pada
                        <%= temp.getTanggal() + " pukul " + temp.getJam()%>

                    </div>
                    <div class="panel-body"  style="background-color: #73E064">
                        <h4><%= temp.getSubjek()%></h4>
                        <%= temp.getIsi()%>
                    </div>
                </div>
                <%                                    }
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>
