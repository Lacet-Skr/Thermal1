<%-- 
    Document   : Permisos
    Created on : 20/09/2019, 10:21:28 AM
    Author     : LACET
--%>


<%@page import="Control.*"%>
<%@page import="Procesos.*"%>
<%@page import="ProcesosImpl.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="include/errores.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
<%@page import="Clase.*"%>
<%@page import="Datos.*"%>
<!DOCTYPE html>
<%
	String usuario = (String) session.getAttribute("usuario");
	if(usuario==null){
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
        
        MenuProcesos menuprocesoss = MenuProcesosImpl.getInstancia();// aqui ocupamos el procesos e procesos impl para poder acceder a la base de datos
%>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Permisos</title>
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
            function cargarCombo(bnombre) {
                var no = document.getElementById(bnombre).value;
                var nu = no.length;
                if (nu >= 2) {
                    //Obtenemos el contenido del div
                    //donde se cargaran los resultados
                    var element = document.getElementById("tbl");
                    //Obtenemos el valor seleccionado del combo anterior
                    var valordepende = document.getElementById(bnombre);
                    var x = valordepende.value;
                    //construimos la url definitiva
                    //pasando como parametro el valor seleccionado
                    var fragment_url = 'include/cargaus.jsp?nombre='+x+'&pag=permisos';
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
                    var fragment_url = 'include/cargamen.jsp?nombre='+x+'&pag=permisos';
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
        <div id="header">
            <jsp:include page="/comunes/header.jsp"/>        
        </div>
        <div id="buscar">
                <form id="form2" name="form2" method="post /thermal/Controlador">        
                    <table width="50%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td align="center"><label for="bnombre">
                                        Usuario:</label>
                                    <input name="bnombre" type="search" required class="cajas" id="bnombre" placeholder="Nombre del Usuario" onKeyPress="cargarCombo('bnombre')">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <div id="tbl">
                    <table width="50%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <p></p>
                </div>
        
                <div id="panel">
                    <form id="form1" name="form1" method="post" action="/thermal/Controlador">
                        <table width="80%" border="0" align="center">
                            <tbody>
                                <tr>
                            <td width="22%" align="right"><input name="tab" type="hidden" id="tab" value="permisos">
                                <input name="accion" type="hidden" id="accion" value="guardar">
                                <input name="evento" type="hidden" id="evento" 
                                       value="${evento}">
                                Usuario:</td>
                            <td colspan="3"><input name="usuario1" type="text" readonly="readonly" required class="cajas" id="usuario1" value="${usuarios1.usuario}" size="30"><!-- este es el id del usuario el cual sirve para eliminar y para agregar permisos  -->
                                <input type="hidden" name="idusuario" id="idusuario" value="${usuarios1.idusuario1}">
                            <input type="hidden" name="longitud" id="longitud"><!-- esta el la longitud de nuestra tabla sirve para el for del baken -->
                            <td width="28%">&nbsp;</td>
                            
                            <td>
                                <input name="submit" type="submit" class="guardar" id="luis" value="  Guardar"><!-- ese es el boton su id es el que se ocupa para organizar los input -->
                            </td>
                        </tr>
                            </tbody>
                            </table>
                            
                            <table align="center" cellspacing=2 cellpadding=5 id="data_table" border=1>
                               
            <tr>
                <th>Permiso</th>
                <th>Eliminar</th>
            </tr>
           
            <%  String evento = request.getParameter("evento");//esto sirve para que se ejecute solo cuando ya allamos seleccionado el usuario
                if("buscarpermiso".equals(evento)){// aqui se evalua el evento y se ejecuta lo que sigue solo si el ebvento es igual a buscar permisos y esto lo enviamos
                    //desde el carga de usuarios ya que elegimos el usuario
                int idusu =Integer.parseInt(request.getParameter("parsin"));//aqui traemos el id del usuario
                ArrayList<Permisos> lis = PermisoCon.permisos(idusu);//aqui usamos el id del usuario para poder traer un arreglo de sus permiso
                for (Permisos per : lis) {//se hace un sor mejorado para poder pintar los datos del usuario
                int idmm = per.getMenu();//aqui almacenamos en una variable el id del menu
                request.setAttribute("idmm", idmm);// mandamos el id del menu mediante el request ya que no se puede convinar codigo java con htm sin un request
                Menus men = menuprocesoss.buscarMenu(idmm);//ocupamos el metodo buscar menu para poder sacar el nombre del menu y despues poder pintarlo
            %>
            <tr id="pi"><!-- se le pone un id cualquira al tr que despues sera cambiado para poder utilizar el boton delete -->
                <td><%= men.getMenu()%><input type="hidden" value="${idmm}"></td><td> <input id="Delete" type='button' value='Delete' clss='delete' onclick='delete_row()'></td>
            </tr>
            <script>
                var table=document.getElementById("data_table");
                var table_leng=(table.rows.length)-1;
                var funcio = "delete_row("+table_leng;//aqui empezamos a dormar la funcion del delete row para que sirva 
                var final = funcio+")";
                var iddel = "Delete"+table_leng;//aqui se va a formar el nuevo id del boton delete
                document.getElementById("Delete").setAttribute("id",iddel);//aqui lo que hacemos es cambiarle el id al input del boton eliminar
                document.getElementById(iddel).setAttribute("onclick",final);//se le cambia el contenido del evento onclick para que pueda funcionar correctamente
                var tr = "row"+table_leng;//se forma el nuevo id del tr
                document.getElementById("pi").setAttribute("id",tr);//se le cambia el id del tr
                </script>
                <%}%>
                <script>
                    var table=document.getElementById("data_table");
                    var table_leng=(table.rows.length)-2;
                    document.getElementById("longitud").setAttribute("value",table_leng);// en estas tres lineas lo que hacemos es almacenar la longitud de la tabla (solo los registros)para
                    //pasarsela a un input el cual utilizaremos en el baken se pone aqui en caso de que no alla ningun nuevo registro
                </script>
           <%}%>
           <tr>
               <td></td>
               <td></td>
           </tr>
        </table>
                            <script>
            function delete_row(no){
                document.getElementById("row"+no+"").outerHTML="";//esto es para eliminar los tr
                var table=document.getElementById("data_table");
                var table_leng1=(table.rows.length)-2;
                document.getElementById("longitud").setAttribute("value",table_leng1);// en estas tres lineas lo que hacemos es almacenar la longitud de la tabla (solo los registros)para
                    //pasarsela a un input el cual utilizaremos en el baken se pone aqui en caso de que eliminemos todos los registros
            }
            
            function add_row(id, menu)
            {
                var table=document.getElementById("data_table");
                var table_leng=(table.rows.length)-1;
                var row = table.insertRow(table_leng).outerHTML="<tr id='row"+table_leng+"'><td id='permiso_row"+table_leng+"'>"+ menu+"<input name='a"+table_leng+"' type='hidden' id='"+table_leng+"' value='"+id+"'></td><td> <input type='button' value='Delete' clss='delete' onclick='delete_row("+ table_leng+")'></td></tr>";//aqui es para poder agregar nuevos permisos la funcion s e llama desde el carga de menu                                 
                var table=document.getElementById("data_table");
                var table_leng1=(table.rows.length)-2;
                document.getElementById("longitud").setAttribute("value",table_leng1);// en estas tres lineas lo que hacemos es almacenar la longitud de la tabla (solo los registros)para
                    //pasarsela a un input el cual utilizaremos en el baken se pone aqui en caso de que se agreguen nuevos registros y ninguno se elimine
                
    
    }
    </script>
    </form>
                            </div>
                            <div id="buscar">
                <form id="form2" name="form2" method="post /thermal/Controlador">        
                    <table width="50%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td align="center"><label for="bnombre">
                                        Menu:</label>
                                    <input name="bnombre" type="search" required class="cajas" id="bnombre" placeholder="Nombre del Menu" onKeyPress="cargarCombo1('bnombre')">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <div id="tbl1">
                    <table width="50%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <p></p>
                </div>
           <script>
           $("#luis").click(function(){//aqui se le agrega un evento click al boton de guardar que tiene como id luis
        var lol = 0;//esta es la variable que ocuparemos para el nuevo name de los input
       $("#data_table tr").each(function (){//aqui ocupamos en each(for) para agregar una funcion y que se repita
           var pi =$(this).find("td").eq(0).find("input").val();//aqui ponemos el valor de el input en una variable para despues evaluarlo
           if(pi == undefined){//aqui evaluamos ya que tambien trae unos input undefineld asi que lo que acemos es que si es igual a undefineld no aga nada
           } else{//pones un esle ya eque en caso de que no sea un unndefineld si va a cambiar el name
               var name = "a" + lol;//aqui almacenamos en una variable el nuevo name que va a cambiar gracias al lol
         $(this).find("td").eq(0).find("input").attr("name",name); //aqui le cambiamos el name
         //var prueva = $(this).find("td").eq(0).find("input").attr("name");
         //alert(prueva);
     }
     lol++;//aqui le aumentamos 1 al valor de la variable lol
    });
        });
           </script>
    </body>
</html>
