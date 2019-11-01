/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import  javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Clase.ComprasDetalle;
import Procesos.ComprasDetalleProcesos;
import ProcesosImpl.ComprasDetalleProcesosImpl;
import java.util.ArrayList;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import java.io.IOException;

public class ComprasDetalleCon {
    private static ComprasDetalleProcesos detallepro = ComprasDetalleProcesosImpl.getInstancia();

    public void evalua(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String evento = request.getParameter("evento");
        if("nuevo".equals(evento)){
            this.nuevaCompraDetalle(request, response);
        }else if("editar".equals(evento)){
            this.editarCompraDetalle(request, response);
        }else if("buscar".equals(evento)){
            this.buscarCompraDetalle(request, response);
        }
    }

    private void nuevaCompraDetalle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      ComprasDetalle cd = new ComprasDetalle();
      cd.setIdcomprasdetalle(Integer.parseInt(request.getParameter("idcompradetalle")));
      cd.setCompra(Integer.parseInt(request.getParameter("compra")));
      cd.setProducto(Integer.parseInt(request.getParameter("producto")));
      cd.setCantidad(Integer.parseInt(request.getParameter("Cantidad")));
      cd.setPrecio(Double.parseDouble(request.getParameter("precio")));
      cd.setObservaciones(request.getParameter("observaciones"));
      cd.setProyecto(request.getParameter("proyecto"));
      cd.setDescuento(Integer.parseInt(request.getParameter("descuento")));
      detallepro.nuevaCompraDetalle(cd);
      request.getRequestDispatcher("panel.jsp").forward(request, response);
    }

    private void editarCompraDetalle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      ComprasDetalle cd = new ComprasDetalle();
      cd.setIdcomprasdetalle(Integer.parseInt(request.getParameter("idcompradetalle")));
      cd.setCompra(Integer.parseInt(request.getParameter("compra")));
      cd.setProducto(Integer.parseInt(request.getParameter("producto")));
      cd.setCantidad(Integer.parseInt(request.getParameter("Cantidad")));
      cd.setPrecio(Double.parseDouble(request.getParameter("precio")));
      cd.setObservaciones(request.getParameter("observaciones"));
      cd.setProyecto(request.getParameter("proyecto"));
      cd.setDescuento(Integer.parseInt(request.getParameter("descuento")));
      detallepro.editarCompraDetalle(cd);
      response.sendRedirect("panel.jsp");
    }

    private void buscarCompraDetalle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     int id = Integer.parseInt(request.getParameter("par"));
     ComprasDetalle cd = detallepro.buscarCompraDetalle(id);
     request.setAttribute("detalle", cd);
     request.setAttribute("evento", "editar");
     request.getRequestDispatcher("comprasdetalle.jsp").forward(request, response);
    }
    public static ArrayList<ComprasDetalle> listarCompraDetalle(String descripcion) throws ServletException, IOException{
      ArrayList<ComprasDetalle> list = detallepro.listarCompraDetalle(descripcion);
      return list;
    }
    
}
