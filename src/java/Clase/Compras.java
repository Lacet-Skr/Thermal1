/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clase;

import java.util.Date;

public class Compras {
    
    private int idcompra;

    public int getIdcompra() {
        return idcompra;
    }

    public void setIdcompra(int idcompra) {
        this.idcompra = idcompra;
    }

    public int getProveedorcompra() {
        return proveedorcompra;
    }

    public void setProveedorcompra(int proveedorcompra) {
        this.proveedorcompra = proveedorcompra;
    }

    public Date getFechacompra() {
        return fechacompra;
    }

    public void setFechacompra(Date fechacompra) {
        this.fechacompra = fechacompra;
    }

    public int getTotalcompra() {
        return totalcompra;
    }

    public void setTotalcompra(int totalcompra) {
        this.totalcompra = totalcompra;
    }

    public String getObservacionescompra() {
        return observacionescompra;
    }

    public void setObservacionescompra(String observacionescompra) {
        this.observacionescompra = observacionescompra;
    }
    private int proveedorcompra;
    private Date fechacompra;
    private int totalcompra;
    private String observacionescompra;
    
    
}
