package com.socialmetadata.model;



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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;



@Entity
public class Item {
	
	@Id
	@Column
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idItem;
	@Column
	private String titulo;
	@Column
	private String año;
	@Column
	private double puntaje;
	@Column
	private int cantidadVotos;
	@Column
	private String imagen; //Es el path de la imagen.
	@Column
	private String descripcion;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "Idioma")
	private Idioma idioma;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "tipo")
	private TipoItem tipo; 
	
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY )
    @JoinTable(
            name = "ItemTema",
            joinColumns = @JoinColumn(name = "idItem"),
            inverseJoinColumns = @JoinColumn(name = "idTema")
    )	
	private Set<Tema> setTemas;
    
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
            name = "ItemAutor",
            joinColumns = @JoinColumn(name = "idItem"),
            inverseJoinColumns = @JoinColumn(name = "idAutor")
    )	
	private Set<Autor> autores;
    
    @OneToMany(mappedBy="item", fetch = FetchType.LAZY)
    private Set<Posteo> posteos;
    
    
    
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "pk.item", cascade=CascadeType.ALL)
    private Set<ValorAtributoItem> valorAtributoPropio;
    
    
    
	public int getIdItem() {
		return idItem;
	}
	public void setIdItem(int idItem) {
		this.idItem = idItem;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getAño() {
		return año;
	}
	public void setAño(String año) {
		this.año = año;
	}
	public double getPuntaje() {
		return puntaje;
	}
	public void setPuntaje(double puntaje) {
		this.puntaje = puntaje;
	}
	public int getCantidadVotos() {
		return cantidadVotos;
	}
	public void setCantidadVotos(int cantidadVotos) {
		this.cantidadVotos = cantidadVotos;
	}
	public String getImagen() {
		return imagen;
	}
	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Idioma getIdioma() {
		return idioma;
	}
	public void setIdioma(Idioma idioma) {
		this.idioma = idioma;
	}
	public TipoItem getTipo() {
		return tipo;
	}
	public void setTipo(TipoItem tipo) {
		this.tipo = tipo;
	}
	public Set<Tema> getSetTemas() {
		return setTemas;
	}
	public void setSetTemas(Set<Tema> setTemas) {
		this.setTemas = setTemas;
	}
	public Set<Autor> getAutores() {
		return autores;
	}
	public void setAutores(Set<Autor> autores) {
		this.autores = autores;
	}
	public Set<Posteo> getPosteos() {
		return posteos;
	}
	public void setPosteos(Set<Posteo> posteos) {
		this.posteos = posteos;
	}
	public Set<ValorAtributoItem> getValorAtributoPropio() {
		return valorAtributoPropio;
	}
	public void setValorAtributoPropio(Set<ValorAtributoItem> valorAtributoPropio) {
		this.valorAtributoPropio = valorAtributoPropio;
	}
	
	
}
