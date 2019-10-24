<%-- 
    Document   : header
    Created on : 30/08/2019, 10:29:18 AM
    Author     : LACET
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="Control.PermisoCon"%>
<%@page import="ProcesosImpl.PermisoProcesosImpl"%>
<%@page import="Procesos.PermisoProcesos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clase.Permisos"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="comunes/styles.css">
   <script src="comunes/script.js"></script>
   <script>
   	function msj(){
		alert("Lacet SKR \n 55-6750-2697"); 
	}
   </script>
        <title>Menu</title>
    </head>
    <body>
        <%
        int usuario = (int) session.getAttribute("idusuario");
        PermisoProcesos pre = PermisoProcesosImpl.getInstancia();
        ArrayList<Permisos> list = pre.listarPermisos(usuario);
        //for(Permisos pe : list){
    %>
    <div id='cssmenu'>
        <ul>
            <li class='last'><a href="/thermal/Controlador?pag=panel"><span>Inicio</span></a></li>
            <li class="has-sub"><a href="#"><span>Clientes</span></a>
            <ul>
                    <%for(Permisos pe : list){
                    if(1==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=clientes&evento=nuevo">Nuevo Cliente</a></li>
                    <%}
                    if(2==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=clientes&evento=editar">Modificar Cliente</a></li>
                    <%}
                    if(3==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=clientes&evento=consultar">Consultar Cliente</a></li>
                    <%}}%>
                </ul>
                </li>
                
                <li class="has-sub"><a href='#'><span>Proveedores</span></a>
   		<ul>
                    <%for(Permisos pe : list){
                    if(4==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=proveedores&evento=nuevo">Nuevo Proveedor</a></li>
                    <%}
                    if(5==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=proveedores&evento=editar">Modificar Proveedor</a></li>
                    <%}
                    if(6==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=proveedores&evento=consultar">Consultar Proveedor</a></li>
                    <%}}%>
                </ul>
                    </li>
                    
                    <li class="has-sub"><a href='#'><span>Almacen</span></a>
                    <ul>
                    <li class="has-sub"><a href='#'><span>Productos</span></a>
   		<ul>
                    <%for(Permisos pe : list){
                    if(7==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=ProductosLi&evento=nuevo">Nuevo Producto</a></li>
                    <%}
                    if(8==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=ProductosLi&evento=editar">Modificar Producto</a></li>
                    <%}
                    if(9==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=ProductosLi&evento=consultar">Consultar Producto</a></li>
                    <%}}%>
                </ul>
                    </li>
                    
                    
                    <li class="has-sub"><a href='#'><span>Lineas</span></a>
   		<ul>
                    <%for(Permisos pe : list){
                    if(10==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=lineas&evento=nuevo">Nuevas Lineas</a></li>
                    <%}
                    if(11==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=lineas&evento=editar">Modificar Lineas</a></li>
                    <%}
                    if(12==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=lineas&evento=consultar">Consultar Lineas</a></li>
                    <%}}%>
                </ul>
                    </li>
                    
                    
                    <li class="has-sub"><a href='#'><span>Sublienas</span></a>
   		<ul>
                    <%for(Permisos pe : list){
                    if(13==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=sublineas&evento=nuevo">Nuevas Sublienas</a></li>
                    <%}
                    if(14==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=sublineas&evento=editar">Modificar Sublienas</a></li>
                    <%}
                    if(15==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=sublineas&evento=consultar">Consultar Sublienas</a></li>
                    <%}}%>
                </ul>
                    </li>
                    </ul>
                </li>
                
                <li class="has-sub"><a href='#'><span>Compras</span></a>
   		<ul>
                    <%for(Permisos pe : list){
                    if(16==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=compras&evento=nuevo">Nueva Compra</a></li>
                    <%}
                    if(17==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=compras&evento=editar">Modificar Compra</a></li>
                    <%}
                    if(18==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=compras&evento=consultar">Consultar Compra</a></li>
                    <%}}%>
                </ul>
                    </li>
                    
                    <li class="has-sub"><a href='#'><span>Cotizaciones</span></a>
   		<ul>
                    <%for(Permisos pe : list){
                    if(19==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=cotizaciones&evento=nuevo">Nueva Cotizacion</a></li>
                    <%}
                    if(20==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=cotizaciones&evento=editar">Modificar Cotizacion</a></li>
                    <%}
                    if(21==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=cotizaciones&evento=consultar">Consultar Cotizacion</a></li>
                    <%}}%>
                </ul>
                    </li>
                    
                
   		<li class="has-sub"><a href='#'><span>Accseso</span></a>
                    <ul>
                    <li class="has-sub"><a href='#'><span>Usuarios</span></a>
   		<ul>
                    <%for(Permisos pe : list){
                    if(22==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=usuarios12&evento=nuevo">Nuevo Usuario</a></li>
                    <%}
                    if(23==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=usuarios12&evento=editar">Modificar Usuario</a></li>
                    <%}
                    if(24==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=usuarios12&evento=consultar">Consultar Usuario</a></li>
                    <%}}%>
                </ul>
                    </li>
                    
                    <li class="has-sub"><a href='#'><span>Permisos</span></a>
   		<ul>
                    <%for(Permisos pe : list){
                    if(25==pe.getMenu()){%>
                    <li><a href="/thermal/Controlador?pag=permisos&evento=nuevo">Nuevo Acceso</a></li>
                    <%}}%>
                </ul>
                    </li>
                    
                    </ul>
                </li>
               
                    
        <li class='last'><a href='#' onClick="msj()"><span>Contacto</span></a></li>
        
        <li class="last"><a href="/thermal/index.jsp"><span>Salir</span></a></li>
        </ul>
    </div>
    </body>
</html>