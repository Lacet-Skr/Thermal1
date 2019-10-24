<%-- 
    Document   : cargaclie
    Created on : 6/09/2019, 09:35:21 AM
    Author     : Tecra
--%>
<%@page import="java.util.ArrayList" %>
<%@page import="Clase.Clientes" %>
<%@page import="Control.ClienteCon" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
		.tbl {
	margin:0px;padding:0px;
	width:100%;
	border:1px solid #ffffff;
	-moz-border-radius-bottomleft:13px;
	-webkit-border-bottom-left-radius:13px;
	border-bottom-left-radius:13px;
	
	-moz-border-radius-bottomright:13px;
	-webkit-border-bottom-right-radius:13px;
	border-bottom-right-radius:13px;
	
	-moz-border-radius-topright:13px;
	-webkit-border-top-right-radius:13px;
	border-top-right-radius:13px;
	
	-moz-border-radius-topleft:13px;
	-webkit-border-top-left-radius:13px;
	border-top-left-radius:13px;
}.tbl table{
    border-collapse: collapse;
    border-spacing: 0;
	width:100%;
	height:100%;
	margin:0px;padding:0px;
}.tbl tr:last-child td:last-child {
	-moz-border-radius-bottomright:13px;
	-webkit-border-bottom-right-radius:13px;
	border-bottom-right-radius:13px;
}
.tbl table tr:first-child td:first-child {
	-moz-border-radius-topleft:13px;
	-webkit-border-top-left-radius:13px;
	border-top-left-radius:13px;
}
.tbl table tr:first-child td:last-child {
	-moz-border-radius-topright:13px;
	-webkit-border-top-right-radius:13px;
	border-top-right-radius:13px;
}.tbl tr:last-child td:first-child{
	-moz-border-radius-bottomleft:13px;
	-webkit-border-bottom-left-radius:13px;
	border-bottom-left-radius:13px;
}.tbl tr:hover td{
	
}
.tbl tr:nth-child(odd){ background-color:#56b6ff; }
.tbl tr:nth-child(even)    { background-color:#c1e6ff; }.tbl td{
	vertical-align:middle;
	
	
	border:1px solid #ffffff;
	border-width:0px 1px 1px 0px;
	text-align:center;
	padding:5px;/*
	font-size:10px;
	font-family:Arial;
	font-weight:normal;
	color:#044545;*/
}.tbl tr:last-child td{
	border-width:0px 1px 0px 0px;
}.tbl tr td:last-child{
	border-width:0px 0px 1px 0px;
}.tbl tr:last-child td:last-child{
	border-width:0px 0px 0px 0px;
}
.tbl tr:first-child td{
		background:-o-linear-gradient(bottom, #3fb8ff 5%, #aae9ff 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #3fb8ff), color-stop(1, #aae9ff) );
	background:-moz-linear-gradient( center top, #3fb8ff 5%, #aae9ff 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#3fb8ff", endColorstr="#aae9ff");	background: -o-linear-gradient(top,#3fb8ff,aae9ff);

	background-color:#3fb8ff;
	border:0px solid #ffffff;
	text-align:center;
	border-width:0px 0px 1px 1px;
	font-size:14px;
	font-family:Arial;
	font-weight:bold;
	color:#044545;
}
.tbl tr:first-child:hover td{
	background:-o-linear-gradient(bottom, #3fb8ff 5%, #aae9ff 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #3fb8ff), color-stop(1, #aae9ff) );
	background:-moz-linear-gradient( center top, #3fb8ff 5%, #aae9ff 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#3fb8ff", endColorstr="#aae9ff");	background: -o-linear-gradient(top,#3fb8ff,aae9ff);

	background-color:#3fb8ff;
}
.tbl tr:first-child td:first-child{
	border-width:0px 0px 1px 0px;
}
.tbl tr:first-child td:last-child{
	border-width:0px 0px 1px 1px;
}
        </style>
    </head>
    <body>
        <%
            String nombre = request.getParameter("nombre");
            ArrayList<Clientes> list = ClienteCon.listarCliente(nombre);
            String pag = request.getParameter("pag");
            String link = null;
            String evento = request.getParameter("evento");
            
            if("clientes".equals(pag)){
                link = "/thermal/Controlador?accion=guardar&tab=clientes&evento=buscar&par=";
            }
        %>
        <div class="tbl">
            <table width="50%" border="0">
                <tbody>
                    <tr>
                        <td width="10%">ID</td>
                        <td width="20%">Nombre</td>
                        <td width="10%"></td>
                        <td width="10%"></td>
                    </tr>
                    <% for (Clientes c : list) {%>
                    <tr>
                        <td align="center"><%= c.getIdcliente()%></td>
                        <td align="center"><%= c.getNombrecliente()%></td>
                        <td><a href="<%= link + c.getIdcliente()%>">Ver</a></td>
                        <td><input type='button' value='Agregar' class='Boton' id="Agregar" onclick="agrega1('<%= c.getIdcliente() %>','<%= c.getNombrecliente() %>')"/></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>