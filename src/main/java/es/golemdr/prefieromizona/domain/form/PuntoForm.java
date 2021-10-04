package es.golemdr.prefieromizona.domain.form;


import java.io.Serializable;


public class PuntoForm implements Serializable{

	private Long idComercio;
	private Long idCliente;
	private Long total;



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
public Long getTotal() {
		return total;
	}
	public void setTotal(Long total) {
		this.total = total;
	}

}
