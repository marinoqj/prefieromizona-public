package es.golemdr.prefieromizona.domain.form;


import java.io.Serializable;
import java.sql.Date;


public class CanjeForm implements Serializable{

	private Long idCanje;
	private Date fechaCanje;
	private Long puntos;
	private Long idComercio;
	private Long idCliente;



public Long getIdCanje() {
		return idCanje;
	}
	public void setIdCanje(Long idCanje) {
		this.idCanje = idCanje;
	}
public Date getFechaCanje() {
		return fechaCanje;
	}
	public void setFechaCanje(Date fechaCanje) {
		this.fechaCanje = fechaCanje;
	}
public Long getPuntos() {
		return puntos;
	}
	public void setPuntos(Long puntos) {
		this.puntos = puntos;
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
