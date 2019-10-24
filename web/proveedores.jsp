<%@page import="Control.ProveedoresCon"%>
<%@page import="Procesos.ProveedoresProcesos"%>
<%@page import="ProcesosImpl.ProveedoresProcesosImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
<%@page import="Clase.*"%>
<%@page import="Datos.*"%>

<!DOCTYPE html>
<% 
   int id = BDProveedores.ulProveedor();
   request.setAttribute("id", id);

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proveedores</title>
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
                if (nu >= 0) {
                    var element = document.getElementById("tbl");
                    var valordepende = document.getElementById(bnombre);
                    var x = valordepende.value;
                    var fragment_url = 'include/cargaprov.jsp?nombre='+x+'&pag=proveedores';
                    peticion.open("GET", fragment_url);
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
    <body>
        <div id="header">
            <jsp:include page="index.jsp"/>        
        </div>
         <c:if test="${evento != 'nuevo'}">
            <div id="buscar">
                <p></p>
        <form id="form2" name="form2" method="post /Thermal/Controlador">        
                    <table width="50%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td align="center"><label for="bnombre">
                                        Proveedor:</label>
                                    <input name="bnombre" type="search" required class="cajas" id="bnombre" placeholder="Nombre del Proveedor" onKeyPress="cargarCombo('bnombre')">
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
            <h2 class="ti">Datos del Proveedor</h2>
            <form id="form1" name="form1" method="post" action="/Thermal/Controlador">
                <table width="80%" border="0" align="center">
                    <tbody>
                        <tr>
                            <td width="22%" align="right"><input name="tab" type="hidden" id="tab" value="proveedores">
                                <input name="accion" type="hidden" id="accion" value="guardar">
                                <input name="evento" type="hidden" id="evento" 
                                       value="${evento}">
                                Nombre:</td>
                            <td colspan="3"><input name="nombre" type="text" required class="cajas" id="nombre" value="${proveedor.nombreproveedor}" size="30">
                                <c:choose>
                                    <c:when test="${proveedor != null}">
                                        <c:set target="idproveedor" var="id" value="${proveedor.idproveedor}"/>
                                    </c:when>
                                </c:choose>
                                <input type="hidden" name="idproveedor" id="idproveedor" value="${id}"></td>
                            <td width="28%">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">RFC:</td>
                            <td colspan="4"><input name="rfc" type="text" class="cajas" id="rfc" value="${proveedor.rfcproveedor}">          
                        </tr>
                         <tr>
                            <td align="right">Direccion:</td>
                            <td width="24%"><textarea name="direccion" cols="30" rows="5" class="cajas" id="direccion">${proveedor.direccionproveedor}</textarea></td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">Telefono:</td>
                            <td colspan="4"><input name="telefono" type="text" class="cajas" id="telefono" value="${proveedor.telefonoproveedor}">          
                        </tr>
                        <tr>
                            <td align="right">Contacto:</td>
                            <td colspan="4"><input name="contacto" type="text" class="cajas" id="contacto" value="${proveedor.contactoproveedor}">          
                        </tr>
                        <tr>
                            <td align="right">Saldo:</td>
                            <td colspan="4"><input name="saldo" type="text" class="cajas" id="saldo">         
                        </tr>
                        <tr>
                            <td align="right">Observaciones:</td>
                            <td width="24%"><textarea name="observaciones" cols="30" rows="5" class="cajas" id="observaciones">${proveedor.observacionesproveedor}</textarea></td>
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
