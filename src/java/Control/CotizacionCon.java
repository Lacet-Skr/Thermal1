package Control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Clase.Cotizacion;
import Procesos.CotizacionProcesos;
import ProcesosImpl.CotizacionProcesosImpl;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;

public class CotizacionCon {
    private static CotizacionProcesos cotizacionpro=CotizacionProcesosImpl.getInstancia();
    
    public void evalua(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String evento = request.getParameter("evento");
        if("nuevo".equals(evento)){
            this.nuevoCotizacion(request, response);
        }else if("editar".equals(evento)){
            this.editarCotizacion(request, response);
        }else if("buscar".equals(evento)){
            this.buscarCotizacion(request, response);
        }
    
}

    private void nuevoCotizacion(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        Cotizacion c = new Cotizacion();
        c.setIdcotizacion(Integer.parseInt(request.getParameter("idcotizacion")));
        c.setClientecotizacion(request.getParameter("clientecotizacion"));
        c.setTotalcotizacion(Integer.parseInt(request.getParameter("totalcotizacion")));
        c.setObservacionescotizacion(request.getParameter("observacionescotizacion"));
        try{
            c.setFechacotizacion(new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fechacompra")).getTime()));
        } catch (Exception ex){
            System.out.println("No extrae Fechas: " + ex.getMessage());
        }        
        cotizacionpro.nuevoCotizacion(c);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void editarCotizacion(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        Cotizacion c = new Cotizacion();
        c.setIdcotizacion(Integer.parseInt(request.getParameter("idcotizacion")));
        c.setClientecotizacion(request.getParameter("clientecotizacion"));        
        c.setTotalcotizacion(Integer.parseInt(request.getParameter("totalcotizacion")));
        c.setObservacionescotizacion(request.getParameter("observacionescotizacion"));
        try{
            c.setFechacotizacion(new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fechacompra")).getTime()));
        } catch (Exception ex){
            System.out.println("No extrae Fechas: " + ex.getMessage());
        }
        cotizacionpro.editarCotizacion(c);
        response.sendRedirect("index.jsp");
    }

    private void buscarCotizacion(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("par"));
        Cotizacion c = cotizacionpro.buscarCotizacion(id);
        request.setAttribute("cotizacion", c);
        request.setAttribute("evento", "editar");
        request.getRequestDispatcher("cotizaciones.jsp").forward(request, response);
    } 
    
    public static ArrayList<Cotizacion> listarCotizacion(String nombre) throws ServletException, IOException{
        ArrayList<Cotizacion> list = cotizacionpro.listarCotizacion(nombre);
        return list;
    }
        public static ArrayList<Cotizacion> listarCotizacion1() throws ServletException, IOException{
        ArrayList<Cotizacion> list = cotizacionpro.listarCotizacion1();
        return list;
    }
}
