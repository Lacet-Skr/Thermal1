
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
            function cargarCombo6(bnombre1) {
                var no = document.getElementById(bnombre1).value;
                var nu = no.length;
                if (nu >= 2) {
                    
                    var element = document.getElementById("tbl6");
                   
                    var valordepende = document.getElementById(bnombre1);
                    var x = valordepende.value;
                   
                    var fragment_url = 'include/cargaprov.jsp?nombre='+x+'&pag=compras';
                    
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
             <h2 class="ti">Orden de compra</h2>
                <form id="form4" name="form4" method="post /thermal/Controlador">        
                    <table width="50%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td align="center"><label for="bnombre">
                                      Buscar Proveedor:</label>
                                    <input name="bnombre1" type="search" required class="cajas" id="bnombre1" placeholder="Nombre del Proveedor" onKeyPress="cargarCombo6('bnombre1')">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
        </div>
        <div id="tbl6">
        </div>
        <div id="buscar">
            <form id="formone" name="formone" method="post" action="/thermal/Controlador">
                <table align='center'>
                    <tbody>
                       <tr>
                            <td align="right">Proveedor:</td>
                            <td colspan="4"><input name="nombreprov" type="text" required class="cajas0" id="nombreprov" value="" readonly="readonly">  
                                <style>
                                    .cajas0{
                                       width: 350px;
                                    }
                                    .cajas5{
                                      width: 120px;
                                      float: left;
                                    }
                                </style>
                             <td align="right">Fecha:</td>
                            <td colspan="4"><input name="fechaprov" type="text" required class="cajas5" id="fechaprov" value="" readonly="readonly">  
                        </tr>
                        <tr>
                            <td align="right">Direcion:</td>
                            <td colspan="4"><input name="direccionprov" type="text" required class="cajas1" id="direccionprov" value="" readonly="readonly"> 
                                <style>
                                    .cajas1{
                                       width: 350px;
                                    }
                                    .cajas6{
                                      width: 120px;
                                      float: left;   
                                    }
                                    .cajas7{
                                      width: 120px;
                                      float: left;  
                                    }
                                </style>
                                <td align="right">Proyecto:</td>
                               <td colspan="4"><input name="proyecto" type="text" required class="cajas7" id="proyecto" value="" >
                                   
                               <td align="right">No. O.C:</td>
                            <td colspan="4"><input name="orden" type="text" required class="cajas6" id="orden" value="" >   
                        </tr>
                       <tr>
                            <td align="right">RFC:</td>
                            <td colspan="4"><input name="rfcprov" type="text" required class="cajas2" id="rfcprov" value="" readonly="readonly">   
                          <style>
                                    .cajas2{
                                       width: 250px;
                                       float: left;
                                    }
                                    .cajas3{
                                        width: 250px;
                                    }
                                </style>
                            <td align="right">Tel/Fax:</td>
                            <td colspan="4"><input name="telprov" type="text" required class="cajas3" id="telprov" value="" readonly="readonly">  
                       </tr>
                       <tr>
                           <td align='right'></td>
                            <td colspan="4"><input type="hidden"> 
                            <td align="right">AT'N:</td>
                            <td colspan="4"><input name="contactoprov" type="text" required class="cajas4" id="contactoprov" value="" readonly="readonly"> 
                                <style>
                                    .cajas4{
                                       width: 250px;
                                     
                                    }
                                    
                                </style>
                        </tr>
                    </tbody>
                </table>
                
            </form>
                
                </div>
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
        <div id="tbl2">
        <%-- cae lo del ajax de buscar productos --%>     
        </div>
      <div id="buscar">
        <form id="form" name="form" method="post /thermal/Controlador">
            <style>
                .tablas{
               border: 1px solid #black;
               width: 100%;
               margin: 0;
               padding: 0;
               border-collapse: collapse;
               border-spacing: 0;
                }
                .tablas th, td{
                text-align: center;
                padding: 1px;
                }
              .tablas tbody tr:nth-child(even){
              background-color: #56b6ff;
             }
             #btn1{
                 width: 100px;
                 height: 39px;
                 background-color: yellow;
             }
             #btn2{
                 width: 100px;
                 height: 39px;
                 background-color: yellowgreen;
                 position: relative;
                 left:40px;
             }
            </style>
            <div style="border : solid 2px #333;
            background : #E4E4E4;
            padding : 4px;
            width : 99%;
            height : 100px;
            overflow : auto; ">
          <table align="center" id="data_table" class="tablas" border=1>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Descripción</th>
                    <th>Costo</th>
                    <th>Cantidad</th>
                    <th>Descuento</th>
                    <th>Total</th>
                    <th>Acción</th>
                </tr>
            </thead>
          <tbody id="data_tbody"> 
            </tbody>
        </table>
         </div>
            <table id="obser">
            <tr>
             <td align="right">Total1:</td>
             <td colspan="4"><input name="Total1" id="Total1" type="text" class="obs"></td>  
                
             <td align="right">Descuento:</td>
             <td colspan="4"><input name="Descuento" id="Descuento" readonly type="text" class="obs"></td>
              
             <td align="right">Subtotal:</td>
             <td colspan="4"><input name="Subtotal" id="Subtotal" readonly type="text" class="obs"></td>
             
             <td align="right">IVA:</td>
             <td colspan="4"><input name="Iva"  id="Iva"  readonly type="text" class="obs"></td>
            
             <td align="right">Total:</td>
             <td colspan="4"><input name="Total" id="Total" readonly type="text" class="obs"></td>
              </tr>
              <tr>
             <td align="right">Observaciones:</td>
             <td colspan="4"><input name="observaciones" id="observaciones" type="text" class="obs"></td>
             
             <td align="right">No.Cotizacion:</td>
             <td colspan="4"><input name="cotizacion" id="cotizacion" type="text" class="obs"></td>
             
             <td align="right">Tiempo de Entrega:</td>
             <td colspan="4"><input name="entrega" id="entrega" type="text" class="obs"></td>
             
             <td align="right">Enviar a:</td>
             <td colspan="4"><input name="envio" id="observaciones" type="envio" class="obs"></td>
              </tr> 
               <tr>
              <td align="right">Condiciones de Pago:</td>    
              <select id="select">
                   <option value="0" ></option>
                  <option value="1">Contado</option>
                  <option value="2">Tarjeta</option>
                  <option value="2">Deposito</option>
              </select>
            </tr>
           
            </table>
   
            <style>
                #obser{
                  position:relative;
                   top: 2px;
                }
                #select{
                  position: relative;
                  top: 80px;
                  left: 130px;
                  
                }
                
                
            </style>
      </div>
             <%-- ************************** --%> 
       
        </form>
          <button id="btn1">Comprobar Calculo</button>
            <button id="btn2">Guardar</button>
            
          
      
        
        <script type="text/javascript">
        $(function () {
                $("#fechaprov").datepicker({
                    dateFormat: "yy-mm-dd",
                    changeMonth: true,
                    changeYear: true
                });
            });
             <%-- Función para eliminar partidas --%>
             function delete_row(no){
                $('#row'+no).remove();
            }
                <%-- Metemos la funcion para recalcular despues de eliminar --%>
    $('#data_table tr').each(function () {         
                var costo;
             var cantidad;
             var descuento;
             var importe=0;
             var subto=0;
             var iva=0;
             var total=0;
             var resultado;
             
            //id = $(this).find("td").eq(0).html();//trae el id
            //descripcion = $(this).find("td").eq(1).html();//trae la descripcion
            //var costo = $(this).find("td").eq(2).html();//trae el costo
            costo=$(this).find("td").eq(2).find("input").val();//trae lo que esta dentro de un input, que esta dentro de un td
            cantidad=$(this).find("td").eq(3).find("input").val();//trae lo que esta dentro de un input, que esta dentro de un td
            descuento=$(this).find("td").eq(4).find("input").val();
            importe=(parseFloat(costo)*parseFloat(cantidad))//multiplicamos el costo por la cantidad y se la damos a el input
            $(this).find("td").eq(5).find("input").val(importe.toFixed(2));//multiplicamos el costo por la cantidad y se la damos a el input
           if (isNaN(importe)) {
            importe=0;     // si importe trae NaN le ponemos 0 para no obtener un NaN
            }
            subto=subto + importe;
            });
            iva=subto*.16;
            total=subto+iva/100;
            
            $('#Subtotal').val(subto.toFixed(2));
            $('#Iva').val(iva.toFixed(2));
            $('#Total').val(total.toFixed(2));
            <%-- termina función de recalcular --%>
                
             
             <%-- Función para calcular partidas --%>
             $("#btn1").click(function(){
             var costo;
             var cantidad;
             var importe=0;
             var subto=0;
             var iva=0;
             var total=0;
             var des=0;
             $('#data_table tr').each(function () {
            //id = $(this).find("td").eq(0).html();//trae el id
            //descripcion = $(this).find("td").eq(1).html();//trae la descripcion
            //var costo = $(this).find("td").eq(2).html();//trae el costo
            costo=$(this).find("td").eq(2).find("input").val();//trae lo que esta dentro de un input, que esta dentro de un td
            //$(this).find("td").eq(2).find("input").attr("name","")
            cantidad=$(this).find("td").eq(3).find("input").val();//trae lo que esta dentro de un input, que esta dentro de un td
            //descuento=$(this).find("td").eq(4).find("input").val();
            importe=(parseFloat(costo)*parseFloat(cantidad));//multiplicamos el costo por la cantidad y se la damos a el input
            $(this).find("td").eq(5).find("input").val(importe.toFixed(2));//multiplicamos el costo por la cantidad y se la damos a el input
           if (isNaN(importe)) {
            importe=0;     // si importe trae NaN le ponemos 0 para no obtener un NaN
            }
            subto=subto + importe;           
            });
            var porcentaje('#Descuento').val();
            
            iva=subto*.16;
            total=subto+iva;
           
            //$('#tfoot_table tr').find("td").eq(1).find("input").val(subto);
            
            $('#Subtotal').val(subto.toFixed(2));
            $('#Iva').val(iva.toFixed(2));
            $('#Total').val(total.toFixed(2));
            });
            <%-- ********************* --%>
         <%-- Función para agregar partidas --%>
            
            <%-- Función para agregar los datos del proveedor--%>
            //function agrega_prov(nombreprov, direccionprov, rfcprov, telprov, contactoprov){
               // $("#nombreprov").attr("value",nombreprov);
              //  $("#direccionprov").attr("value",direccionprov);
              //  $("#rfcprov").attr("value",rfcprov);
             //   $("#telprov").attr("value",telprov);
           //     $("#contactoprov").attr("value",contactoprov);
            //};
            <%-- Función para ordenar y enviar partidas al backend --%>
             $("#btn2").click(function(){
                var conta=0;    
                $('#data_tbody tr').each(function () {
                     $(this).find("td").eq(0).find("input").attr("name",conta + "A");//renombramos el atributo name
                     //alert($(this).find("td").eq(0).find("input").attr('name'));
                     conta++;
                 });
             });
             <%--para la fecha en base al id del campo--%>
            $(function () {
                $("#fechacompra").datepicker({
                    dateFormat: "yy-mm-dd",
                    changeMonth: true,
                    changeYear: true
                });
            });
            </script>  
            <script>
                function add_row(id, producto, unidad, costo)
            {
                var table=document.getElementById("data_tbody");
                var table_leng=(table.rows.length)-1; 
                var row = table.insertRow(table_leng).outerHTML="<tr id='row"+table_leng+"'><td><input type='text' class='id' name=" + id + " value="+ id +" readonly='readonly'></td><td>" + producto + "</td><td id='cos"+table_leng+"'><input type='text' id='name_text"+table_leng+"' value=" + costo + " readonly='readonly' class='costo'></td><td><input type='text' id='cantidad' class='can"+table_leng+"'></td><td><input type='text' id='descuento' class='des"+table_leng+"'></td><td><input type='text' class='total' id='tot"+table_leng+"'></td><td><input type='button' value='Eliminar' class='delete' onclick='delete_row("+ table_leng+")'></td></tr>";                                           
            }
                
                </script>
            <style>
                .delete{
                    background-color: gold;
                }
                .id{
                    border: none;
                    background: none;
                    text-align: center;
                }
                .costo{
                    border: none;
                    background: none;
                    text-align: center;
                }
                #cantidad{
                  border: none;
                  background: none; 
                  text-align: center;
                }
                .total{
                    border: none;
                    background: none;
                    text-align: center;
                }
                .input{
                    border: none;
                    background: none;
                    text-align: center; 
                }
                #descuento{
                    border: none;
                    background: none;
                    text-align: center;  
                }
            </style>
    </body>

</html>
