
<%@page import="Control.SublineaCon"%>
<%@page import="Procesos.SublineaProcesos"%>
<%@page import="ProcesosImpl.SublineaProcesosImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="include/errores.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
<%@page import="Clase.*"%>
<%@page import="Datos.*"%>
<!DOCTYPE html>

<%
	String usuario = (String) session.getAttribute("usuario");
	if(usuario==null){
	request.getRequestDispatcher("index.jsp").forward(request, response);
	}
        
        int linea = Integer.parseInt(request.getParameter("lin"));
        SublineaProcesos listarsub = SublineaProcesosImpl.getInstancia();
        ArrayList<Sublinea> lissub = listarsub.listarSublineas3(linea);
        request.setAttribute("listadosublinea", lissub);
        
	int id = BDSublinea.ulSublinea();
	request.setAttribute("id",id);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <select name="sublinea" class="combos" id="sublinea">
            <option value="" disable selected>Selecciona..</option> 
                                
             <c:forEach var="lissub" items="${listadosublinea}">
                <option value="${lissub.idsublinea}"
                        <c:if test="${sublinea != null}">
                                ${lissub.idsublinea == sublinea.idsublinea ? 'selected="selected"' : ''}
                        </c:if>
                                                
                                >${lissub.descripcionsublinea}</option>
            </c:forEach>
        </select>
        
    </body>
</html>

