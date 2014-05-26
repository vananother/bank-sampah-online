<%-- 
    Document   : index
    Created on : Apr 14, 2014, 12:16:09 PM
    Author     : van
--%>

<%@page import="banksampahonline.util.Pesan"%>
<%@page errorPage="Error.jsp" %>
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
                response.sendRedirect("Login.jsp");
            } else {
                if(account.getRole().equals("superadmin")){
                    response.sendRedirect("Login");
                    return;
                }
                unread = db.getUnreadMessagesCount(account.getUsername());
                db.readMessages(account.getUsername());
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
                            <a href="PenjemputanSampah.jsp">Penjemputan Sampah</a>
                        </li>
                        <li>
                            <a href="update_profile.jsp">Memperbarui Profil</a>
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
                            <input name="subjek" value="${subjek}" type="text" class="form-control" placeholder="Subjek" required="required">
                        </div>

                        <div class="form-group">
                            <label for="">Pesan:</label>
                            <textarea name="isi" value="${isi}" class="form-control" rows="3" required="required"></textarea>
                        </div>

                        <button type="submit" class="btn btn-primary">Kirim Pesan</button>
                    </form>

                    <br>
                    <hr style="height: 3px;color:#333 ">
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
                </div>
                <hr>
            </div>
        </div>
    </body>
</html>
