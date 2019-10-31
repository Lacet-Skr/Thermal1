
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
        int linea = Integer.parseInt(request.getParameter("linea"));
        SublineaProcesos listarsub = SublineaProcesosImpl.getInstancia();
        ArrayList<Sublinea> lissub = listarsub.listarSublineas3(linea);
        request.setAttribute("listadosublinea", lissub);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
               function myFunction3(sublinea) {
               var element = document.getElementById("tbl3");
                var x = sublinea;
                alert(x);
                var url = 'include/cargaprod2.jsp?sublinea='+x+'&pag=productos';
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
        <select name="sublinea" class="combos" id="sublinea" onchange="myFunction3(this.value)">
            <option value="" disable selected>Selecciona..</option> 
                                
             <c:forEach var="lissub" items="${listadosublinea}">
                <option value="${lissub.idsublinea}"
                        <c:if test="${producto != null}">
                                ${lissub.idsublinea == producto.sublinea ? 'selected="selected"' : ''}
                        </c:if>
                                                
                                >${lissub.clavesublinea}<p>-</p><p>${lissub.descripcionsublinea}</p></option>
            </c:forEach>
        </select>
        
    </body>
</html>