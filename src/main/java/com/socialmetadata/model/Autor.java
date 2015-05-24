package com.socialmetadata.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Autor {
	
	@Id
	@Column
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idAutor;
	@Column
	private String nombre;
	@Column
	private String apellido;
	
    @ManyToMany(mappedBy = "autores", fetch = FetchType.LAZY)
    private Set<Item> items;
	
	public Autor(){};
	
	public Autor(int idAutor, String nombre, String apellido) {
		super();
		this.idAutor = idAutor;
		this.nombre = nombre;
		this.apellido = apellido;
	}

	public int getIdAutor() {
		return idAutor;
	}
	public void setIdAutor(int idAutor) {
		this.idAutor = idAutor;
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
	
	@JsonIgnore
	public Set<Item> getItems() {
		return items;
	}

	public void setItems(Set<Item> items) {
		this.items = items;
	}
	
	
}
