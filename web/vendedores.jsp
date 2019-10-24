<%-- 
    Document   : vendedores
    Created on : 6/09/2019, 04:46:09 PM
    Author     : Tecra
--%>
<%@page import="Control.VendedorCon"%>
<%@page import="Procesos.VendedorProcesos"%>
<%@page import="ProcesosImpl.VendedorProcesosImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
<%@page import="Clase.*"%>
<%@page import="Datos.*"%>
<!DOCTYPE html>
<%
    int id = BDVendedor.ulVendedor();
    request.setAttribute("id", id);
%>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Vendedores</title>
    <link href="comunes/estilos.css" rel="stylesheet" type="text/css">
    
    <link href="comunes/jquery.ui.core.min.css" rel="stylesheet" type="text/css">
        <link href="comunes/jquery.ui.theme.min.css" rel="stylesheet" type="text/css">
        <link href="comunes/jquery.ui.datepicker.min.css" rel="stylesheet" type="text/css">
        <script src="comunes/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="comunes/jquery.ui-1.10.4.datepicker.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            var peticion = false;
            var testPasado = false;
            try
            {
                peticion = new XMLHttpRequest();
            }
            catch (trymicrosoft)
            {
                try
                {
                    peticion = new ActiveXObject("Msxml2.XMLHTTP");
                }
                catch (othermicrosoft)
                {
                    try
                    {
                        peticion = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    catch (failed)
                    {
                        peticion = false;
                    }
                }
            }
            if (!peticion)
                alert("ERROR AL INICIALIZAR!");
            function cargarCombo() {
                    var element = document.getElementById("tbl");
                    var fragment_url = 'include/cargaven.jsp?='+'&pag=vendedores';
                    //abrimos la url
                    peticion.open("GET", fragment_url);
                    peticion.onreadystatechange = function ()
                    {
                        if (peticion.readyState == 4)
                        {
                            //escribimos la respuesta
                            element.innerHTML = peticion.responseText;
                        }
                    }
                    peticion.send(null);
                }
            </script>
    </head>
    <body onload="cargarCombo()">
        <div id="header">
            <jsp:include page="index.jsp"/>
        </div>
        <c:if test="${evento != 'nuevo'}">
                
            <div id="tbl">
                
                </div>
                <p></p>
        </c:if>
        <div id="panel">
            <h2 class="ti">Datos del Vendedores</h2>
            <form id="form1" name="form1" method="post" action="/thermal/Controlador">
                <table width="80%" border="0" align="center">
                    <tbody>
                        <tr>
                            <td width="22%" align="right"><input name="tab" type="hidden" id="tab" value="vendedores">
                                <input name="accion" type="hidden" id="accion" value="guardar">
                                <input name="evento" type="hidden" id="evento" value="${evento}">
                                Nombre:</td>
                            <td colspan="3"><input name="nombre" type="text" required class="cajas" id="nombre" value="${vendedor.nombrevendedor}" size="30">
                                <c:choose>
                                    <c:when test="${vendedor != null}">
                                        <c:set target="idvendedor" var="id" value="${vendedor.idvendedor}"/>
                                    </c:when>
                                </c:choose>
                                <input type="hidden" name="idvendedor" id="idvendedor" value="${id}"></td>
                            <td width="28%">&nbsp;</td>
                        </tr>
                        <tr>
                          <td>
                                <c:if test="${evento != 'consultar'}">
                                    <input name="submit" type="submit" class="guardar" id="submit" value="  Guardar">
                                </c:if>
                            </td>
                          <td>
                                <c:if test="${evento != 'consultar'}">
                                    <input name="reset" type="reset" class="limpiar" id="reset" value="  Limpiar">
                                </c:if>
                            </td>
                        </tr>                        
                    </tbody>
                </table>
            </form>                     
        </div>
    </body>
</html>
