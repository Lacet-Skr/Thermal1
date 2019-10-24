
<%@page isErrorPage="true" %>
<%@page import="java.io.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Errores de Sistema</title>
    </head>
    <body>
        <h1>Ocurrio un Error:</h1>
        <br><%= exception.getMessage()%>
        <br>
        <div id="mensaje" style=" position: relative;">
            <pre>
                <% exception.printStackTrace( new PrintWriter(out));%>
            </pre>
        </div>
    </body>
</html>
