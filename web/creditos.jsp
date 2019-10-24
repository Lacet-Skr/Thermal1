<%@page import="Control.CreditoCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
<%@page import="Clase.*"%>
<%@page import="Datos.*"%>
<!DOCTYPE html>
<%
    int id = BDCredito.ulCredito();
    request.setAttribute("id", id);
%>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Creditos</title>
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
          function cargarCombo(bnombre) {
                    var element = document.getElementById("tbl");
                    var fragment_url = 'include/cargacr.jsp?='+'&pag=creditos';                    
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
            <div id="tbl">
            </div>
                <p></p>
        <div id="panel">
            <form id="form1" name="form1" method="post" action="/thermal/Controlador">
                <table width="80%" border="0" align="center">
                    <tbody>
                        
                        <tr>
                            <td width="22%" align="right"><input name="tab" type="hidden" id="tab" value="creditos">
                                <input name="accion" type="hidden" id="accion" value="guardar">
                                <input name="evento" type="hidden" id="evento" 
                                       value="${evento}">
                                Nombre:</td>
                            <td colspan="3"><input name="nombre" type="text" required class="cajas" id="nombre" value="${credito.descripcioncredito}" size="30">
                                <c:choose>
                                    <c:when test="${credito!= null}">
                                        <c:set target="idcredito" var="id" value="${credito.idcredito}"/>
                                    </c:when>
                                </c:choose>
                                <input type="hidden" name="idcredito" id="idcredito" value="${id}"></td>
                            <td width="28%">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">Dias:</td>
                            <td width="24%"><input name="dias" cols="30" rows="5" class="cajas" id="dias" value="${credito.diascredito}"></td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
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
