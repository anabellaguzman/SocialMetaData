package com.socialmetadata.model;

import java.util.Date;
import java.util.HashSet;
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
import javax.persistence.Table;




@Entity
public class Usuario {
	
	@Id
	@Column	
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer idUsuario;
	@Column
	private String nombre;
	@Column
	private String apellido;
	@Column
	private String email;
	@Column
	private String password;
	private String username;
	@Column 
	private boolean enabled;
	
	
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(
		name="usuariorol",
		joinColumns = @JoinColumn(name="idUsuario"),
		inverseJoinColumns = @JoinColumn(name="idRol")
	)
	private Set<Rol> roles;
//	private Set<Rol> roles = new HashSet<Rol>(0);

	
	
	
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
            name = "ItemFavorito",
            joinColumns = @JoinColumn(name = "idUsuario"),
            inverseJoinColumns = @JoinColumn(name = "idItem")
    )	
	private Set<Item> itemsFavoritos;
    

	
	public Usuario() {}

	public Usuario (String username, String nombre, String apellido, String email,
	 String password) {
		super();
		
		this.nombre = nombre;
		this.apellido = apellido;
		this.username = username;
		this.email = email;
		this.password = password;
		this.enabled = true;
		
	}
	
	

	public Integer getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Integer idUsuario) {
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Set<Rol> getRoles() {
		return roles;
	}

	public void setRoles(Set<Rol> roles) {
		this.roles = roles;
	}
//--------------
	
	public void addItemsFavoritos(Item item){
		this.itemsFavoritos.add(item);
	}
	public void addRol(Rol rol){
		this.roles.add(rol);
	}
	
	

	

}
