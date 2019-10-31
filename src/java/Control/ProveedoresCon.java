/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Clase.Proveedores;
import Procesos.ProveedoresProcesos;
import ProcesosImpl.ProveedoresProcesosImpl;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;

public class ProveedoresCon {
    
  private static ProveedoresProcesos proveedorpro = ProveedoresProcesosImpl.getInstancia();

    public void evalua(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String evento = request.getParameter("evento");
        if("nuevo".equals(evento)){
            this.nuevoProveedor(request, response);
        }else if("editar".equals(evento)){
            this.editarProveedor(request, response);
        }else if("buscar".equals(evento)){
            this.buscarProveedor(request, response);
        }
    }

    private void nuevoProveedor(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
     Proveedores p = new Proveedores();
     p.setIdproveedor(Integer.parseInt(request.getParameter("idproveedor")));
     p.setNombreproveedor(request.getParameter("nombre"));
     p.setRfcproveedor(request.getParameter("rfc"));
     p.setDireccionproveedor(request.getParameter("direccion"));
     p.setTelefonoproveedor(Integer.parseInt(request.getParameter("telefono")));
     p.setContactoproveedor(request.getParameter("contacto"));
     p.setObservacionesproveedor(request.getParameter("observaciones"));
     proveedorpro.nuevoProveedor(p);
     request.getRequestDispatcher("panel.jsp").forward(request, response);
    }

    private void editarProveedor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
     Proveedores p = new Proveedores();
     p.setIdproveedor(Integer.parseInt(request.getParameter("idproveedor")));
     p.setNombreproveedor(request.getParameter("nombre"));
     p.setRfcproveedor(request.getParameter("rfc"));
     p.setDireccionproveedor(request.getParameter("direccion"));
     p.setTelefonoproveedor(Integer.parseInt(request.getParameter("telefono")));
     p.setContactoproveedor(request.getParameter("contacto"));
     p.setObservacionesproveedor(request.getParameter("observaciones"));
     proveedorpro.editarProveedor(p);
     response.sendRedirect("panel.jsp");
    }

    private void buscarProveedor(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
      int id = Integer.parseInt(request.getParameter("par"));
      Proveedores p = proveedorpro.buscarProveedor(id);
      request.setAttribute("proveedor", p);
      request.setAttribute("evento", "editar");
      request.getRequestDispatcher("proveedores.jsp").forward(request, response);
    }
  
    public static ArrayList<Proveedores> listarProveedor(String nombre) throws ServletException, IOException{
      ArrayList<Proveedores>list = proveedorpro.listarProveedor(nombre);
      return list;
    }
     public static ArrayList<Proveedores> listarProveedor2() throws ServletException, IOException{
      ArrayList<Proveedores>list = proveedorpro.listarProveedor2();
      return list;
}
}