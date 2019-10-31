<%-- 
    Document   : cotizaciones
    Created on : 17/10/2019, 10:09:48 AM
    Author     : Tecra
--%>
<%@page import="Control.CotizacionCon"%>
<%@page import="Procesos.*"%>
<%@page import="ProcesosImpl.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
<%@page import="Clase.*"%>
<%@page import="Datos.*"%>
<!DOCTYPE html>
<%
    int id = BDCotizacion.ulCotizacion();
    request.setAttribute("id", id);
%>    
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width-decive-width, user-scalable=no, initial-scale=1, maximum-scale=1 minimum-scale=1">
    <title>Cotizaciones</title>
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
                peticion1 = new XMLHttpRequest();
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
                    var element = document.getElementById("tbl");
                    var valordepende = document.getElementById(bnombre);
                    var x = valordepende.value;
                    var fragment_url = 'include/cargaclie.jsp?nombre='+x+'&pag=cotizaciones';
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
            function cargarCombo1(bnombre1) {
                var no = document.getElementById(bnombre1).value;
                var nu = no.length;
                if (nu >= 1) {
                    var element = document.getElementById("tbl2");
                    var valordepende = document.getElementById(bnombre1);
                    var x = valordepende.value;
                    var fragment_url = 'include/.jsp?nombre='+x+'&pag=cotizaciones';
                    peticion1.open("GET", fragment_url);
                    peticion1.onreadystatechange = function ()
                    {
                        if (peticion1.readyState == 4)
                        {
                            element.innerHTML = peticion1.responseText;
                        }
                    }
                    peticion1.send(null);
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
                    <table width="100%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td align="center"><label for="bnombre">
                                        Clientes:</label>
                                    <input name="bnombre" type="search" required class="cajas" id="bnombre" placeholder="Nombre del Cliente" onKeyPress="cargarCombo('bnombre')">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <p></p>
                <div id="tbl">
                
                </div><div class="tbl">
            <table width="100%" border="0" align="center">
                <tr>
                    <td>Id:</td>
                    <td><input name="idcotizacion" type="text" required class="cajas" id="idcotizacion" placeholder="" value="${cotizacion.idcotizacion}" size="30" readonly="readonly"></td>
                    <td>Fecha:</td>
                    <td><input name="fechacotizacion" type="text" required class="cajas" id="fechacotizacion" placeholder="Fecha" value="${cotizacion.fechacotizacion}" size="30" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td><input name="clientecotizacion" type="text" required class="cajas" id="clientecotizacion" placeholder="Nombre" value="${cotizacion.clientecotizacion}" size="30" readonly="readonly"></td>
                    <td>Total:</td>
                    <td><input name="totalcotizacion" type="text" required class="cajas" id="totalcotizacion" placeholder="Total" value="${cotizacion.totalcotizacion}" size="30" readonly="readonly"></td>
                </tr>
            </table></div>
                <p></p>
                <form id="form3" name="form3" method="post /thermal/Controlador">        
                    <table width="100%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td align="center"><label for="bnombre">
                                        Producto:</label>
                                    <input name="bnombre" type="search" required class="cajas" id="bnombre" placeholder="Nombre del Producto" onKeyPress="cargarCombo1('bnombre1')">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <p></p>
                <div id="tbl2">
                
                </div>
                    <p></p>
                    <div class="tbl">
            <table width="100%" border="0" align="center" id="data_table">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Descripción</th>
                    <th>Costo</th>
                    <th>Cantidad</th>
                    <th>Total</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tfoot id="tfoot_table">
                <tr>
                    <td colspan=4 >SubTotal</td>
                    <td><input name="Subtotal" type='text' id="Subtotal" value="0" readonly="readonly" required class="cajas"></td>
                </tr>
                <tr>
                    <td colspan=4 >IVA</td>
                    <td><input name="Iva" type='text' id="Iva" value="0" readonly="readonly" required class="cajas"></td>
                </tr>
                <tr>
                    <td colspan=4 >Total</td>
                    <td><input name="Total" type='text' id="Total" value="0" readonly="readonly" required class="cajas"></td>
                </tr>
            </tfoot>
            <tbody id="data_tbody">
                <tr>
                    <td><input name="" type='text' id="" value="10" required class="cajas"></td>               
                    <td><input name="" type='text' id="" value="Cualquier cosa xD" required class="cajas"></td>
                    <td><input name="" type='text' id="" value="90" required class="cajas"</td>
                    <td><input name="" type='text' id="" value="80" required class="cajas"></td>
                    <td><input name="" type='text' id="" value="0" required class="cajas"></td>
                    <td><input type='button' value='Delete' id="delete_row" class='Boton' onclick='delete_row("1")'></td></tr>
            </tbody>           
            </table></div>                     
                </form>              
                <p></p>
        <button id="myBtn" align="center">Calcular</button>
                <table width="50%" border="0" align="center">
                    <p></p>
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
        <p></p>
        <p></p>
            </div>
        </c:if>       
        <script type="text/javascript">
            $(function() {
                $("#fechacotizacion").datepicker({
                    dateFormat: "yy-mm-dd",
                    changeMonth: true,
                    changeYear: true
                })
            });
             $("#myBtn").click(function(){
             var costo;
             var cantidad;
             var importe=0;
             var subto=0;
             var iva=0;
             var total=0;
             $('#data_table tr').each(function () {
            costo=$(this).find("td").eq(2).find("input").val();
            cantidad=$(this).find("td").eq(3).find("input").val();
            importe=(parseFloat(costo)*parseFloat(cantidad));
            $(this).find("td").eq(4).find("input").val(importe.toFixed(2));
            if (isNaN(importe, cantidad, costo, total)) {
            importe=0;
            cantidad=0;
            costo=0;
            total=0;
            }            
            subto=subto + importe;           
            });
            iva=subto*.16;
            total=subto+iva;
            $('#Subtotal').val(subto.toFixed(2));
            $('#Iva').val(iva.toFixed(2));
            $('#Total').val(total.toFixed(2));
            });
            
            function agrega1(id, nombrec){
                $("#idcotizacion").attr("value",id);
                $("#clientecotizacion").attr("value",nombrec);
            };
            
            function delete_row(no){
                $('#row'+no).remove();
            var costo;
            var cantidad;
            var importe=0;
            var subto=0;
            var iva=0;
            var total=0;
            $('#data_table tr').each(function () {                      
            costo=$(this).find("td").eq(2).find("input").val();
            cantidad=$(this).find("td").eq(3).find("input").val();
            importe=(parseFloat(costo)*parseFloat(cantidad));
            $(this).find("td").eq(4).find("input").val(importe.toFixed(2));
            if (isNaN(importe, cantidad, costo, total)) {
            importe=0;
            cantidad=0;
            costo=0;
            total=0;
            }
            subto=subto + importe;           
            });
            iva=subto*.16;
            total=subto+iva;
            $('#Subtotal').val(subto.toFixed(2));
            $('#Iva').val(iva.toFixed(2));
            $('#Total').val(total.toFixed(2));
             }
                     <%--%>function add_row(id, descripcion, costo)
            {
                var table=document.getElementById("data_tbody");
                var table_leng=(table.rows.length)-1; 
                alert(table_leng);
                var row = table.insertRow(table_leng).outerHTML="<tr id='row"+table_leng+"'><td><input type='text'  name=" + id + " value="+ id +" readonly='readonly'></td><td>" + descripcion + "</td><td id='cos"+table_leng+"'><input type='text' id='name_text"+table_leng+"' value=" + costo + " readonly='readonly'></td><td><input type='text' class='can"+table_leng+"'></td><td><input type='text' id='tot"+table_leng+"'></td><td><input type='button' value='Delete' id="Delete" class='Boton' onclick='delete_row("+ table_leng+")'></td></tr>";                
            } --%>            
        </script>
    </body>
</html>
