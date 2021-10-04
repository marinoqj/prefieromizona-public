package es.golemdr.prefieromizona.domain;


import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "idPunto", scope = Punto.class)
public class Punto {

	private Long idPunto;
	private Long total;
	
	private Comercio comercio;
	private Cliente cliente;
	
	
	public Long getIdPunto() {
		return idPunto;
	}
	public void setIdPunto(Long idPunto) {
		this.idPunto = idPunto;
	}
	public Long getTotal() {
		return total;
	}
	public void setTotal(Long total) {
		this.total = total;
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
