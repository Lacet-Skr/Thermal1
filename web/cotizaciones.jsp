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
            function cargarCombo4(bnombre2) {
                var no = document.getElementById(bnombre2).value;
                var nu = no.length;
                if (nu >= 2) {
                    var element = document.getElementById("tbl");
                    var valordepende = document.getElementById(bnombre2);
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
                    var fragment_url = 'include/cargaprod.jsp?descripcion='+x+'&pag=cotizaciones';
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
                if (nu >= 0) {
                    //Obtenemos el contenido del div
                    //donde se cargaran los resultados
                    var element = document.getElementById("tbl1");
                    //Obtenemos el valor seleccionado del combo anterior
                    var valordepende = document.getElementById(bnombre);
                    var x = valordepende.value;
                    //construimos la url definitiva
                    //pasando como parametro el valor seleccionado
                    var fragment_url = 'include/cargaprodclave.jsp?clave='+x+'&pag=cotizaciones';
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
            
            function myFunction2(linea) {
               var element = document.getElementById("tbl1");
                var x = linea;
                var url = 'include/combosub2.jsp?linea='+x+'&pag=cotizaciones';
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
                var x = sublinea;4
                var url = 'include/cargaprod2.jsp?sublinea='+x+'&pag=cotizaciones';
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
                    var url = 'productosdesc.jsp?';
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
    <body>
        <div id="header">
            <jsp:include page="comunes/header.jsp"/>
        </div>
            <div id="buscar">
                <p></p>
                <form id="form2" name="form2" method="post /thermal/Controlador">        
                    <table width="100%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td align="center"><label for="bnombre2">
                                        Clientes:</label>
                                    <input name="bnombre2" type="search" required class="cajas" id="bnombre2" placeholder="Nombre del Cliente" onKeyPress="cargarCombo4('bnombre2')">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <p></p>
                <div id="tbl">
                
                </div><div class="tbl">
                    <form id="form3" name="form3" method="post /thermal/Controlador"> 
            <table width="100%" border="0" align="center">
                <tr>
                    <td>Cliente:</td>
                    <td><input name="clientecotizacion" type="text" required class="cajas" id="clientecotizacion" placeholder="" value="${cliente.nombrecliente}" size="30" readonly="readonly"></td>
                    <td>Tel:</td>
                    <td><input name="telclicotizacion" type="text" required class="cajas" id="telclicotizacion" placeholder="Tel" value="${cliente.telcliente}" size="30" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input name="emailcliente" type="text" required class="cajas" id="clientecotizacion" placeholder="Email" value="${cliente.emailcliente}" size="30" readonly="readonly"></td>
                    <td>Atención:</td>
                    <td><input name="contactocliente" type="text" required class="cajas" id="totalcotizacion" placeholder="Contacto" value="${cliente.contactocliente}" size="30" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>Fecha:</td>
                    <td><input name="fechacotizacion" type="text" required class="cajas" id="fechacotizacion" placeholder="Fecha" value="" size="30" readonly="readonly"></td>
                    <td>Tiempo-Entrega:</td>
                    <td><input name="entregacotizacion" type="text" required class="cajas" id="entregacotizacion" placeholder="Entrega" value="" size="30"></td>
                </tr>
            </table>
                <p></p>
                    <table width="100%" border="0" align="center">
                        <tbody>
                            <select name="busqueda" id="busqueda" onchange="Busqueda(this.value)">
                            <option value="" disable selected>Busqueda..</option>
                            <option value="descripcion">Descripcion</option>
                            <option value="clave">Clave</option>
                            <option value="linea">Linea & Sublinea</option>
                            </select>
                        </tbody>
                        <div id="tbl2">
                            
                        </div>
                        <div id="tbl1">
                
                </div>
                        <div id="tbl3">
                
                </div>
                    </table>
                    <p></p>
                
                    <div class="tbl">
            <table width="100%" border="0" align="center" id="data_table">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Descripción</th>
                    <th>Unidad</th>
                    <th>Costo</th>
                    <th>Cantidad</th>
                    <th>Total</th>
                    <th>Accion</th>
                </tr>
            </thead>
            <tfoot id="tfoot_table">
                <tr>
                    <td colspan=5 >Costo</td>
                    <td><input name="Costo" type='text' id="Costo" value="0" readonly="readonly" required class="cajas"></td>
                </tr>
                <tr>
                    <td colspan=5 >Utilidad %</td>
                    <td><input name="Utilidadp" type='text' id="Utilidadp" value="0" required class="cajas"></td>
                </tr>
                <tr>
                    <td colspan=5 >Utilidad $</td>
                    <td><input name="Utilidad" type='text' id="Utilidad" value="0" readonly="readonly" required class="cajas"></td>
                </tr>
                <tr>
                    <td colspan=5 >SubTotal</td>
                    <td><input name="Subtotal" type='text' id="Subtotal" value="0" readonly="readonly" required class="cajas"></td>
                </tr>
                <tr>
                    <td colspan=5 >IVA</td>
                    <td><input name="Iva" type='text' id="Iva" value="0" readonly="readonly" required class="cajas"></td>
                </tr>
                <tr>
                    <td colspan=5 >Total</td>
                    <td><input name="Total" type='text' id="Total" value="0" readonly="readonly" required class="cajas"></td>
                </tr>
            </tfoot>
            <tbody id="data_tbody">
            </tbody>           
            </table></div>                     
                </form>  
                </div>
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
             var subto=0;
             var iva=0;
             var total=0;
             var importe=0;
             var utilidadp=0;
             var utilidadm=0;
             var costo1=0;
             $('#data_table tr').each(function () {
            costo=$(this).find("td").eq(3).find("input").val();
            cantidad=$(this).find("td").eq(4).find("input").val();
            importe=(parseFloat(costo)*parseFloat(cantidad));
            $(this).find("td").eq(5).find("input").val(importe.toFixed(2));
            if (isNaN(importe, cantidad, costo, total, utilidadp, utilidadm, costo1)) {
            cantidad=0;
            costo=0;
            total=0;
            importe=0;
            utilidadp=0;
            utilidadm=0;
            costo1=0;
            }            
            costo1=costo1 + importe;           
            });
            utilidadp=$('#Utilidadp').val();
            var porcentaje = utilidadp * costo1;
            utilidadm = porcentaje/100;
            subto = costo1 + utilidadm;
            iva = subto * .16;
            total=subto+iva;
            $('#Costo').val(costo1.toFixed(2));
            $('#Utilidad').val(utilidadm.toFixed(2));
            $('#Subtotal').val(subto.toFixed(2));
            $('#Iva').val(iva.toFixed(2));
            $('#Total').val(total.toFixed(2));
            });
            
             function delete_row(no){
                document.getElementById("row"+no+"").outerHTML="";//esto es para eliminar los tr
               //pasarsela a un input el cual utilizaremos en el baken se pone aqui en caso de que eliminemos todos los registros
            }
             
             function add_row(id, producto, unidad, costo)
            {
                var table=document.getElementById("data_tbody");
                var table_leng=(table.rows.length)-1;
                var row = table.insertRow(table_leng).outerHTML="<tr id='row"+table_leng+"'><td id='id_producto"+table_leng+"'>"+ id+"<input type='hidden' value='"+id+"'></td><td id='permiso"+table_leng+"'>"+ producto+"<input type='hidden' value='"+producto+"'></td><td id='unidad"+table_leng+"'>"+ unidad+"<input type='hidden' value='"+unidad+"'></td><td id='costo"+table_leng+"'>"+ costo+"<input type='hidden' value='"+costo+"'></td><td id='cantidad"+table_leng+"'><input type='text' class='cantidad"+table_leng+"'></td><td id='total"+table_leng+"'><input type='text' readonly='readoly' class='total"+table_leng+"'></td><td> <input type='button' value='Delete' clss='delete' onclick='delete_row("+ table_leng+")'></td></tr>";//aqui es para poder agregar nuevos permisos la funcion s e llama desde el carga de menu                                 
                
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
