<%-- 
    Document   : sublineas
    Created on : 23/09/2019, 11:00:06 AM
    Author     : Tecra
--%>
<%@page import="Control.*"%>
<%@page import="Procesos.*"%>
<%@page import="ProcesosImpl.*"%>
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
    LineaProcesos listarlin = LineaProcesosImpl.getInstancia();
    ArrayList<Linea> lisli = listarlin.listarLinea2();
    request.setAttribute("listadolineas", lisli);
    
    int id = BDSublinea.ulSublinea();
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
                var no = document.getElementById(bnombre).value;
                var nu = no.length;
                if (nu >= 3) {
                    //Obtenemos el contenido del div
                    //donde se cargaran los resultados
                    var element = document.getElementById("tbl");
                    //Obtenemos el valor seleccionado del combo anterior
                    var valordepende = document.getElementById(bnombre);
                    var x = valordepende.value;
                    //construimos la url definitiva
                    //pasando como parametro el valor seleccionado
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
                                        Sublinea:</label>
                                    <input name="bnombre" type="search" required class="cajas" id="bnombre" placeholder="Nombre Sublinea" onKeyPress="cargarCombo('bnombre')">
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
        <div id="panel">
            <h2 class="ti">Datos de la Sublinea</h2>
            <form id="form1" name="form1" method="post" action="/thermal/Controlador">
                <table width="80%" border="0" align="center">
                    <tbody>
                        <tr>
                            <td width="22%" align="right"><input name="tab" type="hidden" id="tab" value="sublineas">
                                <input name="accion" type="hidden" id="accion" value="guardar">
                                <input name="evento" type="hidden" id="evento" value="${evento}">
                                Clave:</td>
                            <td colspan="3"><input name="clavesublinea" type="text" required class="cajas" id="nombre" value="${sublinea.clavesublinea}" size="30">
                                <c:choose>
                                    <c:when test="${sublinea != null}">
                                        <c:set target="idsublinea" var="id" value="${sublinea.idsublinea}"/>
                                    </c:when>
                                </c:choose>
                                <input type="hidden" name="idsublinea" id="idsublinea" value="${id}"></td>
                            <td width="28%">&nbsp;</td>
                        </tr>                     
                        <tr>
                        <td align="right">Lineas:</td>
                        <td>
                            <select name="linea" class="combos" id="lineas" onchange="x(this.value)">
                                <option value="" disable selected>Selecciona..</option> 
                                
                               <c:forEach var="lisli" items="${listadolineas}">
                                        <option value="${lisli.idlinea}"
                                                <c:if test="${sublinea != null}">
                                                    ${lisli.idlinea == sublinea.linea ? 'selected="selected"' : ''}
                                                </c:if>
                                                
                                                >${lisli.descripcionlinea}</option>
                               </c:forEach>
                            </select>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">Descripcion:</td>
                            <td width="15%"><textarea name="descripcionsublinea" cols="30" rows="5" class="cajas" id="descripcionsublinea">${sublinea.descripcionsublinea}</textarea></td>
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
                </table>
            </form>                     
        </div>
    </body>
</html>