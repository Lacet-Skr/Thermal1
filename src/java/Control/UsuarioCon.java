/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Clase.*;
import Procesos.*;
import ProcesosImpl.*;
import DAO.*;
import DAO.Factory.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
/**
 *
 * @author LACET
 */
public class UsuarioCon {
    
    
    private static UsuarioProcesos usuariopro = UsuarioProcesosImpl.getInstancia();
    
    public void evalua (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String evento = request.getParameter("evento");
        if("nuevo".equals(evento)){
            this.nuevoUsuarios(request, response);
        }else if("editar".equals(evento)){
            this.editarUsuarios(request, response);
        }else if("buscar".equals(evento)){
            this.buscarUsuarios(request, response);
        }else if ("buscarpermiso".equals(evento)){
            this.buscarUsuariosPermisos(request, response);
        }
    }
    
    private void nuevoUsuarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuarios u = new Usuarios();
        u.setIdusuario1(Integer.parseInt(request.getParameter("idusuario")));
        u.setUsuario(request.getParameter("usuario1"));
        u.setPassword(request.getParameter("password1"));
        usuariopro.nuevoUsuarios(u);
        request.getRequestDispatcher("panel.jsp").forward(request, response);
    }
    
    private void editarUsuarios(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        Usuarios u = new Usuarios();
        u.setIdusuario1(Integer.parseInt(request.getParameter("idusuario")));
        u.setUsuario(request.getParameter("usuario1"));
        u.setPassword(request.getParameter("password1"));
        usuariopro.editarUsuarios(u);
        request.getRequestDispatcher("panel.jsp").forward(request, response);
    }
    
    private void buscarUsuarios (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
          int id = Integer.parseInt(request.getParameter("parsin"));
          Usuarios u = usuariopro.buscarUsuarios(id);
          request.setAttribute("usuarios1", u);
          request.setAttribute("evento", "editar");
          request.getRequestDispatcher("usuarios12.jsp").forward(request, response);
      }
    
    private void buscarUsuariosPermisos (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
          int id = Integer.parseInt(request.getParameter("parsin"));
          Usuarios u = usuariopro.buscarUsuarios(id);
          request.setAttribute("usuarios1", u);
          request.setAttribute("evento", "nuevo");
          request.getRequestDispatcher("permisos.jsp").forward(request, response);
    }
    
    
    public static ArrayList<Usuarios>listarUsuarios(String nombre)throws ServletException, IOException{
        ArrayList<Usuarios>list = usuariopro.listarUsuarios(nombre);
        return list;
    }
    
    
}

