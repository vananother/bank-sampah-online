<%-- 
    Document   : index
    Created on : Apr 14, 2014, 12:16:09 PM
    Author     : van
--%>

<%@page import="banksampahonline.util.Pesan"%>
<%@page import="java.util.ArrayList"%>
<%@page import="banksampahonline.database.BankSampahOnlineDB"%>
<%@page import="banksampahonline.util.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />


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
                unread = db.getUnreadMessagesCount(account.getUsername());
                db.readMessages(account.getUsername());
//                out.print("Account Info: <BR>");
//                out.print("ID: " + account.getId() + "<BR>");
//                out.print("Role: " + account.getRole() + "<BR>");
//                out.print("Username: " + account.getUsername() + "<BR>");
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
                        <li class="active">
                            <%
                                if(unread == 0){
                                    out.print("<a>Kirim Pesan ke Admin</a>");
                                } else {
                                    out.print("<a>Kirim Pesan ke Admin: ");
                                    out.print(unread);
                                    out.print(" <span class=\"glyphicon glyphicon-envelope\"></span></a>");
                                }
                            %>                            
                        </li>
                        <li>
                            <a href="PenjemputanSampahB.jsp">Penjemputan Sampah</a>
                        </li>
                        <li>
                            <a href="update_profileB.jsp">Memperbarui Profil</a>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-9">
                    <h1 style="text-align:center">Kirim Pesan ke Admin</h1>
                    <form role="form" action="Pesan" method="post">
                        <div class="form-group">
                            <label for="">Pilih Admin:</label>
                            <select name="penerima" class="form-control">
                                <%
                                    ArrayList<String> admins = db.getAdmins();
                                    for (String admin : admins) {
                                        out.println("<option>" + admin + "</option>");
                                    }
                                %>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="">Subjek:</label>
                            <input name="subjek" type="text" class="form-control" placeholder="Subjek" required="required">
                        </div>

                        <div class="form-group">
                            <label for="">Pesan:</label>
                            <textarea name="isi" class="form-control" rows="3" required="required"></textarea>
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
                        //out.println(messages.size());
                        //out.println(db.failBecause);
                        for (Pesan temp : messages) {
                            if (temp.getId_pengirim().equals(account.getUsername())) {

                    %>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <b><%=account.getUsername()%></b>
                            to
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
                            to
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
                    <!--div class="panel panel-primary">
                        <div class="panel-heading">Pengguna 1 (05/17/2014)</div>
                        <div class="panel-body">
                            <h4>Meminta Penjemputan</h4>
                            Mas, tolong cek penjemputan sampah dong, saya baru submit tuh...
                        </div>
                    </div>

                    <div class="panel panel-danger">
                        <div class="panel-heading">Admin 1 (05/17/2014)</div>
                        <div class="panel-body">
                            <h4>RE: Meminta Penjemputan</h4>
                            Okay, nanti saya kesana!
                        </div>
                    </div>

                    <div class="panel panel-primary">
                        <div class="panel-heading">Pengguna 1 (05/17/2014)</div>
                        <div class="panel-body">
                            <h4>Tanpa Subjek</h4>
                            k
                        </div>
                    </div-->
                </div>
            </div>
        </div>
    </body>
</html>
