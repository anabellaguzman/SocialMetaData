package com.socialmetadata.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Usuario {
	
	@Id
	@Column	
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idUsuario;
	@Column
	private String nombre;
	@Column
	private String apellido;
	@Column
	private String email;
	@Column
	private String password;
	
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
            name = "ItemFavorito",
            joinColumns = @JoinColumn(name = "idUsuario"),
            inverseJoinColumns = @JoinColumn(name = "idItem")
    )	
	private Set<Item> itemsFavoritos;
	
	public Usuario() {}

	public Usuario(int idUsuario, String nombre, String apellido, String email,
			Date fechaNacimiento, String password) {
		super();
		this.idUsuario = idUsuario;
		this.nombre = nombre;
		this.apellido = apellido;
		this.email = email;
		this.password = password;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<Item> getItemsFavoritos() {
		return itemsFavoritos;
	}

	public void setItemsFavoritos(Set<Item> itemsFavoritos) {
		this.itemsFavoritos = itemsFavoritos;
	}
	
	
	
	
	
	

}
