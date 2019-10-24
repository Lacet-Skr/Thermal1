<%@page import="Control.*"%>
<%@page import="Procesos.*"%>
<%@page import="ProcesosImpl.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
<%@page import="Clase.*"%>
<%@page import="Datos.*"%>
<!DOCTYPE html>
<%
    //String usuario = (String) session.getAttribute("usuario");
    //if(usuario==null){
            //request.getRequestDispatcher("index.jsp").forward(request, response);
    //}
    int id = BDProducto.ulProducto();
    request.setAttribute("id", id);
%>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Producto</title>
    <link href="comunes/estilos.css" rel="stylesheet" type="text/css">
    
    <link href="comunes/jquery.ui.core.min.css" rel="stylesheet" type="text/css">
        <link href="comunes/jquery.ui.theme.min.css" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <link href="comunes/jquery.ui.datepicker.min.css" rel="stylesheet" type="text/css">
        <script src="comunes/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="comunes/jquery.ui-1.10.4.datepicker.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            
            var peticion = false;
            var testPasado = false;
            try
            {
                peticion = new XMLHttpRequest();
                peticion2 = new XMLHttpRequest();
                peticion3 = new XMLHttpRequest();
            }
            catch (trymicrosoft)
            {
                try
                {
                    peticion = new ActiveXObject("Msxml2.XMLHTTP");
                    peticion2 = new ActiveXObject("Msxml2.XMLHTTP");
                    peticion3 = new ActiveXObject("Msxml2.XMLHTTP");
                }
                catch (othermicrosoft)
                {
                    try
                    {
                        peticion = new ActiveXObject("Microsoft.XMLHTTP");
                        peticion2 = new ActiveXObject("Microsoft.XMLHTTP");
                        peticion3 = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    catch (failed)
                    {
                        peticion = false;
                        peticion2 = false;
                        peticion3 = false;
                    }
                }
            }
            if (!peticion)
                alert("ERROR AL INICIALIZAR!");
            function cargarCombo() {
                
                var no = document.getElementById("linea123").value;
                var nu = no.length;
                if (nu >= 1) {
                    var element = document.getElementById("tbl");
                    var valordepende = document.getElementById(bnombre);
                    var x = valordepende.value;
                    var fragment_url = 'include/cargasubl1.jsp?linea14='+x+'&pag=productos';
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
    <body onload="cargarCombo()">
        <div id="header">
            <jsp:include page="/comunes/header.jsp"/>        
        </div>
            <div id="buscar">
                <p></p>
                <form id="form2" name="form2" method="post /thermal/Controlador">        
                    <input id="linea123" type="hidden" value="${linea.idlinea}"
                </form>
                <div id="tbl">
                    
                </div>
                <p></p>
            </div>
    </body>
</html>
