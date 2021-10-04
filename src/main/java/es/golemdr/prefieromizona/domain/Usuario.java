package es.golemdr.prefieromizona.domain;


import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.Table;


public class Usuario{

	private Long idUsuario;
	private String login;
	private String password;
	private String cambiarPassword;

	private String [] rolesUsuario;

	public Long getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Long idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCambiarPassword() {
		return cambiarPassword;
	}

	public void setCambiarPassword(String cambiarPassword) {
		this.cambiarPassword = cambiarPassword;
	}

	public String[] getRolesUsuario() {
		return rolesUsuario;
	}

	public void setRolesUsuario(String[] rolesUsuario) {
		this.rolesUsuario = rolesUsuario;
	}
	
	


}
