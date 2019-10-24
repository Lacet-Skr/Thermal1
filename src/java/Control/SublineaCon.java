
package Control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Clase.Sublinea;
import Procesos.SublineaProcesos;
import ProcesosImpl.SublineaProcesosImpl;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;

public class SublineaCon {
   private static SublineaProcesos subpro = SublineaProcesosImpl.getInstancia();
   
    public  void evalua(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String evento = request.getParameter("evento");
        if("nuevo".equals(evento)){
            this.nuevoSublinea(request, response);
        }else if("editar".equals(evento)){
            this.editarSublinea(request, response);
        }else if("buscar".equals(evento)){
            this.buscarSublinea(request, response);
        }
    }   
        private void nuevoSublinea(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        Sublinea s = new Sublinea();
        s.setIdsublinea(Integer.parseInt(request.getParameter("idsublinea")));
        s.setClavesublinea(Integer.parseInt(request.getParameter("clavesublinea")));
        s.setLinea(Integer.parseInt(request.getParameter("linea")));
        s.setDescripcionsublinea(request.getParameter("descripcionsublinea"));
        subpro.nuevoSublinea(s);
        request.getRequestDispatcher("panel.jsp").forward(request, response);
        }
        
   private void editarSublinea(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        Sublinea s = new Sublinea();
        s.setIdsublinea(Integer.parseInt(request.getParameter("idsublinea")));
        s.setClavesublinea(Integer.parseInt(request.getParameter("clavesublinea")));
        s.setLinea(Integer.parseInt(request.getParameter("linea")));
        s.setDescripcionsublinea(request.getParameter("descripcionsublinea"));
        subpro.editarSublinea(s);
        response.sendRedirect("panel.jsp");
    }            
         private void buscarSublinea(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("par"));
        Sublinea s = subpro.buscarSublinea(id);
        request.setAttribute("sublinea", s);
        request.setAttribute("evento", "editar");
        request.getRequestDispatcher("sublineas.jsp").forward(request, response);
    }
         
         private void buscarSublineapro(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        int id = Integer.parseInt(request.getParameter("par"));
        Sublinea s = subpro.buscarSublinea(id);
        request.setAttribute("sublinea", s);
        request.getRequestDispatcher("productos.jsp").forward(request, response);
    }
         
    public static ArrayList<Sublinea>listarSublinea(String descripcion)throws ServletException, IOException{
        ArrayList<Sublinea>list = subpro.listarSublinea(descripcion);
        return list;
    } 
    
        public static ArrayList<Sublinea>listarSublineas3(int linea)throws ServletException, IOException{
        ArrayList<Sublinea>list = subpro.listarSublineas3(linea);
        return list;
    } 
}

