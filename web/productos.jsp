<%-- 
    Document   : productos
    Created on : 23/09/2019, 10:57:23 AM
    Author     : Tecra
--%>
<%@page import="Control.*"%>
<%@page import="Procesos.*"%>
<%@page import="ProcesosImpl.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <link href="comunes/jquery.ui.datepicker.min.css" rel="stylesheet" type="text/css">
        <script src="comunes/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="comunes/jquery.ui-1.10.4.datepicker.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            
            var peticion = false;
            var testPasado = false;
            try
            {
                peticion = new XMLHttpRequest();
                peticion2 = new XMLHttpRequest();
                peticion3 = new XMLHttpRequest();
            }
            catch (trymicrosoft)
            {
                try
                {
                    peticion = new ActiveXObject("Msxml2.XMLHTTP");
                    peticion2 = new ActiveXObject("Msxml2.XMLHTTP");
                    peticion3 = new ActiveXObject("Msxml2.XMLHTTP");
                }
                catch (othermicrosoft)
                {
                    try
                    {
                        peticion = new ActiveXObject("Microsoft.XMLHTTP");
                        peticion2 = new ActiveXObject("Microsoft.XMLHTTP");
                        peticion3 = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    catch (failed)
                    {
                        peticion = false;
                        peticion2 = false;
                        peticion3 = false;
                    }
                }
            }
            if (!peticion)
                alert("ERROR AL INICIALIZAR!");
            function cargarCombo(bnombre) {
                var no = document.getElementById(bnombre).value;
                 
                    var element = document.getElementById("tbl");
                    var valordepende = document.getElementById(bnombre);
                    var x = valordepende.value;
                    var fragment_url = 'include/cargaprod.jsp?descripcion='+x+'&pag=productos';
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
            
            
                       function cargarComboSubl(linea) {
                
                    var element = document.getElementById("subl");
                    var fragment_url = 'include/cargacombosubl.jsp?lin='+linea+'&pag=productos';
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
                                        Productos: </label>
                                    <input name="bnombre1" type="search" required class="cajas" id="bnombre" placeholder="Nombre del Producto" onKeyPress="cargarCombo('bnombre')">
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
                            <td width="10%" align="right"><input name="tab" type="hidden" id="tab" value="productos">
                                <input name="accion" type="hidden" id="accion" value="guardar">
                                <input name="evento" type="hidden" id="evento" value="${evento}">
                                Costo</td>
                            <td colspan="2"><input name="costoproducto" type="text" required class="cajas" id="nombre" value="${producto.costoproducto}" size="30">
                                <c:choose>
                                    <c:when test="${productos != null}">
                                        <c:set target="idproducto" var="id" value="${producto.idproducto}"/>
                                    </c:when>
                                </c:choose>
                                <input type="hidden" name="idproducto" id="idproducto" value="${id}"></td>
                            <td width="20%">&nbsp;</td>
                        </tr>                        
                        <tr>
                            <td align="right">Descripcion:</td>
                            <td colspan="1"><input name="descripcionproducto" type="text" class="cajas" id="descripcionproducto" value="${producto.descripcionproducto}" size="35"></td>
                            <td colspan="2">&nbsp;</td>
                        </tr>                       
                        <tr>
                            <td align="right">Existencia</td>
                            <td colspan="1"><input name="existenciaproducto" type="text" class="cajas" id="existenciaproducto" value="${producto.existenciaproducto}" disabled="true"></td>
                            <td colspan="1">&nbsp;</td>
                        </tr>
                        
                        <tr>
                        <td align="center">Lineas:</td>
                        <td>
                    <select name="linea" class="combos" id="lineas" onchange="cargarComboSubl(this.value)">
                        <option value="" disable selected>Selecciona...</option> 
                            <c:forEach var="lisli" items="${listadolinea}">
                                <option value="${lisli.idlinea}"
                                        <c:if test="${productos != null}">
                                            ${lisli.idlinea == productos.linea ? 'selected="selected"' : ''}
                                        </c:if>
                                        >${lisli.descripcionlinea}</option>
                            </c:forEach>
                    </select>
                            <div id="subl">
                            </div>
                        </td>  
                        </tr>
                       
                        <tr>
                          <td align="center">
                                <c:if test="${evento != 'consultar'}">
                                    <input name="submit" type="submit" class="guardar" id="submit" value="  Guardar">
                                </c:if>
                            </td>
                          <td align="center">
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
