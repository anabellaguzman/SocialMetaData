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
public class Tema {
	
	@Id
	@Column
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idTema;
	@Column
	private String tema;
	
    @ManyToMany(mappedBy = "setTemas", fetch = FetchType.LAZY)
    private Set<Item> setItems;
	
	
	
	public Tema(){}
	
	public Tema(int idTema, String tema) {
		super();
		this.idTema = idTema;
		this.tema = tema;
	}

	public int getIdTema() {
		return idTema;
	}

	public void setIdTema(int idTema) {
		this.idTema = idTema;
	}

	public String getTema() {
		return tema;
	}

	public void setTema(String tema) {
		this.tema = tema;
	}

	public Set<Item> getSetItems() {
		return setItems;
	}

	public void setSetItems(Set<Item> setItems) {
		this.setItems = setItems;
	}
	
	
	
	

}
