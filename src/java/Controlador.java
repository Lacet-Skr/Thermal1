/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Clase.Usuarios;
import Procesos.UsuarioProcesos;
import ProcesosImpl.UsuarioProcesosImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Control.*;
import Procesos.*;
import ProcesosImpl.*;

/**
 *
 * @author Dell
 */
@WebServlet(urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pag = request.getParameter("pag");
        String accion = request.getParameter("accion");//traemos esta variable desde index
        
        if("login".equals(accion)){
            this.login(request, response);//vamos al metodo login
        }else if("guardar".equals(accion)){
            this.guardar(request, response);
        }/*else if("catalogos".equals(accion)){
            CatalogosCon cn = new CatalogosCon();
            cn.listarCatalogos(request, response);
        }*/
        if (pag != null) {
            this.ir(request, response);
        }
        
        this.destroy();
    }
    
    protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("user");//lo traemos desde index
        String pass = request.getParameter("pass");//lo traemos desde index
        Usuarios u = new Usuarios();//creamos u
        u.setUsuario(user);
        u.setPassword(pass);
        Usuarios usu = new Usuarios();//creamos usu

        UsuarioProcesos usuariopro = UsuarioProcesosImpl.getInstancia();//por el singleton
        usu = usuariopro.usuarioExiste(u);//le pasamos el user y pass

        if (usu != null) {//si encontro un usuario nos trae todos los campos de dicho usuario
          HttpSession session = request.getSession();//trabajamos una sesion
            session.setAttribute("idusuario", usu.getIdusuario1());
            session.setAttribute("usuario", usu.getUsuario());
            
            request.getRequestDispatcher("panel.jsp").forward(request, response);//nos vamos al panel
       } else {//en caso de no encontrar usuario nos regresamos al index
            request.setAttribute("error", 1);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
    
    protected boolean verifica(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String usuario = (String) session.getAttribute("usuario");
        if (usuario == null) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return false;
        } else {
            return true;
        }
    }
    
    protected void ir(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        boolean ensesion = this.verifica(request, response);
        String pag = request.getParameter("pag")+".jsp";
        String evento = request.getParameter("evento");
        if (ensesion == true) {
            request.setAttribute("evento", evento);
            request.getRequestDispatcher(pag).forward(request, response);
        }

        if (pag == null) {
            request.getRequestDispatcher("panel.jsp").forward(request, response);
        }
    }
    
    protected void guardar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pag = request.getParameter("tab");
        if("menus".equals(pag)){
            MenuCon me = new MenuCon();
            me.evalua(request, response);
        }else if("permisos".equals(pag)){
            PermisoCon per = new PermisoCon();
            per.evalua(request, response);
        }else if("usuarios12".equals(pag)){
            UsuarioCon us = new UsuarioCon();
            us.evalua(request, response);
        }else if("productos".equals(pag)){
            ProductoCon us = new ProductoCon();
            us.evalua(request, response);
        }else if("lineas".equals(pag)){
            LineaCon us = new LineaCon();
            us.evalua(request, response);
        }else if("sublineas".equals(pag)){
            SublineaCon us = new SublineaCon();
            us.evalua(request, response);
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
