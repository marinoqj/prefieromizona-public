package es.golemdr.prefieromizona.domain.form;


import java.io.Serializable;


public class ClienteForm implements Serializable{

	private Long idCliente;
	private String codCliente;
	private String nombre;
	private String apellido1;
	private String apellido2;
	private String dni;
	private String telefono;



public Long getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(Long idCliente) {
		this.idCliente = idCliente;
	}
public String getCodCliente() {
		return codCliente;
	}
	public void setCodCliente(String codCliente) {
		this.codCliente = codCliente;
	}
public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
public String getApellido1() {
		return apellido1;
	}
	public void setApellido1(String apellido1) {
		this.apellido1 = apellido1;
	}
public String getApellido2() {
		return apellido2;
	}
	public void setApellido2(String apellido2) {
		this.apellido2 = apellido2;
	}
public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

}
