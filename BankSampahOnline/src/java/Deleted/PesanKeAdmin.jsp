<%-- 
    Document   : index
    Created on : Apr 14, 2014, 12:16:09 PM
    Author     : van
--%>

<%@page import="banksampahonline.util.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src="others/jquery.js"></script>
        <script src="others/jquery.address.js"></script>

        <link rel="stylesheet" type="text/css" href="semantic-ui/css/semantic.css">
        <script src="semantic-ui/javascript/semantic.js"></script>
        <link rel="stylesheet" type="text/css" href="others/feed.css">
        <script src="others/feed.js"></script>

        <title>Dashboard</title>
    </head>
    <body id="feed">
        <%
            Account account = (Account) session.getAttribute("account");
            if (account == null) {
                response.sendRedirect("index.jsp");
            } else {
                out.print("Account Info: <BR>");
                out.print("ID: "+account.getId()+"<BR>");
                out.print("Role: "+account.getRole()+"<BR>");
                out.print("Username: "+account.getUsername()+"<BR>");             
            }
        %>
        <div class="ui green inverted menu">
            <div class="ui black launch button">
                <i class="list layout icon"></i>
            </div>
            <!--
            <a class="active item">
                <i class="home icon"></i> Home
            </a>
            <a class="item">
                <i class="mail icon"></i> Messages
            </a>
            <a class="item">
                <i class="user icon"></i> Friends
            </a>
            -->
            <div class="right menu">
                <a class="item" href="index.jsp">Keluar</a>
            </div>
        </div>
        <div class="ui large inverted vertical sidebar menu">
            <a class="item" href="Riwayat.jsp">
                Riwayat <span class="ui label">n</span>
            </a>
            <a class="item" href="KirimUangVirtual.jsp">
                Kirim Uang Virtual <span class="ui label">n</span>
            </a>
            <a class="active item">
                Kirim Pesan ke Admin <span class="ui label">n</span>
            </a>
            <a class="item" href="PenjemputanSampah.jsp">
                Penjemputan Sampah <span class="ui label">n</span>
            </a>
            <a class="item" href="update_profile.jsp">
                Memperbarui Profil <span class="ui label">n</span>
            </a>
        </div>

        <div class="ui celled grid">


            <div class="five wide middle column">
                <div class="ui divider"></div>
                <h2 class="ui header">
                    <i class="inbox icon"></i>
                    Daftar Admin
                </h2>

                <div class="peek">
                    <div class="ui vertical pointing secondary menu">
                        <a class="active item">Admin 1</a>
                        <a class="item">Admin 2</a>
                        <a class="item">Admin 3</a>
                        <a class="item">Admin 4</a>
                    </div>
                </div>
            </div>

            <div class="ten wide right column">
                <h1 class="ui header">Kirim Pesan ke Admin</h1>
                <div class="ui divider"></div>
                <div class="ui form">
                    <div class="ui one column grid">
                        <div class="row">
                            <div class="column">
                                <div class="ui segment">
                                    <div class="ui top attached label">Pilih Admin</div>
                                    <div class="ui fluid dropdown">
                                        <div class="text">Daftar Admin</div>
                                        <i class="dropdown icon"></i>
                                        <div class="menu">
                                            <div class="item">Admin 1</div>
                                            <div class="item">Admin 2</div>
                                            <div class="item">Admin 3</div>
                                            <div class="item">Admin 4</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="column">
                                <div class="ui segment">
                                    <div class="ui top attached label">Subjek</div>
                                    <input placeholder="Subjek" type="text">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="column">
                                <div class="ui segment">
                                    <div class="ui top attached label">Pesan</div>
                                    <div class="field">
                                        <textarea></textarea>
                                    </div>
                                    <div class="ui fluid blue labeled submit icon button">
                                        <i class="icon edit"></i> Kirim Pesan
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="ui divider"></div>
                <div class="ui one column grid">
                    <div class="column">
                        <div class="ui piled blue segment">
                            <h2 class="ui header">
                                <i class="icon inverted circular blue comment"></i> Pesan
                            </h2>
                            <div class="ui comments">
                                <div class="comment">
                                    <a class="avatar">
                                        <img src="assets/images/avatar.jpg">
                                    </a>
                                    <div class="content">
                                        <a class="author">Pengguna 1</a>
                                        <div class="metadata">
                                            <span class="date">2 hari yang lalu</span>
                                        </div>
                                        <div class="text">
                                            <h5 class="ui header">Meminta Penjemputan</h5>
                                            Mas, tolong cek penjemputan sampah dong, saya baru submit tuh...
                                        </div>
                                    </div>
                                </div>
                                <div class="comment">
                                    <a class="avatar">
                                        <img src="assets/images/avatar2.jpg">
                                    </a>
                                    <div class="content">
                                        <a class="author">Admin 1</a>
                                        <div class="metadata">
                                            <span class="date">2 hari yang lalu</span>
                                        </div>
                                        <div class="text">
                                            <h5 class="ui header">RE: Meminta Penjemputan</h5>
                                            Okay, nanti saya kesana!
                                        </div>
                                    </div>
                                </div>
                                <div class="comment">
                                    <a class="avatar">
                                        <img src="assets/images/avatar.jpg">
                                    </a>
                                    <div class="content">
                                        <a class="author">Pengguna 1</a>
                                        <div class="metadata">
                                            <span class="date">1 hari yang lalu</span>
                                        </div>
                                        <div class="text">
                                            <h5 class="ui header">Tanpa Subjek</h5>
                                            k
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
