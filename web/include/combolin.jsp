<%@page import="Control.LineaCon"%>
<%@page import="Procesos.LineaProcesos"%>
<%@page import="ProcesosImpl.LineaProcesosImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="include/errores.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
<%@page import="Clase.*"%>
<%@page import="Datos.*"%>
<!DOCTYPE html>

<%
        LineaProcesos listarlin = LineaProcesosImpl.getInstancia();
        ArrayList<Linea> lislin = listarlin.listarLinea2();
        request.setAttribute("listadolineas", lislin);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
               function myFunction2(linea) {
               var element = document.getElementById("tbl1");
                var x = linea;
                alert(x);
                var url = 'include/combosub2.jsp?linea='+x+'&pag=productos';
                peticion.open("GET", url);
                peticion.onreadystatechange=function(){
                    if(this.readyState == 4)
                    {
                        element.innerHTML=peticion.responseText;
                    }
                }
                peticion.send(null);
            
            } 
        </script>   
    </head>
    <body>
        <select name="linea" class="combos" id="linea" onchange="myFunction2(this.value)">
                            <option value="" disable selected>Selecciona..</option> 
                                
                            <c:forEach var="lislin" items="${listadolineas}">
                            <option value="${lislin.idlinea}"
                            <c:if test="${producto != null}">
                            ${lislin.idlinea == producto.linea ? 'selected="selected"' : ''}
                            </c:if>
                                                
                                    >${lislin.clavelinea}<p>-</p><p>${lislin.descripcionlinea}</p></option>
                            </c:forEach>
                            </select>
        
    </body>
</html>

