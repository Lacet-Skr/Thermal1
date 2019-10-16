/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Clase.Menus;
import Procesos.MenuProcesos;
import ProcesosImpl.MenuProcesosImpl;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
/**
 *
 * @author LACET
 */
public class MenuCon {
    private static MenuProcesos menupro=MenuProcesosImpl.getInstancia();
    
    public void evalua(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String evento = request.getParameter("evento");
         if("nuevo".equals(evento)){
             this.nuevoMenu(request, response);
         }else if("editar".equals(evento)){
             this.editarMenu(request, response);
         }else if("buscar".equals(evento)){
             this.buscarMenu(request, response);
         }
     }
    
    private void nuevoMenu (HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        Menus m = new Menus();
        m.setIdmenu(Integer.parseInt(request.getParameter("idmenu")));
        m.setMenu(request.getParameter("menu"));
        menupro.nuevoMenu(m);
        request.getRequestDispatcher("panel.jsp").forward(request, response);
    }
    
    private void editarMenu (HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        Menus m = new Menus();
        m.setIdmenu(Integer.parseInt(request.getParameter("idmenu")));
        m.setMenu(request.getParameter("menu"));
        menupro.editarMenu(m);
        response.sendRedirect("panel.jsp");
    }
    
    private void buscarMenu (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
          int id = Integer.parseInt(request.getParameter("par"));
          Menus m = menupro.buscarMenu(id);
          request.setAttribute("menu", m);
          request.setAttribute("evento", "editar");
          request.getRequestDispatcher("permisos.jsp").forward(request, response);
      }
    
     public static ArrayList<Menus>listarMenu(String nombre)throws ServletException, IOException{
        ArrayList<Menus>list = menupro.listarMenu(nombre);
        return list;
    }
     
      
}
