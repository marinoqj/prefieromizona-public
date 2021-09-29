package es.golemdr.prefieromizona.domain.form;


import java.io.Serializable;


public class ComercioForm implements Serializable{

	private Long idComercio;
	private String codComercio;
	private String razonSocial;
	private String cif;
	private String nombreResponsable;
	private String apellido1Responsable;
	private String apellido2Responsable;
	private String direccion;
	private String municipio;
	private String codPostal;



public Long getIdComercio() {
		return idComercio;
	}
	public void setIdComercio(Long idComercio) {
		this.idComercio = idComercio;
	}
public String getCodComercio() {
		return codComercio;
	}
	public void setCodComercio(String codComercio) {
		this.codComercio = codComercio;
	}
public String getRazonSocial() {
		return razonSocial;
	}
	public void setRazonSocial(String razonSocial) {
		this.razonSocial = razonSocial;
	}
public String getCif() {
		return cif;
	}
	public void setCif(String cif) {
		this.cif = cif;
	}
public String getNombreResponsable() {
		return nombreResponsable;
	}
	public void setNombreResponsable(String nombreResponsable) {
		this.nombreResponsable = nombreResponsable;
	}
public String getApellido1Responsable() {
		return apellido1Responsable;
	}
	public void setApellido1Responsable(String apellido1Responsable) {
		this.apellido1Responsable = apellido1Responsable;
	}
public String getApellido2Responsable() {
		return apellido2Responsable;
	}
	public void setApellido2Responsable(String apellido2Responsable) {
		this.apellido2Responsable = apellido2Responsable;
	}
public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
public String getMunicipio() {
		return municipio;
	}
	public void setMunicipio(String municipio) {
		this.municipio = municipio;
	}
public String getCodPostal() {
		return codPostal;
	}
	public void setCodPostal(String codPostal) {
		this.codPostal = codPostal;
	}

}
