<%@page import="Control.SublineaCon"%>
<%@page import="Procesos.SublineaProcesos"%>
<%@page import="ProcesosImpl.SublineaProcesosImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
<%@page import="Clase.*"%>
<%@page import="Datos.*"%>
<!DOCTYPE html>
<%

         int linea = Integer.parseInt(request.getParameter("linea"));
        //JugadorProcesos listarjuga = JugadorProcesosImpl.getInstancia();
        ArrayList<Sublinea> lissub = SublineaCon.listarSublineas3(linea);
        request.setAttribute("listadosublinea", lissub);
        
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    </body>
</html>

