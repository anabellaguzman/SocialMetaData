package com.socialmetadata.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
//import javax.persistence.Table;
import javax.persistence.OneToMany;

@Entity
//@Table( name ="idioma")
public class Idioma {
	
	@Id
	@Column
//	(name = "idIdioma")	
	@GeneratedValue(strategy=GenerationType.AUTO) //for autonumber
	private  int idIdioma;
	
	@Column
//	(name = "idioma")	
	private String idioma;
	
    @OneToMany(mappedBy="idioma")
    private Set<Item> items;
 
	
	public Idioma(){}
	public Idioma(int idIdioma, String idioma) {
		super();
		this.idIdioma = idIdioma;
		this.idioma = idioma;
	}
	
	public int getIdIdioma() {
		return idIdioma;
	}
	public void setIdIdioma(int idIdioma) {
		this.idIdioma = idIdioma;
	}
	public String getIdioma() {
		return idioma;
	}
	public void setIdioma(String idioma) {
		this.idioma = idioma;
	}
	
	public Set<Item> getItems() {
		return items;
	}
	public void setItems(Set<Item> items) {
		this.items = items;
	}
		

}
