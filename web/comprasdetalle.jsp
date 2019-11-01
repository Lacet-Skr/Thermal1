<%@page import="Control.ComprasDetalleCon"%>
<%@page import="Control.ProveedoresCon"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
<%@page import="Clase.*"%>
<%@page import="Datos.*"%>
<!DOCTYPE html>
<% 
    //String usuario = (String) session.getAttribute("usuario");
	//if(usuario==null){
    //request.getRequestDispatcher("index.jsp").forward(request, response);
	//}
        
   %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compras Detalle</title>
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
                    
                    var element = document.getElementById("tbl1");
                  
                    var valordepende = document.getElementById(bdescripcion);
                    var x = valordepende.value;
                  
                    var fragment_url = 'include/cargaproveedor.jsp?nombre='+x+'&pag=comprasdetalle';
                 
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
        <div id="tbl">
       </div>
        <div id="panel">
            
        </div>
    </body>
</html>
