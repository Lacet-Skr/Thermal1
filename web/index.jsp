


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thermal</title>
         <link href="comunes/estilos.css" rel="stylesheet" type="text/css">
    </head>
    <body>
    <div class="contain">
		<form id="form1" name="form1" method="post" action="/thermal/Controlador">
         <table width="50%" border="0" align="center">
         <tbody>
                        <tr>
                            <td align="center"><p class="ti">Acceso al Sistema</p></td>
                        </tr>
                        <tr>
                            <td> <div class="username-span"></div><input name="user" type="text" required class="login-field" id="user" placeholder="Usuario"></td>
                        </tr>
                         <tr>
                            <td><div class="password-span"></div><input name="pass" type="password" required class="login-field" id="pass" placeholder="Password"></td>
                        </tr>
                        <tr>
                            <td align="center"><input name="accion" type="hidden" id="accion" value="login">                <input name="submit" type="submit" class="login" id="submit" value="Acceder"></td>
                        </tr>
                        <tr>
                            <td align="center">
                                <%--si no encontro ningun usuario nos regresa error --%>
                                <c:if test="${error != null}">
                                    <span class="error">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Verifica Tus Datos&nbsp;&nbsp;</span>
                                </c:if></td>
                        </tr>
                        </tbody>
                </table>
                                
            </form>
        </div>
    </body>
</html>