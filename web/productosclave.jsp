<%-- 
    Document   : productosclave
    Created on : 29/10/2019, 03:07:15 PM
    Author     : LACET
--%>


<%@page import="Control.UsuarioCon"%>
<%@page import="Procesos.*"%>
<%@page import="ProcesosImpl.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="include/errores.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
<%@page import="Clase.*"%>
<%@page import="Datos.*"%>
<!DOCTYPE html>

<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
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
            </script>
    </head>
    <body>
            <div id="buscar">
                <p></p>
                <form id="form2" name="form2" method="post /thermal/Controlador">        
                    <table width="50%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td align="center"><label for="bnombre">
                                        Clave:</label>
                                    <input name="bnombre" type="search" required class="cajas" id="bnombre" placeholder="Clave del Producto" onKeyPress="cargarCombo2('bnombre')">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
    </body>
   
