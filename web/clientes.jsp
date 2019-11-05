<%-- 
    Document   : clientes
    Created on : 6/09/2019, 10:02:01 AM
    Author     : Tecra
--%>
<%@page import="Control.ClienteCon"%>
<%@page import="Procesos.*"%>
<%@page import="ProcesosImpl.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
<%@page import="Clase.*"%>
<%@page import="Datos.*"%>
<!DOCTYPE html>

<%
    VendedorProcesos listarven = VendedorProcesosImpl.getInstatncia();
    ArrayList<Vendedores> lisve = listarven.listarVendedor2();
    request.setAttribute("listadovendedores", lisve);
    
    CreditoProcesos listarcre = CreditoProcesosImpl.getInstancia();
    ArrayList<Creditos> liscr = listarcre.listarCredito2();
    request.setAttribute("listadocredito", liscr);
       
    int id = BDCliente.ulCliente();
    request.setAttribute("id", id);
%>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Clientes</title>
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
                    var element = document.getElementById("tbl");
                    var valordepende = document.getElementById(bnombre);
                    var x = valordepende.value;
                    var fragment_url = 'include/cargaclie.jsp?nombre='+x+'&pag=clientes';
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
                                        Cliente:</label>
                                    <input name="bnombre" type="search" required class="cajas" id="bnombre" placeholder="Nombre del Cliente" onKeyPress="cargarCombo('bnombre')">
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
            <h2 class="ti">Datos del Cliente</h2>
            <form id="form1" name="form1" method="post" action="/thermal/Controlador">
                <table width="100%" border="0" align="center">
                    <tbody>
                        <tr>
                            <td width="22%" align="right"><input name="tab" type="hidden" id="tab" value="clientes">
                                <input name="accion" type="hidden" id="accion" value="guardar">
                                <input name="evento" type="hidden" id="evento" value="${evento}">
                                Nombre:</td>
                            <td colspan="3"><input name="nombre" type="text" required class="cajas" id="nombre" value="${cliente.nombrecliente}" size="30">
                                <c:choose>
                                    <c:when test="${cliente != null}">
                                        <c:set target="idcliente" var="id" value="${cliente.idcliente}"/>
                                    </c:when>
                                </c:choose>
                                <input type="hidden" name="idcliente" id="idcliente" value="${id}"></td>
                            <td width="28%">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">RFC:</td>
                            <td width="15%"><textarea name="rfc" cols="30" rows="5" class="cajas" id="direccion">${cliente.rfccliente}</textarea></td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">Calle:</td>
                            <td colspan="1"><input name="calle" type="text" class="cajas" id="telefono" value="${cliente.callecliente}"></td>          
                            <td colspan="1"><label for="numext">Num Ext:</label><input name="numext" type="text" class="cajas" id="mail" value="${cliente.numextcliente}"></td>
                            <td colspan="1"><label for="numint">Num Int:</label><input name="numint" type="text" class="cajas" id="mail" value="${cliente.numintcliente}"></td>
                        </tr>
                        <tr>
                            <td align="right">Colonia:</td>
                            <td width="15%"><textarea name="colonia" cols="30" rows="5" class="cajas" id="direccion">${cliente.coloniacliente}</textarea></td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">Localidad:</td>
                            <td colspan="1"><input name="localidad" type="text" class="cajas" id="telefono" value="${cliente.localidadcliente}"></td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">Referencia:</td>
                            <td colspan="1"><input name="referencia" type="text" class="cajas" id="telefono" value="${cliente.referenciacliente}"></td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">Municipio</td>
                            <td width="15%"><textarea name="municipio" cols="30" rows="5" class="cajas" id="direccion">${cliente.municipiocliente}</textarea></td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr> 
                            <tr>
                            <td align="right">Estado:</td>
                            <td colspan="1"><input name="Estado" type="text" class="cajas" id="telefono" value="${cliente.estadocliente}"></td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                            <tr>
                            <td align="right">Pais:</td>
                            <td colspan="1"><input name="pais" type="text" class="cajas" id="telefono" value="${cliente.paiscliente}"></td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">C.P.</td>
                            <td colspan="1"><input name="cp" type="text" class="cajas" id="telefono" value="${cliente.cpcliente}"></td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">E-mail</td>
                            <td colspan="1"><input name="email" type="text" class="cajas" id="telefono" value="${cliente.emailcliente}"></td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">Credito:</td>
                        <td>
                            <select name="credito" class="combos" id="creditos">
                                <option value="" disable selected>Selecciona..</option>                                 
                               <c:forEach var="liscr" items="${listadocredito}">
                                        <option value="${liscr.idcredito}"
                                                <c:if test="${cliente != null}">
                                                    ${liscr.idcredito == cliente.creditocliente ? 'selected="selected"' : ''}
                                                </c:if>
                                                
                                                >${liscr.descripcioncredito}</option>
                               </c:forEach>
                            </select>
                            </td>
                        </tr>
                            <tr>
                            <td align="right">Observaciones:</td>
                            <td width="15%"><textarea name="observaciones" cols="30" rows="5" class="cajas" id="observaciones">${cliente.observacionescliente}</textarea></td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                            <tr>
                            <td align="right">Tipo pago:</td>
                            <td colspan="1"><input name="tipopago" type="text" class="cajas" id="tipopago" value="${cliente.tipopagocliente}"></td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">Banco</td>
                            <td colspan="1"><input name="banco" type="text" class="cajas" id="banco" value="${cliente.bancocliente}"></td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">4 Digitos</td>
                            <td colspan="1"><input name="cuatrodigitos" type="text" class="cajas" id="cuatrodigitos" value="${cliente.cuatrodigitoscliente}"></td>
                            <td colspan="2">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                        <td align="right">Vendedor:</td>
                        <td>
                            <select name="vendedor" class="combos" id="vendedor">
                                <option value="" disable selected>Selecciona..</option> 
                                
                               <c:forEach var="lisve" items="${listadovendedores}">
                                        <option value="${lisve.idvendedor}"
                                                <c:if test="${cliente != null}">
                                                    ${lisve.idvendedor == cliente.vendedor ? 'selected="selected"' : ''}
                                                </c:if>
                                                
                                                >${lisve.nombrevendedor}</option>
                               </c:forEach>
                            </select>
                        </td></tr>
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
