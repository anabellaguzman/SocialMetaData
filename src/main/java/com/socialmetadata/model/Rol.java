package com.socialmetadata.model;

import java.util.Set;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;



@Entity
public class Rol {
	
	@Id
	@Column	
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idRol;
	
	@Column
	private String rol;
	
	@Column
	private String descripcion;
	
	@ManyToMany(mappedBy = "roles", fetch = FetchType.LAZY)
	private Set<Usuario> rolUsuarios;

	public int getIdRol() {
		return idRol;
	}

	public void setIdRol(int idRol) {
		this.idRol = idRol;
	}

	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Set<Usuario> getRolUsuario() {
		return rolUsuarios;
	}

	public void setRolUsuario(Set<Usuario> rolUsuarios) {
		this.rolUsuarios = rolUsuarios;
	} 
	
	
}
