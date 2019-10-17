

<%@page import="Control.ProductoCon"%>
<%@page import="Procesos.*"%>
<%@page import="ProcesosImpl.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
<%@page import="Clase.*"%>
<%@page import="Datos.*"%>
<!DOCTYPE html>
<%
    LineaProcesos listarlin = LineaProcesosImpl.getInstancia();
    ArrayList<Linea> lisli = listarlin.listarLinea2();
    request.setAttribute("listadolinea", lisli);
    
    int id = BDProducto.ulProducto();
    request.setAttribute("id", id);
%>
<html>
 <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Producto</title>
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
                if (nu >= 1) {
                    //Obtenemos el contenido del div
                    //donde se cargaran los resultados
                    var element = document.getElementById("tbl");
                    //Obtenemos el valor seleccionado del combo anterior
                    var valordepende = document.getElementById(bnombre);
                    var x = valordepende.value;
                    //construimos la url definitiva
                    //pasando como parametro el valor seleccionado
                    var fragment_url = 'include/cargaprod.jsp?nombre='+x+'&pag=productos';
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
            function mifuncion2(linea) {
                var elemento2 = document.getElementById("subli");
                peticion4 = new XMLHttpRequest();
                    var nsr = 'include/cargacomboSub.jsp?lin='+linea;
                    peticion4.open("GET", nsr);
                    peticion4.onreadystatechange = function ()
                    {
                        if (peticion4.readyState == 4)
                        {
                            elemento2.innerHTML = peticion4.responseText;
                        }
                    }
                    peticion4.send(null);
                }
            </script>
    </head>
    <body>
                           <div id="header">
            <jsp:include page="comunes/header.jsp"/>
        </div>  
                <div id="header">
        <c:if test="${evento != 'nuevo'}">
            <div id="buscar">
                <p></p>
                <form id="form2" name="form2" method="post /thermal/Controlador">        
                    <table width="50%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td align="center"><label for="bnombre">
                                        Producto:</label>
                                    <input name="bnombre" type="search" required class="cajas" id="bnombre" placeholder="Nombre del Producto" onKeyPress="cargarCombo('bnombre')">
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
            <h2 class="ti">Datos del Producto</h2>
            <form id="form1" name="form1" method="post" action="/thermal/Controlador">
                <table width="80%" border="0" align="center">
                    <tbody>
                        <tr>
                                <c:choose>
                                    <c:when test="${producto != null}">
                                        <c:set target="idproducto" var="id" value="${producto.idproducto}"/>
                                    </c:when>
                                </c:choose>
                                <input type="hidden" name="idproducto" id="idproducto" value="${id}"></td>
                            <td width="28%">&nbsp;</td>
                        </tr>                        
                        
                         <tr>
                            <td width="22%" align="right"><input name="tab" type="hidden" id="tab" value="producto">
                                <input name="accion" type="hidden" id="accion" value="guardar">
                                <input name="evento" type="hidden" id="evento" value="${evento}">Descripcion:</td>
                            <td colspan="1"><input name="producto" type="text" class="cajas" id="descripcionproducto" value="${producto.descripcionproducto}"></td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">Costo:</td>
                            <td colspan="1"><input name="costoproducto" type="text" class="cajas" id="costoproducto" value="${producto.costoproducto}"></td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>  
                        <tr>
                            <td align="right">Existencia</td>
                            <td colspan="1"><input name="existenciaproducto" type="text" class="cajas" id="existenciaproducto" value="${producto.existenciaproducto}"></td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                        <td align="right">Lineas:</td>
                        <td>
                            <select name="linea" class="combos" id="linea" onchange="mifuncion2(this.value)">
                                <option value="" disable selected>Selecciona..</option>                                 
                               <c:forEach var="lisli" items="${listadolinea}">
                                        <option value="${lisli.idlinea}"
                                                <c:if test="${producto != null}">
                                                    ${lisli.idlinea == producto.linea ? 'selected="selected"' : ''}
                                                </c:if> 
                                                >${lisli.descripcionlinea}</option>
                               </c:forEach>
                            </select>
                        <td align="center">Sublineas:</td>

                            <td><div id="subli"></div></td></tr>
                        
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

