<%@page import="Control.ComprasCon"%>
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
                  
                    var fragment_url = 'include/cargaproducto.jsp?nombre='+x+'&pag=Compra';
                 
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
                  
                    var fragment_url = 'include/cargaproveedor.jsp?nombre='+x+'&pag=Compra';
                   
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
                <form id="form4" name="form4" method="post /Thermal/Controlador">        
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
         <form id="formone" name="formone" method="post" action="/Thermal/Controlador">
            <table border="1" align="center">
                <tr>
                    <td>Id Proveedor:</td>
                    <td><input name="idbreprov" type="text" required class="cajas" id="idbreprov" placeholder="Nombre del Proveedor" value="" size="30" readonly="readonly"></td>
                    <td>Fecha:</td>
                    <td><input name="fechacompra" type="text" required class="cajas" id="fechacompra" placeholder="Fecha:" value="" size="30" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>Nombre Proveedor:</td>
                    <td><input name="nombreprov" type="text" required class="cajas" id="nombreprov" placeholder="Id del Proveedor" value="" size="30" readonly="readonly"></td>
                    <td>Referencia:</td>
                    <td><input name="referencia" type="text" required class="cajas" id="referencia" placeholder="Referencia" value="" size="30"></td>
                </tr>
            </table>
        </form>
        <div id="buscar">
                <form id="form3" name="form3" method="post /Thermal/Controlador">        
                    <table width="50%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td align="center"><label for="bdescripcion">
                                        Producto:</label>
                                    <input name="bdescripcion" type="search" required class="cajas" id="bdescripcion" placeholder="Descripcion del producto" onKeyPress="cargarCombo2('bdescripcion')">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
        </div>
        <div id="tbl">
        </div>
       
            <%-- Tabla donde se van agregando las partidas --%> 
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
  
        
        <button id="btn2">Guardar</button>
        <br>
        <br>
        <button id="btn1">Calcular</button>
        
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
