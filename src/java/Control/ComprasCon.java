/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Clase.Compras;
import java.io.IOException;
import Procesos.ComprasProcesos;
import ProcesosImpl.ComprasProcesosImpl;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import java.util.ArrayList;
import java.sql.SQLException;

public class ComprasCon {
    private static ComprasProcesos comprapro = ComprasProcesosImpl.getInstancia();

    public void evalua(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String evento = request.getParameter("evento");
        if("nuevo".equals(evento)){
            this.nuevaCompra(request, response);
        }else if ("editar".equals(evento)){
            this.editarCompra(request, response);
        }else if("buscar".equals(evento)){
            this.buscarCompra(request, response);
        }
    }

    private void nuevaCompra(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
     Compras c = new Compras();
     c.setIdcompra(Integer.parseInt(request.getParameter("idcompra")));
     c.setProveedorcompra(Integer.parseInt(request.getParameter("proveedor")));
     try{
      c.setFechacompra(new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fecha")).getTime()));
     }catch(Exception ex){
     }
     c.setTotalcompra(Integer.parseInt(request.getParameter("total")));
     c.setObservacionescompra(request.getParameter("observaciones"));
     comprapro.nuevaCompra(c);
     request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void editarCompra(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     Compras c = new Compras();
     c.setIdcompra(Integer.parseInt(request.getParameter("idcompra")));
     c.setProveedorcompra(Integer.parseInt(request.getParameter("proveedor")));
     try{
      c.setFechacompra(new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fecha")).getTime()));
     }catch(Exception ex){
     }
     c.setTotalcompra(Integer.parseInt(request.getParameter("total")));
     c.setObservacionescompra(request.getParameter("observaciones"));
     comprapro.editarCompra(c);
     response.sendRedirect("index.jsp");
    }

    private void buscarCompra(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
     int id = Integer.parseInt(request.getParameter("par"));
     Compras c = comprapro.buscarCompra(id);
     request.setAttribute("compra", c);
     request.setAttribute("evento", "editar");
     request.getRequestDispatcher("compras.jsp").forward(request, response);
    }
}
