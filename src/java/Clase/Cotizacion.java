
package Clase;

import java.util.Date;

public class Cotizacion {
    private int idcotizacion;
    private String clientecotizacion;
    private Date fechacotizacion;
    private int totalcotizacion;
    private String observacionescotizacion;

    public int getIdcotizacion() {
        return idcotizacion;
    }

    public void setIdcotizacion(int idcotizacion) {
        this.idcotizacion = idcotizacion;
    }

    public String getClientecotizacion() {
        return clientecotizacion;
    }

    public void setClientecotizacion(String clientecotizacion) {
        this.clientecotizacion = clientecotizacion;
    }

    public Date getFechacotizacion() {
        return fechacotizacion;
    }

    public void setFechacotizacion(Date fechacotizacion) {
        this.fechacotizacion = fechacotizacion;
    }

    public int getTotalcotizacion() {
        return totalcotizacion;
    }

    public void setTotalcotizacion(int totalcotizacion) {
        this.totalcotizacion = totalcotizacion;
    }

    public String getObservacionescotizacion() {
        return observacionescotizacion;
    }

    public void setObservacionescotizacion(String observacionescotizacion) {
        this.observacionescotizacion = observacionescotizacion;
    }
    
}
