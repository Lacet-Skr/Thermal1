
<%@page import="Control.ProveedoresCon"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
<%@page import="Clase.*"%>
<%@page import="Datos.*"%>
<!DOCTYPE html>

 <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Compras</title>
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
            function cargarCombo2(bdescripcion) {
                var no = document.getElementById(bdescripcion).value;
                var nu = no.length;
                if (nu >= 2) {
                    
                    var element = document.getElementById("tbl");
                  
                    var valordepende = document.getElementById(bdescripcion);
                    var x = valordepende.value;
                  
                    var fragment_url = 'include/cargaproducto.jsp?nombre='+x+'&pag=compras';
                 
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
                
                if (nu >= 2) {
                
                    var element = document.getElementById("tbl2");
              
                    var valordepende = document.getElementById(bnombre);
                    
                    var x = valordepende.value;
                  
                    var fragment_url = 'include/cargaproveedor.jsp?nombre='+x+'&pag=compras';
                   
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
        <div id="buscar"> 
            <h2 class="ti">Orden de compra</h2>
                <form id="form4" name="form4" method="post /thermal/Controlador">        
                    <table width="50%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td align="center"><label for="bnombre">
                                        Proveedor:</label>
                                    <input name="bnombre" type="search" required class="cajas" id="bnombre" placeholder="Nombre del Proveedor" onKeyPress="cargarCombo1('bnombre')">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
        </div>
        <div id="tbl2">
        </div>
        <div id="buscar">
            <form id="form5" name="form5" action="/thermal/Controlador" method="post">
                <table width="80%" border="0" align="center">
                    <tbody>
                        <tr>
                            <td width="22%" align="right"><input name="tab" type="hidden" id="tab" value="compras">
                                <input name="accion" type="hidden" id="accion" value="guardar">
                                <input name="evento" type="hidden" id="evento" 
                                       value="${evento}">
                                Proveedor:</td>
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
                            <td align="right">Direccion:</td>
                            <td colspan="4"><input name="direccion" type="text" class="cajas" id="direccion" value="${proveedor.direccionproveedor}">          
                        </tr>
                        <tr>
                            <td align="right">RFC:</td>
                            <td colspan="2"><input name="rfc" type="text" class="cajas" id="rfc" value="${proveedor.rfcproveedor}">  
                          
                            <td align="right">Tel/Fax:</td>
                            <td colspan="4"><input name="telefono" type="text" class="cajas" id="telefono" value="${proveedor.telefonoproveedor}">          
                        </tr> 
                        <tr>
                            <td align="right">AT'N:</td>
                            <td colspan="4"><input name="contacto" type="text" id="contacto" value="${proveedor.contactoproveedor}">   <style> #contacto{ left: 10px;}</style>       
                        </tr>
                    </tbody>
                </table>
            </form>
            </div>
            <div id="buscar"> 
                <form id="form" name="form" method="post /thermal/Controlador">        
                    <table width="50%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td align="center"><label for="bdescripcion">
                                        Producto:</label>
                                    <input name="bdescripcion" type="search" required class="cajas" id="bdescripcion" placeholder="Nombre del Producto" onKeyPress="cargarCombo2('bdescripcion')">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
        </div>
        <div id='tbl'>
        </div>
       <div id="buscar">
          <table align="center" id="data_table" border=1>
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
                    <td><input name="Subtotal" type='text' id="Subtotal" value="0" readonly="readonly"></td>
                </tr>
                <tr>
                    <td colspan=4 >IVA</td>
                    <td><input name="Iva" type='text' id="Iva" value="0" readonly="readonly"></td>
                </tr>
                <tr>
                    <td colspan=4 >Total</td>
                    <td><input name="Total" type='text' id="Total" value="0" readonly="readonly"></td>
                </tr>
            </tfoot>
            <tbody id="data_tbody">
                
            </tbody>
        </table>    
           
       
           <center><button id="btn1"><style> #btn1{ height: 39px; width: 100px; background: yellow; }</style>Comprobar Calculo</button>
               <button id="btn2"><style> #btn2{ height: 35px; width: 100px; background: greenyellow;}</style>Guardar</button>
           </center>
       </div>
        
        <script type="text/javascript">
        $(function () {
                $("#fechacompra").datepicker({
                    dateFormat: "yy-mm-dd",
                    changeMonth: true,
                    changeYear: true
                });
            });
          
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
           if (isNaN(importe)) {
            importe=0;     
            }
            subto=subto + importe;           
            });
            iva=subto*.16;
            total=subto+iva;
            $('#Subtotal').val(subto.toFixed(2));
            $('#Iva').val(iva.toFixed(2));
            $('#Total').val(total.toFixed(2));
             }   
             $("#btn1").click(function(){
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
           if (isNaN(importe)) {
            importe=0;   
            }
            subto=subto + importe;           
            });
            iva=subto*.16;
            total=subto+iva;

            $('#Subtotal').val(subto.toFixed(2));
            $('#Iva').val(iva.toFixed(2));
            $('#Total').val(total.toFixed(2));
            });
   
            function add_row(id, descripcion, costo)
            {
                var table=document.getElementById("data_tbody");
                var table_leng=(table.rows.length)-1; 
                var row = table.insertRow(table_leng).outerHTML="<tr id='row"+table_leng+"'><td><input type='text'  name=" + id + " value="+ id +" readonly='readonly'></td><td>" + descripcion + "</td><td id='cos"+table_leng+"'><input type='text' id='name_text"+table_leng+"' value=" + costo + " readonly='readonly'></td><td><input type='text' class='can"+table_leng+"'></td><td><input type='text' id='tot"+table_leng+"'></td><td><input type='button' value='Delete' clss='delete' onclick='delete_row("+ table_leng+")'></td></tr>";                
            }
            </script>            
    </body>
</html>
