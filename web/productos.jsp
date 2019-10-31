
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
        
        LineaProcesos listarlin = LineaProcesosImpl.getInstancia();
        ArrayList<Linea> lislin = listarlin.listarLinea2();
        request.setAttribute("listadolineas", lislin);
        

        
        SublineaProcesos listarsub = SublineaProcesosImpl.getInstancia();
        ArrayList<Sublinea> lissub = listarsub.listarSublinea2();
        request.setAttribute("listadosublinea", lissub);
//hola
%>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Productos</title>
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
            
            function cargarCombo1(bnombre) {
                var no = document.getElementById(bnombre).value;
                var nu = no.length;
                if (nu >= 0) {
                    //Obtenemos el contenido del div
                    //donde se cargaran los resultados
                    var element = document.getElementById("tbl1");
                    //Obtenemos el valor seleccionado del combo anterior
                    var valordepende = document.getElementById(bnombre);
                    var x = valordepende.value;
                    //construimos la url definitiva
                    //pasando como parametro el valor seleccionado
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
            }
            
            function cargarCombo2(bnombre) {
                var no = document.getElementById(bnombre).value;
                var nu = no.length;
                if (nu >= 3) {
                    //Obtenemos el contenido del div
                    //donde se cargaran los resultados
                    var element = document.getElementById("tbl1");
                    //Obtenemos el valor seleccionado del combo anterior
                    var valordepende = document.getElementById(bnombre);
                    var x = valordepende.value;
                    //construimos la url definitiva
                    //pasando como parametro el valor seleccionado
                    var fragment_url = 'include/cargaprodclave.jsp?clave='+x+'&pag=productos';
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
            
            function myFunction1(linea) {
               var element = document.getElementById("combon");
                var x = linea;
                alert(x);
                var url = 'include/combosub.jsp?linea='+x+'&pag=productos';
                peticion.open("GET", url);
                peticion.onreadystatechange=function(){
                    if(this.readyState == 4)
                    {
                        element.innerHTML=peticion.responseText;
                    }
                }
                peticion.send(null);
            
            }
            
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
            
            function Busqueda(condicional){
                var x = condicional;
                if("descripcion"==x){
                    var element = document.getElementById("tbl2");
                    var url = 'productosdesc.jsp';
                    peticion.open("GET", url);
                    peticion.onreadystatechange = function ()
                    {
                        if (peticion.readyState == 4)
                        {
                            element.innerHTML = peticion.responseText;
                        } 
                    }
                    peticion.send(null);
                }else if("clave"==x){
                    var element = document.getElementById("tbl2");
                    var url = 'productosclave.jsp';
                    peticion.open("GET", url);
                    peticion.onreadystatechange = function ()
                    {
                        if (peticion.readyState == 4)
                        {
                            element.innerHTML = peticion.responseText;
                        } 
                    }
                    peticion.send(null);
                }else if("linea"==x){
                    var element = document.getElementById("tbl2");
                    var url = 'include/combolin.jsp';
                    peticion.open("GET", url);
                    peticion.onreadystatechange = function ()
                    {
                        if (peticion.readyState == 4)
                        {
                            element.innerHTML = peticion.responseText;
                        } 
                    }
                    peticion.send(null);
                }
            }
            
            </script>
    </head>
    <body id="bodyn">
        <div id="header">
            <jsp:include page="/comunes/header.jsp"/>        
        </div>
        <c:if test="${evento != 'nuevo'}">
        <select name="busqueda" id="busqueda" onchange="Busqueda(this.value)">
            <option value="" disable selected>Busqueda..</option>
            <option value="descripcion">Descripcion</option>
            <option value="clave">Clave</option>
            <option value="linea">Linea & Sublinea</option>
        </select>
        </c:if>
        <div id="tbl2">
                    <table width="50%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <p></p>
                <div id="tbl1">
                    <table width="50%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <p></p>
                <div id="tbl3">
                    <table width="50%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <p></p>
        <div id="panel">
            <h2 class="ti">Datos del Producto</h2>
            <form id="form1" name="form1" method="post" action="/thermal/Controlador">
                <table width="80%" border="0" align="center">
                    <tbody>
                        <tr>
                            <td width="22%" align="right"><input name="tab" type="hidden" id="tab" value="productos">
                                <input name="accion" type="hidden" id="accion" value="guardar">
                                <input name="evento" type="hidden" id="evento" 
                                       value="${evento}">
                                Descripcion:</td>
                            <td colspan="3"><input name="descripcionproducto" type="text" required class="cajas" id="descripcionproducto" value="${producto.descripcionproducto}" size="30">
                                <c:choose>
                                    <c:when test="${usuarios1 != null}">
                                        <c:set target="idproducto" var="id" value="${producto.idproducto}"/>
                                    </c:when>
                                </c:choose>
                                <input type="hidden" name="idproducto" id="idproducto" value="${id}"></td>
                            <td width="28%">&nbsp;</td>
                            <td aling="right">Clave:</td>
                            <td colspan="3"><input name="claveproducto" type="text" required class="cajas" id="claveproducto" value="${producto.claveproducto}" size="30"></td>
                        </tr>
                        <tr>
                            <td aling="right">Tipo de unidad:</td>
                            <td colspan="3"><input name="unidadproducto" type="text" required class="cajas" id="unidadproducto" value="${producto.unidadproducto}" size="30"></td>
                            
                            <td aling="right">Existencia del producto:</td>
                            <td colspan="3"><input name="existenciaproducto" type="text" required class="cajas" id="existenciaproducto" readonly="readonly" value="${producto.existenciaproducto}" size="30"></td>
                        </tr>
                        <tr>
                            <td aling="right">Costo:</td>
                            <td colspan="3"><input name="costoproducto" type="text" required class="cajas" id="costoproducto" value="${producto.cotoproducto}" size="30"></td>
                            
                            <td aling="right">Venta:</td>
                            <td colspan="3"><input name="ventaproducto" type="text" required class="cajas" id="ventaproducto" value="${producto.ventaproducto}" size="30"></td>
                        </tr>
                        <tr>
                            <td>
                            <select name="linea" class="combos" id="linea" onchange="myFunction1(this.value)">
                            <option value="" disable selected>Selecciona..</option> 
                                
                            <c:forEach var="lislin" items="${listadolineas}">
                            <option value="${lislin.idlinea}"
                            <c:if test="${producto != null}">
                            ${lislin.idlinea == producto.linea ? 'selected="selected"' : ''}
                            </c:if>
                                                
                                    >${lislin.clavelinea}<p>-</p><p>${lislin.descripcionlinea}</p></option>
                            </c:forEach>
                            </select>
                            </td>
                            
                            <td id="combon">
                                <c:if test="${evento != 'nuevo'}">
                            <select name="sublinea" class="combos" id="sublinea">
                                    <option value="" disable selected>Selecciona..</option> 
                                
                                    <c:forEach var="lissub" items="${listadosublinea}">
                                    <option value="${lissub.idsublinea}"
                                    <c:if test="${producto != null}">
                                    ${lissub.idsublinea == producto.sublinea ? 'selected="selected"' : ''}
                                    </c:if>
                                                
                                    >${lissub.clavesublinea}<p>-</p><p>${lissub.descripcionsublinea}</p></option>
                                </c:forEach>
                            </select>
                                </c:if>
                                
                            </td>
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

