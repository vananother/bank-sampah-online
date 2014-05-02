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
        <title>Register New Account</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    </head>
    <body background="assets/images/wood013.jpg">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="well well-lg">
                        <h1 align="center">Register New Account</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="well well-lg">
                            <form role="form" method="post" action="index.jsp">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-xs-5">
                                            <label for="exampleInputEmail1">Username:</label>
                                            <input name="regusername" type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter username">
                                        </div>
                                        <div class="col-xs-2"></div>
                                        <div class="col-xs-5">
                                            <label for="exampleInputEmail1">First Name:</label>
                                            <input name="regfirstname" type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter first name">
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-xs-5">
                                            <label for="exampleInputPassword1">Password:</label>
                                            <input name="regpassword" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                        </div>
                                        <div class="col-xs-2"></div>
                                        <div class="col-xs-5">
                                            <label for="exampleInputEmail1">Last Name:</label>
                                            <input name="reglastname" type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter last name">
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-xs-5">
                                            <label for="exampleInputPassword1">Confirm Password:</label>
                                            <input name="regpassword2" type="password" class="form-control" id="exampleInputPassword1" placeholder="Confirm password">
                                        </div>
                                        <div class="col-xs-2"></div>
                                        <div class="col-xs-5">
                                            <label for="exampleInputEmail1">Alamat:</label>
                                            <textarea name="regalamat" rows="3" class="form-control" id="exampleInputEmail1" placeholder="Enter address" ></textarea>
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class="row">
                                    <div class="col-xs-5"></div>
                                    <div class="col-xs-2"></div>
                                    <div class="col-xs-5">
                                        <label for="exampleInputPassword1">Nomor Handphone:</label>
                                        <input name="regphone" type="number" class="form-control" id="exampleInputPassword1" placeholder="Enter handphone number">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-5"></div>
                                    <div class="col-xs-2"></div>
                                    <div class="col-xs-5">
                                        <label for="exampleInputPassword1">Alamat email:</label>
                                        <input name="regemail" type="email" class="form-control" id="exampleInputPassword1" placeholder="Enter email address">
                                    </div>
                                </div>
                                <br/>
                                <div class="row">
                                    <div style="text-align:center">
                                        <button name="register" value="register" type="submit" class="btn btn-default">Create New Account</button>
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
