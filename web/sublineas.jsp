<%-- 
    Document   : proveedor
    Created on : 3/09/2019, 11:44:20 AM
    Author     : Tecra
--%>

<%@page import="Control.SublineaCon"%>
<%@page import="Procesos.SublineaProcesos"%>
<%@page import="ProcesosImpl.SublineaProcesosImpl"%>
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
    
    int id = BDSublinea.ulSublineas();
    request.setAttribute("id", id);
%>

<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Sublineas</title>
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
                    //Obtenemos el contenido del div
                    //donde se cargaran los resultados
        var no = document.getElementById(bnombre).value;
        var nu = no.length;
        if (nu>=2){
        
        var element = document.getElementById("tbl");
        
        var valordepende = document.getElementById(bnombre);
        var x=valordepende.value;
                    var fragment_url = 'include/cargasubl.jsp?nombre='+x+'&pag=sublineas';
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
            }
            </script>
    </head>
    <body >
        <div id="header">
            <jsp:include page="header.jsp"/>
        </div>
        <c:if test="${evento != 'nuevo'}">
            <div id="buscar">
                <p></p>
                <form id="form2" name="form2" method="post /thermal/Controlador">        
                    <table width="50%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td align="center"><label for="bnombre">
                                        Sublineas:</label>
                                    <input name="bnombre" type="search" required class="cajas" id="bnombre" placeholder="Nombre de Sublinea" onKeyPress="cargarCombo('bnombre')">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <div id="tbl">
                
                </div>
                <p></p>
            </div>
        </c:if>
        <div id="panel" align="left">
            <h2 class="ti">Datos de Sublineas</h2>
            <form id="form1" name="form1" method="post" action="/thermal/Controlador">
                <table width="30%" border="0" align="center">
                    <tbody align="">
                        <tr>
                            <td width="22%" align="right"><input name="tab" type="hidden" id="tab" value="sublinea">
                                <input name="accion" type="hidden" id="accion" value="guardar">
                                <input name="evento" type="hidden" id="evento" value="${evento}">
                                Clave:</td>
                            <td colspan="3"><input name="clave" type="text" required class="cajas" id="nombre" value="${productos.calve}" width="54" size="30">
                        </tr> 
                        <tr>
                            <td width="22%" align="right"><input name="tab" type="hidden" id="tab" value="sublinea">
                                <input name="accion" type="hidden" id="accion" value="guardar">
                                <input name="evento" type="hidden" id="evento" value="${evento}">
                                Sublinea:</td>
                            <td colspan="3"><input name="sublinea" type="text" required class="cajas" id="nombre" value="${productos.sublineas}" size="30">
                                <c:choose>
                                    <c:when test="${productos != null}">
                                        <c:set target="idproductos" var="id" value="${productos.idproductos}"/>
                                    </c:when>
                                </c:choose>
                                <input type="hidden" name="idproductos" id="idproductos" value="${id}"></td>
                            <td width="28%">&nbsp;</td>
                        </tr>   
                        <tr>
                            <td width="22%" align="right"><input name="tab" type="hidden" id="tab" value="linea">
                                <input name="accion" type="hidden" id="accion" value="guardar">
                                <input name="evento" type="hidden" id="evento" value="${evento}">
                                linea:</td>
                            <td colspan="3"><input name="linea" type="text" required class="cajas" id="nombre" value="${productos.linea}" size="30">
                        </tr>    
                                
                                <c:choose>
                                    <c:when test="${proveedor != null}">
                                        <c:set target="idproveedor" var="id" value="${proveedor.idproveedor}"/>
                                    </c:when>
                                </c:choose>
                                <input type="hidden" name="idproveedor" id="idproveedor" value="${id}"></td>
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
