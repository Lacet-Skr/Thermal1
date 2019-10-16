<%-- 
    Aqui nos traemos la variable usuario en la sesion y mandamos traer el header.jsp
    Pero si no hay sesion de usuario nos regresaria al index.jsp, es decir a volvernos a logear
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String usuario = (String) session.getAttribute("usuario");//nos traemos usuario en la sesion
    if (usuario == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Panel de Control</title>
    </head>
    <body>
        <div id="header">
            <jsp:include page="/comunes/header.jsp"/>        
        </div>
    </body>
</html>
