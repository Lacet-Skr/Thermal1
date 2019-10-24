
package Control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Clase.*;
import Procesos.LineaProcesos;
import ProcesosImpl.LineaProcesosImpl;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;

public class LineaCon {
    
    private static LineaProcesos lineapro = LineaProcesosImpl.getInstancia();
    
    public  void evalua(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String evento = request.getParameter("evento");
        if("nuevo".equals(evento)){
            this.nuevoLinea(request, response);
        }else if("editar".equals(evento)){
            this.editarLinea(request, response);
        }else if("buscar".equals(evento)){
            this.buscarLinea(request, response);
        }else if("buscarpro".equals(evento)){
            this.buscarLineaPrd(request, response);
        }
    }
        private void nuevoLinea(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        Linea li = new Linea();
        li.setIdlinea(Integer.parseInt(request.getParameter("idlinea")));
        li.setClavelinea(Integer.parseInt(request.getParameter("clavelinea")));
        li.setDescripcionlinea(request.getParameter("descripcionlinea"));
        
        lineapro.nuevoLinea(li);
        request.getRequestDispatcher("panel.jsp").forward(request, response);
        }
    private void editarLinea(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        Linea l=new Linea();
        l.setIdlinea(Integer.parseInt(request.getParameter("idlinea")));
        l.setClavelinea(Integer.parseInt(request.getParameter("clavelinea")));
        l.setDescripcionlinea(request.getParameter("descripcionlinea"));
        lineapro.editarLinea(l);
        request.getRequestDispatcher("panel.jsp").forward(request, response);
    }    
        private void buscarLinea(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("par"));
        Linea l = lineapro.buscarLinea(id);
        request.setAttribute("linea", l);
        request.setAttribute("evento", "editar");
        request.getRequestDispatcher("lineas.jsp").forward(request, response);
    }
        
        private void buscarLineaPrd(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("par"));
        Linea l = lineapro.buscarLinea(id);
        request.setAttribute("linea", l);
        request.getRequestDispatcher("Productossub.jsp").forward(request, response);
    }
        
    public static ArrayList<Linea>listarLinea(String descripcion)throws ServletException, IOException{
        ArrayList<Linea>list = lineapro.listarLinea(descripcion);
        return list;
    }    
    public static ArrayList<Linea>listarLinea2()throws ServletException, IOException{
        ArrayList<Linea>list = lineapro.listarLinea2();
        return list;
    }        
}

