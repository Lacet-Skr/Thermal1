
package Control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Clase.Producto;
import Procesos.ProductoProcesos;
import ProcesosImpl.ProductoProcesosImpl;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;

public class ProductoCon {
    
    private static ProductoProcesos prodpro = ProductoProcesosImpl.getInstancia();
    
    public void evalua(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String evento = request.getParameter("evento");
            if("nuevo".equals(evento)){
            this.nuevoProducto(request, response);
        }else if("editar".equals(evento)){
            this.editarProducto(request, response);
        }else if("buscar".equals(evento)){
            this.buscarProducto(request, response);
        }
    }   
    private void nuevoProducto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       Producto p = new Producto();
        p.setIdproducto(Integer.parseInt(request.getParameter("idproducto")));
        p.setCostoproducto(request.getParameter("costoproducto"));
        p.setDescripcionproducto(request.getParameter("descripcionproducto"));
        p.setExistenciaproducto(request.getParameter("existenciaproducto"));
        prodpro.nuevoProducto(p);
        request.getRequestDispatcher("panel.jsp").forward(request, response);
    }
    

    private void editarProducto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Producto p = new Producto();
        p.setIdproducto(Integer.parseInt(request.getParameter("idproducto")));
        p.setCostoproducto(request.getParameter("costoproducto"));
        p.setDescripcionproducto(request.getParameter("descripcionproducto"));
        p.setExistenciaproducto(request.getParameter("existenciaproducto"));
        prodpro.editarProducto(p);
        response.sendRedirect("panel.jsp");
    }

    private void buscarProducto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("par"));
        Producto p = prodpro.buscarProducto(id);
        request.setAttribute("producto", p);
        request.setAttribute("evento", "editar");
        request.getRequestDispatcher("productos.jsp").forward(request, response);    
    }
    public static ArrayList<Producto>listarProducto(String nombre)throws ServletException, IOException{
        ArrayList<Producto> list = prodpro.listarProducto(nombre);
        return list;
    }   
        public static ArrayList<Producto>listarProducto2()throws ServletException, IOException{
        ArrayList<Producto> list = prodpro.listarProducto2();
        return list;
    }   
}
