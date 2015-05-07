package com.socialmetadata.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
public class TipoItem {
	
	@Id
	@Column
	@GeneratedValue(strategy=GenerationType.AUTO)
	private  int idTipoItem;

	@Column
	private String descripcion;
	
	@OneToMany(mappedBy="tipo", fetch = FetchType.LAZY)
	private Set<Item> items;
	
    @OneToMany(mappedBy="tipoItem", fetch = FetchType.LAZY)
    private Set<AtributoItem> atributoItem;
    
    public TipoItem(){}

	public TipoItem(int idTipoItem, String descripcion, Set<Item> items,
			Set<AtributoItem> atributoItem) {
		super();
		this.idTipoItem = idTipoItem;
		this.descripcion = descripcion;
		this.items = items;
		this.atributoItem = atributoItem;
	}

	public int getIdTipoItem() {
		return idTipoItem;
	}

	public void setIdTipoItem(int idTipoItem) {
		this.idTipoItem = idTipoItem;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	@JsonIgnore
	public Set<Item> getItems() {
		return items;
	}

	public void setItems(Set<Item> items) {
		this.items = items;
	}

	
	@JsonIgnore
	public Set<AtributoItem> getAtributoItem() {
		return atributoItem;
	}

	public void setAtributoItem(Set<AtributoItem> atributoItem) {
		this.atributoItem = atributoItem;
	}

    
	
	

}
