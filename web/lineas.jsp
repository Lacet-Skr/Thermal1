
<%@page import="Control.LineaCon"%>
<%@page import="Procesos.LineaProcesos"%>
<%@page import="ProcesosImpl.LineaProcesosImpl"%>
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
        
    int id = BDLinea.ulLinea();
    request.setAttribute("id", id);
%>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Linea</title>
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
                var no = document.getElementById(bnombre).value;
                var nu = no.length;
                if (nu >= 2) {
                    //Obtenemos el contenido del div
                    //donde se cargaran los resultados
                    var element = document.getElementById("tbl");
                    //Obtenemos el valor seleccionado del combo anterior
                    var valordepende = document.getElementById(bnombre);
                    var x = valordepende.value;
                    //construimos la url definitiva
                    //pasando como parametro el valor seleccionado
                    var fragment_url = 'include/cargalin.jsp?nombre='+x+'&pag=lineas';
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
    <body>
        <div id="header">
            <jsp:include page="comunes/header.jsp"/>
        </div>
        <c:if test="${evento != 'nuevo'}">
            <div id="buscar">
                <p></p>
                <form id="form2" name="form2" method="post /thermal/Controlador">        
                    <table width="50%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td align="center"><label for="bnombre">
                                        Linea:</label>
                                    <input name="bnombre" type="search" required class="cajas" id="bnombre" placeholder="Nombre Linea:" onKeyPress="cargarCombo('bnombre')">
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
            <h2 class="ti">Datos de la Linea</h2>
            <form id="form1" name="form1" method="post" action="/thermal/Controlador">
                <table width="30%" border="0" align="center">
                    <tbody align="">
                                <input type="hidden" name="idlinea" id="idlinea" value="${id}"></td>
                            <td width="28%">&nbsp;</td>
                        </tr>
                        <tr>
                            <td width="22%" align="right"><input name="tab" type="hidden" id="tab" value="linea">
                                <input name="accion" type="hidden" id="accion" value="guardar">
                                <input name="evento" type="hidden" id="evento" value="${evento}">
                                Clave:</td>
                            <td colspan="3"><input name="clavelinea" type="text" required class="cajas" id="nombre" value="${linea.clavelinea}" size="30">
                            <c:choose>
                            <c:when test="${linea != null}">
                        <c:set target="idlinea" var="id" value="${linea.idlinea}"/>
                            </c:when>
                            </c:choose>
                        <tr>
                            <td> 
                                Descripcion Linea:</td>
                            <td colspan="3"><input name="descripcionlinea" type="text" required class="cajas" id="nombre" value="${linea.descripcionlinea}" size="30">
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
