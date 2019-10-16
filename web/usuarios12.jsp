
<%@page import="Control.UsuarioCon"%>
<%@page import="Procesos.*"%>
<%@page import="ProcesosImpl.*"%>
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
        
        int id = BDUsuarios.ulTrabajadores();
	request.setAttribute("id",id);
%>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Usuarios</title>
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
                    var fragment_url = 'include/cargaus.jsp?nombre='+x+'&pag=usuarios12';
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
            <jsp:include page="/comunes/header.jsp"/>        
        </div>
        <c:if test="${evento != 'nuevo'}">
            <div id="buscar">
                <p></p>
                <form id="form2" name="form2" method="post /thermal/Controlador">        
                    <table width="50%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td align="center"><label for="bnombre">
                                        Usuario:</label>
                                    <input name="bnombre" type="search" required class="cajas" id="bnombre" placeholder="Nombre del Usuario" onKeyPress="cargarCombo('bnombre')">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <div id="tbl">
                    <table width="50%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <p></p>
            </div>
        </c:if>
        <div id="panel">
            <h2 class="ti">Datos del Usuario</h2>
            <form id="form1" name="form1" method="post" action="/thermal/Controlador">
                <table width="80%" border="0" align="center">
                    <tbody>
                        <tr>
                            <td width="22%" align="right"><input name="tab" type="hidden" id="tab" value="usuarios12">
                                <input name="accion" type="hidden" id="accion" value="guardar">
                                <input name="evento" type="hidden" id="evento" 
                                       value="${evento}">
                                Usuario:</td>
                            <td colspan="3"><input name="usuario1" type="text" required class="cajas" id="usuario1" value="${usuarios1.usuario}" size="30">
                                <c:choose>
                                    <c:when test="${usuarios1 != null}">
                                        <c:set target="idusuario" var="id" value="${usuarios1.idusuario1}"/>
                                    </c:when>
                                </c:choose>
                                <input type="hidden" name="idusuario" id="idusuario" value="${id}"></td>
                            <td width="28%">&nbsp;</td>
                        </tr>
                        <tr>
                            <td aling="right">Password:</td>
                            <td colspan="3"><input name="password1" type="text" required class="cajas" id="poassword1" value="${usuarios1.password}" size="30"></td>
                        </tr>
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
