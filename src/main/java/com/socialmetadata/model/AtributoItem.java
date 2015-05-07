package com.socialmetadata.model;

import java.util.Set;





import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
public class AtributoItem {
	
	@Id
	@Column
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idAtributoItem;
	@Column
	private String nombre;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "pk.atributo")
	private Set<ValorAtributoItem> valorAtributo;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idTipoItem")
	private TipoItem tipoItem;
	
	public AtributoItem(){}

	public AtributoItem(int idAtributoItem, String nombre,
			Set<ValorAtributoItem> valorAtributo, TipoItem tipoItem) {
		super();
		this.idAtributoItem = idAtributoItem;
		this.nombre = nombre;
		this.valorAtributo = valorAtributo;
		this.tipoItem = tipoItem;
	}

	public int getIdAtributoItem() {
		return idAtributoItem;
	}

	public void setIdAtributoItem(int idAtributoItem) {
		this.idAtributoItem = idAtributoItem;
	}
	
	
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	@JsonIgnore
	public Set<ValorAtributoItem> getValorAtributo() {
		return valorAtributo;
	}

	public void setValorAtributo(Set<ValorAtributoItem> valorAtributo) {
		this.valorAtributo = valorAtributo;
	}

	public TipoItem getTipoItem() {
		return tipoItem;
	}

	public void setTipoItem(TipoItem tipoItem) {
		this.tipoItem = tipoItem;
	}
	
	
	
	

}
