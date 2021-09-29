package es.golemdr.prefieromizona.domain.form;


import java.io.Serializable;
import java.sql.Date;


public class CompraForm implements Serializable{

	private Long idCompra;
	private Date fechaCompra;
	private Long puntos;
	private Date fechaCanje;
	private Long idComercio;
	private Long idCliente;



public Long getIdCompra() {
		return idCompra;
	}
	public void setIdCompra(Long idCompra) {
		this.idCompra = idCompra;
	}
public Date getFechaCompra() {
		return fechaCompra;
	}
	public void setFechaCompra(Date fechaCompra) {
		this.fechaCompra = fechaCompra;
	}
public Long getPuntos() {
		return puntos;
	}
	public void setPuntos(Long puntos) {
		this.puntos = puntos;
	}
public Date getFechaCanje() {
		return fechaCanje;
	}
	public void setFechaCanje(Date fechaCanje) {
		this.fechaCanje = fechaCanje;
	}
public Long getIdComercio() {
		return idComercio;
	}
	public void setIdComercio(Long idComercio) {
		this.idComercio = idComercio;
	}
public Long getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(Long idCliente) {
		this.idCliente = idCliente;
	}

}
