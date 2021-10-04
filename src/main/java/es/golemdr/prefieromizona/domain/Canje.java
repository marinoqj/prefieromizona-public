package es.golemdr.prefieromizona.domain;


import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@JsonIdentityInfo(generator=ObjectIdGenerators.PropertyGenerator.class,property = "idCanje", scope = Canje.class)
public class Canje{

	private Long idCanje;
	private Date fechaCanje;
	private Long puntos;

	private Comercio comercio;
	private Cliente cliente;
	
	
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
	public Comercio getComercio() {
		return comercio;
	}
	public void setComercio(Comercio comercio) {
		this.comercio = comercio;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}





}
