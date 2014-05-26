<%-- 
    Document   : Error
    Created on : May 26, 2014, 6:30:41 PM
    Author     : van
--%>
<%@ page isErrorPage="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Halaman Error</title>
    </head>
    <body>
        <h1>Ooopps...</h1>
        <p>Sebuah error telah terjadi pada sistem kami</p>
        <p>Error disebabkan karena: </p>
        <p>
            <%
                out.print(exception.getMessage());
            %>
        </p>
    </body>
</html>